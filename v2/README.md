### Context: This is a second pass on the experiment by Chris. 

### Strategy

- Experiment with single-pass entity extraction in GPT-4
    - Use a node script
- Consider vectorizing

### Questions:

Understand capabilities of GPT-4
- Does it identify all of the entities correctly? 
- Does it invent entities?
- How does it help model relationships (assuming this part can not be fully automated)
- Does a vector store really help? Are the same entities revealed in clusters? Can it help characterize relationships?

### Setup / Installation

- Add GPT-4 enabled account API key to a .env file, using .env-example template.
- Execute the entity extractor potentially like this: `node ./01-entity-extraction/extract-entities.js`