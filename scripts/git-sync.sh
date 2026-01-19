#!/bin/bash
# Helper script to sync (pull + push) using PAT token
# Usage: ./git-sync.sh [branch]
# Default branch: main

BRANCH="${1:-main}"

# Navigate to repo root
cd "$(dirname "$0")/.."

echo "🔄 Syncing with GitHub..."
echo ""

# Pull first
./scripts/git-pull.sh "$BRANCH"
PULL_EXIT=$?

if [ $PULL_EXIT -ne 0 ]; then
    echo "❌ Pull failed, aborting push"
    exit $PULL_EXIT
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Then push
./scripts/git-push.sh "$BRANCH"
PUSH_EXIT=$?

if [ $PUSH_EXIT -eq 0 ]; then
    echo ""
    echo "✅ Successfully synced with GitHub!"
else
    echo ""
    echo "❌ Sync incomplete - push failed"
fi

exit $PUSH_EXIT
