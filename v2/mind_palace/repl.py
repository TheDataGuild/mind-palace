# Load in documents

from llama_index import SimpleDirectoryReader

required_exts = [".pdf"]

docs = SimpleDirectoryReader(
    input_dir="./resources/pdfs", required_exts=required_exts
).load_data()

print(f"Loaded {len(docs)} docs")
# each page of a PDF becomes a separate doc object

# Index Construction
from llama_index.llms import OpenAI
from llama_index.embeddings import OpenAIEmbedding

from llama_index import ServiceContext
from llama_index import VectorStoreIndex

service_context = ServiceContext.from_defaults(
    llm=OpenAI(model="gpt-3.5-turbo"),
    embed_model="local"
)

# index = VectorStoreIndex.from_documents(docs, service_context=service_context, show_progress=True)
