#!/usr/bin/env bash
set -euo pipefail

capsules=(MOTHER MOTHER_CLONE SOCIALS ADS SCRIPT ANALYTICS AUTOM8 BOOK COMMUNITY COURSE MENTOR PIPELINE)

echo "🔍 Verifying capsule structure..."
for c in "${capsules[@]}"; do
  echo -n "$c: "
  ok=true

  # Check dirs + files
  [[ -d "capsules/$c" ]] || { echo "❌ missing capsules/$c"; ok=false; }
  [[ -f "heirloom-seeds/${c}-seed.txt" ]] || { echo "❌ missing heirloom-seeds/${c}-seed.txt"; ok=false; }
  [[ -f "runways/${c}-runway.md" ]] || { echo "❌ missing runways/${c}-runway.md"; ok=false; }

  if [ "$ok" = true ]; then
    echo "✅ OK"
  fi
done

