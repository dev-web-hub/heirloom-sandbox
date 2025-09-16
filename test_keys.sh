#!/bin/bash
# test_keys.sh — verify each capsule’s OPENAI_API_KEY_* works
# Usage: ./test_keys.sh

set -e

# Load env vars
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "❌ No .env file found. Run from ~/heirloom-sandbox with .env present."
  exit 1
fi

# List of capsules
CAPSULES=(
  MOTHER
  SOCIALS
  ADS
  SCRIPT
  ANALYTICS
  AUTOM8
  BOOK
  COMMUNITY
  COURSE
  MENTOR
  PIPELINE
  MOTHER_CLONE
)

echo "🔑 Testing OpenAI API keys for all capsules..."

for CAP in "${CAPSULES[@]}"; do
  KEY_VAR="OPENAI_API_KEY_${CAP}"
  KEY_VAL="${!KEY_VAR}"

  if [ -z "$KEY_VAL" ]; then
    echo "⚠️  $CAP → no key found in .env"
    continue
  fi

  echo -n "→ $CAP: "
  RESPONSE=$(curl -s https://api.openai.com/v1/models \
    -H "Authorization: Bearer $KEY_VAL" \
    -H "Content-Type: application/json" \
    | grep -o '"id":' | head -n 1)

  if [ -n "$RESPONSE" ]; then
    echo "✅ key works"
  else
    echo "❌ key failed"
  fi
done
