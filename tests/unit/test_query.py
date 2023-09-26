import llama_index as li
import pytest


@pytest.mark.skip(reason="This cost money to run")
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
