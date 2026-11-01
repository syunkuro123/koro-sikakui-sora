# コロと四角い空 — 公開ページ

MiniMax H3 で作った10分の短編アニメ「コロと四角い空」を見るためのページ。

- 公開先：https://koro-sikakui-sora.pages.dev/ （Cloudflare Pages・会社のアカウント・プロジェクト名 `koro-sikakui-sora`）
- 動画：元の mp4（190MB）は Pages の1ファイル25MBの上限を超えるので、`build.sh` で約6〜10秒ずつに分けて（HLS）流す。再生は hls.js（Safari は標準の再生）
- 元の動画はこのリポジトリに入れない（`../out/コロと四角い空.mp4`、ドライブにも同じもの）

## 出し直し

```bash
./build.sh   # ~/Library/Caches/koro-deploy/dist に一式を作る
./deploy.sh  # Cloudflare Pages に出す
```

## 表示の決まり

- 映像に MiniMax H3 を使ったことを書く（ライセンスの表示義務）
- ナレーションは「VOICEVOX:No.7」と書く
