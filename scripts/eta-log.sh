#!/bin/bash
NOW=$(date +"%Y-%m-%d %H:%M PT")
MSG=$1
echo "$NOW — $MSG" >> ../PROOF.md
