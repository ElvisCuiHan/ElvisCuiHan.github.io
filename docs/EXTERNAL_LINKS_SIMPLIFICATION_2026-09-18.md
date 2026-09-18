# External Links — a single acknowledgement

The author requested a cleaner presentation and only one button thanking
Yating Zou in External Links. This is a local update; no push or deployment.

- Preserved the independent `/friends/` route and “External Links” navigation.
- Page content is now only its heading and one native link styled as a button:
  “Thanks, Yating Zou”, with the short caption “For the website styling”.
- Link destination remains the author-provided https://yatingz205.github.io/.
  It has a visible focus outline, a new-tab accessible notice, and `noopener`.
- Removed the rendered institutional directory, introductory sentence and
  redundant back-link. Institution data, assets and reusable include remain
  in the repository; no source materials are deleted.
- Removed the repeated homepage styling-credit block. Research content, selected
  publication thumbnails, WeChat and the personal card are unchanged.
- Restrained outline styling, serif italic name, modest padding and no animation
  beyond a reduced-motion-aware color transition. Existing three-theme colors
  are reused. No additional JavaScript or external asset request is introduced.

Automated tests now require exactly one page-content link to Yating's site, no
rendered institutional grid and no duplicated homepage acknowledgement.

Jekyll build, 10-page/site-link checks, theme-cycle and clipboard tests pass;
`git diff --check` passes. The served local page contains exactly one content
link and no institutional logos. Browser connection again timed out (10 seconds),
so fresh browser screenshots and live keyboard/three-theme visual checks remain
unverified. Static HTML/CSS checks are not a substitute for visual acceptance.
