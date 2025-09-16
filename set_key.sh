#!/usr/bin/env bash
# Usage: ./set_key.sh CAPSULE_NAME API_KEY
# Example: ./set_key.sh MOTHER sk-123abc

set -euo pipefail

CAPSULE="$1"
KEY="$2"
ENV_FILE="capsules/${CAPSULE}/.env"

mkdir -p "capsules/${CAPSULE}"
touch "$ENV_FILE"

# Overwrite or append OPENAI_API_KEY line
grep -v '^OPENAI_API_KEY=' "$ENV_FILE" 2>/dev/null > "${ENV_FILE}.tmp" || true
echo "OPENAI_API_KEY=${KEY}" >> "${ENV_FILE}.tmp"
mv "${ENV_FILE}.tmp" "$ENV_FILE"

echo "✅ Key set for $CAPSULE in $ENV_FILE"
