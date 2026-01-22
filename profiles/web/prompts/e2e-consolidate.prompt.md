---
name: e2e-consolidate
description: Consolidate and refactor e2e tests based on passing PRD items.
agent: agent
---

user-workflow.spec.ts is getting pretty bloated. Review this file and then review the prd.json file for each item where "passes" is true. Consolidate and refactor the e2e tests to ensure that all passing prd.json items are still covered in fewer tests that are faster to run.

After making your changes, ensure all feedback loops pass (npm run typecheck, npm run test, npm run test:e2e, npm run lint, npm run build).
