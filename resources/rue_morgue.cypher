CREATE (analyticalMinds:Entity {name: "Analytical Minds"})
CREATE (people:Entity {name: "People"})
CREATE (enjoy:Entity {name: "Enjoy"})
CREATE (solve:Entity {name: "Solve"})
CREATE (patterns:Entity {name: "Patterns"})
CREATE (connections:Entity {name: "Connections"})
CREATE (intuition:Entity {name: "Intuition"})

CREATE (analyticalMinds)-[:IS_A]->(people)
CREATE (analyticalMinds)-[:ENJOYS]->(solve)
CREATE (analyticalMinds)-[:SEE_PATTERNS]->(patterns)
CREATE (analyticalMinds)-[:MAKE_CONNECTIONS]->(connections)
CREATE (solve)-[:RESULTS_IN]->(intuition)

MATCH
  (mathematical_study:Node {name: "Mathematical study"}),
  (problem_solving_skills:Node {name: "Problem-solving skills"})
WHERE
  mathematical_study.name IN ["Mathematical study", "mathematics"]
AND problem_solving_skills.name IN ["Problem-solving skills", "problem solving", "skills"]
CREATE
  (mathematical_study)-[r:improves]->(problem_solving_skills)
LABEL r "improves"

MATCH
  (chess:Node {name: "Chess"}),
  (draughts:Node {name: "Draughts"})
WHERE
  chess.name IN ["Chess", "chess"]
AND draughts.name IN ["Draughts", "draught"]
CREATE
  (chess)-[r:not_as_good_for_improving_problem_solving_skills]->(draughts)
LABEL r "not_as_good_for_improving_problem_solving_skills"

MATCH
  (acute_player:Node {name: "Acute player"}),
  (concentrative_player:Node {name: "Concentrative player"})
WHERE
  acute_player.name IN ["Acute player", "acute"]
AND concentrative_player.name IN ["Concentrative player", "concentrative"]
CREATE
  (acute_player)-[r:more_likely_to_win]->(draughts)
LABEL r "more_likely_to_win"

MATCH
  (winner:Node {name: "Winner"}),
  (outthink_opponent:Node {name: "Outthink opponent"})
WHERE
  winner.name IN ["Winner", "winner"]
AND outthink_opponent.name IN ["Outthink opponent", "outthink"]
CREATE
  (winner)-[r:can_outthink_opponent]->(outthink_opponent)
LABEL r "can_outthink_opponent"

CREATE (whist:Game {name: "Whist"})
CREATE (analytical_thinking:Entity {name: "Analytical Thinking"})
CREATE (inference:Entity {name: "Inference"})
CREATE (facial_expressions:Entity {name: "Facial Expressions"})
CREATE (body_language:Entity {name: "Body Language"})
CREATE (subtle_clues:Entity {name: "Subtle Clues"})
CREATE (win_more_tricks:Entity {name: "Win More Tricks"})
CREATE (ultimately_win_the_game:Entity {name: "Ultimately Win the Game"})
CREATE (observe_carefully:Entity {name: "Observe Carefully"})
CREATE (make_accurate_inferences:Entity {name: "Make Accurate Inferences"})
CREATE (think_quickly:Entity {name: "Think Quickly"})
CREATE (make_strategic_decisions:Entity {name: "Make Strategic Decisions"})

CREATE (whist)-[:REQUIRES]->(analytical_thinking)
CREATE (whist)-[:ALLOWS]->(win_more_tricks)
CREATE (whist)-[:ALLOWS]->(ultimately_win_the_game)
CREATE (analytical_thinking)-[:ASSOCIATED_WITH]->(inference)
CREATE (inference)-[:USES]->(facial_expressions)
CREATE (inference)-[:USES]->(body_language)
CREATE (inference)-[:USES]->(subtle_clues)
CREATE (win_more_tricks)-[:REQUIRES]->(observe_carefully)
CREATE (win_more_tricks)-[:REQUIRES]->(make_accurate_inferences)
CREATE (ultimately_win_the_game)-[:REQUIRES]->(think_quickly)
CREATE (ultimately_win_the_game)-[:REQUIRES]->(make_strategic_decisions)

