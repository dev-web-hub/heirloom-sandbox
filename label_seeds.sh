#!/bin/zsh
set -euo pipefail

typeset -A labels
labels=(
  MOTHER "MOTHER Orchestrator"
  MOTHER_CLONE "MOTHER_CLONE Orchestrator v2"
  SOCIALS "SOCIALS API Harvest"
  ADS "ADS Funnel Creative"
  SCRIPT "SCRIPT Newsletter Builder"
  ANALYTICS "ANALYTICS Tracking"
  AUTOM8 "AUTOM8 CI/CD Hub"
  BOOK "BOOK Productization"
  COMMUNITY "COMMUNITY Growth"
  COURSE "COURSE Curriculum"
  MENTOR "MENTOR Mentorship"
  PIPELINE "PIPELINE Sales Flow"
)

for c in ${(k)labels}; do
  seed="heirloom-seeds/${c}-seed.txt"
  if [[ -f "$seed" ]]; then
    tmp=$(mktemp)
    echo "${labels[$c]}" > "$tmp"
    cat "$seed" >> "$tmp"
    mv "$tmp" "$seed"
    echo "✅ Updated $seed"
  else
    echo "⚠️ Missing: $seed"
  fi
done
