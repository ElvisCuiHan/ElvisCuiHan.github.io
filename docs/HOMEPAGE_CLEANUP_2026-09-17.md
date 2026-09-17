# Homepage cleanup and landscape visibility

## Request and changes

- Remove the Writing, Translations and Mentors modules from the homepage only.
  Retain Writing and Mentors in navigation; Translations is accessible through
  Writing. All 11 translation entries and seven mentor recollections remain.
- No change to the three appearance choices or to the deferred friend boundary.
- Support `?appearance=ink`, `?appearance=day`, and `?appearance=night` as explicit
  appearance links. Valid parameters override old saved preferences and save the
  new choice. Menu changes update an existing parameter without reloading.
  Unknown parameters are ignored. No arbitrary CSS or URL is interpreted.
- Move the decorative backdrop from a negative stacking level to level 0, with
  content at 1 and the header above it. This avoids depending on negative-layer
  painting behavior.
- On narrow screens, fit the complete landscape to the viewport width instead
  of cropping a landscape image to portrait height. The reading overlay stays.

## Findings

The production JPEG was present and byte-for-byte identical to the local asset:
SHA256 `b2225e7356f95d644cd9ef34ebe5a4ee382998ac58b3c20da25b0b7722141b96`.
The published stylesheet referenced that same asset.

Day/Night intentionally hide the landscape, including when restored from an old
saved preference. The previous mobile `auto 100%` background sizing also cropped
away much of the side artwork. The user's exact selected browser mode was not
observed, so no claim is made that a specific preference caused their report.

## Verification

- Jekyll build passed; site checks: 11 routes, 261 local links/assets.
- Appearance unit tests passed, including explicit-link precedence, persistence,
  query update after selection, invalid values and blocked local storage.
- Browser screenshots reviewed at 1440 × 1000 and 390 × 844: the landscape is
  visible, the body remains readable, and the removed modules are absent.
- Measured no horizontal overflow at desktop and mobile widths.
- Selected Day from an explicit Ink link and refreshed: Day remained selected
  and the landscape was hidden. Opening `?appearance=ink` restored the landscape.
- Followed actual navigation to Writing, Translations (11 entries), Mentors
  (7 entries), and back to About. Content was not deleted.
- No full cross-browser or screen-reader audit; no new image generation/editing.
