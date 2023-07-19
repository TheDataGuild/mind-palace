# Murders in Rue Morgue property graph v1

A v1 property graph model of the murders in Edgar Allen Poe's short story "The Murders in the Rue Morgue".

![v1 graph overview](v1-graph-overview.png)

## Accessing the graph

This model is persisted on our Neo4J database at `neo4j+s://96bb6c6e.databases.neo4j.io`.

## Solving the crime

Can we solve this crime using only the property graph and no prior knowledge?

First, let's see what node labels we have.

```
$ match (n) return distinct labels(n);

["Object"]
["Location"]
["Character"]
["neighbors"]
["police"]
["Testimony"]
[]
["Evidence"]
["Event"]
```

We see that there are two node labels that are relevant to our investigation: Evidence and Character. Let's use the Neo4J Bloom Explorer to see which characters are connected to evidences.

![(Evidence) - (Character)](evidence-chracter.png)

Character `Ourang-Outang` seems suspicious with its connection to `screams`. Let's see what other relations Ourang-Outang has by expanding all its neighbours.

![(Ourang-Outang)](ourang-outang.png)

The relation `CONCEALS` between `Ourang-Outang` and `bodies` seems important. Let's expand the `bodies` node to see what other relations it has.

![(bodies)](bodies.png)

At this point, we hit a roadblock. The relations between `bodies` and the `mother` and `daughter` (victims) are missing. These relations were mentioned in the text, but they were not extracted from the text.

The relation between `screams` and a `Testimony` by a `Witness` is also missing. This is another critical piece of information that is not in the data.

Without these missing relations, we cannot solve the crime. The data extraction process failed to extract these important relations. If these relations had been extracted, we would have been able to identify `Ourang-Outang` as the murderer.

## Data Extraction Process

Going from text directly to Cypher ends up with a disconnected graph that's all over the place (it's a quality spectrum, because it still is, just less so). Thus, we need to provide some modelling constraint. Here's an approach taken for this v1 model,

Applying a 2 stage approach.

Stage 1 `modelling_nodes.md`, semi-manual top-down analysis using [a third-party summary](../resources/murders_in_rue_morgue_summary.txt) with LLM to establish constraints to the graph model. Particularly limiting the node types. Do this once.

Stage 2 `modelling_relations.md`, using the node types from Stage 1, apply a series of guided reasoning prompts to parse each paragraph into Cypher. Iterate this over every paragraph one at a time.

Reference: https://github.com/TheDataGuild/mind-palace/pull/1

Note that we're using a third-party summary instead of the original text so that it's easier to go back and forth manually while figuring out this process. One of the next steps is to do-away with this extra summary requirement.

## Known shortcomings

- dirty nodes, e.g. police and policeman should be the same Character node
- erroneous relations (false positives), e.g. `(dupin)-[:BELONGS_TO]->(sailor)` doesn't make sense at all
- missing relations (false negatives), e.g.
- large quantity of errors
- lack of source reference, see [ticket](https://github.com/TheDataGuild/mind-palace/issues/2)
