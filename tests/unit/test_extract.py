from tests.context import extract
from . import test_docs


def test_gen_document_dict():
    nodes_dict = extract._gen_document_dict(
        test_docs.XML_PATH
        + "2010_PhysRevLett_Pulsating Tandem Microbubble for Localized and Directional Single-Cell Membrane Poration.pdf.tei.xml"
    )
    assert isinstance(nodes_dict, dict)
    assert isinstance(nodes_dict["title"], extract.TextNode)
    assert isinstance(nodes_dict["abstract"], extract.TextNode)
    assert isinstance(nodes_dict["body_paragraphs"], list)
    assert all(
        isinstance(body_node, extract.TextNode)
        for body_node in nodes_dict["body_paragraphs"]
    )


def test_seed_nodes():
    nodes = extract.seed_nodes(test_docs.XML_PATH)
    assert isinstance(nodes, list)
    assert all(isinstance(node, extract.TextNode) for node in nodes)
