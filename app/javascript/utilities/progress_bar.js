document.addEventListener('turbolinks:load', function() {
  updateProgressBar();
});

function updateProgressBar() {
  const progressBar = document.querySelector('.progress-bar');
  
  if (progressBar) {
    const currentQuestion = parseInt(progressBar.dataset.currentQuestion, 10);
    const questionsCount = parseInt(progressBar.dataset.questionsCount, 10);
    const progressPercentage = (currentQuestion / questionsCount) * 100;
    
    progressBar.style.width = `${progressPercentage}%`;
  }
}
