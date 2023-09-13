from llama_index.schema import TextNode, NodeRelationship, RelatedNodeInfo
import grobid_tei_xml


def load_tei_xml(file_path):
    print(f"Loading {file_path}")
    with open(file_path, "r") as xml_file:
        return grobid_tei_xml.parse_document_xml(xml_file.read())


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


def set_relationships(title_node, abstract_node):
    abstract_node.relationships[NodeRelationship.PARENT] = RelatedNodeInfo(
        node_id=title_node.node_id
    )
    return
