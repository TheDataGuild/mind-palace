import streamlit as st

import openai

import extract
import index

openai.api_key = st.secrets.openai_key
xml_dir = "./resources/xmls/12-pdfs-from-steve-aug-22/"

st.title("Chat with Steve's 12 PDFs 💬🦙")

selected_model = st.sidebar.selectbox(
    "Choose your GPT model", ("gpt-3.5-turbo", "gpt-4"), index=0
)

if "messages" not in st.session_state.keys():  # Initialize the chat messages history
    st.session_state.messages = [
        {"role": "assistant", "content": "Ask me a question about these PDFs"}
    ]


@st.cache_resource(show_spinner=False)
def load_index(model):
    with st.spinner(
        text="Loading and indexing the PDFs – hang tight! This should take 1-2 minutes."
    ):
        nodes = extract.seed_nodes(xml_dir)
        vector_index = index.index_nodes(nodes, model)
        return vector_index


vector_index = load_index(selected_model)
chat_engine = vector_index.as_chat_engine(chat_mode="condense_question", verbose=True)

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
            response = chat_engine.chat(prompt)
            st.write(response.response)
            message = {"role": "assistant", "content": response.response}
            st.session_state.messages.append(message)  # Add response to message history
