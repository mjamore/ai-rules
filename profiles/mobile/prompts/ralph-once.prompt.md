---
name: ralph-once
description: Use this prompt to complete one task at a time from the prd.json file, updating progress.txt and ensuring all feedback loops pass before committing.
agent: agent
---

1. Read the prd.json and progress.text file.
2. Find the next incomplete task.
3. Create a new branch for your work.
4. Implement the task fully.
5. Add/Update Maestro tests.
6. Run all feedback loops (npm lint, npm run test:maestro).
7. Update any relevant documentation.
8. Update progress.txt with what you did.
9. Set 'passes' to true in prd.json for the item you completed and validated via automated testing.
   ONLY DO ONE TASK AT A TIME. DO NOT COMMIT THE CHANGES YOURSELF.
