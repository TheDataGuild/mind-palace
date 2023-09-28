import extract
import index
import openai
import streamlit as st
import welcome
from llama_index.query_engine import CitationQueryEngine

openai.api_key = st.secrets.openai_key
xml_dir = "./resources/xmls/12-pdfs-from-steve-aug-22/"
gpt_model = "gpt-3.5-turbo"

st.set_page_config(page_title="Chatting with Steve's PDFs")
st.title("Chat with Steve's PDFs 💬")

with st.sidebar:
    st.markdown("Conversation History")
    st.text("Coming soon...")


@st.cache_resource(
    show_spinner="Loading and indexing the PDFs – hang tight! This should take 1-2 minutes."
)
def load_nodes_and_index(xml_dir, model):
    nodes = extract.seed_nodes(xml_dir)
    vector_index = index.index_nodes(nodes, model)
    return nodes, vector_index


nodes, vector_index = load_nodes_and_index(xml_dir, gpt_model)
query_engine = CitationQueryEngine.from_args(index=vector_index, verbose=True)


# TODO: pass in nodes instead of abstracts
@st.cache_data(show_spinner="Summarizing papers...")
def get_welcome_message(abstracts):
    return welcome.summarize(gpt_model, abstracts)


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


if prompt := st.chat_input(
    "Your question"
):  # Prompt for user input and save to chat history
    st.session_state.messages.append({"role": "user", "content": prompt})

for message in st.session_state.messages:  # Display the prior chat messages
    with st.chat_message(message["role"]):
        st.write(message["content"])

# If last message is not from assistant, generate a new response
if st.session_state.messages[-1]["role"] != "assistant":
    with st.chat_message("assistant"):
        with st.spinner("Thinking..."):
            response = query_engine.query(prompt)
            st.write(response.response)

            message = {"role": "assistant", "content": response.response}
            st.session_state.messages.append(message)  # Add response to message history

            st.markdown("### Sources")
            for i, source_node in enumerate(response.source_nodes):
                with st.expander(f"[{i + 1}] {source_node.node.metadata['citation']}"):
                    if source_node.metadata["paragraph_number"]:
                        st.write(
                            f"paragraph number: {source_node.metadata['paragraph_number']}"
                        )
                    st.write("original text:")
                    st.write(source_node.node.get_text().split(":", 1)[1])
