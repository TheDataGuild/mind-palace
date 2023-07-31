// Theory: It should be possible to use the API to input the entire text of the story (The effective context window in ChatGPT is only 4,000ish tokens, becasue it reserves space for chat history.)

// Key constraints:
// The Rue Morgue story is about 15k words
// Strategy: Load the text and query GPT-4 for entities.

// Key API docs
// - `gpt-4` model has 8,192 tokens / 6k word limit
// - `gpt-4-32k` is 128k / 24k word limit
// https://platform.openai.com/docs/models/gpt-4

require('dotenv').config();
const fs = require('fs');
const openai = require('openai');


fs.readFile('./resources/Tales_(Poe)_The_Murders_in_the_Rue_Morgue.txt', 'utf8', async function (err, data) {
    if (err) {
        console.error(err);
        return;
    }

    const { Configuration, OpenAIApi } = require("openai");

    const configuration = new Configuration({
        apiKey: process.env.OPENAI_API_KEY,
    });
    const openai = new OpenAIApi(configuration);

    // Split the data into sections of maximum 6k words
    const sections = data.split(' ').reduce((acc, word, i) => {
        if (i % 6000 === 0) acc.push('');
        acc[acc.length - 1] += ` ${word}`;
        return acc;
    }, []);

    // Call the API in a loop for each section
    let results = [];
    for (const section of sections) {
        const completion = await openai.createChatCompletion({
            model: "gpt-4",
            messages: [{ "role": "system", "content": "You are a entity extractor. List all the entitites in the text." }, {
                role: "user", content: `
                ${section} 
            ` }],
        });
        results.push(completion.data.choices[0].message);
    }

    // Write the results to extracted-entities.json
    fs.writeFile('./extracted-entities.json', JSON.stringify(results), (err) => {
        if (err) {
            console.error(err);
            return;
        }
        console.log('Entities have been successfully extracted and saved to extracted-entities.json');
    });

});




