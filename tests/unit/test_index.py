import pytest

from tests.context import extract, index


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
