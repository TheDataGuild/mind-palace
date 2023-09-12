from .context import extract

XML_PATH = "./resources/pdfs/12-pdfs-from-steve-aug-22/xml/"


def test_load_tei_xml():
    nodes_dict = extract._load_tei_xml(
        XML_PATH
        + "2010_PhysRevLett_Pulsating Tandem Microbubble for Localized and Directional Single-Cell Membrane Poration.pdf.tei.xml"
    )
    assert isinstance(nodes_dict, dict)
    for node in nodes_dict.values():
        assert isinstance(node, extract.TextNode)


def test_seed_nodes():
    input_dir = XML_PATH
    nodes = extract.seed_nodes(input_dir)
    assert isinstance(nodes, list)
    for node in nodes:
        assert isinstance(node, extract.TextNode)
