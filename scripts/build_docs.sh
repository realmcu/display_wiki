#!/usr/bin/env bash
set -euo pipefail

# Build bilingual Sphinx docs into site/
# Usage: scripts/build_docs.sh

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CN_SRC="$ROOT_DIR/doc/cn"
EN_SRC="$ROOT_DIR/doc/en"
CN_OUT="$ROOT_DIR/site/cn"
EN_OUT="$ROOT_DIR/site/en"

mkdir -p "$CN_OUT" "$EN_OUT"

echo "Building CN -> $CN_OUT"
sphinx-build -b html "$CN_SRC" "$CN_OUT"

echo "Building EN -> $EN_OUT"
sphinx-build -b html "$EN_SRC" "$EN_OUT"

echo "Done. Serve with ./serve.sh -d site"

