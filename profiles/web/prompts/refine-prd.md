---
name: refine-prd
description: This prompt is used to refine the product requirements document (prd.json) based on proposed feature changes.
agent: agent
---

The prd.json file is the source of truth the entire application and it's critically important to maintain its integrity. Review it thoroughly.

I want to make an addition or change to the application's requirements. Based on the following feature description, identify if one or more new features should be added to prd.json, or if one or more existing features should be modified.

If adding one or more new features, you should determine the "category", define the "description" and "steps" for validating the feature and set "passes" to false.

If modifying one or more existing features, update the "description" and "steps" and change "passes" to false.

Only modify the prd.json file. Do not modify any other files at this time.

Feature Description:
${featureDescription}
