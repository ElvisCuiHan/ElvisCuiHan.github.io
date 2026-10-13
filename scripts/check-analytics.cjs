const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const source = fs.readFileSync(path.join(__dirname, '../assets/js/visitor-analytics.js'), 'utf8');
function run(overrides = {}) {
  const added = [];
  const context = {
    URL,
    document: {
      currentScript: {getAttribute: () => 'example-test'},
      title: 'About · Elvis Han Cui',
      referrer: 'https://example.org/private/path?token=secret#fragment',
      head: {appendChild: node => added.push(node)},
      createElement: () => ({dataset: {}})
    },
    location: {protocol: 'https:', hostname: 'elviscuihan.github.io', pathname: '/writing/', search: '?token=secret', hash: '#private'},
    navigator: {}, window: {}, localStorage: {getItem: () => null}
  };
  overrides.edit?.(context);
  vm.runInNewContext(source, context);
  return {added, settings: context.window.goatcounter};
}
let result = run();
assert.equal(result.added.length, 1);
assert.equal(result.added[0].src, 'https://gc.zgo.at/count.js');
assert.equal(result.added[0].dataset.goatcounter, 'https://example-test.goatcounter.com/count');
assert.equal(result.settings.path, '/writing/');
assert.equal(result.settings.referrer, 'https://example.org');
assert.equal(result.settings.no_events, true);
for (const hostname of ['localhost','127.0.0.1','preview.example.org','elviscuihan.github.io.evil.test']) {
  assert.equal(run({edit: c => c.location.hostname = hostname}).added.length, 0);
}
assert.equal(run({edit: c => c.location.protocol = 'http:'}).added.length, 0);
for (const code of ['', null, 'https://someone.goatcounter.com', 'bad/code', 'bad"code']) {
  assert.equal(run({edit: c => c.document.currentScript.getAttribute = () => code}).added.length, 0);
}
assert.equal(run({edit: c => c.document.currentScript = null}).added.length, 0);
assert.equal(run({edit: c => c.navigator.doNotTrack = '1'}).added.length, 0);
assert.equal(run({edit: c => c.window.doNotTrack = '1'}).added.length, 0);
assert.equal(run({edit: c => c.navigator.globalPrivacyControl = true}).added.length, 0);
assert.equal(run({edit: c => c.localStorage.getItem = () => '1'}).added.length, 0);
assert.equal(run({edit: c => c.localStorage.getItem = () => {throw Error('blocked');}}).added.length, 1);
assert.equal(run({edit: c => c.document.referrer = 'not a URL'}).settings.referrer, '');
const built = path.join(__dirname, '../_site-preview/index.html');
if (fs.existsSync(built)) {
  const html = fs.readFileSync(built, 'utf8');
  const config = fs.readFileSync(path.join(__dirname, '../_config.yml'), 'utf8');
  if (/enabled\s*:\s*false/.test(config)) {
    assert.ok(!html.includes('src="/assets/js/visitor-analytics.js"'));
    assert.ok(!html.includes('gc.zgo.at/count.js'));
  } else {
    assert.ok(html.includes('src="/assets/js/visitor-analytics.js"'));
    assert.ok(html.includes('data-site-code="eliuvish"'));
    assert.ok(!html.includes('src="https://gc.zgo.at/count.js"'));
  }
}
console.log('Analytics checks passed: production guard, configured loader, privacy signals, URL minimization, storage fallback.');
