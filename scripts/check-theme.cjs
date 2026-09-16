'use strict';
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const source = fs.readFileSync(path.join(__dirname, '../assets/js/academic-theme.js'), 'utf8');

function fixture({ stored = null, dark = false, blocked = false, legacy = false } = {}) {
  const listeners = {};
  const attributes = {};
  const root = { dataset: {} };
  const button = { hidden: true, setAttribute: (k, v) => attributes[k] = v,
    addEventListener: (name, fn) => listeners[name] = fn };
  let saved = stored;
  let systemChange;
  const media = { matches: dark };
  media[legacy ? 'addListener' : 'addEventListener'] =
    legacy ? fn => systemChange = fn : (_, fn) => systemChange = fn;
  const context = { window: { matchMedia: () => media },
    document: { documentElement: root, querySelector: () => button,
      addEventListener: (name, fn) => listeners[name] = fn },
    localStorage: {
      getItem: () => { if (blocked) throw Error('blocked'); return saved; },
      setItem: (_, value) => { if (blocked) throw Error('blocked'); saved = value; }
    }
  };
  vm.runInNewContext(source, context);
  listeners.DOMContentLoaded();
  return { root, button, attributes, click: () => listeners.click(),
    system: value => systemChange({ matches: value }), saved: () => saved };
}
for (const legacy of [false, true]) {
  const f = fixture({ legacy });
  assert.equal(f.root.dataset.theme, 'light');
  assert.equal(f.button.hidden, false);
  f.system(true);
  assert.equal(f.root.dataset.theme, 'dark');
  f.click();
  assert.equal(f.saved(), 'light');
  assert.equal(f.attributes['aria-label'], 'Switch to dark theme');
  f.system(true);
  assert.equal(f.root.dataset.theme, 'light');
}
const saved = fixture({ stored: 'dark' });
assert.equal(saved.root.dataset.theme, 'dark');
assert.equal(saved.attributes['aria-pressed'], 'true');
saved.click();
assert.equal(saved.root.dataset.theme, 'light');
const blocked = fixture({ blocked: true, dark: true });
blocked.click();
assert.equal(blocked.root.dataset.theme, 'light');
const invalid = fixture({ stored: 'invalid', dark: false });
assert.equal(invalid.root.dataset.theme, 'light');
console.log('Theme checks passed: default, saved preference, toggle, system changes, blocked storage, accessible labels, legacy listener.');
