# Repository Guidelines

This guide helps contributors work efficiently on the Display Wiki documentation site. Follow these practices to keep builds reproducible and content consistent.

## Project Structure & Module Organization
- `doc/`: Sphinx sources (`index.rst`, `pages/*`, `_static`, `_templates`).
- `site/`: Built HTML and assets; do not edit by hand.
- `scripts/`: Helper scripts like `scripts/build_docs.sh`.
- `serve.sh`: Local static server (WSL-friendly) for previewing `site/`.
- `.readthedocs.yaml`: Read the Docs config using `doc/requirements.txt`.

## Build, Test, and Development Commands
- Create env and install deps: `python3 -m venv .venv && source .venv/bin/activate && pip install -r doc/requirements.txt`.
- Build docs: `scripts/build_docs.sh` (outputs to `site/`).
- Preview locally: `./serve.sh -p 8000 -d site`.
- Alternative build: `sphinx-build -b html doc site`.

## Coding Style & Naming Conventions
- Content in Markdown (MyST) or reStructuredText; keep headings concise and consistent.
- Filenames lowercase, hyphen-separated (e.g., `quickstart/index.md`). No spaces, no tabs.
- Place new pages under `doc/pages/<section>/` and include them in `doc/index.rst` via `.. toctree::`.
- Use relative links and assets (`_static/css/custom.css`, `../hardware/index.md`).

## Testing Guidelines
- No unit tests; validate documentation by building locally.
- Treat warnings strictly when needed: `sphinx-build -b html -W doc site`.
- Optional link check: `sphinx-build -b linkcheck doc site-linkcheck`.

## Commit & Pull Request Guidelines
- Commits: short, imperative subject (e.g., "Add quickstart page"), with focused changes.
- Reference affected sections or pages; link related issues.
- PRs: clear description, before/after screenshots when visual changes, and steps to preview.
- Ensure local build succeeds before requesting review.

## Security & Configuration Tips
- Do not edit `site/` manually; always regenerate via Sphinx.
- On WSL, use `./serve.sh` and follow printed port-proxy hints for LAN access.
- Customize theme and navigation in `doc/conf.py` and `_static/css`.

