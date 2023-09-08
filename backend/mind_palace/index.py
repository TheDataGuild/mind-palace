from llama_index.llms import OpenAI
import llama_index as li


def index_nodes(nodes):
    service_context = li.ServiceContext.from_defaults(
        llm=OpenAI(model="gpt-3.5-turbo"),
        embed_model="local"
        # Q: how much does a better embedding model help?
    )

    print(f"Creating an index with {len(nodes)} number of nodes")
    index = li.VectorStoreIndex(nodes, service_context=service_context)

    return index
