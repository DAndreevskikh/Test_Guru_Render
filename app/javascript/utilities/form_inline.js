document.addEventListener('turbolinks:load', function() {
  setupFormInlineLinks();
});

function setupFormInlineLinks() {
  $('.form-inline-link').on('click', formInlineLinkHandler);

  $('form.form-inline').on('submit', function(event) {
    event.preventDefault();

    const titleField = $(this).find('input[name="test[title]"]');
    const titleValue = titleField.val().trim();
    removePreviousErrors(titleField);

    if (titleValue === '') {
      const errorMessage = "Поле не может быть пустым";
      titleField.attr('placeholder', errorMessage);
      titleField.addClass('is-invalid');
      return;  
    }

    alert('Form is valid and can be submitted!'); 
  });
}

function formInlineLinkHandler(event) {
  event.preventDefault();
  const testId = this.dataset.testId;
  formInlineHandler(testId);
}

function formInlineHandler(testId) {
  const $link = $(`[data-test-id="${testId}"].form-inline-link`);
  const $testTitle = $(`.test-title[data-test-id="${testId}"]`);
  const $formInline = $(`.form-inline[data-test-id="${testId}"]`);

  $formInline.toggle();
  $testTitle.toggle();

  if ($formInline.is(':visible')) {
    const title = $testTitle.text();
    $formInline.find('input[type="text"]').val(title).removeClass('is-invalid');
    clearFormErrors($formInline);
  }

  updateLinkText($link, $formInline.is(':visible'));
}

function updateLinkText($link, isVisible) {
  const editText = $link.data('editText') || 'Edit';
  const cancelText = $link.data('cancelText') || 'Cancel';
  $link.text(isVisible ? cancelText : editText);
}

function clearFormErrors($form) {
  $form.find('input').each(function() {
    $(this).removeClass('is-invalid').attr('placeholder', '');
  });
}

function removePreviousErrors(inputField) {
  inputField.removeClass('is-invalid').attr('placeholder', '');
}
