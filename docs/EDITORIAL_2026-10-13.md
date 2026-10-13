# Editorial layout and analytics preparation — October 13, 2026

## Scope

- Short, factual biography and current author-provided affiliation.
- Compact research rows instead of numbered statement cards.
- Preserve scGTM, The Statistical Compass and glucodensity, including previews, author lists, source links and manuscript status.
- Keep the author-selected landscape, avatar, logos and personal card unchanged. The large research illustration and card are collapsed by default.
- Retain the three-mode appearance button and Yating Zou credit; reduce landscape contrast and spacing.
- Add an opt-in GoatCounter loader and a configuration-aware privacy page. Analytics remain disabled pending a confirmed account.

## Validation

- Jekyll 3.10 build, using an isolated gem directory and the available Ruby runtime; no project dependency changes.
- Site checker: 14 routes, 420 local links/assets, 22 legacy redirects.
- Appearance and WeChat behavior tests passed.
- New analytics checks cover the exact production host, disabled state, tracking preferences, query stripping, origin-only referrers and blocked storage.
- Browser review at the normal desktop viewport and 390px mobile width, in Ink & Paper, Day and Night.
- Corrected a legacy 154px thumbnail width that overlapped the new mobile publication column; checked all three rows afterward.
- Open/close disclosures, keyboard Enter, image loading and the privacy page verified in the browser. Temporary viewport overrides reset.

No GoatCounter account was created or claimed, and no real telemetry request was sent during testing. Activation and the authenticated dashboard count check still require the owner's verified site address.
