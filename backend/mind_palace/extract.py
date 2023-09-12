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


def _load_tei_xml(path) -> dict[str, TextNode]:
    with open(path, "r") as xml_file:
        doc = grobid_tei_xml.parse_document_xml(xml_file.read())

    filename = os.path.basename(path)

    try:
        node_title = TextNode(
            text=doc.header.title,
            id_=f"{filename}-title",
        )
        node_abstract = TextNode(
            text=doc.abstract,
            id_=f"{filename}-abstract",
        )
        # TODO: load more sections

        node_abstract.relationships[NodeRelationship.PARENT] = RelatedNodeInfo(
            node_id=node_title.node_id
        )
        return {"title": node_title, "abstract": node_abstract}
    except Exception as e:
        print(f"failed to load {path} because {e}")
        return None


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
        nodes_dict = _load_tei_xml(file_path)
        if nodes_dict:
            for node in nodes_dict.values():
                nodes.append(node)

    return nodes
