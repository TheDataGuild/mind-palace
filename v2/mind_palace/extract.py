import llama_index as li
from llama_index.schema import TextNode, NodeRelationship, RelatedNodeInfo
import grobid_tei_xml


def load_pdfs():
    required_exts = [".pdf"]

    # Q: we could use a better text extractor supporting section-aware extraction
    return li.SimpleDirectoryReader(
        input_dir="./resources/pdfs/12-pdfs-from-steve-aug-22",
        required_exts=required_exts,
    ).load_data()


def nodes(documents, service_context=li.ServiceContext.from_defaults()):
    return service_context.node_parser.get_nodes_from_documents(
        documents, show_progress=True
    )


# a Node from load_pdfs standard pipeline
#
# >>> nodes[0].__dict__.keys()
# dict_keys(['id_', 'embedding', 'metadata', 'excluded_embed_metadata_keys',
# 'excluded_llm_metadata_keys', 'relationships', 'hash', 'text',
# 'start_char_idx', 'end_char_idx', 'text_template', 'metadata_template',
# 'metadata_seperator'])


def load_tei_xml(path):
    with open(path, "r") as xml_file:
        doc = grobid_tei_xml.parse_document_xml(xml_file.read())

    node_title = TextNode(
        text=doc.header.title,
        id_="Pulsating Tandem Microbubble for Localized and Directional Single-Cell Membrane Poration-title",
    )
    node_abstract = TextNode(
        text=doc.abstract,
        id_="Pulsating Tandem Microbubble for Localized and Directional Single-Cell Membrane Poration-abstract",
    )
    # set relationships
    node_abstract.relationships[NodeRelationship.PARENT] = RelatedNodeInfo(
        node_id=node_title.node_id
    )
    return [node_title, node_abstract]


def seed_nodes():
    xml_path = "./resources/pdfs/12-pdfs-from-steve-aug-22/xml/2010_PhysRevLett_Pulsating Tandem Microbubble for Localized and Directional Single-Cell Membrane Poration.pdf.tei.xml"
    return load_tei_xml(xml_path)

