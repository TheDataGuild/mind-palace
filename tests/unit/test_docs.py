from unittest.mock import MagicMock, patch

import grobid_tei_xml.types as grobid_types
from llama_index.schema import NodeRelationship, TextNode

from tests.context import docs

XML_PATH = "./resources/xmls/12-pdfs-from-steve-aug-22/"
XML_SAMPLE_FILE_PATH = (
    XML_PATH
    + "2010_PhysRevLett_Pulsating Tandem Microbubble for Localized and Directional Single-Cell Membrane Poration.pdf.tei.xml"
)


def test_load_tei_xml():
    xml = docs.load_tei_xml(XML_SAMPLE_FILE_PATH)
    assert isinstance(xml, grobid_types.GrobidDocument)


def test_cite_authors():
    xml = MagicMock()
    xml.header.authors = [
        MagicMock(surname="Doe", given_name="John"),
        MagicMock(surname="Smith", given_name="Jane"),
    ]
    assert docs.cite_authors(xml) == "Doe, John, et al"

    xml.header.authors = [MagicMock(surname="Doe", given_name="John")]
    assert docs.cite_authors(xml) == "Doe, John"


def test_cite():
    xml = MagicMock()

    with patch("docs.cite_authors", return_value="Doe, John"):
        xml.header.title = "This is a title"
        xml.header.journal_abbrev = "J. Abbrev."
        xml.header.date = "2023"
        xml.header.volume = "1"
        xml.header.issue = "9"
        xml.header.doi = "10.1234/1234"
        assert (
            docs.cite(xml)
            == "Doe, John. This is a title. J. Abbrev. 2023;1(9). doi:10.1234/1234."
        )


def gen_nodes():
    return [
        TextNode(text="this is first"),
        TextNode(text="this is second"),
        TextNode(text="this is third"),
    ]


def test_set_prev_relationships():
    nodes = gen_nodes()
    docs.set_prev_relationships(nodes)
    assert not nodes[0].relationships
    assert nodes[1].relationships[NodeRelationship.PREVIOUS].node_id == nodes[0].node_id
    assert nodes[2].relationships[NodeRelationship.PREVIOUS].node_id == nodes[1].node_id


def test_set_next_relationships():
    nodes = gen_nodes()
    docs.set_next_relationships(nodes)
    assert nodes[0].relationships[NodeRelationship.NEXT].node_id == nodes[1].node_id
    assert nodes[1].relationships[NodeRelationship.NEXT].node_id == nodes[2].node_id
    assert not nodes[2].relationships


def test_body():
    xml = docs.load_tei_xml(XML_SAMPLE_FILE_PATH)
    assert isinstance(docs.body(xml, xml.header.doi), list)


def test_node_relationships():
    title_node = TextNode(text="this is title")
    abstract_node = TextNode(text="this is abstract")
    body_nodes = gen_nodes()
    assert docs.set_relationships(title_node, abstract_node, body_nodes) is None
    assert (
        abstract_node.relationships[NodeRelationship.PARENT].node_id
        == title_node.node_id
    )
    for body_node in body_nodes:
        assert (
            body_node.relationships[NodeRelationship.PARENT].node_id
            == title_node.node_id
        )
    for body_node in body_nodes[:-1]:
        assert (
            body_node.relationships[NodeRelationship.NEXT].node_id
            == body_nodes[body_nodes.index(body_node) + 1].node_id
        )
    for body_node in body_nodes[1:]:
        assert (
            body_node.relationships[NodeRelationship.PREVIOUS].node_id
            == body_nodes[body_nodes.index(body_node) - 1].node_id
        )


def test_set_citations():
    xml = docs.load_tei_xml(XML_SAMPLE_FILE_PATH)
    title_node = TextNode(text="this is title")
    abstract_node = TextNode(text="this is abstract")
    body_nodes = gen_nodes()
    docs.set_citations(xml=xml, nodes=[title_node, abstract_node, body_nodes])
    assert title_node.metadata["citation"] == docs.cite(xml)
    assert abstract_node.metadata["citation"] == docs.cite(xml)
    for body_node in body_nodes:
        assert body_node.metadata["citation"] == docs.cite(xml)
