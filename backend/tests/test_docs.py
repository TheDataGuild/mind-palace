from .context import docs
import grobid_tei_xml.types as grobid_types
from llama_index.schema import TextNode, NodeRelationship

XML_PATH = "./resources/xmls/12-pdfs-from-steve-aug-22/"


def test_set_next_relationships():
    nodes = [
        TextNode(text="this is first"),
        TextNode(text="this is second"),
        TextNode(text="this is third"),
    ]
    docs.set_next_relationships(nodes)
    assert (
        nodes[0].relationships[NodeRelationship.NEXT].node_id == nodes[1].node_id
    )
    assert (
        nodes[1].relationships[NodeRelationship.NEXT].node_id == nodes[2].node_id
    )
    assert not nodes[2].relationships


def test_body():
    xml = docs.load_tei_xml(
        XML_PATH
        + "2019_IEEE Transactions_Cellular Bioeffect Investigations on Low-Intensity Pulsed Ultrasound and Sonoporation_ Platform Design and Flow Cytometry Protocol.pdf.tei.xml"
    )
    assert isinstance(docs.body(xml, xml.header.doi), list)


def test_node_relationships():
    title_node = TextNode(text="this is title")
    abstract_node = TextNode(text="this is abstract")
    assert docs.set_relationships(title_node, abstract_node) is None
    assert (
        abstract_node.relationships[NodeRelationship.PARENT].node_id
        == title_node.node_id
    )


def test_load_tei_xml():
    xml = docs.load_tei_xml(
        XML_PATH
        + "2010_PhysRevLett_Pulsating Tandem Microbubble for Localized and Directional Single-Cell Membrane Poration.pdf.tei.xml"
    )
    assert isinstance(xml, grobid_types.GrobidDocument)
