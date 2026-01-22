# ai-rules

A source-of-truth repository for AI coding rules, prompts, and Claude Code skills.

## Repo structure

- `profiles/web/` – web project rules/prompts/skills/scripts
- `profiles/mobile/` – placeholder for future mobile rules/prompts/skills/scripts
- `bin/ai-install` – clone `ai-rules` into a target repo root and run an initial sync
- `bin/ai-sync` – sync profile files into the target repo (overwrites)

## Typical usage (in a target repo)

```bash
# one-time (creates ./ai-rules in the repo)
curl -fsSL <YOUR_RAW_URL_TO_ai-install> | bash -s -- --repo git@github.com:<you>/ai-rules.git --profile web

# later, after updating ./ai-rules
./ai-rules/bin/ai-sync web
```

> This template ships as a zip for initial setup. After you publish it to GitHub, use `ai-install` with `--repo`.

## What gets synced into the target repo

- `AGENTS.md` → repo root
- `CLAUDE.md` → repo root (delegates to AGENTS.md)
- `.github/copilot-instructions.md` → delegates to AGENTS.md
- `.github/prompts/*.prompt.md` → Copilot prompt files
- `.claude/skills/*` → Claude Code skills
- project scripts (e.g. `ralph-once.sh`) → repo root
