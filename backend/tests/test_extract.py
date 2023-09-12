from .context import extract


def test_seed_nodes():
    input_dir="./resources/pdfs/12-pdfs-from-steve-aug-22/xml"
    nodes = extract.seed_nodes(input_dir)
    assert isinstance(nodes, list)
    for node in nodes:
        assert isinstance(node, extract.TextNode)
