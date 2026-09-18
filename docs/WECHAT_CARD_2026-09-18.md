# WeChat account card — 2026-09-18

The author asked to improve the “让统计再次伟大” section and obtain the real
account logo/avatar. The public article URL returned a verification page; no
verification or access restriction was bypassed. An older local creator
dashboard screenshot was unsuitable for publication and was **not copied**
into the project or generated site.

The author then supplied a public-facing profile screenshot:
`codex-clipboard-79e6e506-c4d3-408b-99a3-fd3628ae8ab4.png`, 842 × 274 px.
It shows the account name, its avatar and public introduction, not the private
creator dashboard. This unchanged image is stored as
`assets/images/wechat-account-profile.png`.

The website uses a CSS viewport to show only the original circular avatar:
x=29, y=38, width=128, height=128 source pixels. The delivered source file is
unchanged; no generative reconstruction, raster edit or upscaling was used.
Visible avatar sizes are 90 px desktop, 64/58 px on smaller mobile widths.
If an independent higher-resolution avatar is supplied later, replace the asset
and remove the screenshot-specific viewport rules together.

## Presentation

- Real circular avatar, restrained Songti Chinese account name, a small
  WeChat/公众号 label, and an English paraphrase of the supplied introduction.
- Light paper-like panel in Ink & Paper/Day and theme-adaptive colors in Night.
- Copy name: writes only the exact account name “让统计再次伟大” when clicked.
  It does not read the clipboard. An accessible live status announces success
  or suggests manual copying if clipboard permission is denied. The button
  remains hidden when the API is unavailable; search instructions remain.
- Read an essay: the author's previously supplied
  https://mp.weixin.qq.com/s/hAIXft_2gpk3P9Mvs0X_RQ link. No profile link,
  account identifier or QR code was invented.

## Verification

- Jekyll build and site checks passed: 10 main pages, 287 local links/assets.
- Copy-button logic checks passed: exact value, disabled state during copying,
  success status, denied permission, absent clipboard API, and unrelated pages.
- Existing three-mode appearance checks and `git diff --check` passed.
- Public source dimensions and avatar coordinates checked against the supplied
  image. No private screenshot was included in deployable assets.
- Browser-control connection timed out. Current desktop/mobile page screenshots,
  actual clipboard interaction and keyboard visual acceptance remain pending;
  passing unit/build checks is not a completed visual review.
- Local preview only. No push or deployment.
