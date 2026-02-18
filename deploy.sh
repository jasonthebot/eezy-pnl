#!/usr/bin/env bash
set -euo pipefail

cd /home/jason/.openclaw/workspace

msg="${*:-update: $(date -u +'%Y-%m-%d %H:%M UTC')}"

# Stage everything
git add .

# Exit fast if no changes
if git diff --cached --quiet; then
  echo "No changes to deploy."
  exit 0
fi

git commit -m "$msg"
git push

echo "✅ Pushed. Vercel will auto-deploy in ~10-60 seconds."
