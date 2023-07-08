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

//// Paragraph 4 ///////////////////////////////////////////////////////////////
//
// marked as unsafe by GPT
//
//// Paragraph 5 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (t:Testimony {name: "testimonies of various witnesses"});
MERGE (ow:Character {name: "old woman"});
MERGE (f:Object {name: "fortunes"});
MERGE (m:Object {name: "money"});
MERGE (s:Location {name: "scene"});
MERGE (p:Character {name: "policeman"});

// Relation 1
MATCH (ow:Character {name: "old woman"}), (f:Object {name: "fortunes"})
CREATE (ow)-[r1:GAVE_FOR_LIVING]->(f)
SET r1.interval = "sometimes";

// Relation 2
MATCH (pair:Character), (m:Object {name: "money"})
CREATE (pair)-[r2:SAVED_MONEY]->(m)
SET r2.interval = "quite a bit";

// Relation 3
MATCH (pair:Character)
WHERE pair <> (ow:Character {name: "old woman"})
CREATE (pair)-[r3:KEPT_TO_THEMSELVES]->(pair)
SET r3.interval = "hardly seen out";

// Relation 4
MATCH (t:Testimony {name: "testimonies of various witnesses"})
CREATE (t)-[r4:DESCRIBES_VOICES]->(s)
SET r4.description = "slightly different things";

// Relation 5
MATCH (p:Character {name: "policeman"}), (s:Location {name: "scene"})
CREATE (p)-[r5:DESCRIBES_SHRIEKS]->(s)
SET r5.description = "coming probably from two people, one rough, one much more shrill";

// Relation 6
MATCH (p:Character {name: "policeman"})
CREATE (p)-[r6:THOUGHT_VOICE]->(s)
SET r6.voice = "former voice", r6.origin = "French";

// Relation 7
MATCH (t:Testimony {name: "testimonies of various witnesses"})
CREATE (t)-[r7:BELIEVES_HEARS_VOICE]->(s)
SET r7.voice = "Italian";

// Relation 8
MATCH (t:Testimony {name: "testimonies of various witnesses"})
CREATE (t)-[r8:ASSUMES_FOREIGN_TONGUE]->(s);

// Relation 9
MATCH (t:Testimony {name: "testimonies of various witnesses"})
CREATE (t)-[r9:UNABLE_TO_TRANSLATE]->(s);

//// Paragraph 6 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (t:Testimony {name: "The testimonies"});
MERGE (l:Location {name: "house"});
MERGE (c:Location {name: "young woman's chamber"});
MERGE (o1:Object {name: "evidence"});
MERGE (o2:Object {name: "murderer"});
MERGE (o3:Object {name: "windows"});
MERGE (ch:Character {name: "police"});
MERGE (lb:Character {name: "Le Bon"});
MERGE (d:Character {name: "Dupin"});
MERGE (n:Character {name: "narrator"});

// Relation 1
MATCH (t:Testimony {name: "The testimonies"}), (l:Location {name: "house"})
CREATE (t)-[r1:DESCRIBES]->(l)
SET r1.description = "paint a picture of the house as being very difficult to get access to";

// Relation 2
MATCH (c:Location {name: "young woman's chamber"})
CREATE (c)-[r2:LOCKED_FROM_INSIDE]->(c);

// Relation 3
MATCH (o3:Object {name: "windows"})
CREATE (o3)-[r3:LOCKED]->(o3);

// Relation 4
MATCH (ch:Character {name: "police"})
CREATE (ch)-[r4:CONFUSED]->(ch);

// Relation 5
MATCH (o1:Object {name: "evidence"}), (o2:Object {name: "murderer"})
CREATE (o1)-[r5:MISSING_FOR]->(o2);

// Relation 6
MATCH (t:Testimony {name: "The testimonies"}), (o1:Object {name: "evidence"})
CREATE (t)-[r6:MENTIONS]->(o1)
SET r6.description = "follow-up article reports another search";

// Relation 7
MATCH (t:Testimony {name: "The testimonies"}), (o1:Object {name: "evidence"})
CREATE (t)-[r7:MENTIONS]->(o1)
SET r7.description = "no further evidence found";

// Relation 8
MATCH (ch:Character {name: "police"}), (lb:Character {name: "Le Bon"})
CREATE (ch)-[r8:ARRESTS]->(lb)
SET r8.reason = "without much reason";

// Relation 9
MATCH (d:Character {name: "Dupin"})
CREATE (d)-[r9:INTERESTED_IN]->(d)
SET r9.description = "the process of the investigation";

// Relation 10
MATCH (d:Character {name: "Dupin"}), (n:Character {name: "narrator"})
CREATE (d)-[r10:ASKS_FOR_THOUGHTS]->(n);

// Relation 11
MATCH (n:Character {name: "narrator"})
SET n.can_add = "nothing";

//// Paragraph 7 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (d:Character {name: "Dupin"});
MERGE (p:Character {name: "police"});
MERGE (v:Character {name: "Vidocq"});
MERGE (c: Object {name: "crime"});
MERGE (i: Object {name: "investigation"});
MERGE (pt: Object {name: "point"});
MERGE (pic: Object {name: "picture"});
MERGE (s: Object {name: "star"});

// Relation 1
MATCH (d:Character {name: "Dupin"}), (c:Object {name: "crime"}), (p:Character {name: "police"})
CREATE (d)-[r1:SAYS]->(c)
SET r1.description = "cannot be judged on the inept way that the investigation has been carried out by the police";

// Relation 2
MATCH (d:Character {name: "Dupin"}), (p:Character {name: "police"})
CREATE (d)-[r2:SAYS]->(p)
SET r2.description = "operate with diligence and thoroughness";

// Relation 3
MATCH (p:Character {name: "police"}), (pt: Object {name: "point"})
CREATE (p)-[r3:MISS]->(pt)
SET r3.description = "miss the point entirely";

// Relation 4
MATCH (d:Character {name: "Dupin"}), (v:Character {name: "Vidocq"})
CREATE (d)-[r4:COMPARES_WITH]->(v)
SET r4.description = "a detective";

// Relation 5
MATCH (v:Character {name: "Vidocq"}), (pic: Object {name: "picture"})
CREATE (v)-[r5:LOOKS_AT_TOO_CLOSELY]->(pic)
SET r5.description = "often looked at things too closely and missed the bigger picture";

// Relation 6
MATCH (d:Character {name: "Dupin"}), (s: Object {name: "star"})
CREATE (d)-[r6:SAYS]->(s)
SET r6.description = "by viewing a star in one's peripheral vision, thereby letting its radiance affect you, a far truer picture of the star is gained";

//// Paragraph 8 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (d:Character {name: "Dupin"});
MERGE (lb:Character {name: "Le Bon"});
MERGE (p:Character {name: "Prefect"});
MERGE (rm:Location {name: "Rue Morgue"});
MERGE (nh:Location {name: "newspaper headquarters"});
MERGE (i:Object {name: "investigation"});
MERGE (f:Object {name: "favor"});
MERGE (h:Object {name: "house"});
MERGE (ch:Object {name: "chamber"});
MERGE (cs:Object {name: "crime scene"});
MERGE (b:Object {name: "bodies"});
MERGE (te1:Testimony {name: "They enter and go up to the chamber."});
MERGE (te2:Testimony {name: "Everything original to the crime scene is still in place."});
MERGE (te3:Testimony {name: "Dupin looks over everything, including the gruesome bodies."});
MERGE (te4:Testimony {name: "They examine the scene until nighttime."});
MERGE (te5:Testimony {name: "Dupin visited a newspaper headquarters."});
MERGE (te6:Testimony {name: "Dupin is silent until the next afternoon."});

// Relation 1
MATCH (d:Character {name: "Dupin"}), (i:Object {name: "investigation"})
CREATE (d)-[r1:SUGGESTS]->(i)
SET r1.reason = "for amusement if nothing else";

// Relation 2
MATCH (d:Character {name: "Dupin"}), (i:Object {name: "investigation"})
CREATE (d)-[r2:SUGGESTS]->(i)
SET r2.reason = "because Dupin knows the suspect Le Bon";

// Relation 3
MATCH (d:Character {name: "Dupin"}), (i:Object {name: "investigation"})
CREATE (d)-[r3:SUGGESTS]->(i)
SET r3.reason = "because Dupin owes him a favor";

// Relation 4
MATCH (d:Character {name: "Dupin"}), (p:Character {name: "Prefect"})
CREATE (d)-[r4:GETS_PERMISSION_FROM]->(p);

// Relation 5
MATCH (d:Character {name: "Dupin"}), (rm:Location {name: "Rue Morgue"})
CREATE (d)-[r5:GOES_TO]->(rm);

// Relation 6
MATCH (d:Character {name: "Dupin"}), (rm:Location {name: "Rue Morgue"})
CREATE (d)-[r6:PAYS_ATTENTION_TO]->(h)
SET r6.description = "environs of the house";

// Relation 7
MATCH (te1:Testimony {name: "They enter and go up to the chamber."}), (ch:Object {name: "chamber"})
CREATE (te1)-[r7:ENTERS]->(ch);

// Relation 8
MATCH (te1:Testimony {name: "They enter and go up to the chamber."}), (ch:Object {name: "chamber"})
CREATE (te1)-[r8:GOES_UP_TO]->(ch);

// Relation 9
MATCH (te2:Testimony {name: "Everything original to the crime scene is still in place."}), (cs:Object {name: "crime scene"})
CREATE (te2)-[r9:ORIGINAL_IS_STILL_IN_PLACE]->(cs);

// Relation 10
MATCH (d:Character {name: "Dupin"}), (te3:Testimony {name: "Dupin looks over everything, including the gruesome bodies."})
CREATE (d)-[r10:LOOKS_OVER]->(te3);

// Relation 11
MATCH (te3:Testimony {name: "Dupin looks over everything, including the gruesome bodies."}), (b:Object {name: "bodies"})
CREATE (te3)-[r11:LOOKS_OVER]->(b);

// Relation 12
MATCH (te4:Testimony {name: "They examine the scene until nighttime."}), (cs:Object {name: "crime scene"})
CREATE (te4)-[r12:EXAMINES_UNTIL_NIGHTTIME]->(cs);

// Relation 13
MATCH (d:Character {name: "Dupin"}), (nh:Location {name: "newspaper headquarters"})
CREATE (d)-[r13:VISITS]->(nh);

// Relation 14
MATCH (d:Character {name: "Dupin"}), (te6:Testimony {name: "Dupin is silent until the next afternoon."})
CREATE (d)-[r14:IS_SILENT]->(te6);

//// Paragraph 9 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (d:Character {name: "Dupin"});
MERGE (n:Character {name: "narrator"});
MERGE (l:Location {name: "Rue-Morgue"});
MERGE (nr:Object {name: "newspaper report"});
MERGE (m:Object {name: "murders"});
MERGE (t1:Testimony {name: "the paper has not presented the extremity, the unusualness of the murders"});
MERGE (t2:Testimony {name: "the murders seem impossible to solve to the police, because of the lack of motive and their extreme brutality"});
MERGE (t3:Testimony {name: "these very factors could be used to the advantage of a detective"});
MERGE (t4:Testimony {name: "it is where the situation deviates from the ordinary, that gives reason a way to solve it"});
MERGE (t5:Testimony {name: "he advises looking at the unique aspects of the crime, rather than what appears before them"});

// Relation 1
MATCH (d:Character {name: "Dupin"}), (n:Character {name: "narrator"}), (nr:Object {name: "newspaper report"})
CREATE (d)-[r1:ASKS]->(n)
SET r1.question = "Did you notice anything peculiar in the newspaper report?";
CREATE (nr)-[r2:MENTIONED_IN]->(r1);

// Relation 2
MATCH (d:Character {name: "Dupin"}), (n:Character {name: "narrator"})
CREATE (d)-[r3:EMPHASIZES]->(n)
SET r3.word = "peculiar";

// Relation 3
MATCH (nr:Object {name: "newspaper report"}), (t1:Testimony {name: "the paper has not presented the extremity, the unusualness of the murders"})
CREATE (nr)-[r4:MENTIONS]->(t1);

// Relation 4
MATCH (m:Object {name: "murders"}), (t2:Testimony {name: "the murders seem impossible to solve to the police, because of the lack of motive and their extreme brutality"})
CREATE (m)-[r5:MENTIONS]->(t2);

// Relation 5
MATCH (t2:Testimony {name: "the murders seem impossible to solve to the police, because of the lack of motive and their extreme brutality"}), (t3:Testimony {name: "these very factors could be used to the advantage of a detective"})
CREATE (t2)-[r6:LEADS_TO]->(t3);

// Relation 6
MATCH (t4:Testimony {name: "it is where the situation deviates from the ordinary, that gives reason a way to solve it"}), (d:Character {name: "Dupin"})
CREATE (t4)-[r7:SAYS]->(d)
SET r7.claim = "The situation deviates from the ordinary, which gives reason a way to solve it.";

// Relation 7
MATCH (d:Character {name: "Dupin"}), (t5:Testimony {name: "he advises looking at the unique aspects of the crime, rather than what appears before them"})
CREATE (d)-[r8:ADVISORY]->(t5);

//// Paragraph 10 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (d:Character {name: "Dupin"});
MERGE (n:Character {name: "narrator"});
MERGE (l:Location {name: "Rue-Morgue"});
MERGE (c:Object {name: "crime"});
MERGE (m:Object {name: "man"});
MERGE (p:Object {name: "pistol"});
MERGE (t1:Testimony {name: "Dupin expects to be met by someone who is in part responsible for the crime"});
MERGE (t2:Testimony {name: "Dupin says the man is probably largely innocent but he hopes the man will prove to be the key to the riddle"});
MERGE (t3:Testimony {name: "Dupin gives the narrator a pistol to use should the meeting demand it"});
MERGE (e:Evidence {name: "Dupin explains his reasoning"});

// Relation 1
MATCH (d:Character {name: "Dupin"}), (n:Character {name: "narrator"}), (l:Location {name: "Rue-Morgue"})
CREATE (d)-[r1:TELLS]->(n)
SET r1.details = "Dupin tells the narrator of Rue-Morgue about his expectations.";
CREATE (l)-[r2:MENTIONED_IN]->(r1);

// Relation 2
MATCH (d:Character {name: "Dupin"}), (m:Object {name: "man"}), (c:Object {name: "crime"})
CREATE (d)-[r3:EXPECTS]->(m)
SET r3.details = "Dupin expects to be met by someone who is in part responsible for the crime.";

// Relation 3
MATCH (d:Character {name: "Dupin"}), (m:Object {name: "man"}), (t2:Testimony {name: "Dupin says the man is probably largely innocent but he hopes the man will prove to be the key to the riddle"})
CREATE (m)-[r4:DESCRIBED_AS]->(t2);

// Relation 4
MATCH (d:Character {name: "Dupin"}), (m:Object {name: "man"}), (e:Evidence {name: "Dupin explains his reasoning"})
CREATE (m)-[r5:CONTRIBUTES_TO]->(e);

// Relation 5
MATCH (d:Character {name: "Dupin"}), (n:Character {name: "narrator"}), (p:Object {name: "pistol"})
CREATE (d)-[r6:GIVES]->(n)
SET r6.item = "pistol";

// Relation 6
MATCH (n:Character {name: "narrator"}), (p:Object {name: "pistol"}), (t3:Testimony {name: "Dupin gives the narrator a pistol to use should the meeting demand it"})
CREATE (n)-[r7:RECEIVES]->(p)
SET r7.details = "The pistol is for the narrator to use should the meeting demand it.";

// Relation 7
MATCH (d:Character {name: "Dupin"}), (e:Evidence {name: "Dupin explains his reasoning"})
CREATE (d)-[r8:EXPLAINS]->(e);

//// Paragraph 11 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (d:Character {name: "Dupin"});
MERGE (v:Object {name: "voices"});
MERGE (w:Object {name: "women"});
MERGE (m:Object {name: "murders"});
MERGE (ow:Object {name: "old woman"});
MERGE (db:Object {name: "daughter's body"});
MERGE (c:Object {name: "chimney"});
MERGE (wtn:Object {name: "witnesses"});
MERGE (sv:Object {name: "shrill voice"});
MERGE (t1:Testimony {name: "the voices couldn't have been the women"});
MERGE (t2:Testimony {name: "the murders couldn't have been self-suicide"});
MERGE (t3:Testimony {name: "the old woman would never be strong enough to jam her daughter's body up the chimney"});
MERGE (t4:Testimony {name: "the voices heard were foreign"});
MERGE (t5:Testimony {name: "none of the witnesses could confirm the origin of the shrill voice"});
MERGE (t6:Testimony {name: "the voice was foreign to their own language"});
MERGE (t7:Testimony {name: "the language of the 'shrill' suspect is something beyond even the far reaches of the world in terms of its foreignness"});
MERGE (e:Evidence {name: "statements from diverse nationalities"});

// Relation 1
MATCH (d:Character {name: "Dupin"}), (v:Object {name: "voices"})
CREATE (d)-[r1:ADDRESSES]->(v)
SET r1.question = "What about the voices heard?";

// Relation 2
MATCH (v:Object {name: "voices"}), (w:Object {name: "women"})
CREATE (v)-[r2:COULDN'T_HAVE_BEEN]->(w);

// Relation 3
MATCH (m:Object {name: "murders"}), (t2:Testimony {name: "the murders couldn't have been self-suicide"})
CREATE (m)-[r3:COULDN'T_HAVE_BEEN]->(t2);

// Relation 4
MATCH (ow:Object {name: "old woman"}), (db:Object {name: "daughter's body"}), (c:Object {name: "chimney"}), (t3:Testimony {name: "the old woman would never be strong enough to jam her daughter's body up the chimney"})
CREATE (ow)-[r4:UNABLE_TO_JAM]->(db)
SET r4.location = "chimney";

// Relation 5
MATCH (v:Object {name: "voices"}), (t4:Testimony {name: "the voices heard were foreign"})
CREATE (v)-[r5:WERE]->(t4);

// Relation 6
MATCH (wtn:Object {name: "witnesses"}), (t5:Testimony {name: "none of the witnesses could confirm the origin of the shrill voice"})
CREATE (wtn)-[r6:UNABLE_TO_CONFIRM]->(t5);

// Relation 7
MATCH (t5:Testimony {name: "none of the witnesses could confirm the origin of the shrill voice"}), (t6:Testimony {name: "the voice was foreign to their own language"})
CREATE (t5)-[r7:FOREIGN_TO_LANGUAGE]->(t6);

// Relation 8
MATCH (wtn:Object {name: "witnesses"}), (t7:Testimony {name: "the language of the 'shrill' suspect is something beyond even the far reaches of the world in terms of its foreignness"})
CREATE (wtn)-[r8:PROVIDE]->(t7);

// Relation 9
MATCH (e:Evidence {name: "statements from diverse nationalities"}), (t7:Testimony {name: "the language of the 'shrill' suspect is something beyond even the far reaches of the world in terms of its foreignness"})
CREATE (e)-[r9:INCLUDES]->(t7);

//// Paragraph 12 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (d:Character {name: "Dupin"});
MERGE (ds:Object {name: "discovery"});
MERGE (v:Object {name: "voices"});
MERGE (s:Object {name: "suspicion"});
MERGE (e:Object {name: "exits"});
MERGE (a:Object {name: "apartment"});
MERGE (b:Object {name: "boundaries"});
MERGE (r:Object {name: "room"});
MERGE (doo:Object {name: "doors"});
MERGE (ch:Object {name: "chimneys"});
MERGE (cat:Object {name: "cat"});
MERGE (win:Object {name: "windows"});
MERGE (t1:Testimony {name: "this discovery about the voices leads singularly to the suspicion he is now entertaining"});
MERGE (t2:Testimony {name: "he won't let on what that suspicion is just yet"});
MERGE (t3:Testimony {name: "neither of them believe in the supernatural, so the material boundaries of the room must have been crossed in a material way"});
MERGE (t4:Testimony {name: "both doors into the apartments were locked"});
MERGE (t5:Testimony {name: "the chimneys are too narrow for something larger than a cat to pass through"});
MERGE (t6:Testimony {name: "the only available option left are the windows"});
MERGE (ev:Evidence {name: "means of entry and escape"});

// Relation 1
MATCH (d:Character {name: "Dupin"}), (ds:Object {name: "discovery"}), (v:Object {name: "voices"}), (s:Object {name: "suspicion"})
CREATE (d)-[r1:DESCRIBES]->(ds)
SET r1.details = "This discovery about the voices leads singularly to the suspicion he is now entertaining.";
CREATE (ds)-[r2:LEADS_TO]->(s)
SET r2.claim = "The suspicion he is entertaining.";

// Relation 2
MATCH (d:Character {name: "Dupin"}), (t2:Testimony {name: "he won't let on what that suspicion is just yet"})
CREATE (d)-[r3:WITHHOLDS]->(t2);

// Relation 3
MATCH (d:Character {name: "Dupin"}), (e:Object {name: "exits"}), (a:Object {name: "apartment"})
CREATE (d)-[r4:ANALYZES]->(e)
SET r4.details = "The exits of the apartment.";
CREATE (a)-[r5:LOCATED_IN]->(e);

// Relation 4
MATCH (doo:Object {name: "doors"}), (t4:Testimony {name: "both doors into the apartments were locked"})
CREATE (doo)-[r6:WERE_LOCKED]->(t4);

// Relation 5
MATCH (ch:Object {name: "chimneys"}), (cat:Object {name: "cat"}), (t5:Testimony {name: "the chimneys are too narrow for something larger than a cat to pass through"})
CREATE (ch)-[r7:TOO_NARROW_FOR]->(cat)
SET r7.item = "something larger than a cat";

// Relation 6
MATCH (b:Object {name: "boundaries"}), (r:Object {name: "room"}), (t3:Testimony {name: "neither of them believe in the supernatural, so the material boundaries of the room must have been crossed in a material way"})
CREATE (b)-[r8:CROSSED]->(r)
SET r8.details = "In a material way";

// Relation 7
MATCH (d:Character {name: "Dupin"}), (ev:Evidence {name: "means of entry and escape"})
CREATE (d)-[r9:GOES_THROUGH]->(ev)
SET r9.details = "Each means of entry and escape";

// Relation 8
MATCH (ev:Evidence {name: "means of entry and escape"}), (win:Object {name: "windows"}), (t6:Testimony {name: "the only available option left are the windows"})
CREATE (ev)-[r10:LEFT_OPTION]->(win);

//// Paragraph 13 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (d:Character {name: "Dupin"});
MERGE (o:Object {name: "option"});
MERGE (w:Object {name: "windows"});
MERGE (n:Object {name: "nail"});
MERGE (det:Object {name: "details"});
MERGE (p:Object {name: "police"});
MERGE (al:Object {name: "auto-locking device"});
MERGE (c:Object {name: "criminal"});
MERGE (sm:Object {name: "spring mechanism"});
MERGE (t1:Testimony {name: "they must not be deterred by how impossible this option looks"});
MERGE (t2:Testimony {name: "each of the possible windows is locked and stopped with a nail"});
MERGE (t3:Testimony {name: "it seemed impossible to open them"});
MERGE (t4:Testimony {name: "the police had abandoned the windows"});
MERGE (t5:Testimony {name: "one of the windows must open"});
MERGE (t6:Testimony {name: "Dupin endeavors to find out some auto-locking device of the windows"});
MERGE (t7:Testimony {name: "the criminal could not have fastened them from the inside, having escaped"});
MERGE (t8:Testimony {name: "he finds a spring mechanism that explains everything"});
MERGE (t9:Testimony {name: "the nail in the first window is intact and could not be replaced from the outside"});
MERGE (t10:Testimony {name: "the criminal must have escaped through the other window"});
MERGE (t11:Testimony {name: "he finds a broken spring in the other window"});
MERGE (e:Evidence {name: "search"});

// Relation 1
MATCH (d:Character {name: "Dupin"}), (t1:Testimony {name: "they must not be deterred by how impossible this option looks"})
CREATE (d)-[r1:STATES]->(t1);

// Relation 2
MATCH (w:Object {name: "windows"}), (n:Object {name: "nail"}), (t2:Testimony {name: "each of the possible windows is locked and stopped with a nail"})
CREATE (w)-[r2:LOCKED_WITH]->(n)
SET r2.details = "Stopped with a nail";

// Relation 3
MATCH (w:Object {name: "windows"}), (t3:Testimony {name: "it seemed impossible to open them"})
CREATE (w)-[r3:SEEMED_IMPOSSIBLE]->(t3);

// Relation 4
MATCH (p:Object {name: "police"}), (w:Object {name: "windows"}), (t4:Testimony {name: "the police had abandoned the windows"})
CREATE (p)-[r4:ABANDONED]->(w);

// Relation 5
MATCH (d:Character {name: "Dupin"}), (w:Object {name: "windows"}), (t5:Testimony {name: "one of the windows must open"})
CREATE (d)-[r5:MUST_OPEN]->(w);

// Relation 6
MATCH (d:Character {name: "Dupin"}), (al:Object {name: "auto-locking device"}), (w:Object {name: "windows"}), (t6:Testimony {name: "Dupin endeavors to find out some auto-locking device of the windows"})
CREATE (d)-[r6:ENDEAVORS_TO_FIND]->(al)
CREATE (al)-[r7:OF]->(w);

// Relation 7
MATCH (c:Object {name: "criminal"}), (t7:Testimony {name: "the criminal could not have fastened them from the inside, having escaped"})
CREATE (c)-[r8:COULD_NOT_HAVE_FASTENED]->(w)
SET r8.details = "From the inside";

// Relation 8
MATCH (d:Character {name: "Dupin"}), (e:Evidence {name: "search"}), (t8:Testimony {name: "he finds a spring mechanism that explains everything"})
CREATE (d)-[r9:CONDUCTS]->(e)
SET r9.details = "Search";
CREATE (e)-[r10:INCLUDES]->(t8);

// Relation 9
MATCH (w:Object {name: "windows"}), (n:Object {name: "nail"}), (t9:Testimony {name: "the nail in the first window is intact and could not be replaced from the outside"})
CREATE (w)-[r11:HAS_INTACT_NAIL]->(n);

// Relation 10
MATCH (c:Object {name: "criminal"}), (w:Object {name: "windows"}), (t10:Testimony {name: "the criminal must have escaped through the other window"})
CREATE (c)-[r12:MUST_HAVE_ESCAPED]->(w)
SET r12.details = "Through the other window";

// Relation 11
MATCH (d:Character {name: "Dupin"}), (w:Object {name: "windows"}), (sm:Object {name: "spring mechanism"}), (t11:Testimony {name: "he finds a broken spring in the other window"})
CREATE (d)-[r13:FINDS]->(sm)
SET r13.details = "Broken spring";
CREATE (sm)-[r14:EXPLAINS]->(w);

//// Paragraph 14 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (s:Character {name: "suspect"});
MERGE (d:Character {name: "Dupin"});
MERGE (n:Character {name: "narrator"});
MERGE (q:Object {name: "question"});
MERGE (w:Object {name: "window"});
MERGE (lr:Object {name: "lightning rod"});
MERGE (h:Object {name: "house"});
MERGE (sht:Object {name: "shutters"});
MERGE (ls:Object {name: "lattice structure"});
MERGE (lang:Object {name: "language"});
MERGE (pa:Object {name: "physical ability"});
MERGE (t1:Testimony {name: "there is a way that one could escape onto a lightning rod near the house"});
MERGE (t2:Testimony {name: "if the shutters were open"});
MERGE (t3:Testimony {name: "by climbing out onto the lattice structure"});
MERGE (t4:Testimony {name: "one could also enter this way"});
MERGE (t5:Testimony {name: "the suspect has an unintelligible language"});
MERGE (t6:Testimony {name: "the suspect has an astonishing physical ability"});
MERGE (e:Evidence {name: "extreme difficulty of the move"});
MERGE (t7:Testimony {name: "the narrator almost understanding what Dupin is getting at"});

// Relation 1
MATCH (q:Object {name: "question"}), (w:Object {name: "window"})
CREATE (q)-[r1:IS_ABOUT]->(w);

// Relation 2
MATCH (t1:Testimony {name: "there is a way that one could escape onto a lightning rod near the house"}), (lr:Object {name: "lightning rod"}), (h:Object {name: "house"})
CREATE (t1)-[r2:LEADS_TO]->(lr)
CREATE (lr)-[r3:NEAR]->(h);

// Relation 3
MATCH (t2:Testimony {name: "if the shutters were open"}), (sht:Object {name: "shutters"})
CREATE (t2)-[r4:DEPENDS_ON]->(sht);

// Relation 4
MATCH (t3:Testimony {name: "by climbing out onto the lattice structure"}), (w:Object {name: "window"}), (ls:Object {name: "lattice structure"})
CREATE (t3)-[r5:CLIMB_OUT_ONTO]->(ls)
CREATE (w)-[r6:LEADS_TO]->(ls);

// Relation 5
MATCH (t4:Testimony {name: "one could also enter this way"}), (ls:Object {name: "lattice structure"})
CREATE (t4)-[r7:CAN_ENTER]->(ls);

// Relation 6
MATCH (d:Character {name: "Dupin"}), (e:Evidence {name: "extreme difficulty of the move"})
CREATE (d)-[r8:POINTS_OUT]->(e);

// Relation 7
MATCH (s:Character {name: "suspect"}), (t5:Testimony {name: "the suspect has an unintelligible language"})
CREATE (s)-[r9:HAS]->(lang);

// Relation 8
MATCH (s:Character {name: "suspect"}), (t6:Testimony {name: "the suspect has an astonishing physical ability"})
CREATE (s)-[r10:HAS]->(pa);

// Relation 9
MATCH (n:Character {name: "narrator"}), (t7:Testimony {name: "the narrator almost understanding what Dupin is getting at"})
CREATE (n)-[r11:ALMOST_UNDERSTANDS]->(t7);

//// Paragraph 15 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (d:Character {name: "Dupin"});
MERGE (a:Object {name: "apartment"});
MERGE (wb:Object {name: "women's belongings"});
MERGE (d:Object {name: "drawers"});
MERGE (ct:Object {name: "certain things"});
MERGE (ec:Object {name: "expensive clothes"});
MERGE (mc:Object {name: "many clothes"});
MERGE (m:Object {name: "money"});
MERGE (r:Object {name: "room"});
MERGE (t1:Testimony {name: "the women were reclusive"});
MERGE (t2:Testimony {name: "the women wouldn't have need for expensive or many clothes"});
MERGE (t3:Testimony {name: "the money recently withdrawn by the old woman has been left in the room"});
MERGE (t4:Testimony {name: "the police have looked to this withdrawal as a possible motive"});
MERGE (t5:Testimony {name: "the withdrawal is a complete red herring"});
MERGE (t6:Testimony {name: "there is no motive in this case"});

// Relation 1
MATCH (d:Character {name: "Dupin"}), (a:Object {name: "apartment"})
CREATE (d)-[r1:IS_CONCERNED_WITH]->(a);

// Relation 2
MATCH (wb:Object {name: "women's belongings"}), (a:Object {name: "apartment"})
CREATE (wb)-[r2:ARE_STREWN_IN]->(a);

// Relation 3
MATCH (d:Object {name: "drawers"}), (a:Object {name: "apartment"})
CREATE (d)-[r3:LOOKED_EMPTIED_OF]->(ct)
CREATE (ct)-[r4:WERE_IN]->(d)
CREATE (d)-[r5:ARE_IN]->(a);

// Relation 4
MATCH (t1:Testimony {name: "the women were reclusive"}), (wb:Object {name: "women's belongings"})
CREATE (t1)-[r6:ARE]->(wb);

// Relation 5
MATCH (t2:Testimony {name: "the women wouldn't have need for expensive or many clothes"}), (ec:Object {name: "expensive clothes"})
CREATE (t2)-[r7:WOULDN_T_HAVE_NEED_FOR]->(ec)
CREATE (t2)-[r8:WOULDN_T_HAVE_NEED_FOR]->(mc);

// Relation 6
MATCH (t3:Testimony {name: "the money recently withdrawn by the old woman has been left in the room"}), (m:Object {name: "money"}), (r:Object {name: "room"})
CREATE (t3)-[r9:HAS_BEEN_LEFT_IN]->(r)
CREATE (m)-[r10:WAS_RECENTLY_WITHDRAWN_BY]->(t3);

// Relation 7
MATCH (t4:Testimony {name: "the police have looked to this withdrawal as a possible motive"}), (t3:Testimony {name: "the money recently withdrawn by the old woman has been left in the room"})
CREATE (t4)-[r11:LOOKED_TO_AS_POSSIBLE_MOTIVE]->(t3);

// Relation 8
MATCH (t5:Testimony {name: "the withdrawal is a complete red herring"})
CREATE (t5)-[r12:IS]->(t3);

// Relation 9
MATCH (t6:Testimony {name: "there is no motive in this case"})
CREATE (t6)-[r13:IS_IN]->(t5);

//// Paragraph 16 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (d:Character {name: "Dupin"});
MERGE (n:Character {name: "narrator"});
MERGE (l:Location {name: "Rue-Morgue"});
MERGE (o1:Object {name: "crime"});
MERGE (o2:Object {name: "extreme force"});
MERGE (o3:Object {name: "murders"});
MERGE (o4:Object {name: "body"});
MERGE (o5:Object {name: "chimney"});
MERGE (o6:Object {name: "human hair"});
MERGE (o7:Object {name: "clumps of blood"});
MERGE (o8:Object {name: "flesh"});
MERGE (o9:Object {name: "injury"});
MERGE (o10:Object {name: "weapon"});
MERGE (t1:Testimony {text: "the strength of one who can push a body into a chimney"});
MERGE (t2:Testimony {text: "the human hair found at the scene with clumps of blood and flesh"});
MERGE (t3:Testimony {text: "the injury on the body of the old woman was sustained from her fall"});
MERGE (e:Evidence {name: "method of the crime"});

// Relation 1
MATCH (d:Character {name: "Dupin"}), (n:Character {name: "narrator"})
CREATE (d)-[r1:DRAWS_ATTENTION_TO]->(n)
SET r1.topic = "method of the crime";

// Relation 2
MATCH (d:Character {name: "Dupin"}), (n:Character {name: "narrator"})
CREATE (d)-[r2:DRAWS_ATTENTION_TO]->(n)
SET r2.topic = "extreme force of both the murders";

// Relation 3
MATCH (d:Character {name: "Dupin"}), (n:Character {name: "narrator"})
CREATE (d)-[r3:ASKS_TO_IMAGINE]->(n)
SET r3.description = "the strength of one who can push a body into a chimney";

// Relation 4
MATCH (o6:Object {name: "human hair"}), (o7:Object {name: "clumps of blood"}), (o8:Object {name: "flesh"})
CREATE (o6)-[r4:FOUND_WITH]->(o7)
CREATE (o6)-[r5:FOUND_WITH]->(o8)
SET r4.description = "at the scene"
SET r5.description = "at the scene";

// Relation 5
MATCH (o7:Object {name: "clumps of blood"}), (o8:Object {name: "flesh"}), (o2:Object {name: "extreme force"})
CREATE (o7)-[r6:IMPLIES]->(o2)
CREATE (o8)-[r7:IMPLIES]->(o2)
SET r6.description = "taken up with"
SET r7.description = "taken up with";

// Relation 6
MATCH (d:Character {name: "Dupin"}), (o9:Object {name: "injury"})
CREATE (d)-[r8:EXPLAINS]->(o9)
SET r8.description = "what had looked like from some kind of weapon"
SET r8.source = "body of the old woman"
SET r8.explanation = "was in fact sustained from her fall";

// Relation 7
MATCH (o1:Object {name: "crime"}), (e:Evidence {name: "method of the crime"})
CREATE (o1)-[r9:INCLUDES]->(e);

//// Paragraph 17 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (d:Character {name: "Dupin"});
MERGE (n:Character {name: "narrator"});
MERGE (r:Location {name: "Rue-Morgue"});
MERGE (o1:Object {name: "details"});
MERGE (o2:Object {name: "deed"});
MERGE (o3:Object {name: "escaped madman"});
MERGE (o4:Object {name: "tones"});
MERGE (o5:Object {name: "phrases"});
MERGE (o6:Object {name: "language"});
MERGE (o7:Object {name: "tuft of hair"});
MERGE (o8:Object {name: "Madame Esplanaye's clutches"});
MERGE (o9:Object {name: "sketch"});
MERGE (o10:Object {name: "hand mark"});
MERGE (o11:Object {name: "old woman's neck"});
MERGE (o12:Object {name: "human-sized hand"});
MERGE (t1:Testimony {description: "the narrator can only imagine that the deed was committed by some kind of escaped madman"});
MERGE (t2:Testimony {description: "even madmen have recognizable tones and phrases in their language"});
MERGE (t3:Testimony {description: "the tuft of hair found in Madame Esplanaye's clutches is not human hair"});
MERGE (t4:Testimony {description: "the hand mark around the old woman's neck is the print of no human-sized hand"});
MERGE (e:Evidence {description: "none"});

// Relation 1
MERGE (d)-[:SUMS_UP]->(n);

// Relation 2
MERGE (d)-[:ASKS]->(n);

// Relation 3
MERGE (n)-[:IMAGINES]->(o3);

// Relation 4
MERGE (d)-[:ADMITS]->(o3);

// Relation 5
MERGE (o3)-[:HAVE]->(o4);
MERGE (o3)-[:HAVE]->(o5);
MERGE (o6)-[:HAVE]->(o4);
MERGE (o6)-[:HAVE]->(o5);

// Relation 6
MERGE (d)-[:REVEALS]->(o7);

// Relation 7
MERGE (o7)-[:FOUND_IN]->(o8);

// Relation 8
MERGE (d)-[:SHOWS]->(o9);

// Relation 9
MERGE (o9)-[:AROUND]->(o11);
MERGE (o9)-[:PRINT_OF]->(o12);

// Relation 10
MERGE (o10)-[:AROUND]->(o11);
MERGE (o10)-[:PRINT_OF]->(o12);

//// Paragraph 18 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (d:Character {name: "Dupin"});
MERGE (n:Character {name: "narrator"});
MERGE (r:Location {name: "Rue-Morgue"});
MERGE (e:Object {name: "excerpt"});
MERGE (ct:Object {name: "Cuvier text"});
MERGE (oo:Object {name: "Ourang-Outang"});
MERGE (a:Object {name: "anatomy"});
MERGE (s:Object {name: "strength"});
MERGE (cr:Object {name: "crime"});
MERGE (v:Object {name: "voices"});
MERGE (sv:Object {name: "shrill voice"});
MERGE (uv:Object {name: "unintelligible voice"});
MERGE (g:Object {name: "gruff French phrases"});
MERGE (ni:Object {name: "neighbors' intrusion"});
MERGE (f:Object {name: "Frenchman"});
MERGE (h:Object {name: "horror"});
MERGE (mc:Object {name: "missing creature"});
MERGE (ad:Object {name: "ad"});
MERGE (p:Object {name: "paper"});
MERGE (ms:Object {name: "Maltese sailor"});

// Relation 1
MATCH (d:Character {name: "Dupin"}), (n:Character {name: "narrator"}), (r:Location {name: "Rue-Morgue"}), (e:Object {name: "excerpt"}), (ct:Object {name: "Cuvier text"}), (oo:Object {name: "Ourang-Outang"})
CREATE (d)-[r1:SHOWS]->(n),
(d)-[r2:SHOWS]->(r),
(d)-[r3:SHOWS]->(e),
(d)-[r4:SHOWS]->(ct),
(d)-[r5:SHOWS]->(oo);

// Relation 2
MATCH (oo:Object {name: "Ourang-Outang"}), (a:Object {name: "anatomy"}), (s:Object {name: "strength"}), (cr:Object {name: "crime"})
CREATE (oo)-[r6:MATCHES]->(a),
(oo)-[r7:MATCHES]->(s),
(oo)-[r8:MATCHES]->(cr);

// Relation 3
MATCH (oo:Object {name: "Ourang-Outang"}), (sv:Object {name: "shrill voice"}), (uv:Object {name: "unintelligible voice"})
CREATE (oo)-[r9:HAS_DESCRIPTION]->(sv),
(oo)-[r10:HAS_DESCRIPTION]->(uv);

// Relation 4
MATCH (ni:Object {name: "neighbors' intrusion"}), (g:Object {name: "gruff French phrases"})
CREATE (ni)-[r11:INVOLVES]->(g);

// Relation 5
MATCH (d:Character {name: "Dupin"}), (f:Object {name: "Frenchman"})
CREATE (d)-[r12:SUGGESTS]->(f);

// Relation 6
MATCH (f:Object {name: "Frenchman"}), (oo:Object {name: "Ourang-Outang"}), (h:Object {name: "horror"})
CREATE (f)-[r13:TRIED_TO_FOLLOW]->(oo),
(f)-[r14:ESCAPED]->(h);

// Relation 7
MATCH (d:Character {name: "Dupin"}), (f:Object {name: "Frenchman"}), (mc:Object {name: "missing creature"})
CREATE (d)-[r15:CORRECT_PREDICTION]->(f),
(d)-[r16:LOOKING_FOR]->(mc);

// Relation 8
MATCH (d:Character {name: "Dupin"}), (ad:Object {name: "ad"}), (p:Object {name: "paper"}), (ms:Object {name: "Maltese sailor"})
CREATE (d)-[r17:PUTS]->(ad),
(d)-[r18:PUTS]->(p),
(d)-[r19:BELONGS_TO]->(ms),
(ad)-[r20:RETURN_UPON_IDENTIFICATION]->(oo);

//// Paragraph 19 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (narrator:Character {name: "narrator"});
MERGE (dupin:Character {name: "Dupin"});
MERGE (rueMorgue:Location {name: "Rue-Morgue"});
MERGE (sailor:Object {name: "sailor"});
MERGE (malteseVessel:Object {name: "Maltese vessel"});
MERGE (ribbon:Object {name: "ribbon"});
MERGE (lightningRod:Object {name: "lightning rod"});
MERGE (ad:Object {name: "ad"});
MERGE (innocence:Object {name: "innocence"});

// Relation 1
MATCH (n:narrator), (d:dupin), (s:sailor), (mv:malteseVessel)
CREATE (n)-[:WONDERS]->(d),
(d)-[:KNOWS]->(s),
(s)-[:FROM]->(mv);

// Relation 2
MATCH (d:dupin)
SET d.guesses = true;

// Relation 3
MATCH (d:dupin), (lr:lightningRod)
CREATE (d)-[:FOUND]->(lr);

// Relation 4
MATCH (d:dupin), (r:ribbon), (ms:sailor)
CREATE (d)-[:RECOGNIZES]->(r),
(r)-[:USED_BY]->(ms),
(r)-[:KNOTTED_IN]->(ms);

// Relation 5
MATCH (ad:ad)
SET ad.harmless = true;

// Relation 6
MATCH (s:sailor), (ad:ad)
CREATE (ad)-[:ASSUME_ERROR]->(s),
(ad)-[:DESCRIBE_PERFECTLY]->(s);

// Relation 7
MATCH (ad:ad), (s:sailor)
CREATE (ad)-[:EXPECTED_RESPONSE]->(s);

// Relation 8
MATCH (s:sailor), (i:innocence)
CREATE (s)-[:PROTECTS]->(i);

//// Paragraph 20 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (t:Character {name: "They"});
MERGE (d:Character {name: "Dupin"});
MERGE (p:Object {name: "pistols"});
MERGE (s:Location {name: "stairs"});
MERGE (do:Location {name: "door"});
MERGE (c:Location {name: "chamber"});
MERGE (sa:Testimony {name: "sailor"});

// Relation 1
MATCH (a:Character {name: "They"})
CREATE (a)-[r1:HEARS]->(:Event {name: "someone enter"});

// Relation 2
MATCH (a:Character {name: "They"}), (p:Object {name: "pistols"})
CREATE (a)-[r2:READY]->(p);

// Relation 3
MATCH (a:Character {name: "They"}), (sa:Testimony {name: "sailor"}), (s:Location {name: "stairs"})
CREATE (a)-[r3:HEARS]->(sa)
CREATE (sa)-[r4:COMES_UP]->(s);

// Relation 4
MATCH (sa:Testimony {name: "sailor"}), (do:Location {name: "door"}), (c:Location {name: "chamber"})
CREATE (sa)-[r5:KNOCKS_ON]->(do)
CREATE (do)-[r6:LEADS_TO]->(c);

// Relation 5
MATCH (a:Testimony {name: "sailor"})
SET a.appearance = "sailor's";

// Relation 6
MATCH (a:Testimony {name: "sailor"})
SET a.physical_condition = "muscular and hardy";

// Relation 7
MATCH (a:Testimony {name: "sailor"}), (d:Character {name: "Dupin"})
CREATE (a)-[r7:GREETS_WITH {accent: "French"}]->(d);

// Relation 8
MATCH (a:Character {name: "Dupin"}), (sa:Testimony {name: "sailor"})
CREATE (a)-[r8:INVITES_IN]->(sa)
SET r8.sentiment = "pleasantly";

// Relation 9
MATCH (a:Character {name: "Dupin"}), (sa:Testimony {name: "sailor"})
CREATE (a)-[r9:COMPLIMENTS]->(sa)
SET r9.topic = "the species that has brought him here";

//// Paragraph 21 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (s:Character {name: "sailor"});
MERGE (d:Character {name: "Dupin"});
MERGE (a:Object {name: "animal"});
MERGE (r:Object {name: "reward"});
MERGE (p:Object {name: "pistol"});
MERGE (n:Location {name: "nearby"});
MERGE (m:Testimony {name: "murders"});
MERGE (h:Testimony {name: "honesty"});
MERGE (c:Testimony {name: "concealment"});
MERGE (e:Evidence {name: "age"});

// Relation 1
MATCH (s:Character {name: "sailor"})
SET s.emotion = "worried";

// Relation 2
MATCH (d:Character {name: "Dupin"}), (a:Object {name: "animal"})
CREATE (d)-[r2:ASKS_ABOUT {question: "how old the animal is"}]->(a);

// Relation 3
MATCH (s:Character {name: "sailor"})
SET s.sureness = "uncertain";

// Relation 4
MATCH (d:Character {name: "Dupin"}), (a:Object {name: "animal"}), (n:Location {name: "nearby"})
CREATE (d)-[r4:PRETENDS_TO_STORE]->(a)
CREATE (d)-[r5:PRETENDS_TO_SAY_GOODBYE_TO]->(a)
CREATE (a)-[r6:STORED_NEARBY]->(n);

// Relation 5
MATCH (d:Character {name: "Dupin"}), (a:Object {name: "animal"})
SET d.sorrow = "sorry to say goodbye to the animal";

// Relation 6
MATCH (s:Character {name: "sailor"}), (a:Object {name: "animal"})
CREATE (s)-[r7:EAGER_TO_GET_BACK]->(a);

// Relation 7
MATCH (s:Character {name: "sailor"}), (r:Object {name: "reward"})
CREATE (s)-[r8:OFFERS]->(r)
SET r.description = "handsome";

// Relation 8
MATCH (d:Character {name: "Dupin"}), (r:Object {name: "reward"})
CREATE (d)-[r9:CHOOSES_REWARD]->(r);

// Relation 9
MATCH (d:Character {name: "Dupin"}), (m:Testimony {name: "murders"})
CREATE (d)-[r10:WANTS_TO_KNOW]->(m)
SET r10.scope = "everything possible";

// Relation 10
MATCH (d:Character {name: "Dupin"})
SET d.sentiment = "pleasant";

// Relation 11
MATCH (d:Character {name: "Dupin"})
SET d.words = "threatening";

// Relation 12
MATCH (d:Character {name: "Dupin"}), (p:Object {name: "pistol"})
CREATE (d)-[r12:PRODUCES]->(p);

// Relation 13
MATCH (s:Character {name: "sailor"})
SET s.emotion = "terrified";

// Relation 14
MATCH (d:Character {name: "Dupin"}), (s:Character {name: "sailor"})
CREATE (d)-[r14:ASSURES]->(s)
SET r14.tone = "calm";

// Relation 15
MATCH (d:Character {name: "Dupin"}), (s:Character {name: "sailor"})
CREATE (d)-[r15:TRUSTS]->(s)
SET r15.belief = "almost entirely innocent of the murders";

// Relation 16
MATCH (d:Character {name: "Dupin"}), (s:Character {name: "sailor"})
CREATE (d)-[r16:BELIEVES]->(s)
SET r16.belief = "knows a great deal more than the police";

// Relation 17
MATCH (s:Character {name: "sailor"}), (c:Testimony {name: "concealment"})
CREATE (s)-[r17:RESPONSIBLE_TO_TELL]->(c)
SET r17.subject = "all he knows";

// Relation 18
MATCH (c:Testimony {name: "concealment"}), (h:Testimony {name: "honesty"})
CREATE (c)-[r18:SENSE_IN]->(h)
SET r18.comparison = "more";

//// Paragraph 22 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (s:Character {name: "sailor"});
MERGE (b:Character {name: "Borneo"});
MERGE (sm:Character {name: "shipmate"});
MERGE (oo:Character {name: "Ourang-Outang"});
MERGE (p:Character {name: "Paris"});
MERGE (a:Character {name: "ape"});
MERGE (d:Character {name: "Dupin"});
MERGE (m:Character {name: "Madames"});
MERGE (mo:Character {name: "mother"});
MERGE (dau:Character {name: "daughter"});
MERGE (st:Object {name: "story"});
MERGE (ship:Object {name: "ship"});
MERGE (cage:Object {name: "cage"});
MERGE (r:Object {name: "routine"});
MERGE (w:Object {name: "whip"});
MERGE (lr:Object {name: "lightning rod"});
MERGE (bo:Object {name: "bodies"});
MERGE (fp:Location {name: "fireplace"});
MERGE (win:Location {name: "window"});
MERGE (dr:Testimony {name: "drinking"});
MERGE (ch:Testimony {name: "chase"});
MERGE (cat:Testimony {name: "catastrophe"});
MERGE (scre:Evidence {name: "screams"});
MERGE (gu:Evidence {name: "guilt"});

// Relation 1
MATCH (s:Character {name: "sailor"}), (st:Object {name: "story"})
CREATE (s)-[r1:TELLS]->(st)
SET r1.scope = "his";

// Relation 2
MATCH (s:Character {name: "sailor"}), (b:Character {name: "Borneo"})
CREATE (s)-[r2:VOYAGED_TO]->(b);

// Relation 3
MATCH (s:Character {name: "sailor"}), (oo:Character {name: "Ourang-Outang"}), (sm:Character {name: "shipmate"})
CREATE (s)-[r3:CAPTURED_WITH]->(oo)
CREATE (sm)-[r3:CAPTURED_WITH]->(oo);

// Relation 4
MATCH (sm:Character {name: "shipmate"}), (s:Character {name: "sailor"})
CREATE (sm)-[r4:DIED]->(s);

// Relation 5
MATCH (s:Character {name: "sailor"}), (a:Character {name: "ape"})
CREATE (s)-[r5:LEFT_ALONE_WITH]->(a);

// Relation 6
MATCH (s:Character {name: "sailor"}), (a:Character {name: "ape"}), (p:Character {name: "Paris"})
CREATE (s)-[r6:LODGED_WITH]->(a)
CREATE (a)-[r6:LODGED_WITH]->(p);

// Relation 7
MATCH (s:Character {name: "sailor"})
CREATE (s)-[r7:RETURNED_HOME {time: "One night"}]->(:Event {name: "return"});

// Relation 8
MATCH (a:Character {name: "ape"}), (c:Object {name: "cage"})
CREATE (a)-[r8:OUT_OF]->(c);

// Relation 9
MATCH (a:Character {name: "ape"}), (s:Character {name: "sailor"}), (r:Object {name: "routine"})
CREATE (a)-[r9:IMITATES {action: "shaving routine"}]->(r)
CREATE (s)-[r9:IMITATES {action: "shaving routine"}]->(r);

// Relation 10
MATCH (s:Character {name: "sailor"}), (oo:Character {name: "Ourang-Outang"}), (w:Object {name: "whip"})
CREATE (s)-[r10:TRIES_TO_WHIP]->(oo)
CREATE (w)-[r10:USED_ON {target: "Ourang-Outang"}]->(oo);

// Relation 11
MATCH (w:Object {name: "whip"}), (oo:Character {name: "Ourang-Outang"})
SET w.effect = "frightened";

// Relation 12
MATCH (oo:Character {name: "Ourang-Outang"})
CREATE (oo)-[r12:ESCAPED]->(:Event {name: "escape"});

// Relation 13
MATCH (s:Character {name: "sailor"}), (ch:Testimony {name: "chase"})
CREATE (s)-[r13:CHASED]->(ch)
SET r13.duration = "hours";

// Relation 14
MATCH (s:Character {name: "sailor"}), (m:Character {name: "Madames"})
CREATE (s)-[r14:COMES_TO]->(m)
SET r14.destination = "apartment";

// Relation 15
MATCH (s:Character {name: "sailor"}), (d:Character {name: "Dupin"})
CREATE (s)-[r15:SEES]->(d)
SET r15.foretold = true;

// Relation 16
MATCH (a:Character {name: "ape"}), (lr:Object {name: "lightning rod"})
CREATE (a)-[r16:ENTERS_ROOM]->(lr);

// Relation 17
MATCH (s:Character {name: "sailor"}), (lr:Object {name: "lightning rod"})
CREATE (s)-[r17:FOLLOWS]->(lr);

// Relation 18
MATCH (s:Character {name: "sailor"}), (lr:Object {name: "lightning rod"})
CREATE (s)-[r18:GETS_STUCK_ON]->(lr);

// Relation 19
MATCH (s:Character {name: "sailor"}), (lr:Object {name: "lightning rod"})
CREATE (s)-[r19:PEERS_INTO]->(lr)
SET r19.location = "room";

// Relation 20
MATCH (lr:Object {name: "lightning rod"})
CREATE (lr)-[r20:HAPPENS_INSIDE]->(:Event {name: "catastrophe"});

// Relation 21
MATCH (s:Character {name: "sailor"})
CREATE (s)-[r21:WITNESSES]->(:Event {name: "whole event"});

// Relation 22
MATCH (mo:Character {name: "mother"}), (dau:Character {name: "daughter"}), (oo:Character {name: "Ourang-Outang"}), (scre:Evidence {name: "screams"})
CREATE (mo)-[r22:FRIGHTENS]->(oo)
CREATE (dau)-[r22:FRIGHTENS]->(oo)
CREATE (scre)-[r22:PRODUCED_DURING {event: "screams"}]->(oo);

// Relation 23
MATCH (oo:

Ourang-Outang"), (gu:Evidence {name: "guilt"})
SET oo.emotion = "enraged";

// Relation 24
MATCH (oo:Character {name: "Ourang-Outang"}), (s:Character {name: "sailor"}), (bo:Object {name: "bodies"})
CREATE (oo)-[r24:CONCEALS]->(bo)
CREATE (s)-[r24:CONCEALS]->(bo);

// Relation 25
MATCH (bo:Object {name: "bodies"}), (fp:Location {name: "fireplace"})
CREATE (bo)-[r25:CONCEALED_IN]->(fp);

// Relation 26
MATCH (bo:Object {name: "bodies"}), (win:Location {name: "window"})
CREATE (bo)-[r26:CONCEALED_OUT_OF]->(win);

//// Paragraph 23 ///////////////////////////////////////////////////////////////
// Create nodes
MERGE (n:narrator {name: "narrator"});
MERGE (rm:Rue_Morgue {name: "Rue-Morgue"});
MERGE (s:sailor {name: "sailor"});
MERGE (oo:Ourang_Outang {name: "Ourang-Outang"});
MERGE (lb:Le_Bon {name: "Le Bon"});
MERGE (p:Prefect {name: "Prefect"});
MERGE (d:Dupin {name: "Dupin"});
MERGE (c:police {name: "police"});
MERGE (cr:Object {name: "closing remarks"});
MERGE (pr:Object {name: "price"});
MERGE (pris:Object {name: "prison"});
MERGE (sk:Object {name: "skill"});
MERGE (q:Object {name: "quote"});

// Relation 1
MATCH (n:narrator), (cr:Object {name: "closing remarks"})
CREATE (n)-[r1:ADDS]->(cr);

// Relation 2
MATCH (s:sailor), (oo:Ourang_Outang)
CREATE (s)-[r2:RECAPTURES]->(oo);

// Relation 3
MATCH (s:sailor), (oo:Ourang_Outang), (pr:Object {name: "price"})
CREATE (s)-[r3:SELLS]->(oo)
CREATE (oo)-[r3:IS_SOLD_FOR]->(pr);

// Relation 4
MATCH (lb:Le_Bon), (pris:Object {name: "prison"})
CREATE (lb)-[r4:IS_RELEASED_FROM]->(pris);

// Relation 5
MATCH (p:Prefect), (sk:Object {name: "skill"})
CREATE (p)-[r5:KNOWS_HE_IS_BEATEN]
CREATE (sk)-[r5:BEATEN_BY]->(p);

// Relation 6
MATCH (p:Prefect), (d:Dupin), (sk:Object {name: "skill"})
CREATE (p)-[r6:ANNOYED_AT {target: "Dupin's skill"}]->(d)
CREATE (sk)-[r6:SKILL_OF]->(p);

// Relation 7
MATCH (d:Dupin), (p:Prefect), (sk:Object {name: "skill"})
CREATE (d)-[r7:KNOWS_WISDOM_IS_SHALLOW]->(p)
CREATE (sk)-[r7:SHALLOW_WISDOM_OF]->(p);

// Relation 8
MATCH (d:Dupin), (p:Prefect)
CREATE (d)-[r8:CONSIDERS {target: "Prefect"}]->(p)
SET r8.description = "good creature";

// Relation 9
MATCH (d:Dupin), (q:Object {name: "quote"})
CREATE (d)-[r9:ENDS_WITH]->(q)
SET r9.tone = "condescending";

// Relation 10
MATCH (q:Object {name: "quote"}), (sk:Object {name: "skill"})
CREATE (q)-[r10:DESCRIBES]->(sk)
SET r10.target = "Prefect's main skill";
