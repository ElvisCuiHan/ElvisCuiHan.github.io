'use strict';
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const source = fs.readFileSync(path.join(__dirname, '../assets/js/academic-style.js'), 'utf8');
function fixture({stored = {}, blocked = false, missing = false} = {}) {
  const storage = {...stored};
  const root = {dataset:{}};
  const events = {};
  const control = {hidden:true};
  const select = {value:'ink', addEventListener:(name, fn) => events[name] = fn};
  const context = {
    document:{documentElement:root,
      querySelector:selector => missing ? null : selector === '#visual-style' ? select : control,
      addEventListener:(name, fn) => events[name] = fn},
    localStorage:{getItem:key => {if(blocked) throw Error('blocked'); return storage[key] || null;},
      setItem:(key, value) => {if(blocked) throw Error('blocked'); storage[key] = value;}}
  };
  vm.runInNewContext(source, context);
  const early = {...root.dataset};
  events.DOMContentLoaded();
  return {root, control, select, early, storage, change:value=>{select.value=value;events.change();}};
}
const modes = {
  ink:{appearance:'ink',style:'ink',theme:'light'},
  day:{appearance:'day',style:'minimal',theme:'light'},
  night:{appearance:'night',style:'minimal',theme:'dark'}
};
const fresh = fixture();
assert.deepEqual(fresh.early, modes.ink);
assert.equal(fresh.control.hidden, false);
for(const mode of ['day','night','ink']) {
  fresh.change(mode);
  assert.deepEqual(fresh.root.dataset, modes[mode]);
  assert.equal(fresh.storage['elvis-appearance'],mode);
  const restored = fixture({stored:fresh.storage});
  assert.deepEqual(restored.early, modes[mode]);
  assert.equal(restored.select.value,mode);
}
assert.deepEqual(fixture({stored:{'elvis-color-theme':'dark'}}).early,modes.night);
assert.deepEqual(fixture({stored:{'elvis-visual-style':'minimal','elvis-color-theme':'light'}}).early,modes.day);
assert.deepEqual(fixture({stored:{'elvis-appearance':'day','elvis-color-theme':'dark'}}).early,modes.day);
const blocked = fixture({blocked:true});
blocked.change('night');
assert.deepEqual(blocked.root.dataset,modes.night);
const invalid = fixture({stored:{'elvis-appearance':'unknown'}});
assert.deepEqual(invalid.early,modes.ink);
invalid.change('unknown');
assert.deepEqual(invalid.root.dataset,modes.ink);
assert.deepEqual(fixture({missing:true}).early,modes.ink);
console.log('Appearance checks passed: Ink/Day/Night, pre-paint defaults, persistence, legacy migration, invalid values, blocked storage, missing controls.');
