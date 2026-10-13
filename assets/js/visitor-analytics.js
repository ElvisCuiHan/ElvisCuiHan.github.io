/* Page counts only. Never run on a preview or send URL query parameters. */
(function () {
  'use strict';
  var code = document.currentScript && document.currentScript.getAttribute('data-site-code');
  if (!code || !/^[a-z0-9][a-z0-9-]{0,60}$/.test(code)) return;
  if (location.protocol !== 'https:' || location.hostname !== 'elviscuihan.github.io') return;
  if (navigator.doNotTrack === '1' || window.doNotTrack === '1' || navigator.globalPrivacyControl) return;
  try { if (localStorage.getItem('elvis-analytics-opt-out') === '1') return; }
  catch (_) { /* Storage availability must not affect navigation. */ }
  var referrer = '';
  try { if (document.referrer) referrer = new URL(document.referrer).origin; } catch (_) {}
  window.goatcounter = {
    path: location.pathname,
    title: document.title,
    referrer: referrer,
    no_events: true
  };
  var script = document.createElement('script');
  script.async = true;
  script.src = 'https://gc.zgo.at/count.js';
  script.dataset.goatcounter = 'https://' + code + '.goatcounter.com/count';
  document.head.appendChild(script);
}());
