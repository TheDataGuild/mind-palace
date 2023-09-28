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


def summarize_prompt(abstracts: List[str]):
    bullet_points = "\n".join([f"* {text}" for text in abstracts])
    return {
        "system": (
            "You are a science journalist summarizing papers for your readers.\n"
            "Instructions:\n"
            "respond with fewer than 100 words\n"
            "start your response with 'This collection of papers'"
        ),
        "user": f"Summarize these research papers:\n'''{bullet_points}'''",
    }


def summarize(gpt_model, texts: List[str]):
    prompt = summarize_prompt(texts)
    messages = [
        ChatMessage(role="system", content=prompt["system"]),
        ChatMessage(role="user", content=prompt["user"]),
    ]
    resp = OpenAI(model=gpt_model).chat(messages)
    return resp.message.content


def get_welcome_message(nodes):
    # TODO:
    return "Ask me a question about these PDFs"
