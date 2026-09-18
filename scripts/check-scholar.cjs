const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const source = fs.readFileSync(path.join(__dirname, '../assets/js/scholar.js'), 'utf8');

function fixture(options = {}) {
  let ready, click;
  const writes = [];
  const button = {
    hidden: true,
    disabled: false,
    getAttribute: () => '让统计再次伟大',
    addEventListener(type, handler) { assert.equal(type, 'click'); click = handler; }
  };
  const status = { textContent: '' };
  const clipboard = options.noClipboard ? undefined : {
    async writeText(text) {
      writes.push(text);
      if (options.reject) throw new Error('Clipboard permission denied');
    }
  };
  vm.runInNewContext(source, {
    navigator: { clipboard },
    document: {
      addEventListener(type, handler) { assert.equal(type, 'DOMContentLoaded'); ready = handler; },
      querySelector(selector) {
        if (options.noCard) return null;
        if (selector === '[data-copy-wechat]') return button;
        if (selector === '.wechat-copy-status') return status;
        return null;
      }
    }
  });
  ready();
  return { button, status, writes, click: () => click() };
}

(async () => {
  const working = fixture();
  assert.equal(working.button.hidden, false);
  const pending = working.click();
  assert.equal(working.button.disabled, true);
  await pending;
  assert.deepEqual(working.writes, ['让统计再次伟大']);
  assert.match(working.status.textContent, /Copied/);
  assert.equal(working.button.disabled, false);

  const rejected = fixture({ reject: true });
  await rejected.click();
  assert.match(rejected.status.textContent, /manually/);
  assert.equal(rejected.button.disabled, false);

  assert.equal(fixture({ noClipboard: true }).button.hidden, true);
  fixture({ noCard: true });
  console.log('WeChat copy checks passed: exact account name, busy state, success, denial, unsupported API and pages without a card.');
})().catch(error => { console.error(error); process.exitCode = 1; });
