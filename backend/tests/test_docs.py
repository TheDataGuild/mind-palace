from .context import docs
import grobid_tei_xml.types as grobid_types
from llama_index.schema import TextNode, NodeRelationship

XML_PATH = "./resources/pdfs/12-pdfs-from-steve-aug-22/xml/"


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
