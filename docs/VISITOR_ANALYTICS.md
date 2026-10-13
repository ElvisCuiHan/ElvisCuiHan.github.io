# Visitor analytics

GoatCounter is enabled for **eliuvish**, the site code confirmed by the owner on October 13, 2026. Dashboard: https://eliuvish.goatcounter.com/. An unauthenticated request redirects to login; the dashboard is not public. Statistics begin after the enabled configuration is deployed; earlier visits cannot be recovered.

## Configuration and verification

1. The owner supplied `https://eliuvish.goatcounter.com/` after completing registration.
2. Keep the statistics dashboard private. Individual pageview storage is not required.
3. No API token, password, or email verification code belongs in this repository.
4. `_config.yml` uses `analytics.goatcounter_code: "eliuvish"` and `analytics.enabled: true`. Set `enabled: false` to disable it without removing the integration.
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
