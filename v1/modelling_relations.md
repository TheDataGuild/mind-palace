## Pass 1

### Prompt

```
Given the following text, define a property graph model. Follow these rules:

- create nodes for instances which fit one of the given types
- parse relations from the text between the created nodes
- do not use pronouns, name each noun explicitly
- do not assume any relations which are not explicitly mentioned in the text

Node Types: Character, Location, Object, Testimony, Evidence

Text 1: """
Foo and Bar are friends. They like to eat cheese together.
"""
Model 1:
"""
Nodes:
- Character:
  - Foo
  - Bar
- Object:
  - cheese

Relations:
1. Foo and Bar are friends.
2. Foo eats cheese.
3. Bar eats cheese.
4. Foo and Bar eats cheese together.
"""

Text 2:
"""
"""
Model 2:
```

### Output

model: `gpt-3.5-turbo`

```
Nodes:
- Character:
  - narrator
  - Auguste Dupin
- Location:
  - Paris
- Object:
  - Books
  - special volume
  - house

Relations:
1. The narrator tells us that this discussion will be relevant to the story.
2. The narrator introduces us to Auguste Dupin.
3. The narrator is spending time in Paris with Auguste Dupin.
4. Auguste Dupin is a man of high class and family.
5. Auguste Dupin has lost a lot of his fortune in a series of events.
6. Books are now Auguste Dupin's highest luxury.
7. The narrator shares a love for books with Auguste Dupin.
8. The narrator and Auguste Dupin had their first meeting at a library.
9. They bonded over a special volume.
10. The narrator is surprised at how well read Auguste Dupin is.
11. The narrator judges that Auguste Dupin's company during their stay in Paris will be very valuable.
12. The pair live together.
13. They can afford a romantic but "grotesque" house with their combined fortunes.
14. The house seems to suit their mood.
```

## Pass 2

### Prompt

```
Parse this text into Cypher language. Re-use the nodes and relations as much as possible to limit number of nodes and relations.

Text 1: """
Nodes:
- Character:
  - Foo
  - Bar
- Object:
  - cheese

Relations:
1. Foo likes cheese.
2. Bar likes cheese.
3. Foo and Bar eats cheese together sometimes.
"""
Cypher 1:
// Create nodes
MERGE (f:Character {name: "Foo"});
MERGE (b:Character {name: "Bar"});
MERGE (c:Object {name: "cheese"});

// Relation 1
MATCH (a:Character {name: "Foo"}), (c:Object {name: "cheese"})
CREATE (a)-[r1:LIKES]->(cheese);

// Relation 2
MATCH (a:Character {name: "Bar"}), (c:Object {name: "cheese"})
CREATE (a)-[r1:LIKES]->(cheese);

// Relation 3
MATCH (a:Character {name: "Foo"}), (b:Character {name: "Bar"})
MERGE (a)-[r1:EATS_WITH]->(b)
SET r.interval = "sometimes";

##
Text: """
"""
Cypher 2:
```

## Output

model: `gpt-3.5-turbo`

```
// Create nodes
MERGE (narrator:Character {name: "narrator"});
MERGE (dupin:Character {name: "Auguste Dupin"});
MERGE (paris:Location {name: "Paris"});
MERGE (books:Object {name: "Books"});
MERGE (volume:Object {name: "special volume"});
MERGE (house:Object {name: "house"});

// Relation 1
MATCH (n:narrator)
SET n.relevance = "relevant to the story";

// Relation 2
MATCH (n:narrator), (d:dupin)
CREATE (n)-[r1:INTRODUCES]->(d);

// Relation 3
MATCH (n:narrator), (d:dupin), (p:paris)
CREATE (n)-[r2:SPENDS_TIME_WITH]->(d)
SET r2.location = p.name;

// Relation 4
MATCH (d:dupin)
SET d.class = "high class",
    d.family = "high class";

// Relation 5
MATCH (d:dupin)
SET d.fortune = "lost a lot";

// Relation 6
MATCH (d:dupin), (b:books)
CREATE (d)-[r3:HAS_LUXURY]->(b)
SET r3.level = "highest";

// Relation 7
MATCH (n:narrator), (d:dupin), (b:books)
CREATE (n)-[r4:SHARES_LOVE_WITH]->(d)
SET r4.item = b.name;

// Relation 8
MATCH (n:narrator), (d:dupin), (l:Location {name: "library"})
CREATE (n)-[r5:FIRST_MEETING_AT]->(l)
CREATE (d)-[r5]->(l);

// Relation 9
MATCH (n:narrator), (d:dupin), (v:volume)
CREATE (n)-[r6:BONDED_OVER]->(v)
CREATE (d)-[r6]->(v);

// Relation 10
MATCH (n:narrator), (d:dupin)
SET n.read = "surprised",
    d.read = "well";

// Relation 11
MATCH (n:narrator), (d:dupin)
SET n.judgment = "valuable";

// Relation 12
MATCH (n:narrator), (d:dupin)
CREATE (n)-[r7:LIVE_TOGETHER]->(d);

// Relation 13
MATCH (n:narrator), (d:dupin), (h:house)
CREATE (n)-[r8:AFFORD]->(h)
CREATE (d)-[r8]->(h)
SET r8.mood = "grotesque";

// Relation 14
MATCH (h:house)
SET h.suit = "their mood";
```

## Reference

Text = paste the text from `./murders_in_rue_morgue_summary.txt`, one paragraph at a time

Drop database,

```cypher
MATCH (n)
DETACH DELETE n;
```
