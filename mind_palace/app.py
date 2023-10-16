import logging

import extract
import index
import openai
import streamlit as st
import welcome
from itune import MultiArmedBandit, Tune
from llama_index.query_engine import CitationQueryEngine

openai.api_key = st.secrets.openai_key
xml_dir = "./resources/xmls/dennis-oct-10/"
gpt_model = "gpt-3.5-turbo"


def is_production_env():
    return "app_env" in st.secrets.keys() and st.secrets.app_env == "production"


if not is_production_env():
    logging.basicConfig(level=logging.INFO)

itune = Tune(
    strategy=MultiArmedBandit(),
    only_choose_winning_params=is_production_env(),
)

st.set_page_config(page_title="Q&A with Dennis's PDFs")
st.title("Q&A with Dennis's PDFs 💬")

with st.sidebar:
    st.markdown("Conversation History")
    st.text("Coming soon...")


@st.cache_resource(
    show_spinner="Loading and indexing the PDFs – hang tight! This should take 1-2 minutes.",
    max_entries=3,
)
def load_nodes_and_index(xml_dir, model):
    nodes = extract.seed_nodes(xml_dir)
    vector_index = index.index_nodes(nodes, model)
    return nodes, vector_index


nodes, vector_index = load_nodes_and_index(xml_dir, gpt_model)
query_engine = CitationQueryEngine.from_args(
    index=vector_index,
    similarity_top_k=itune.choose(similarity_top_k=[3, 5]),
    verbose=True,
)


@st.cache_data(
    show_spinner="Analyzing papers... just a few more seconds.", max_entries=3
)
def get_welcome_message(abstracts):
    return (
        welcome.summarize(gpt_model, abstracts)
        + "\n\n"
        + "Top keywords: "
        + ", ".join(welcome.extract_keywords(gpt_model, abstracts))
    )


if "messages" not in st.session_state.keys():  # Initialize the chat messages history
    st.session_state.messages = [
        {
            "role": "assistant",
            "content": get_welcome_message(welcome.parse_abstracts(nodes)),
        },
        {
            "role": "assistant",
            "content": "Ask me a question about these papers.",
        },
    ]
# if this refresh is not triggered by user button press, reset the chat messages
elif not st.session_state.rating_button_pressed:
    print("clearing chat messages!")
    st.session_state.messages = []

# this needs to be reset after checking if the messaages should be cleared
st.session_state.rating_button_pressed = False

if prompt := st.chat_input(
    "Your question"
):  # Prompt for user input and save to chat history
    st.session_state.messages.append({"role": "user", "content": prompt})


for message in st.session_state.messages:  # Display the prior chat messages
    with st.chat_message(message["role"]):
        st.write(message["content"])


def user_clicked_rating(is_good_response):
    print(f"user thumbs {'up' if is_good_response else 'down'}")
    itune.register_outcome(is_good_response)
    st.session_state.rating_button_pressed = True


# If last message is from user, generate a new response
if st.session_state.messages[-1]["role"] == "user":
    with st.chat_message("assistant"):
        with st.spinner("Thinking..."):
            response = query_engine.query(prompt)
            st.write(response.response)

            message = {"role": "assistant", "content": response.response}
            st.session_state.messages.append(message)  # Add response to message history

            _, col1, col2 = st.columns([7, 1, 1], gap="small")
            col1.button(
                "👍",
                on_click=user_clicked_rating,
                args=[True],
                help="Good response",
                key="good_response",
                use_container_width=True,
            )
            col2.button(
                "👎",
                on_click=user_clicked_rating,
                args=[False],
                help="Bad response",
                key="bad_response",
                use_container_width=True,
            )

            st.markdown("### Sources")
            for i, source_node in enumerate(response.source_nodes):
                with st.expander(f"[{i + 1}] {source_node.node.metadata['citation']}"):
                    if source_node.metadata["paragraph_number"]:
                        st.write(
                            f"paragraph number: {source_node.metadata['paragraph_number']}"
                        )
                    st.write("original text:")
                    st.write(source_node.node.get_text().split(":", 1)[1])
