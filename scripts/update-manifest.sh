#!/bin/bash
echo "# CAPSULE MANIFEST" > ../MANIFEST.md
for cap in $(ls ../capsules); do
  echo "- $cap" >> ../MANIFEST.md
done
