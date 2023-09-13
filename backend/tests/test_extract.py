from .context import extract
from . import test_docs


def test_gen_document_dict():
    nodes_dict = extract._gen_document_dict(
        test_docs.XML_PATH
        + "2010_PhysRevLett_Pulsating Tandem Microbubble for Localized and Directional Single-Cell Membrane Poration.pdf.tei.xml"
    )
    for node in nodes_dict.values():
        assert isinstance(node, extract.TextNode)


def test_seed_nodes():
    nodes = extract.seed_nodes(test_docs.XML_PATH)
    assert isinstance(nodes, list)
    for node in nodes:
        assert isinstance(node, extract.TextNode)
