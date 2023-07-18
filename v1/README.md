# Murders in Rue Morgue property graph v1

A v1 property graph model of the murders in Edgar Allen Poe's short story "The Murders in the Rue Morgue".

![v1 graph overview](v1-graph-overview.png)

## Accessing the graph

This model is persisted on our Neo4J database at `neo4j+s://96bb6c6e.databases.neo4j.io`.

## Methodology

Going from text directly to Cypher ends up with a disconnected graph that's all over the place. Thus, we need to provide some modelling constraint. Here's an approach taken for this v1 model,

Applying a 2 stage approach.

Stage 1 `modelling_nodes.md`, semi-manual top-down analysis using [a third-party summary](../resources/murders_in_rue_morgue_summary.txt) with LLM to establish constraints to the graph model. Particularly limiting the node types. Do this once.

Stage 2 `modelling_relations.md`, using the node types from Stage 1, apply a series of guided reasoning prompts to parse each paragraph into Cypher. Iterate this over every paragraph one at a time.

Reference: https://github.com/TheDataGuild/mind-palace/pull/1

Note that we're using a third-party summary instead of the original text so that it's easier to go back and forth manually while figuring out this process. One of the next steps is to do-away with this extra summary requirement.
