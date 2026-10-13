---
layout: archive
title: "Privacy"
permalink: /privacy/
excerpt: "How this personal website handles visitor information."
---

<div class="privacy-page" markdown="1">
{% if site.analytics.enabled == true and site.analytics.goatcounter_code != '' %}
This site uses [GoatCounter](https://www.goatcounter.com/) to understand which pages people read. The statistics describe visits, not the names or identities of visitors.

The page address and title, referring website, and basic browser and screen information are sent to GoatCounter. This site's integration removes query strings and fragments from page addresses and sends only the referring site's origin. It does not track link clicks. GoatCounter derives approximate location and visit counts from requests; it does not store IP addresses or place tracking cookies. See [GoatCounter's privacy details](https://www.goatcounter.com/help/privacy).

The counter is not loaded when your browser sends Do Not Track or Global Privacy Control. Local previews are never counted.
{% else %}
Visitor analytics are not currently enabled. No GoatCounter tracking script is loaded.
{% endif %}

## Other browser data

Your appearance choice (Ink & Paper, Day or Night) is saved in your browser. It is not sent to an analytics service. GitHub Pages hosts this site and handles requests under [GitHub's privacy statement](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement).

Links to other websites follow those websites' privacy policies.
</div>
