document.addEventListener('turbolinks:load', function() {
  const feedbackButton = document.querySelector('.feedback-button');
  const feedbackModal = document.querySelector('.modal-feedback');
  
  feedbackButton.addEventListener('click', function(event) {
    event.preventDefault();
    feedbackModal.style.display = 'block';
  });

  document.addEventListener('click', function(event) {
    if (!feedbackModal.contains(event.target) && !feedbackButton.contains(event.target)) {
      feedbackModal.style.display = 'none';
    }
  });
});
