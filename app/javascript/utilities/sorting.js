document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by-title');

  if (control) { control.addEventListener('click', function() {
      sortRowsByTitle(control);
    });
  }
});

function sortRowsByTitle(control) {
  const table = document.querySelector('table');
  const tbody = table.querySelector('tbody');
  const rows = tbody.querySelectorAll('tr');
  const sortedRows = Array.from(rows);
  const arrowUp = control.querySelector('.octicon-arrow-up');
  const arrowDown = control.querySelector('.octicon-arrow-down');

  const isAscending = arrowUp.classList.contains('hide');
  sortedRows.sort(isAscending ? compareRowsAsc : compareRowsDesc);

  arrowUp.classList.toggle('hide', !isAscending);
  arrowDown.classList.toggle('hide', isAscending);

  sortedRows.forEach(row => tbody.appendChild(row));
}

function compareRowsAsc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent;
  const testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 < testTitle2) { return -1; }
  if (testTitle1 > testTitle2) { return 1; }
  return 0;
}

function compareRowsDesc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent;
  const testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 < testTitle2) { return 1; }
  if (testTitle1 > testTitle2) { return -1; }
  return 0;
}
