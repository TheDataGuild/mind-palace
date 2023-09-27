from tests.context import docs
from tests.context import welcome as w


def test_parse_abstracts():
    nodes = [
        docs.create_text_node(
            text="this is abstract", node_id=1, section=docs.Section.ABSTRACT
        ),
        docs.create_text_node(
            text="this is not abstract", node_id=2, section=docs.Section.BODY
        ),
    ]
    abstracts = w.parse_abstracts(nodes)
    assert len(abstracts) == 1
    assert isinstance(abstracts, list)
    assert all(isinstance(abstract, str) for abstract in abstracts)
