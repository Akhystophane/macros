#!/bin/bash
# Auto-pull script for macros server branch

REPO_DIR="/home/injector/.local/share/DaVinciResolve/Fusion/Macros/minimalist-style"
BRANCH="server"
LOG_FILE="/home/injector/logs/macros-auto-pull.log"

cd "$REPO_DIR" || exit 1

# Fetch latest from remote
git fetch origin "$BRANCH" 2>/dev/null

# Check if local is behind remote
LOCAL=$(git rev-parse "$BRANCH")
REMOTE=$(git rev-parse "origin/$BRANCH")

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Changes detected, pulling..." >> "$LOG_FILE"
    git pull origin "$BRANCH" >> "$LOG_FILE" 2>&1
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Pull complete" >> "$LOG_FILE"
fi
