from tests.context import extract, index
import llama_index as li


def bootstrap_index(xml_dir):
    nodes = extract.seed_nodes(xml_dir)
    return index.index_nodes(nodes)


def persist_index(vector_index):
    vector_index.storage_context.persist()


def test_query():
    storage_context = li.StorageContext.from_defaults(
        persist_dir="./tests/end_to_end/llama_stores/12-pdfs-from-steve-aug-22/"
    )
    vector_index = li.load_index_from_storage(storage_context)
    assert vector_index is not None

    # Query
    query_engine = vector_index.as_query_engine()
    assert query_engine is not None

    # TODO:
    # response = query_engine.query("What interaction is investigated?")
    # assert response.get_response()
