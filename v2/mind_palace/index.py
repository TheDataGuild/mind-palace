from llama_index.llms import OpenAI
from llama_index import ServiceContext
from llama_index import VectorStoreIndex


def index_documents(documents):
    service_context = ServiceContext.from_defaults(
        llm=OpenAI(model="gpt-3.5-turbo"),
        embed_model="local"
        # Q: how much does a better embedding model help?
    )

    # add docs to a VectorStoreIndex one at a time to avoid OpenAI rate limits
    # note that we reverted to not using OpenAI for embedding for now because it's slow
    print(f"Adding {documents[0].metadata}")
    index = VectorStoreIndex.from_documents(
        documents[:1], service_context=service_context
    )

    for doc in documents[1:]:
        print(f"Adding {doc.metadata}")
        index.insert(doc)

    return index
