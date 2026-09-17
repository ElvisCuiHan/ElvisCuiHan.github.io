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
  function apply(value) {
    root.dataset.appearance = value;
    root.dataset.style = value === 'ink' ? 'ink' : 'minimal';
    root.dataset.theme = value === 'night' ? 'dark' : 'light';
  }
  apply(preference);
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
    });
  });
}());
