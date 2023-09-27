from typing import List

from docs import Section


def parse_abstracts(nodes) -> List[str]:
    """Returns a list of abstract texts from a list of nodes."""
    return [
        node.get_text()
        for node in nodes
        if node.metadata["section"] == str(Section.ABSTRACT)
    ]


def summarize(texts):
    # TODO:
    return


def get_welcome_message(nodes):
    # TODO:
    return "Ask me a question about these PDFs"
