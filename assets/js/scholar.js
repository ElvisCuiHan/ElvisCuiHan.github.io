'use strict';
document.addEventListener('DOMContentLoaded', function () {
  var printButton = document.querySelector('[data-print-cv]');
  if (printButton) printButton.addEventListener('click', function () { window.print(); });
});
