# Author-selected research banner · 2026-09-19

## Scope and authorization

The author supplied the landscape banner and explicitly requested integrating
it and pushing to the existing personal website. Destination remains
ElvisCuiHan/ElvisCuiHan.github.io, `master`, GitHub Pages. No hosting or permissions
change; no unrelated bibliography, research-status or translation edits.

The 2073 × 758 PNG is copied byte-for-byte from the supplied attachment,
`codex-clipboard-df2b5af7-710a-446c-916f-a49f4e64f7c9.png`, to
`assets/images/research-landscape-banner.png`.
SHA-256: `8105babf4a135374abf613e28367c8f111c3adf469448e954d65c414ef987a43`.
No generation, retouching, relabeling, or derived raster files. The scene is
captioned as a conceptual research landscape, not a campus photograph or an
experimental result. Embedded scales are part of the supplied illustration,
not newly asserted measurements or data.

## Integration

- Full, uncropped banner at widths of 1100px and above, capped at 1400px.
- Two native, keyboard-accessible links cover the painted Research / Publications
  controls. Research targets the focusable homepage research heading;
  Publications opens the existing full bibliography. Targets are at least 44px
  high, with visible hover/focus treatment; no JavaScript image-map dependency.
- Below 1100px, real HTML identity/subtitle/motto and 46px-high link-buttons
  accompany a CSS viewport on the scientific illustration. This avoids shrunken
  raster text and tiny hit targets. A full-artwork link preserves the original.
- One semantic h1 with the English-only display name is retained; desktop text
  is screen-reader available, and the banner has descriptive alternative text.
- Source dimensions reserve layout space; only the hero image has high fetch
  priority. The new stylesheet loads on the homepage only.
- The repeated large navy statement panel is removed from this layout. Its
  scientific introduction is retained above the existing three themes.
- Existing avatar, logo, styling credit, affiliations, three themes, three
  selected publications, WeChat, personal card and appearance switch remain.
- Narrow-screen avatar ornament no longer rotates beyond the viewport edge.
- Print shows the HTML identity and motto without the large raster banner.

## Verification

- Local Jekyll build and site checker pass: 13 routes, 374 local links/assets,
  22 legacy aliases, unchanged bibliography and source/rights checks.
- Added banner regression checks for exact asset hash, image dimensions,
  semantic identity, native destinations, full-artwork link, keyboard target,
  and removal of the duplicate oversized statement.
- Appearance-cycle and WeChat clipboard tests pass; no new JS behavior.
- Browser screenshots inspected at desktop 1280px and 1440px, tablet 820px,
  phone 390px (all three appearances), and narrow phone 320px.
- Research Enter activation moves focus to its heading, below the sticky
  navigation; Publications click opens the correct page.
- No horizontal document overflow at 320, 390, 820, 1099, 1100, 1280 or
  1440px after correcting the avatar ornament. Desktop Tab focus has a visible
  double-contrast outline; native Research activation transfers focus below
  the sticky navigation on desktop and mobile. No full assistive-technology
  audit is claimed.

## Release

Use a normal fast-forward push after checking remote master. Confirm GitHub
Pages build and deployed HTML, stylesheet and image separately from Git push.
Build output, temporary screenshots and the rest of the Downloads archive are
not part of the release.
