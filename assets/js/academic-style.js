/* One-button cycle: Ink & Paper → Day → Night. Applies preferences before CSS. */
(function () {
  'use strict';
  var root = document.documentElement;
  var key = 'elvis-appearance';
  var modes = ['ink', 'day', 'night'];
  var labels = {ink: 'Ink & Paper', day: 'Day', night: 'Night'};
  function valid(value) { return value === 'ink' || value === 'day' || value === 'night'; }
  var preference = 'ink';
  try {
    var saved = localStorage.getItem(key);
    if (valid(saved)) preference = saved;
    else if (localStorage.getItem('elvis-color-theme') === 'dark') preference = 'night';
    else if (localStorage.getItem('elvis-visual-style') === 'minimal') preference = 'day';
  } catch (_) {}
  // A shareable appearance link makes Ink & Paper discoverable even if an old
  // Day/Night preference was saved. Only the three known values are accepted.
  var explicitAppearance = false;
  try {
    var requested = new URL(window.location.href).searchParams.get('appearance');
    if (valid(requested)) {
      preference = requested;
      explicitAppearance = true;
    }
  } catch (_) {}
  function apply(value) {
    root.dataset.appearance = value;
    root.dataset.style = value === 'ink' ? 'ink' : 'minimal';
    root.dataset.theme = value === 'night' ? 'dark' : 'light';
  }
  apply(preference);
  if (explicitAppearance) {
    try { localStorage.setItem(key, preference); } catch (_) {}
  }
  document.addEventListener('DOMContentLoaded', function () {
    var button = document.querySelector('#appearance-toggle');
    if (!button) return;
    function nextMode() { return modes[(modes.indexOf(preference) + 1) % modes.length]; }
    function updateButton() {
      button.dataset.appearance = preference;
      button.setAttribute('aria-label', 'Appearance: ' + labels[preference] + '. Switch to ' + labels[nextMode()] + '.');
      button.title = labels[preference] + ' → ' + labels[nextMode()];
    }
    updateButton();
    button.hidden = false;
    // A native button provides both Enter and Space activation without custom keys.
    button.addEventListener('click', function () {
      preference = nextMode();
      apply(preference);
      updateButton();
      try { localStorage.setItem(key, preference); } catch (_) {}
      try {
        var url = new URL(window.location.href);
        if (url.searchParams.has('appearance')) {
          url.searchParams.set('appearance', preference);
          window.history.replaceState(window.history.state, '', url.href);
        }
      } catch (_) {}
    });
  });
}());
