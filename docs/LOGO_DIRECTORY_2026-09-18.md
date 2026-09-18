# Personal mark, link directory and compact publications

## Author request and scope

Install the previously selected option-5 personal logo; move the seven
education/work-history links from About to External Links; use a compact
logo/name grid resembling the author's supplied reference. Keep only one
sentence thanking Yating Zou on About. Make the homepage publication list more
like the compact scholarly list at https://faculty.stat.ucla.edu/arashamini/.
Local preview only: no push, deployment or change of access permissions.

## Personal logo — published phoenix selection

The subsequently confirmed landscape/seal/bamboo family is documented in
`LOGO_FAMILY_2026-09-18.md`. It is a local follow-up, not yet published.

- Author supplied and selected the green phoenix / open-book emblem on 2026-09-18.
- Source: `codex-clipboard-b0b336c3-3a2a-4d50-9ece-f2aa7308fe34.png`.
- Destination: `assets/images/elvis-phoenix-logo.png`, 1254 × 1254.
- SHA-256: `e1ca8e86e17596ff1e433a70c65d9246f51f70b9e8ba60e6dd71dc07a6a04085`.
- The attachment is copied byte-for-byte, without crop, regeneration or recoloring.
  CSS displays a 68px square in the shared desktop header and 56px on mobile,
  alongside the readable name “Elvis Han Cui / 崔涵”. The home link retains its
  accessible name. The favicon now uses the same author-selected image.
- The paper-colored image background is preserved in all three appearances.
- Local preview only; no push or deployment. The older logo asset is preserved.

## Previous personal logo (superseded)

- Unchanged user attachment: `codex-clipboard-7cf213c5-3e64-47ca-82a3-d21b97706065.png`.
- Destination: `assets/images/elvis-calligraphy-logo.png`.
- SHA-256: `218002738123dbeb7e801f7a9259b7a84b90c1716532d2b0e106f43ad67afeb1`.
- Rendered in the shared header as a linked image, with an accessible author
  name and homepage destination. Original proportions, colors and background
  are retained in all three themes; no image generation, crop or recoloring.

## Institutional images

Six images were copied unchanged from the existing Qian Lab project's
`current/static/` directory. The source project and UNC-UCLA were not modified.
The source's `docs/ASSET_SOURCES.md` was read before copying. These are
identification marks, not an assertion of sponsorship, affiliation beyond
the user's stated personal history, or an open-content license.

| Local file under assets/images/institutions | Recorded source | Status |
| --- | --- | --- |
| zju.png | Qian Lab static/universities; originally the existing SMARTWorks emblem | Original download provenance unrecorded; local preview only, public-use review pending |
| ucla.png | Qian Lab static/universities; originally the existing SMARTWorks seal | Original download provenance unrecorded; local preview only, public-use review pending |
| uci.png | https://brand.uci.edu/logos/_img/ucirvine-blue.png | Existing unchanged official image; institution retains rights |
| westlake-university-logo-color.png | https://en.westlake.edu.cn/images/header_icon_color.png | Existing unchanged official image; institution retains rights |
| hengrui.png | https://www.hengrui.com/images/logo.png | Existing unchanged official image; public-use permission unverified |
| iqvia.svg | https://www.iqvia.com/-/media/iqvia/iqvia_lg_hrz_rgb.svg | Existing unchanged static SVG; no script/external references found |

Earlier revision: Huadong had a plain typographic name, **not a fabricated corporate logo**.
Its official homepage could not be reliably read with the web tool (403).
This fallback is superseded by the official header asset below.

No institutions from the reference image were added beyond the author's seven
existing entries. The initial IQVIA / Kuntuo combined mark is superseded by
Kuntuo's own official mark and destination below. The directory describes personal
history and expressly disclaims institutional partnership or endorsement.

## Publications and acknowledgement

- Homepage: four single-column entries with venue/year marker, complete
  verified title/authors/venue, existing resource links, and optional Overview
  disclosures using the pre-existing editorial descriptions.
- No new article metadata, abstract or downloadable paper was invented.
  The full 28-record bibliography is unchanged.
- Yating: one linked sentence on About. The previous extended gratitude text
  is no longer rendered on External Links.
- The former `/friends/` route remains stable and is labeled External Links.

## Verification and limits

- Jekyll build passed; HTTP 200 from the existing loopback preview.
- Site checker passed: 10 pages, 285 local links/assets, four metadata-checked
  selected papers, seven directory destinations, 22 legacy aliases.
- Three-mode appearance script tests and `git diff --check` passed.
- Responsive rules are implemented for desktop and 390/320 px widths, with
  native keyboard-accessible links and Overview disclosures.
- **New visual/browser acceptance is pending.** Browser access repeatedly
  timed out before any current screenshot or interaction test could run.
  Earlier screenshots in this folder document the prior revision, not this
  revision. No alternate UI-control tool was used to bypass the failure.
- No external push or deployment occurred. Institutional mark permissions must
  be reviewed before a future public release.

## Follow-up: circular links and corrected company marks

- The author asked for clickable circular entries. The large tinted panel is
  replaced by compact white logo circles, with names underneath. Each link
  opens its official destination in a new tab and includes an accessible
  new-tab notice and `noopener noreferrer`. Hover, pressed and keyboard-focus
  states are provided; reduced-motion suppresses movement.
- Desktop circles are 112 px; mobile circles are 88 px (76 px under 370 px).
  Layout wraps from seven entries per row to four, then three on phones.
  Original logos remain contained, not circularly cropped or recolored.
- Huadong: copied the unchanged SVG referenced by the official homepage's
  `a.logo img[alt="华东医药"]`:
  https://web-cn-oss.huadongpharm.com/huadong/uploads/20260318/vFj8ZE4dbOnBPyKV1596Gtpkg2ao03Cs.svg
  into `assets/images/institutions/huadong.svg`. Its official website
  https://www.eastchinapharm.com/ was readable by normal HTTP fetch during this
  follow-up, superseding the earlier web-tool failure. SVG has a 420 × 112
  viewBox and no script or external asset references. A QA raster rendering
  was visually inspected; the deployed source remains the unmodified SVG.
  Inspection showed this is a white/reversed mark. It therefore uses a navy
  circular surface (`logo_surface: navy`), avoiding white-on-white rendering.
- Kuntuo: copied the unchanged color header logo from
  https://www.kuntuo-cro.com/uploads/allimg/20250616/8503b41fdc90be16f80bef2abf9d252a.png
  into `assets/images/institutions/kuntuo.png`. The official homepage
  https://www.kuntuo-cro.com/ lists this as its header's color variant, and
  identifies Kuntuo as an IQVIA company. Visual inspection confirmed the mark
  reads “昆拓 / KUNTUO / an IQVIA company”. The link now leads to Kuntuo's
  website; IQVIA's standalone mark is no longer used as a substitute.
- The two new assets retain their owners' rights; availability on an official
  website is not an open-license claim. This remains an unpublished preview.
- Rebuilt successfully; checks pass for 10 pages, 286 local references,
  all seven logo links, corrected company destinations, and theme switching.
  HTTP 200 from the updated local directory. Browser-control connection again
  timed out, so current-page screenshot, responsive visual and real keyboard/
  click acceptance remain pending. Asset inspection is not page acceptance.
