#!/bin/zsh
# 公開用の一式（ページ・動画の小分け・表紙）を OUT に作る。動画は Pages の1ファイル25MBの上限を超えるので、
# 数秒ずつに分けて（HLS）流す。元の mp4 は変えない。
set -euo pipefail
cd "$(dirname "$0")"
SRC="${SRC:-$HOME/Documents/ClaudeVault/00_Projects/h3-10min-koro/out/コロと四角い空.mp4}"
OUT="${OUT:-$HOME/Library/Caches/koro-deploy/dist}"
SITE_URL="${SITE_URL:-https://koro-sikakui-sora.pages.dev}"

mkdir -p "$OUT/video"
ffmpeg -v error -y -i "$SRC" -c copy -f hls -hls_time 6 -hls_playlist_type vod \
  -hls_segment_filename "$OUT/video/seg_%03d.ts" "$OUT/video/index.m3u8"
ffmpeg -v error -y -ss 25 -i "$SRC" -frames:v 1 -q:v 3 "$OUT/poster.jpg"
ffmpeg -v error -y -ss 25 -i "$SRC" -frames:v 1 -vf "scale=1200:-2,crop=1200:630" -q:v 3 "$OUT/og.jpg"
sed "s#__SITE_URL__#$SITE_URL#g" index.html > "$OUT/index.html"
cp _headers "$OUT/_headers"
echo "built: $OUT ($(ls "$OUT/video" | wc -l | tr -d ' ') files in video/)"
