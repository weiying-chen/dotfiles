# Repository Guidelines

## Project Structure & Module Organization

- This is a `chezmoi` source-state repo. Files/dirs like `private_dot_local/` map to targets like `~/.local/` when applied.
- `private_dot_local/bin/`: user-facing entrypoints; e.g. `symlink_watchpick` is materialized as `watchpick` on the target machine.
- The `watchpick` Python source itself is kept outside this repo (e.g. `~/python/watchpick/watchpick.py`); this repo only manages the `~/.local/bin/watchpick` symlink to it.

## Build, Test, and Development Commands

This repo is script-oriented (no Makefile/package manager at the root).

- Preview/apply dotfiles with chezmoi: `chezmoi diff`, `chezmoi apply -v`
- Check managed files: `chezmoi status`, `chezmoi verify` (if configured)
- Refresh dotfiles + externals: `chezmoi update` (external refresh honors `.chezmoiexternal.toml` + `refreshPeriod`)
- Force-refresh externals now: `chezmoi update -R always` (or `chezmoi apply -R always`)
- Show CLI help (after apply): `watchpick --help`
- Common env vars: `TEXT_ROOT` (default search root), `SUB_WATCH_TS` (path to `watch.ts`), `BASELINE_ROOT` (where baselines live)
- Expected tools: `python3` (3.10+), `npx`/`tsx` (Node), optional `fzf` (picker UI), optional `wl-copy` (clipboard)

## Coding Style & Naming Conventions

- Python: 4-space indentation, type hints encouraged, `snake_case` for functions/vars, `UPPER_SNAKE_CASE` for constants.
- Keep changes dependency-light (prefer stdlib) and ensure CLI behavior remains predictable (clear errors, non-zero exit codes on failure).
- Preserve chezmoi source-state filename prefixes (`private_`, `dot_`, `symlink_`, `executable_`) unless you are intentionally changing installation behavior.

## Testing Guidelines

No automated test suite currently.

- Fast sanity checks (external repo): `python3 -m py_compile ~/python/watchpick/watchpick.py`
- Smoke test: run `watchpick --print --no-run` to validate argument parsing and command generation.

## Commit & Pull Request Guidelines

- Commits use short, imperative subjects (e.g., “Add …”, “Make …”); keep subjects concise and focused on the user-visible outcome.
- PRs should include: what changed, why, an example invocation (command line), and any new/changed env vars or external tool requirements.
