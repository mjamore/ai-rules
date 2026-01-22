# AGENTS.md — Project Rules (Source of Truth)

This file is the **source of truth** for how AI should work in this repository.

**Priority**

1. Follow this file first.
2. If another doc conflicts with this file, follow **AGENTS.md**.
3. Prefer small, safe, incremental changes.

---

## Git workflow

- Use git **terminal commands** for basic operations (branching, staging, committing).
- Use the **GitHub CLI** when necessary (PRs, releases, etc.).
- Favor basic CLI tools over MCP servers for git operations.

---

## Code organization

### Constants

- Place constants in a shared file/module (avoid duplicating literals across files).

---

## React.js

- Avoid `useEffect` unless absolutely necessary.
  - If you must use it, keep it small, explain why, and ensure cleanup is correct.
- Prefer **Server Components**.
- Only use **Client Components** when client interaction is required.
  - Keep Client Components as far down the DOM tree as possible.

---

## Next.js

- Follow Next.js 16 conventions.
- Use `proxy.ts` instead of `middleware.ts` (when applicable in this codebase).

---

## Zod

- Treat Zod as a first class citizen. Value strong typing.
- Use `lib/schemas.ts` and `lib/env.ts`.

---

## Supabase / Vercel / shadcn

- Supabase: MCP server may be available.
- Vercel: MCP server may be available.
- shadcn/ui:
  - Use shadcn/ui components where reasonable.
  - MCP server may be available.

> If MCP tooling is unavailable in your current environment, proceed using docs + local repo context.

---

## Automated tests

### General testing rules

- Write the **minimal** tests that cover the most important behavior.
- Before adding a new test:
  - Prefer extending an existing test if it remains readable and focused.
  - Add a new test only when it improves clarity or separation of concerns.
- **Never** create snapshot tests.

### Vitest (unit tests)

- Co-locate unit tests next to the source file.
- Use `*.test.ts` naming.

### Playwright (e2e)

Two categories:

1. **pages**

- Validate a page loads with expected elements.
- Validate basic interactions.

2. **workflows**

- Validate critical user workflows that often span multiple pages.
- These are the most important tests for confidence.

Additional rules:

- Never write fragile tests against styling/layout.
- Prefer fewer, comprehensive tests over many tiny tests.

---

## Browser automation

- Use `agent-browser` for web automation.

See: `.claude/skills/agent-browser/SKILL.md` for the workflow and commands.
