#!/usr/bin/env bash
set -euo pipefail
echo "PWD:" && pwd
echo "== Registry ==" && { head -n 50 capsules/registry.md || echo "missing registry.md"; } && echo
echo "== ESB ==" && { head -n 20 state/esb.hex || echo "missing esb.hex"; } && echo
echo "== Seeds (first 5 lines) =="
for f in heirloom-seeds/*.txt; do echo "--- $f ---"; head -n 5 "$f"; echo; done
echo "== Runways (names only) ==" && ls -1 runways/*.md || true
echo "✅ Smoke test finished."

