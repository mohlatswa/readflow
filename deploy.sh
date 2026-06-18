#!/usr/bin/env bash
# ReadFlow one-command publish.
# Usage:  ./deploy.sh "optional commit message"
# Commits any changes to index.html and pushes them live to
# https://mohlatswa.github.io/readflow/  (refreshes within ~1 min).
set -e
cd "$(dirname "$0")"

msg="${1:-update ReadFlow}"

if [ -z "$(git status --porcelain)" ]; then
  echo "No changes to publish — site is already up to date."
  exit 0
fi

git add -A
git -c commit.gpgsign=false commit -m "$msg"
git push
echo ""
echo "Pushed. Live in ~1 min at: https://mohlatswa.github.io/readflow/"
