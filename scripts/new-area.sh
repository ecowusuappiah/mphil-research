#!/usr/bin/env bash
# Copies 01-exploration/_template into a new area folder.
# Usage: scripts/new-area.sh kebab-case-name
set -euo pipefail
cd "$(dirname "$0")/.."

NAME="${1:-}"
if [ -z "$NAME" ]; then
  echo "Usage: make new-area NAME=kebab-case-name" >&2
  exit 1
fi

DEST="01-exploration/areas/${NAME}"
if [ -e "$DEST" ]; then
  echo "Error: area '${NAME}' already exists at $DEST" >&2
  exit 1
fi

cp -r 01-exploration/_template "$DEST"
echo "Created $DEST"
echo ""
echo "Next steps:"
echo "  1. Edit $DEST/workflow.tex (fill in the \\todo{} placeholders)"
echo "  2. Run: make refresh-index"
echo "  3. Add a row for '${NAME}' to 00-admin/areas-index.md"
