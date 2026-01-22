# Browser Automation (agent-browser)

Use `agent-browser` for web automation.

## Core workflow

1. Open a page
   - `agent-browser open <url>`

2. Snapshot interactive elements (shows refs like `@e1`, `@e2`)
   - `agent-browser snapshot -i`

3. Interact using refs
   - `agent-browser click @e1`
   - `agent-browser fill @e2 "text"`
   - Re-snapshot after page changes: `agent-browser snapshot -i`

## Tips

- Prefer stable interactions (buttons/links/inputs by role/name).
- Re-snapshot after navigation, modals, or major DOM changes.
- Keep a short log of steps you tried and what changed.
