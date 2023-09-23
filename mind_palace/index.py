from llama_index.llms import OpenAI
import llama_index as li

from measure import time_function


@time_function
def index_nodes(nodes, model="gpt-3.5-turbo"):
    service_context = li.ServiceContext.from_defaults(
        llm=OpenAI(model=model),
        embed_model="local"
        # Q: how much does a better embedding model help?
    )

    print(f"Creating an index with {len(nodes)} number of nodes using model {model}")
    index = li.VectorStoreIndex(nodes, service_context=service_context)

    return index
