# ai-rules

My single source-of-truth for all my AI coding rules, Copilot prompts, and Claude Code skills — organized by profile (web/mobile).

This repo contains a script intended to be installed in the `$PATH`:

- `ai-rules-sync` — syncs the selected profile (web/mobile) into the current git repo (overwrites)

This script does 2 things:

1. Pulls my personal AI files, from `profiles/...`, such as AGENT.md, custom prompts, and custom scripts for agentic coding.
2. Pulls skills (web/mobile) for all AI providers (Claude, Copilot, Cursor, etc.) using `npx skills add ...`.

After running this script, I should have my perfect AI setup with all the prompts, skills, etc. and my custom AGENTS.md file.

## Install script on your machine

Symlink into `/usr/local/bin` (or anywhere on PATH)

```bash
git clone git@github.com:mjamore/ai-rules.git ~/git/ai-rules
sudo ln -sf ~/git/ai-rules/bin/ai-rules-sync  /usr/local/bin/ai-rules-sync
```

## Use in any target repo

```bash
cd /path/to/your/project
ai-rules-sync web
```

## Configuration

Environment variables (optional):

- `GITHUB_TOKEN` (optional) — increases GitHub API rate limits

## What gets written into the target repo

From `profiles/<profile>/...`:

- `instructions/AGENTS.md` → `./AGENTS.md`
- `instructions/CLAUDE.md` → `./CLAUDE.md`
- `instructions/copilot-instructions.md` → `./.github/copilot-instructions.md`
- `prompts/*` → `./.github/prompts/*`
- `claude/skills/*` → `./.claude/skills/*` (all files preserved)
- `scripts/*` → repo root `./*` (e.g. `ralph-once.sh`)

`CLAUDE.local.md` in the target repo is never overwritten.
