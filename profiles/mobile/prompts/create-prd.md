---
name: create-prd
description: This prompt is used to populate the product requirements document (prd.json) based on a user written requirements.md file.
agent: agent
---

We are going to create a thorough list of all features for this application in prd.json file. Review the placeholder content in #file:prd.json to understand the structure of this file. Features are grouped by "category", and each feature has a "description", "steps" for validating the feature, and a "passes" boolean to indicate if the feature is complete (implemented and covered by tests). Features can optionally have a "requirements" field, which contains technical notes about how to implement the feature, such as specific technical decisions to follow, screenshots of mockups to reference, etc.

Review each of the images in the documentation/inspiration directory. These are screenshots to give an idea of design/layout for various parts of the application.

Then review #file:requirements.md. This is a human written requirements document for the vision of this application that we want to create.

Your goal is to update #file:prd.json to list out ALL features to be implemented in this application, based on the requirements.md file. For each feature, determine the appropriate "category" it belongs to, write a clear "description" of the feature, and write out the "steps" needed to validate the feature. Set "passes" to false for all features at this time. Add any relevant "requirements" notes for technical implementation details. Each feature should be a single piece of functionality that is independently testable.

I should be able to point an AI agent to #file:prd.json and have it incrementally build each feature one by one until the application is complete.
