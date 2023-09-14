from tests.context import extract, index, measure
import llama_index as li


def bootstrap_index(xml_dir):
    nodes = extract.seed_nodes(xml_dir)
    vector_index, elapsed_time = measure.time_function(lambda: index.index_nodes(nodes))
    print(f"Elapsed time {elapsed_time:.1f} seconds: Indexed {len(nodes)} nodes")
    return vector_index


def persist_index(vector_index):
    vector_index.storage_context.persist()


def test_query():
    storage_context = li.StorageContext.from_defaults(persist_dir="./tests/end_to_end/llama_stores/12-pdfs-from-steve-aug-22/")
    vector_index = li.load_index_from_storage(storage_context)
    assert vector_index is not None

    # Querying
    # query_engine = vector_index.as_query_engine()

# This query calls out to OppenAI
# response = query_engine.query("What interaction is investigated?")
# >>> print(response)
# The interaction of laser-generated tandem microbubble with single cells is investigated.
#
# >>> query_engine.query("What is the significant finding in this investigation?")
# The significant finding in this investigation is that the interaction of
# laser-generated tandem microbubbles with single cells can lead to the
# formation of alternating, directional microjets and vortices. This
# interaction can also result in localized and directional membrane poration,
# which is absent when using a single oscillating microbubble of comparable
# size and at the same stand-off distance.
