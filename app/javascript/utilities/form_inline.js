document.addEventListener('turbolinks:load', function() {
  setupFormInlineLinks();
});

function setupFormInlineLinks() {
  $('.form-inline-link').on('click', formInlineLinkHandler);

  $('form.form-inline').on('ajax:success', function(event) {
    location.reload();  
  }).on('ajax:error', function(event, xhr, status, error) {
    handleErrors(xhr.responseJSON, $(this));
  });

  $('form.form-inline').on('submit', function(event) {
    event.preventDefault(); 

    const titleField = $(this).find('input[name="test[title]"]');
    const titleValue = titleField.val().trim();
    if (titleValue === '') {
      const errorMessage = "Поле не может быть пустым";
      removePreviousErrors(titleField); 
      titleField.after(`<div class="alert alert-danger">${errorMessage}</div>`);
      return false; 
    }

    $(this).off('submit').submit();
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

  clearFormErrors($formInline);

  $formInline.toggle();
  $testTitle.toggle();

  if ($formInline.is(':visible')) {
    const title = $testTitle.text();
    $formInline.find('input[type="text"]').val(title).removeClass('is-invalid').next('.alert-danger').remove();
  }

  updateLinkText($link, $formInline.is(':visible'));
}

function updateLinkText($link, isVisible) {
  const editText = $link.data('editText') || 'Edit';
  const cancelText = $link.data('cancelText') || 'Cancel';
  $link.text(isVisible ? cancelText : editText);
}

function clearFormErrors($form) {
  $form.find('.alert-danger').remove(); 
  $form.find('.is-invalid').removeClass('is-invalid'); 
}

function removePreviousErrors(titleField) {
  titleField.parent().find('.alert-danger').remove();
}
