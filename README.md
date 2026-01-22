# ai-rules

My single source-of-truth for all my AI coding rules, Copilot prompts, and Claude Code skills — organized by profile (web/mobile).

This repo contains a script intended to be installed on your machine's `$PATH`:

- `ai-rules-sync` — syncs the selected profile into the current git repo (overwrites)

## Install scripts on your machine

Symlink into `/usr/local/bin` (or anywhere on PATH)

```bash
git clone git@github.com:mjamore/ai-rules.git ~/git/ai-rules
sudo ln -sf ~/git/ai-rules/bin/ai-rules-sync  /usr/local/bin/ai-rules-sync
```

Option B: add the repo `bin/` to your PATH

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
