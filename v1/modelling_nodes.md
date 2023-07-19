A 2-pass process to identify node types for a property graph model from text

## First Pass

Identify initial set of node types

### Prompt

Given the following text, define a property graph model. Follow these rules:

- create node types to represent categories of nouns
- try to limit to no more than 6 node types
- use categorical naming for node types, e.g. 'object' instead of 'book'
- ignore the relations

Text:
"""
"""


### Output

model: `gpt-3.5-turbo`

```
Based on the provided text, here's a property graph model that represents the main categories of nouns:

Character: Represents the main characters in the story.
  Node properties: Name, Description
Location: Represents different locations mentioned in the story.
  Node properties: Name, Description
Book: Represents books or references to books.
  Node properties: Title, Description
Crime: Represents the details and elements related to the crime.
  Node properties: Description, Evidence
Testimony: Represents the testimonies given by various witnesses.
  Node properties: Description, Witness
Investigation: Represents the process of investigation carried out by the characters.
  Node properties: Description, Conclusion
```

### Analysis

From the above output, I suggest these node types for the next pass:

Character
Location
Object
Testimony
Evidence

## Second Pass

Validate and refine node types

### Prompt

Given the following partial property graph model, parse the following text to identify all of the node instances. Follow these rules:

- add node instances and properties to each where needed
- consolidate nodes as much as possible by re-using existing nodes
- limit node instances to the following node types only

Node Types:

"""
Character
Location
Object
Testimony
Evidence
"""

Text:

"""
"""

### Output

model: `gpt-3.5-turbo`

Based on the provided text, the identified node instances are as follows:

1. Character:
   - Narrator
   - Auguste Dupin
   - Police
   - Le Bon
   - Prefect of the police
   - Madame Esplanaye (mentioned)

2. Location:
   - Paris
   - Rue Morgue
   - The apartment
   - The chamber
   - The house
   - The lightning rod
   - The newspaper headquarters

3. Object:
   - Books
   - Special volume
   - Pistol
   - Nail
   - Ribbon

4. Testimony:
   - Testimonies of various witnesses (describing the murders and other details)

5. Evidence:
   - Lengths of human hair
   - Bags of money
   - Jewels
   - Clumps of blood and flesh
   - Tuft of hair

Please note that some entities may be mentioned in the text but do not qualify as distinct node instances based on the provided node types. Additionally, there may be instances that are not explicitly mentioned in the text but can be inferred based on context.

### Analsysis

Eyeballing the instances and their types, our list of 5 types from Pass 1 appear to be sufficient. We can proceed to the next pass.



## Reference

Text = paste the full text from `./murders_in_rue_morgue_summary.txt`
