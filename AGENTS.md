# Repository Guidelines

## Project Structure & Module Organization

- This is a `chezmoi` source-state repo. Files/dirs like `private_dot_local/` map to targets like `~/.local/` when applied.
- `private_dot_local/bin/`: user-facing entrypoints; e.g. `symlink_watchpick` is materialized as `watchpick` on the target machine.
- `python/watchpick/`: Python implementation for the `watchpick` helper. Files prefixed with `executable_` are meant to be installed with the executable bit (e.g., `executable_watchpick.py` → `watchpick.py`).

## Build, Test, and Development Commands

This repo is script-oriented (no Makefile/package manager at the root).

- Preview/apply dotfiles with chezmoi: `chezmoi diff`, `chezmoi apply -v`
- Check managed files: `chezmoi status`, `chezmoi verify` (if configured)
- Show CLI help: `python3 python/watchpick/executable_watchpick.py --help`
- Run against a directory: `python3 python/watchpick/executable_watchpick.py --root ~/texts --recursive`
- Print the underlying `npx tsx` command without executing: `python3 python/watchpick/executable_watchpick.py --print --no-run`
- Common env vars: `TEXT_ROOT` (default search root), `SUB_WATCH_TS` (path to `watch.ts`), `BASELINE_ROOT` (where baselines live)
- Expected tools: `python3` (3.10+), `npx`/`tsx` (Node), optional `fzf` (picker UI), optional `wl-copy` (clipboard)

## Coding Style & Naming Conventions

- Python: 4-space indentation, type hints encouraged, `snake_case` for functions/vars, `UPPER_SNAKE_CASE` for constants.
- Keep changes dependency-light (prefer stdlib) and ensure CLI behavior remains predictable (clear errors, non-zero exit codes on failure).
- Preserve chezmoi source-state filename prefixes (`private_`, `dot_`, `symlink_`, `executable_`) unless you are intentionally changing installation behavior.

## Testing Guidelines

No automated test suite currently.

- Fast sanity checks: `python3 -m py_compile python/watchpick/executable_watchpick.py`
- Smoke test: run with `--print --no-run` to validate argument parsing and command generation.

## Commit & Pull Request Guidelines

- Commits use short, imperative subjects (e.g., “Add …”, “Make …”); keep subjects concise and focused on the user-visible outcome.
- PRs should include: what changed, why, an example invocation (command line), and any new/changed env vars or external tool requirements.
