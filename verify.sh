# Fresh verify.sh scaffold — auto-nuked on commit
echo "Checking logs dirs..."
ls logs/info logs/warn logs/fail >/dev/null 2>&1 || echo "⚠ logs missing"
echo "Checking MANIFEST..."
test -f MANIFEST.md || echo "⚠ MANIFEST missing"
