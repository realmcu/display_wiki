# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Display Wiki is a Sphinx-based documentation site for display technology. Content is written in Markdown (MyST) and reStructuredText, built into static HTML, and hosted on Read the Docs. The site includes custom navigation features like draggable sidebar width.

## Build Commands

### Quick Start (One Command)
```bash
./quickstart.sh        # Default port 8080
./quickstart.sh 9000   # Custom port
```
This script automatically creates venv, installs dependencies, cleans old builds, builds docs, and starts the server.

### Manual Build Steps
```bash
# 1. Setup environment (first time only)
python3 -m venv .venv
source .venv/bin/activate
pip install -r doc/requirements.txt

# 2. Clean and build (always recommended to avoid cache issues)
rm -rf site/* && sphinx-build -b html doc site

# 3. Preview locally
./serve.sh -p 8080
```

### Alternative Build
```bash
scripts/build_docs.sh  # Uses sphinx-build, outputs to site/
```

### Validation
```bash
# Build with warnings as errors
sphinx-build -b html -W doc site

# Check for broken links
sphinx-build -b linkcheck doc site-linkcheck
```

## Project Architecture

### Directory Structure
- `doc/` - Sphinx source files
  - `conf.py` - Sphinx configuration (theme, extensions, language=zh_CN)
  - `index.rst` - Documentation entry point with main toctree
  - `pages/` - All content pages organized by section (quickstart, hardware, software, applications, faq)
  - `_static/` - Static assets (CSS, JS, images, PDFs, slides)
    - `css/custom.css` - Custom styling including draggable sidebar
    - `js/custom.js` - Custom JavaScript for sidebar drag functionality
    - `refs/` - Reference documents and datasheets
  - `_templates/` - Jinja2 template overrides (currently empty, uses defaults)
  - `requirements.txt` - Python dependencies
- `site/` - Generated HTML output (never edit manually, regenerated on each build)
- `scripts/` - Helper scripts
- `serve.sh` - Local static server with WSL support
- `quickstart.sh` - One-command setup and serve
- `.readthedocs.yaml` - Read the Docs hosting configuration

### Key Technologies
- **Sphinx**: Documentation generator with MyST (Markdown) parser
- **Theme**: sphinx_rtd_theme (Read the Docs theme) with heavy customization
- **Extensions**: myst-parser, sphinx-copybutton, sphinxcontrib-mermaid
- **Language**: Chinese (zh_CN) with Chinese search support

### Custom Features
1. **Draggable Sidebar**: Users can drag left navigation bar to resize width, stored in localStorage (`docs.displaywiki.sidebar.width`)
2. **PDF Viewer**: Custom JavaScript for inline PDF viewing in documentation
3. **Auto-numbered Titles**: CSS automatically numbers section headings
4. **Custom Styling**: Extensive CSS customizations for layout, colors, and responsive design

## Content Organization

### Adding New Pages
1. Create Markdown file in appropriate `doc/pages/<section>/` subdirectory
2. Add to toctree in either:
   - `doc/index.rst` (main toctree) for top-level sections
   - Section's `index.md` file for subsections
3. Use relative paths for internal links and assets
4. Follow naming convention: lowercase with hyphens (e.g., `display-controller.md`)

### Content Sections
- `quickstart/` - Getting started guides, environment setup, first examples
- `hardware/` - Hardware specifications, interfaces, display controllers, drivers
- `software/` - Software frameworks, graphics libraries, video/vector rendering
- `applications/` - Use cases and application examples (automotive, industrial, smartwatch)
- `faq/` - Troubleshooting and common questions

## Development Workflow

### After Editing Content
1. Always clean before rebuilding: `rm -rf site/*`
2. Rebuild: `sphinx-build -b html doc site`
3. Preview: `./serve.sh -p 8080`
4. Browser caching: Hard refresh (Ctrl+Shift+R) if changes don't appear

### WSL Development
- Windows browser on same PC: `http://localhost:8080`
- LAN access requires Windows port forwarding (see README.md for netsh commands)
- Server binds to 0.0.0.0 for network access
- WSL IP shown when `serve.sh` starts (for portproxy configuration)

### Systemd Service
- Install: `./install-service.sh` (user-level service, auto-starts on login)
- Status: `systemctl --user status display-wiki`
- Logs: `journalctl --user -u display-wiki -f`
- Uninstall: `./uninstall-service.sh`

## Important Notes

### Build System
- **Always clean before building** (`rm -rf site/*`) - incremental builds can leave stale files
- `site/` directory is disposable - never edit HTML directly
- Sphinx caching can cause unexpected behavior; when in doubt, clean and rebuild

### Configuration
- Theme options in `doc/conf.py` control navigation depth, collapsing, logo
- Custom CSS/JS injected via `html_css_files` and `html_js_files`
- `html_context` passes variables to templates (e.g., sidebar width storage key)

### Content Guidelines
- No spaces or tabs in filenames
- Place assets in `_static/` with organized subdirectories
- Use MyST Markdown features: colon fences, attributes, linkify
- Keep headings concise and consistent for auto-numbering

### Read the Docs
- Config in `.readthedocs.yaml` (Python 3.13, Ubuntu 24.04)
- Automatically builds on git push
- Uses same `doc/requirements.txt` as local builds
