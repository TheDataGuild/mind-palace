//// Paragraph 1 ///////////////////////////////////////////////////////////////
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
CREATE (d)-[r6:FIRST_MEETING_AT]->(l);

// Relation 9
MATCH (n:narrator), (d:dupin), (v:volume)
CREATE (n)-[r6:BONDED_OVER]->(v)
CREATE (d)-[r7:BONDED_OVER]->(v);

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
CREATE (d)-[r9:AFFORD]->(h)
SET r8.mood = "grotesque";

// Relation 14
MATCH (h:house)
SET h.suit = "their mood";


//// Paragraph 2 //////////////////////////////////////////////////////////////
// Create nodes
MERGE (narrator:Character {name: "narrator"});
MERGE (dupin:Character {name: "Dupin"});
MERGE (rueMorgue:Location {name: "Rue-Morgue"});
MERGE (parisien:Location {name: "Parisien"});
MERGE (darkness:Object {name: "darkness"});
MERGE (atmosphere:Object {name: "atmosphere"});
MERGE (shutters:Object {name: "shutters"});

// Relation 1
MATCH (n:Character {name: "narrator"}), (dupin:Character {name: "Dupin"})
CREATE (n)-[r1:TELLS]->(dupin)
SET r1.description = "If you could observe their daily routines, you'd think the pair suffered from madness.";

// Relation 2
MATCH (dupin:Character {name: "Dupin"}), (dupin)-[r2:KEPT_TO_THEMSELVES]->(dupin)
SET r2.description = "The pair kept completely to themselves.";

// Relation 3
MATCH (dupin:Character {name: "Dupin"}), (dupin)-[r3:OBSESSED_WITH]->(night:Location {name: "night"})
SET r3.description = "Dupin especially was obsessed with night time.";

// Relation 4
MATCH (narrator:Character {name: "narrator"}), (narrator)-[r4:FEELS]->(night)
SET r4.description = "The narrator feels the same way.";

// Relation 5
MATCH (dupin:Character {name: "Dupin"}), (dupin)-[r5:RECREATES]->(parisien)
SET r5.description = "Even in the day, they recreate the darkness and atmosphere of the Parisien night.";

// Relation 6
MATCH (dupin:Character {name: "Dupin"}), (dupin)-[r6:WRITES_READS]->(falseNight:Object {name: "false night"})
SET r6.description = "In this false night, they write and read.";

// Relation 7
MATCH (dupin:Character {name: "Dupin"}), (dupin)-[r7:JAUNTS_AROUND]->(town:Location {name: "town"})
SET r7.description = "When real night came, they jaunt around town.";


//// Paragraph 3 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (narrator:Character {name: "narrator"});
MERGE (dupin:Character {name: "Dupin"});
MERGE (rueMorgue:Location {name: "Rue-Morgue"});
MERGE (analyticAbility:Object {name: "analytic ability"});
MERGE (humanSpecimens:Object {name: "human specimens"});
MERGE (soul:Object {name: "soul"});
MERGE (mysteryStory:Object {name: "mystery story"});
MERGE (character:Object {name: "character"});
MERGE (example:Object {name: "example"});
MERGE (strolling:Object {name: "strolling"});
MERGE (astuteness:Object {name: "astuteness"});

// Relation 1
MATCH (narrator:Character {name: "narrator"}), (dupin:Character {name: "Dupin"})
CREATE (narrator)-[r1:COMMENTS]->(dupin)
SET r1.description = "The narrator of 'Rue-Morgue' comments that Dupin has a particular analytic ability.";

// Relation 2
MATCH (dupin:Character {name: "Dupin"}), (dupin)-[r2:ENJOYS_USING]->(analyticAbility)
SET r2.description = "Dupin enjoys using his analytic ability while they are out.";

// Relation 3
MATCH (dupin:Character {name: "Dupin"}), (dupin)-[r3:OBSERVES]->(humanSpecimens)
SET r3.description = "They are observing the human specimens around them.";

// Relation 4
MATCH (dupin:Character {name: "Dupin"}), (dupin)-[r4:BELIEVES]->(soul)
SET r4.description = "Dupin believes he can see right into a man's soul.";

// Relation 5
MATCH (narrator:Character {name: "narrator"}), (narrator)-[r5:CLARIFIES]->(mysteryStory)
SET r5.description = "The narrator clarifies that this isn't a mystery story about Dupin's character.";

// Relation 6
MATCH (narrator:Character {name: "narrator"}), (narrator)-[r6:USES]->(example)
SET r6.description = "The narrator is using an example from their recent strolling to illustrate Dupin's astuteness.";
