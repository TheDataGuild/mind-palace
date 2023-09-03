import time


def time_function(func):
    start_time = time.time()
    result = func()
    end_time = time.time()
    elapsed_time = end_time - start_time
    return result, elapsed_time


def load_documents():
    # TODO: refactor this step out (so I'm keeping it self-contained with imports for now)
    from llama_index import SimpleDirectoryReader

    required_exts = [".pdf"]

    # Q: we could use a better text extractor supporting section-aware extraction
    return SimpleDirectoryReader(
        input_dir="./resources/pdfs/12-pdfs-from-steve-aug-22", required_exts=required_exts
    ).load_data()


docs, elapsed_time = time_function(load_documents)
print(f"Elapsed time {elapsed_time:.1f} seconds: Loaded {len(docs)} total pages (aka Documents) from {len(set([doc.metadata['file_name'] for doc in docs]))} PDFs")

# Index Construction
def index_documents(documents):
    # TODO: refactor this step out (so I'm keeping it self-contained with imports for now)
    from llama_index.llms import OpenAI

    from llama_index import ServiceContext
    from llama_index import VectorStoreIndex

    service_context = ServiceContext.from_defaults(
        llm=OpenAI(model="gpt-3.5-turbo"),
        embed_model="local"
        # Q: how much does a better embedding model help?
    )

    # add docs to a VectorStoreIndex one at a time to avoid OpenAI rate limits
    # note that we reverted to not using OpenAI for embedding for now because it's slow
    print(f"Adding {docs[0].metadata}")
    index = VectorStoreIndex.from_documents(documents[:1], service_context=service_context)

    for doc in documents[1:]:
        print(f"Adding {doc.metadata}")
        index.insert(doc)

    return index

index, elapsed_time = time_function(lambda: index_documents(docs))
print(f"Elapsed time {elapsed_time:.1f} seconds: Indexed {len(docs)} total pages (aka Documents) from {len(set([doc.metadata['file_name'] for doc in docs]))} PDFs")

