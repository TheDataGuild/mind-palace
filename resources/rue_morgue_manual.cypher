# https://www.litcharts.com/lit/poe-s-stories/the-murders-in-the-rue-morgue
# https://www.supersummary.com/the-murders-in-the-rue-morgue/summary/


CREATE (narrator:Person {name: "The unnamed narrator"})
CREATE (dupin:Person {name: "Monsieur C. Auguste Dupin"})
CREATE (library:Place {name: "an offbeat library on Rue Montmartre"})
CREATE (mansion:Place {name: "a time-eaten and grotesque mansion in Faubourg St. Germain"})
CREATE (book:Object {})

CREATE (narrator)-[:MET]->(dupin)
CREATE (narrator)-[:LIVES_IN]->(mansion)
CREATE (dupin)-[:LIVES_IN]->(mansion)
CREATE (dupin)-[:LIKES]->(book)
CREATE (narrator)-[:VISITED]->(library)
CREATE (dupin)-[:VISITED]->(library)
CREATE (narrator)-[:MET_AT]->(library)<-[:MET_AT]-(dupin)

create (chantilly:Person {name: "Chantilly", occupation: "stage actor"})
CREATE (chantilly)-[:READS_MIND]->(narrator)
CREATE (chantilly)-[:AGREES_WITH]->(narrator)
CREATE (chantilly)-[:ANALYZES_INTERACTION]->(narrator)
CREATE (narrator)-[:HAS_THOUGHT_PATTERN]->(chantilly)
CREATE (chantilly)-[:HAS_DUALITY]->(narrator)
