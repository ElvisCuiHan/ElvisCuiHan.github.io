/* Three explicit appearances. Runs before CSS to prevent a preference flash. */
(function () {
  'use strict';
  var root = document.documentElement;
  var key = 'elvis-appearance';
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
    var control = document.querySelector('.style-control');
    var select = document.querySelector('#visual-style');
    if (!control || !select) return;
    select.value = preference;
    control.hidden = false;
    select.addEventListener('change', function () {
      if (!valid(select.value)) return;
      preference = select.value;
      apply(preference);
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
