#!/usr/bin/env bash
# Regenerates the \input{...} list between the AUTO-GENERATED markers
# in 01-exploration/main.tex from whatever folders exist under
# 01-exploration/areas/. Run this after `make new-area` or after
# deleting/renaming an area folder.
set -euo pipefail
cd "$(dirname "$0")/.."

MAIN="01-exploration/main.tex"
START="% AUTO-GENERATED-AREAS-START"
END="% AUTO-GENERATED-AREAS-END"

if [ ! -f "$MAIN" ]; then
  echo "Error: $MAIN not found." >&2
  exit 1
fi

BLOCK=$(mktemp)
{
  echo "% ============================================================"
  echo "$START"
  echo "% Do not hand-edit between these markers -- run \`make refresh-index\`."
  echo "% ============================================================"
  for d in $(find 01-exploration/areas -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sort); do
    name=$(basename "$d")
    if [ -f "$d/workflow.tex" ]; then
      echo "\\input{areas/${name}/workflow}"
    fi
  done
  echo "% ============================================================"
  echo "$END"
  echo "% ============================================================"
} > "$BLOCK"

awk -v start="$START" -v end="$END" -v blockfile="$BLOCK" '
  $0 ~ start { while ((getline line < blockfile) > 0) print line; inblock=1; next }
  $0 ~ end   { inblock=0; next }
  inblock    { next }
  { print }
' "$MAIN" > "${MAIN}.tmp" && mv "${MAIN}.tmp" "$MAIN"

rm -f "$BLOCK"

count=$(find 01-exploration/areas -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
echo "Refreshed $MAIN -- ${count} area(s) listed."
