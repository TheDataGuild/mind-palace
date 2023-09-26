from tests.context import extract, index
import llama_index as li
import pytest


def bootstrap_index(xml_dir):
    nodes = extract.seed_nodes(xml_dir)
    return index.index_nodes(nodes)


@pytest.mark.skip(reason="This test takes a minute to run")
def test_bootstrap_index():
    xml_dir = "./resources/xmls/12-pdfs-from-steve-aug-22/"
    vector_index = bootstrap_index(xml_dir)
    assert vector_index is not None


def persist_index(vector_index):
    vector_index.storage_context.persist()


def test_query():
    storage_context = li.StorageContext.from_defaults(
        persist_dir="./tests/unit/llama_stores/12-pdfs-from-steve-aug-22/"
    )
    vector_index = li.load_index_from_storage(storage_context)
    assert vector_index is not None

    # Query
    query_engine = vector_index.as_query_engine()
    assert query_engine is not None

    # TODO:
    # response = query_engine.query("What interaction is investigated?")
    # assert response.get_response()
