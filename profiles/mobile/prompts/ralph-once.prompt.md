---
name: ralph-once
description: Use this prompt to complete one task at a time from the prd.json file, updating progress.txt and ensuring all feedback loops pass before committing.
agent: agent
---

1. Read the prd.json and progress.text file.
2. Find the next incomplete task.
3. Create a new branch for your work.
4. Implement the task fully. You should be 100% confident it works as expected/designed.
5. Add/Update XCUIAutomation tests (do not run tests).
6. Update any relevant documentation.
7. Update progress.txt with what you did.
8. Set 'passes' to true in prd.json for the item you completed and validated via automated testing.
   ONLY DO ONE TASK AT A TIME. DO NOT COMMIT THE CHANGES YOURSELF.
