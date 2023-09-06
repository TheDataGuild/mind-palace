import timer


def load_documents():
    # TODO: refactor this step out (so I'm keeping it self-contained with imports for now)
    from llama_index import SimpleDirectoryReader

    required_exts = [".pdf"]

    # Q: we could use a better text extractor supporting section-aware extraction
    return SimpleDirectoryReader(
        input_dir="./resources/pdfs/12-pdfs-from-steve-aug-22", required_exts=required_exts
    ).load_data()


docs, elapsed_time = timer.time_function(load_documents)
print(f"Elapsed time {elapsed_time:.1f} seconds: Loaded {len(docs)} total pages (aka Documents) from {len(set([doc.metadata['file_name'] for doc in docs]))} PDFs")

# Index Construction
def index_documents(documents):
    # TODO: refactor this step out (so I'm keeping it self-contained with imports for now)
    from llama_index.llms import OpenAI

    from llama_index import ServiceContext
    from llama_index import VectorStoreIndex

    service_context = ServiceContext.from_defaults(
        llm=OpenAI(model="gpt-3.5-turbo"),
        embed_model="local"
        # Q: how much does a better embedding model help?
    )

    # add docs to a VectorStoreIndex one at a time to avoid OpenAI rate limits
    # note that we reverted to not using OpenAI for embedding for now because it's slow
    print(f"Adding {docs[0].metadata}")
    index = VectorStoreIndex.from_documents(documents[:1], service_context=service_context)

    for doc in documents[1:]:
        print(f"Adding {doc.metadata}")
        index.insert(doc)

    return index

index, elapsed_time = timer.time_function(lambda: index_documents(docs))
print(f"Elapsed time {elapsed_time:.1f} seconds: Indexed {len(docs)} total pages (aka Documents) from {len(set([doc.metadata['file_name'] for doc in docs]))} PDFs")

# Querying

query_engine = index.as_query_engine()
# This query calls out to OppenAI
# response = query_engine.query("What are the potential applications of sonoporation in drug/gene delivery and cancer therapy?")

# >>> print(response)
# Sonoporation has potential applications in drug/gene delivery and cancer
# therapy. It can be used for in vitro and in vivo gene/drug delivery studies,
# as well as for cancer treatment. Sonoporation can also be utilized for
# bio-marker extraction and has the potential to enhance the efficacy of
# sonoporation-mediated drug/gene delivery through the development of proper
# cytoprotection strategies. Furthermore, further innovations in
# sonoporation-based treatment applications may be formulated.
#
# >>> response.source_nodes
# [NodeWithScore(node=TextNode(id_='2dbb3c09-32e8-4e00-9a5d-6d194b91fe7c', embedding=None, metadata={'page_label': '1', 'file_name': '2022_BME Frontiers_Ultrasound-Mediated Drug Delivery Sonoporation Mechanisms,.pdf'}, excluded_embed_metadata_keys=[], excluded_llm_metadata_keys=[], relationships={<NodeRelationship.SOURCE: '1'>: RelatedNodeInfo(node_id='9dfbae35-a6df-4614-87f5-bb23f1a02b88', node_type=None, metadata={'page_label': '1', 'file_name': '2022_BME Frontiers_Ultrasound-Mediated Drug Delivery Sonoporation Mechanisms,.pdf'}, hash='78930d79cac509f5aa48f29e49a427659ec4b105a8431902082da0afbf0862c6'), <NodeRelationship.PREVIOUS: '2'>: RelatedNodeInfo(node_id='5f529d80-c0fd-4c07-acb4-9ea48e78debf', node_type=None, metadata={'page_label': '1', 'file_name': '2022_BME Frontiers_Ultrasound-Mediated Drug Delivery Sonoporation Mechanisms,.pdf'}, hash='bd815f7605fc43c6cd202ff023c74746b6aa44da0dfd4c68dc6ca09535a41771')}, hash='7bb9da9a5422ca874d3b23e7fe41a73c55734544c24bab224697bbbe734ba4f3', text='Accordingly, various therapeutic\napplications have been developed based on both in vitro and\nin vivo gene/drug delivery studies [2, 14, 15, 31, 36 –38], bio-\nmarker extraction [39], cancer treatment [36, 40 –43], blood-AAAS\nBME Frontiers\nVolume 2022, Article ID 9807347, 17 pages\nhttps://doi.org/10.34133/2022/9807347', start_char_idx=None, end_char_idx=None, text_template='{metadata_str}\n\n{content}', metadata_template='{key}: {value}', metadata_seperator='\n'), score=0.925180899629173), NodeWithScore(node=TextNode(id_='e8d14135-5a80-4e3f-b5f2-b669dcbc5142', embedding=None, metadata={'page_label': '1085', 'file_name': '2013_Ultrasound Med Biol_Sonoporation as a Cellular Stress Induction of Morphological Repression.pdf'}, excluded_embed_metadata_keys=[], excluded_llm_metadata_keys=[], relationships={<NodeRelationship.SOURCE: '1'>: RelatedNodeInfo(node_id='aa5c9274-ad54-42bc-b0de-f5f44c923b84', node_type=None, metadata={'page_label': '1085', 'file_name': '2013_Ultrasound Med Biol_Sonoporation as a Cellular Stress Induction of Morphological Repression.pdf'}, hash='a1f1bba513abf4cbdc1f14a5bf88dc3ad8158fa043077632fef65d28a1d71582'), <NodeRelationship.PREVIOUS: '2'>: RelatedNodeInfo(node_id='03e49605-2fad-4245-97ae-bf0913a6b71e', node_type=None, metadata={'page_label': '1085', 'file_name': '2013_Ultrasound Med Biol_Sonoporation as a Cellular Stress Induction of Morphological Repression.pdf'}, hash='2f28389bf3093302d69d3160ee6eb59a5674ba59fcbdf28dfa53bf05ad7aabdf')}, hash='3797ac389f56dde2158b2f522917f8ea079c686de4e2649bbff7e1045b6561df', text='We anticipate that with enriched efforts in investi-\ngating the biological aspects of sonoporation, proper cy-toprotection strategies may be developed to reinforce the\nefﬁcacy of sonoporation-mediated drug/gene delivery; in\naddition, further innovations in sonoporation-based treat-ment applications may be formulated.Acknowledgments— This work has been supported in part by the Hong\nKong Innovation and Technology Fund (ITS/292/11) and the University\nof Hong Kong (201109176229).The authors are grateful to Dr. Wai-Hung Sit for his technical advice on the bromodeoxyuridine ﬂow cytom-etry assay.REFERENCES\nBegg AC, McNally NJ, Shrieve DC, Karcher H. A method to measure\nthe duration of DNA synthesis and the potential doubling timefrom a single sample.Cytometry 1985;6:620–626.Bortner CD, Cidlowski JA.Cell shrinkage and monovalent cation ﬂuxes:\nRole in apoptosis.Arch Biochem Biophys 2007;462:176–188.Branzei D, Foiani M. Regulation of DNA repair throughout the cell\ncycle.Nat Rev Mol Cell Biol 2008;9:297–308.Campbell P, Prausnitz MR. Future directions of therapeutic ultrasound.Ultrasound Med Biol 2007;33:657.Chen YC, Liang HD, Zhang QP, Blomley MJK, Lu QL.Pluronic block\ncopolymers: Novel functions in ultrasound-mediated gene transferand against cell damage.Ultrasound Med Biol 2006;32:131–137.Fan Z, Kumon RE, Park J, Deng CX.Intracellular delivery and calcium\ntransients generated in sonoporation facilitated by microbubbles.J.Control Release 2010;142:31–39.Feril LB Jr, Kondo T. Biological effects of low intensity ultrasound: The\nmechanism involved, and its implications on therapy and onbiosafety of ultrasound.J Radiat Res 2004;45:479–489.Frenkel V. Ultrasound mediated delivery of drugs and genes to solid\ntumors.Adv Drug Deliv Rev 2008;60:1193–1208.Sonoporation as a cellular stress dX.C\nHENet al.1085', start_char_idx=None, end_char_idx=None, text_template='{metadata_str}\n\n{content}', metadata_template='{key}: {value}', metadata_seperator='\n'), score=0.9233340944979004)]
#
# >>> response.metadata
# {'2dbb3c09-32e8-4e00-9a5d-6d194b91fe7c': {'page_label': '1', 'file_name': '2022_BME Frontiers_Ultrasound-Mediated Drug Delivery Sonoporation Mechanisms,.pdf'}, 'e8d14135-5a80-4e3f-b5f2-b669dcbc5142': {'page_label': '1085', 'file_name': '2013_Ultrasound Med Biol_Sonoporation as a Cellular Stress Induction of Morphological Repression.pdf'}}
