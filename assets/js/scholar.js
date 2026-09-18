'use strict';
document.addEventListener('DOMContentLoaded', function () {
  var printButton = document.querySelector('[data-print-cv]');
  if (printButton) printButton.addEventListener('click', function () { window.print(); });
  var copyButton = document.querySelector('[data-copy-wechat]');
  var copyStatus = document.querySelector('.wechat-copy-status');
  if (copyButton && copyStatus && navigator.clipboard && typeof navigator.clipboard.writeText === 'function') {
    copyButton.hidden = false;
    copyButton.addEventListener('click', async function () {
      copyButton.disabled = true;
      copyStatus.textContent = '';
      try {
        await navigator.clipboard.writeText(copyButton.getAttribute('data-copy-wechat'));
        copyStatus.textContent = 'Copied. Paste it into WeChat search.';
      } catch (error) {
        copyStatus.textContent = 'Please select the name above and copy it manually.';
      } finally {
        copyButton.disabled = false;
      }
    });
  }
});
