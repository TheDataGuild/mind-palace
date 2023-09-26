import grobid_tei_xml
from llama_index.schema import NodeRelationship, RelatedNodeInfo, TextNode


def load_tei_xml(file_path):
    print(f"Loading {file_path}")
    with open(file_path, "r") as xml_file:
        return grobid_tei_xml.parse_document_xml(xml_file.read())


def cite_authors(xml):
    first_author = xml.header.authors[0]
    first_author_display_name = f"{first_author.surname}, {first_author.given_name}"
    return first_author_display_name + (
        ", et al." if len(xml.header.authors) > 1 else "."
    )


def title(xml, doc_id):
    return TextNode(
        text=xml.header.title,
        id_=f"{doc_id}-title",
    )


def abstract(xml, doc_id):
    return TextNode(
        text=xml.abstract,
        id_=f"{doc_id}-abstract",
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
    # TODO: Improve body extraction
    return [
        TextNode(
            text=line,
            id_=f"{doc_id}-body-paragraph-{index}",
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
