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

## Second pass — newspaper / magazine direction

The owner subsequently supplied `https://eliuvish.goatcounter.com/` and requested
a more distinctive journalism-inspired design. The integration is now enabled
for `eliuvish`; an unauthenticated dashboard request was verified to redirect
to login. The private dashboard's live counts still require owner login to view.

Design changes: locally hosted Libre Caslon Display (SIL OFL bundled), a large
name masthead, typographic rules, the existing full-color illustrated portrait,
a lead scGTM article and two secondary publication columns.
No new biographical claims or images were generated. Original image files,
publication metadata and the three appearance modes are unchanged.

The owner requested color rather than monochrome; the portrait retains its
original colors without a grayscale filter. Editorial hierarchy is typographic,
not dependent on black-and-white imagery.

QA: 14 routes / 448 local links and assets; enabled analytics destination checked
on every primary route. Browser review at 320px, 390px, 768px and desktop width;
no horizontal overflow or publication-column overlap. The local page contains
the configured loader but never loads the remote counter, as intended.

Typography source: [Google Fonts Libre Caslon Display](https://github.com/google/fonts/tree/main/ofl/librecaslondisplay).
Editorial reference: [The New Yorker magazine index](https://www.newyorker.com/magazine),
for hierarchy and article pacing only; no articles, images or brand assets copied.
