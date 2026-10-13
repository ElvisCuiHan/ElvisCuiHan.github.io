# Visitor analytics

GoatCounter integration is installed but **disabled** until the owner supplies a verified dashboard address. No visitor statistics are available yet.

## Activate

1. The owner creates and verifies a GoatCounter account for `https://elviscuihan.github.io/`.
2. Keep the statistics dashboard private. Do not enable individual pageview storage.
3. Confirm the dashboard's public site code (the subdomain before `.goatcounter.com`). No API token, password, or email verification code belongs in this repository.
4. Set `analytics.goatcounter_code` to that code and `analytics.enabled` to `true` in `_config.yml`.
5. Build, run the checks below, and publish to the existing GitHub Pages branch.
6. Visit one production page, then verify the count in the authenticated dashboard. Visits from a browser with Do Not Track / Global Privacy Control are intentionally excluded.

## Collection boundaries

- Only HTTPS on the exact `elviscuihan.github.io` hostname; local previews never count.
- Page paths omit query strings and fragments. Referrers are reduced to their origin.
- No click tracking, identities, or additional fingerprinting.
- Respect Do Not Track, Global Privacy Control, and a local `elvis-analytics-opt-out` value of `1`.
- The privacy page reflects the enabled/disabled configuration automatically.
- This does not identify visitors by name and cannot reconstruct visits before activation.

## Checks

`node scripts/check-analytics.cjs` tests the local loader without making network requests. `ruby scripts/check-site.rb _site-preview` checks the built pages and links. The final dashboard check requires the owner's account.

References: [GoatCounter setup](https://www.goatcounter.com/help/start), [JavaScript options](https://www.goatcounter.com/help/js), [privacy](https://www.goatcounter.com/help/privacy).
