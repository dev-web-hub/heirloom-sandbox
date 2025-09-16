#!/usr/bin/env bash
set -euo pipefail
echo "== Repair =="
# folders
for d in capsules heirloom-seeds runways state .github/workflows; do
  [[ -d "$d" ]] || { echo "create $d"; mkdir -p "$d"; }
done
# registry
[[ -f capsules/registry.md ]] || cat > capsules/registry.md <<'EOF'
# Capsule Registry · Heirloom Seed Map
(placeholder; reinsert full registry later)
EOF
# esb
[[ -f state/esb.hex ]] || cat > state/esb.hex <<'EOF'
A1 0004 7632
A2 0001 01
A3 000C 0104 0201 0301 0401 0500 0600 0700 0800 0900 0A00 0B00 0C00
A4 0002 0000
A5 0008 5455 452F 5448 55
A6 0020 7B1F2A8E5C4D9A11C0FFEECCBBAA99887766554433221100
AF 0001 00
EOF
# reseed stubs
for n in SCRIPT ADS SOCIALS ANALYTICS AUTOM8 BOOK COMMUNITY COURSE MENTOR PIPELINE; do
  [[ -f "heirloom-seeds/${n}-seed.txt" ]] || echo "# ${n} seed stub" > "heirloom-seeds/${n}-seed.txt"
  [[ -f "runways/${n}-runway.md"      ]] || echo "# ${n} runway stub" > "runways/${n}-runway.md"
done
echo "== Repair done =="

