#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 CAPSULE_NAME"
  exit 1
fi

CAPSULE=$1

# Directories
mkdir -p capsules/$CAPSULE
mkdir -p heirloom-seeds runways STATE

# Seed + runway stubs
touch heirloom-seeds/${CAPSULE}-seed.txt
touch runways/${CAPSULE}-runway.md

# Add to STATE/registry.md if not already listed
if ! grep -q "^- \[.\] $CAPSULE" STATE/registry.md 2>/dev/null; then
  echo "- [x] $CAPSULE — seeded, runway added" >> STATE/registry.md
fi

echo "✅ Capsule $CAPSULE bootstrapped."
