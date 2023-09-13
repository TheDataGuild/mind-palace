import os
import llama_index as li
from llama_index.schema import TextNode

import docs


def _gen_document_dict(file_path) -> dict[str, TextNode]:
    xml = docs.load_tei_xml(file_path)
    doi = xml.header.doi
    assert doi is not None

    try:
        title_node = docs.title(xml, doi)
        abstract_node = docs.abstract(xml, doi)
        # TODO: load more sections

        docs.set_relationships(title_node, abstract_node)
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
        nodes_dict = _gen_document_dict(file_path)
        if nodes_dict:
            for node in nodes_dict.values():
                nodes.append(node)

    return nodes
