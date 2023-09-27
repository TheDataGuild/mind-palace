from enum import Enum, auto

import grobid_tei_xml
from llama_index.schema import NodeRelationship, RelatedNodeInfo, TextNode


class Section(Enum):
    TITLE = auto()
    ABSTRACT = auto()
    BODY = auto()

    def __str__(self) -> str:
        return self.name.lower()


def create_text_node(node_id, text, section: Section, paragraph_number=None):
    return TextNode(
        text=text,
        metadata={"section": str(section), "paragraph_number": paragraph_number},
        excluded_embed_metadata_keys=["section"],
        id_=node_id,
    )


def load_tei_xml(file_path):
    print(f"Loading {file_path}")
    with open(file_path, "r") as xml_file:
        return grobid_tei_xml.parse_document_xml(xml_file.read())


def cite_authors(xml):
    first_author = xml.header.authors[0]
    first_author_display_name = f"{first_author.surname}, {first_author.given_name}"
    return first_author_display_name + (
        ", et al" if len(xml.header.authors) > 1 else ""
    )


def cite_journal(xml):
    return f"{xml.header.journal_abbrev} {xml.header.date};{xml.header.volume}({xml.header.issue}). doi:{xml.header.doi}"


def cite(xml):
    return f"{cite_authors(xml)}. {xml.header.title}. {cite_journal(xml)}."


def title(xml, doc_id):
    return create_text_node(
        node_id=f"{doc_id}-title", text=xml.header.title, section=Section.TITLE
    )


def abstract(xml, doc_id):
    return create_text_node(
        node_id=f"{doc_id}-abstract", text=xml.abstract, section=Section.ABSTRACT
    )


def set_prev_relationships(nodes):
    for index, node in enumerate(nodes[1:]):
        node.relationships[NodeRelationship.PREVIOUS] = RelatedNodeInfo(
            node_id=nodes[index].node_id
        )
    return


def set_next_relationships(nodes):
    for index, node in enumerate(nodes[:-1]):
        node.relationships[NodeRelationship.NEXT] = RelatedNodeInfo(
            node_id=nodes[index + 1].node_id
        )
    return


def body(xml, doc_id):
    """A naive implementation of body extraction"""
    return [
        create_text_node(
            node_id=f"{doc_id}-body-paragraph-{index}",
            text=line,
            section=Section.BODY,
            paragraph_number=index + 1,
        )
        for index, line in enumerate(xml.body.split("\n"))
    ]


def set_relationships(title_node, abstract_node, body_nodes):
    # set relationships between sections
    abstract_node.relationships[NodeRelationship.PARENT] = RelatedNodeInfo(
        node_id=title_node.node_id
    )
    for body_node in body_nodes:
        body_node.relationships[NodeRelationship.PARENT] = RelatedNodeInfo(
            node_id=title_node.node_id
        )

    # set relationships between body paragraphs
    set_prev_relationships(body_nodes)
    set_next_relationships(body_nodes)
    return


def _set_citation_metadata(citation, node):
    node.metadata["citation"] = citation
    return


def set_citations(xml, nodes):
    citation = cite(xml)
    for node in nodes:
        if isinstance(node, list):
            for sub_node in node:
                _set_citation_metadata(citation, sub_node)
            continue
        else:
            _set_citation_metadata(citation, node)

    return
