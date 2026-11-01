#!/bin/zsh
# build.sh で作った一式を Cloudflare Pages（koro-sikakui-sora）に出す。会社のアカウントの wrangler ログインが要る。
set -euo pipefail
OUT="${OUT:-$HOME/Library/Caches/koro-deploy/dist}"
npx -y wrangler@4.151.3 pages deploy "$OUT" --project-name koro-sikakui-sora --branch main --commit-dirty=true
