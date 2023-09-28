import re

import pytest

from tests.context import docs, extract
from tests.context import welcome as w

from . import test_docs


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


def test_summarize_prompt():
    abstracts = ["this is abstract", "second abstract"]
    prompt = w._summarize_prompt(abstracts)
    assert isinstance(prompt, dict)
    assert isinstance(prompt["system"], str)
    assert re.search(r"'''\* this is abstract\n\* second abstract'''", prompt["user"])


@pytest.mark.skip(reason="calls out to OpenAI API and is not free")
def test_summerize():
    nodes = extract.seed_nodes(test_docs.XML_PATH)
    abstracts = w.parse_abstracts(nodes)
    summary = w.summarize("gpt-3.5-turbo", abstracts)

    # An example response from GPT:
    # This collection of papers focuses on the process of sonoporation, which
    # involves using ultrasound and microbubbles to temporarily permeate the
    # plasma membrane of cells. The papers discuss the mechanistic knowledge of
    # sonoporation-induced cellular impact, the spatiotemporal characteristics
    # of sonoporation, the disruption of the actin cytoskeleton during
    # sonoporation, the role of membrane blebbing in cell recovery, the cellular
    # impact of sonoporation on living cells, the properties of daughter bubbles
    # created during inertial cavitation, and the dynamics of membrane
    # perforation and resealing during sonoporation. These findings provide
    # valuable insights into the potential applications and optimization of
    # sonoporation as a drug and gene delivery technique.

    assert summary.startswith("This collection of papers")
    assert len(summary.split()) < 200
    assert "sonoporation" in summary


def test_extract_keywords_output():
    assert w._extract_keywords_output(
        "1. Sonoporation\n2. Microbubble-mediated ultrasound\n3. Drug delivery\n4. Cellular impact\n5. Membrane resealing"
    ) == [
        "Sonoporation",
        "Microbubble-mediated ultrasound",
        "Drug delivery",
        "Cellular impact",
        "Membrane resealing",
    ]


@pytest.mark.skip(reason="calls out to OpenAI API and is not free")
def test_extract_keywords():
    nodes = extract.seed_nodes(test_docs.XML_PATH)
    abstracts = w.parse_abstracts(nodes)
    keywords = w.extract_keywords("gpt-3.5-turbo", abstracts)
    assert isinstance(keywords, list)
    assert len(keywords) == 5
    assert all(isinstance(keyword, str) for keyword in keywords)
    assert "Sonoporation" in keywords
