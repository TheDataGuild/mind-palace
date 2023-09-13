import os
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

# TODO: move these into a submodule


def _load_tei_xml(filepath):
    with open(filepath, "r") as xml_file:
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


def _gen_document_dict(xml) -> dict[str, TextNode]:
    doi = xml.header.doi
    assert doi is not None

    try:
        title_node = title(xml, doi)
        abstract_node = abstract(xml, doi)
        # TODO: load more sections

        set_relationships(title_node, abstract_node)
        return {"title": title_node, "abstract": abstract_node}
    except Exception as e:
        print(f"failed to load DOI {doi} because {e}")
        return {}


def _get_file_paths(directory_path):
    file_paths = []
    for filename in os.listdir(directory_path):
        file_path = os.path.join(directory_path, filename)
        if os.path.isfile(file_path):
            file_paths.append(file_path)
    return file_paths


def seed_nodes(input_dir) -> list[TextNode]:
    nodes = []
    file_paths = _get_file_paths(input_dir)

    for file_path in file_paths:
        print(f"loading {file_path}")
        xml_data = _load_tei_xml(file_path)
        nodes_dict = _gen_document_dict(xml_data)
        if nodes_dict:
            for node in nodes_dict.values():
                nodes.append(node)

    return nodes
