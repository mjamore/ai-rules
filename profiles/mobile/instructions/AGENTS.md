# AGENTS.md — Project Rules (Source of Truth)

This file is the **source of truth** for how AI should work in this repository.

**Priority**

1. Follow this file first.
2. If another doc conflicts with this file, follow **AGENTS.md**.
3. Prefer small, safe, incremental changes.

---

## Skills

- You have access to various skills relevant to iOS development and testing practices. These are located in `.agents/skills`.
- Always consult these skills before making changes related to their domain.

---

## General coding practices

- Minimize nested conditions as much as possible.
- In functions, perform early checks for negative conditions and use early returns to simplify logic.
- Use guard statements and early returns.
- Minimize nested conditions as much as possible.
- Keep file sizes small and manageable. Don't be afraid to break components down into smaller pieces.
- Never duplicate code. Always abstract repeated logic into reusable functions or components.
- Place constants in a shared file/module (avoid duplicating literals across files).
- Keep application state centralized and well-organized using SwiftData. Avoid mixing state/data management and UI logic.

---

## iOS Development

- Follow Swift and SwiftUI best practices. Keep code as simple as possible.
- Use SwiftData for data modeling and persistence.
- Prefer accessibility identifiers for UI elements to facilitate testing.

### UI Design

- Follow Human Interface Guidelines (HIG) for iOS.
- All UI and user interactions should feel native to iOS.
- Use the latest Apple iOS design, specifically Liquid Glass.

---

## Git workflow

- Use git **terminal commands** for basic operations (branching, staging, committing).
- Use the **GitHub CLI** when necessary (PRs, releases, etc.).
- Favor basic CLI tools over MCP servers for git operations.

---

## Automated testing

### General testing rules

- All critical user workflows MUST be covered by automated tests.
- Before adding a new test:
  - Prefer extending an existing test if it remains readable and focused.
  - Add a new test only when it improves clarity or separation of concerns.

### XCUIAutomation

- All core functionality must be covered by XCUIAutomation tests. See the XCUIAutomation skill in the `.agents/skills` directory for implementation details.
