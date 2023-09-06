from llama_index import SimpleDirectoryReader


def load_documents():
    required_exts = [".pdf"]

    # Q: we could use a better text extractor supporting section-aware extraction
    return SimpleDirectoryReader(
        input_dir="./resources/pdfs/12-pdfs-from-steve-aug-22",
        required_exts=required_exts,
    ).load_data()
