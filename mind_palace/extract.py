import os

import docs
from llama_index.schema import TextNode


def _gen_document_dict(file_path) -> dict[str, TextNode]:
    xml = docs.load_tei_xml(file_path)
    doi = xml.header.doi
    assert doi is not None

    try:
        title_node = docs.title(xml, doi)
        abstract_node = docs.abstract(xml, doi)
        body_nodes = docs.body(xml, doi)

        docs.set_relationships(title_node, abstract_node, body_nodes)
        docs.set_citations(xml=xml, nodes=[title_node, abstract_node, body_nodes])

        return {
            "title": title_node,
            "abstract": abstract_node,
            "body_paragraphs": body_nodes,
        }

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
        nodes_dict = _gen_document_dict(file_path)
        if nodes_dict:
            for node in nodes_dict.values():
                if isinstance(node, TextNode):
                    nodes.append(node)
                elif isinstance(node, list):
                    nodes.extend(node)

    return nodes
