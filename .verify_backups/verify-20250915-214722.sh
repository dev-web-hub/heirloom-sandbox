# verify.sh – full version with Git check
#!/usr/bin/env bash
set -euo pipefail

echo "🔍 Verifying Heirloom Sandbox structure + keys"
echo "--------------------------------------------"

# Define capsule list
capsules=(MOTHER MOTHER_CLONE SOCIALS ADS SCRIPT ANALYTICS AUTOM8 BOOK COMMUNITY COURSE MENTOR PIPELINE)

# Check .env file
if [[ ! -f .env ]]; then
  echo "❌ .env file not found"
  exit 1
fi

# Load .env into environment (safe, no export)
set -a
source .env
set +a

missing_keys=0
missing_dirs=0

# Loop capsules
for c in "${capsules[@]}"; do
  echo "→ Checking $c"

  # 1) API key
  var="OPENAI_API_KEY_${c}"
  val="${!var:-}"
  if [[ -z "$val" ]]; then
    echo "   ❌ Missing $var in .env"
    ((missing_keys++))
  else
    echo "   ✅ $var present"
  fi

  # 2) Capsule folder
  if [[ ! -d "capsules/$c" ]]; then
    echo "   ❌ capsules/$c folder missing"
    ((missing_dirs++))
  else
    echo "   ✅ capsules/$c exists"
  fi

  # 3) Seed + runway
  if [[ ! -f "heirloom-seeds/${c}-seed.txt" ]]; then
    echo "   ❌ heirloom-seeds/${c}-seed.txt missing"
    ((missing_dirs++))
  else
    echo "   ✅ seed present"
  fi
  if [[ ! -f "runways/${c}-runway.md" ]]; then
    echo "   ❌ runways/${c}-runway.md missing"
    ((missing_dirs++))
  else
    echo "   ✅ runway present"
  fi
done

echo "--------------------------------------------"
echo "📊 Summary:"
echo "   Missing keys: $missing_keys"
echo "   Missing dirs/files: $missing_dirs"

if [[ $missing_keys -eq 0 && $missing_dirs -eq 0 ]]; then
  echo "🎉 Structure OK"
else
  echo "⚠️  Some items missing — fix before proceeding."
fi

echo "--------------------------------------------"
echo "🔍 Checking Git status"
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git_status=$(git status --short)
  branch_info=$(git rev-parse --abbrev-ref HEAD)
  remote_info=$(git status -sb)

  if [[ -z "$git_status" ]]; then
    echo "✅ Working tree clean"
  else
    echo "⚠️  Uncommitted changes:"
    echo "$git_status"
  fi

  echo "📌 Branch: $branch_info"
  echo "🌐 Remote sync: $remote_info"
else
  echo "❌ Not inside a Git repo"
fi
