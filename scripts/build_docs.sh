#!/usr/bin/env bash
set -euo pipefail

# Build Sphinx docs into site/
# Usage: scripts/build_docs.sh

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DOC_SRC="$ROOT_DIR/doc"
DOC_OUT="$ROOT_DIR/site"

mkdir -p "$DOC_OUT"

echo "Building docs -> $DOC_OUT"
sphinx-build -b html "$DOC_SRC" "$DOC_OUT"

echo "Done. Serve with ./serve.sh"

