import llama_index as li
from llama_index.schema import TextNode, NodeRelationship, RelatedNodeInfo


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


def seed_nodes():
    node_title = TextNode(
        text="Pulsating Tandem Microbubble for Localized and Directional Single-Cell Membrane Poration",
        id_="Pulsating Tandem Microbubble for Localized and Directional Single-Cell Membrane Poration-title",
    )
    node_abstract = TextNode(
        text="The interaction of laser-generated tandem microbubble (maximum diameter of about 50 m) with single (rat mammary carcinoma) cells is investigated in a 25-m liquid layer. Antiphase and coupled oscillation of the tandem microbubble leads to the formation of alternating, directional microjets (with max microstreaming velocity of 10 m=s) and vortices (max vorticity of 350 000 s À1 ) in opposite directions. Localized and directional membrane poration (200 nm to 2 m in pore size) can be produced by the tandem microbubble in an orientation and proximity-dependent manner, which is absent from a single oscillating microbubble of comparable size and at the same stand-off distance.",
        id_="Pulsating Tandem Microbubble for Localized and Directional Single-Cell Membrane Poration-abstract",
    )
    # set relationships
    node_abstract.relationships[NodeRelationship.PARENT] = RelatedNodeInfo(
        node_id=node_title.node_id
    )
    return [node_title, node_abstract]
