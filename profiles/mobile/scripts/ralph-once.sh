#!/bin/bash

claude --permission-mode acceptEdits "@prd.json @progress.txt \
1. Read the prd.json and progress.text file. \
2. Find the next incomplete task. \
3. Create a new branch for your work. \
4. Implement the task fully. \
5. Add/Update Maestro tests if applicable. \
6. Run all feedback loops (npm lint, npm run test). \
7. Update any relevant documentation. \
8. Update progress.txt with what you did. \
9. Set 'passes' to true in prd.json for the item you completed and validated via automated testing. \
ONLY DO ONE TASK AT A TIME. DO NOT COMMIT THE CHANGES YOURSELF."