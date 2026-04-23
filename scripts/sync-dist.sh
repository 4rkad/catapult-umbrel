#!/usr/bin/env bash
# Rebuild the upstream Catapult SPA and copy dist/ into this repo.
# Run from the root of catapult-umbrel.
set -euo pipefail

UPSTREAM="${UPSTREAM:-$HOME/coinswap-research/catapult}"
HERE="$(cd "$(dirname "$0")/.." && pwd)"

( cd "$UPSTREAM" && npm install && npm run build )
rm -rf "$HERE/catapult-dist"
cp -r "$UPSTREAM/dist" "$HERE/catapult-dist"
echo "Synced $UPSTREAM/dist -> $HERE/catapult-dist"
