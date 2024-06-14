document.addEventListener('turbolinks:load', function() {
  const ruleSelect = document.getElementById('rule-select');
  const categorySelect = document.getElementById('category-select');
  const levelSelect = document.getElementById('level-select');
  const testSelect = document.getElementById('test-select');
  const ruleValueInput = document.querySelector('input[name="badge[rule_value]"]');

  function handleRuleChange() {
    const selectedRule = ruleSelect.value;

    categorySelect.style.display = 'none';
    levelSelect.style.display = 'none';
    testSelect.style.display = 'none';
    categorySelect.querySelector('select').value = '';
    levelSelect.querySelector('select').value = '';
    testSelect.querySelector('select').value = '';
    ruleValueInput.value = '';

    if (selectedRule === 'category_complete') {
      categorySelect.style.display = 'block';
      categorySelect.querySelector('select').addEventListener('change', handleCategoryChange);
    } else if (selectedRule === 'level_complete') {
      levelSelect.style.display = 'block';
      levelSelect.querySelector('select').addEventListener('change', handleLevelChange);
    } else if (selectedRule === 'first_try') {
      testSelect.style.display = 'block';
      testSelect.querySelector('select').addEventListener('change', handleTestChange);
    }
  }

  function handleCategoryChange() {
    ruleValueInput.value = categorySelect.querySelector('select').value;
  }

  function handleLevelChange() {
    ruleValueInput.value = levelSelect.querySelector('select').value;
  }

  function handleTestChange() {
    ruleValueInput.value = testSelect.querySelector('select').value;
  }

  ruleSelect.addEventListener('change', handleRuleChange);
  handleRuleChange();
});

