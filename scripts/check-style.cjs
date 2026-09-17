'use strict';
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const source = fs.readFileSync(path.join(__dirname, '../assets/js/academic-style.js'), 'utf8');
function fixture({stored = {}, blocked = false, missing = false, url = 'https://elviscuihan.github.io/'} = {}) {
  const storage = {...stored};
  const root = {dataset:{}};
  const events = {};
  const control = {hidden:true};
  const select = {value:'ink', addEventListener:(name, fn) => events[name] = fn};
  const location = {href:url};
  const context = {
    URL,
    window:{location,history:{state:null,replaceState:(_, __, href)=>{location.href=href;}}},
    document:{documentElement:root,
      querySelector:selector => missing ? null : selector === '#visual-style' ? select : control,
      addEventListener:(name, fn) => events[name] = fn},
    localStorage:{getItem:key => {if(blocked) throw Error('blocked'); return storage[key] || null;},
      setItem:(key, value) => {if(blocked) throw Error('blocked'); storage[key] = value;}}
  };
  vm.runInNewContext(source, context);
  const early = {...root.dataset};
  events.DOMContentLoaded();
  return {root, control, select, early, storage, location, change:value=>{select.value=value;events.change();}};
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
const explicit = fixture({stored:{'elvis-appearance':'night'},url:'https://elviscuihan.github.io/?appearance=ink#main'});
assert.deepEqual(explicit.early,modes.ink);
assert.equal(explicit.storage['elvis-appearance'],'ink');
explicit.change('day');
assert.equal(explicit.location.href,'https://elviscuihan.github.io/?appearance=day#main');
assert.deepEqual(fixture({stored:explicit.storage,url:explicit.location.href}).early,modes.day);
assert.deepEqual(fixture({stored:{'elvis-appearance':'day'},url:'https://elviscuihan.github.io/?appearance=unknown'}).early,modes.day);
assert.deepEqual(fixture({blocked:true,url:'https://elviscuihan.github.io/?appearance=night'}).early,modes.night);
console.log('Appearance checks passed: Ink/Day/Night, pre-paint defaults, persistence, legacy migration, shareable mode links, invalid values, blocked storage, missing controls.');
