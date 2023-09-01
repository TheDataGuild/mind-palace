from llama_index import SimpleDirectoryReader

required_exts = [".pdf"]

docs = SimpleDirectoryReader(
    input_dir="./resources/pdfs", required_exts=required_exts
).load_data()

print(f"Loaded {len(docs)} docs")
# each page of a PDF becomes a separate doc object

from llama_index.schema import MetadataMode
print("The LLM sees this: \n", docs[0].get_content(metadata_mode=MetadataMode.LLM))
print("The Embedding model sees this: \n", docs[0].get_content(metadata_mode=MetadataMode.EMBED))

