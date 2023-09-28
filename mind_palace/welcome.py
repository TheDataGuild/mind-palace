from typing import List

from docs import Section
from llama_index.llms import ChatMessage, OpenAI


def parse_abstracts(nodes) -> List[str]:
    """Returns a list of abstract texts from a list of nodes."""
    return [
        node.get_text()
        for node in nodes
        if node.metadata["section"] == str(Section.ABSTRACT)
    ]


def _as_bullet_points(texts: List[str]) -> str:
    return "\n".join([f"* {text}" for text in texts])


def _summarize_prompt(abstracts: List[str]):
    return {
        "system": (
            "You are a science journalist summarizing papers for your readers.\n"
            "Instructions:\n"
            "respond with fewer than 100 words\n"
            f"start your response with 'This collection of {len(abstracts)} papers'"
        ),
        "user": f"Summarize these research papers:\n'''{_as_bullet_points(abstracts)}'''",
    }


def summarize(gpt_model, texts: List[str]) -> str:
    prompt = _summarize_prompt(texts)
    messages = [
        ChatMessage(role="system", content=prompt["system"]),
        ChatMessage(role="user", content=prompt["user"]),
    ]
    resp = OpenAI(model=gpt_model).chat(messages)
    return resp.message.content


def _extract_keywords_prompt(abstracts: List[str]):
    return {
        "system": "You are a science journalist extracting keywords from papers for your readers.\n",
        "user": f"Extract five keywords from these research papers:\n'''{_as_bullet_points(abstracts)}'''",
    }


def _extract_keywords_output(message):
    keywords = message.split("\n")
    return [keyword.split(". ")[1] for keyword in keywords]


def extract_keywords(gpt_model, texts: List[str]) -> List[str]:
    prompt = _extract_keywords_prompt(texts)
    messages = [
        ChatMessage(role="system", content=prompt["system"]),
        ChatMessage(role="user", content=prompt["user"]),
    ]
    resp = OpenAI(model=gpt_model).chat(messages)
    return _extract_keywords_output(resp.message.content)
