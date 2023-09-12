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


def _load_tei_xml(filepath):
    with open(filepath, "r") as xml_file:
        return grobid_tei_xml.parse_document_xml(xml_file.read())


def _gen_document_dict(xml) -> dict[str, TextNode]:
    doi = xml.header.doi
    assert doi is not None

    try:
        node_title = TextNode(
            text=xml.header.title,
            id_=f"{doi}-title",
        )
        node_abstract = TextNode(
            text=xml.abstract,
            id_=f"{doi}-abstract",
        )
        # TODO: load more sections

        node_abstract.relationships[NodeRelationship.PARENT] = RelatedNodeInfo(
            node_id=node_title.node_id
        )
        return {"title": node_title, "abstract": node_abstract}
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
