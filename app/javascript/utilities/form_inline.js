document.addEventListener('turbolinks:load', function() {
  $('.form-inline-link').on('click', formInlineLinkHandler);

  const errors = document.querySelector('.resource-errors');
  if (errors) {
    const resourceId = errors.dataset.resourceId;
    formInlineHandler(resourceId);
  }
});

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

  const isVisible = $formInline.is(':visible');
  const editText = $link.data('editText');
  const cancelText = $link.data('cancelText');

  $link.text(isVisible ? cancelText : editText);
}
