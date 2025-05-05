#!/usr/bin/env bash
cd "$(dirname "$0")"

git add -A
git commit -m "auto: changes at $(date '+%Y-%m-%d %H:%M:%S')" --allow-empty

# Push to remote (assumes origin/master is set up)
git push origin master