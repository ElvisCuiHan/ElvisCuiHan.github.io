/* Dependency-free theme preference; works when local storage is unavailable. */
(function () {
  'use strict';
  var root = document.documentElement;
  var preference = null;
  var system = window.matchMedia('(prefers-color-scheme: dark)');
  try { preference = localStorage.getItem('elvis-color-theme'); } catch (_) {}
  if (preference !== 'dark' && preference !== 'light') preference = null;
  function apply(theme) {
    root.dataset.theme = theme;
    var button = document.querySelector('.theme-toggle');
    if (button) {
      button.hidden = false;
      button.setAttribute('aria-pressed', String(theme === 'dark'));
      button.setAttribute('aria-label', 'Switch to ' + (theme === 'dark' ? 'light' : 'dark') + ' theme');
    }
  }
  apply(preference || (system.matches ? 'dark' : 'light'));
  document.addEventListener('DOMContentLoaded', function () {
    apply(root.dataset.theme);
    var button = document.querySelector('.theme-toggle');
    if (!button) return;
    button.addEventListener('click', function () {
      preference = root.dataset.theme === 'dark' ? 'light' : 'dark';
      apply(preference);
      try { localStorage.setItem('elvis-color-theme', preference); } catch (_) {}
    });
  });
  function followSystem(event) { if (!preference) apply(event.matches ? 'dark' : 'light'); }
  if (system.addEventListener) system.addEventListener('change', followSystem);
  else if (system.addListener) system.addListener(followSystem);
}());
