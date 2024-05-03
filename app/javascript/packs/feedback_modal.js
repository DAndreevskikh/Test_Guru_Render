document.addEventListener('turbolinks:load', function() {
  const feedbackButton = document.querySelector('.feedback-button');
  const feedbackModal = document.querySelector('.modal-feedback');
  const form = document.querySelector('form');
  const submitButton = form ? form.querySelector('[type="submit"]') : null;

  if (feedbackButton && feedbackModal) {
    setupModal(feedbackButton, feedbackModal);
  }

  if (form && submitButton) {
    setupFormValidation(form, submitButton);
  }
});

function setupModal(button, modal) {
  button.addEventListener('click', function(event) {
    event.preventDefault();
    modal.style.display = 'block';
  });

  document.addEventListener('click', function(event) {
    if (!modal.contains(event.target) && !button.contains(event.target)) {
      modal.style.display = 'none';
    }
  });
}

function setupFormValidation(form, submitButton) {
  const nameInput = document.querySelector('#feedback_name');
  const emailInput = document.querySelector('#feedback_email');
  const messageInput = document.querySelector('#feedback_message');

  const inputs = [nameInput, emailInput, messageInput].filter(input => input !== null);

  inputs.forEach(input => {
    input.addEventListener('input', () => {
      validateInput(input);
      checkFormValidity(form, submitButton);
    });
  });

  form.addEventListener('submit', function(event) {
    event.preventDefault();
    if (checkFormValidity(form, submitButton)) {
      form.submit();
    }
  });
}

function validateInput(input) {
  const isValid = input.value.trim() && (input.id !== 'feedback_email' || validateEmail(input.value));
  toggleError(input, isValid);
  return isValid;
}

function toggleError(input, isValid) {
  const errorDiv = input.nextElementSibling;
  if (isValid) {
    if (input.classList.contains('is-invalid')) {
      input.classList.remove('is-invalid');
      errorDiv.style.display = 'none';
    }
  } else {
    if (!input.classList.contains('is-invalid')) {
      input.classList.add('is-invalid');
      errorDiv.textContent = getErrorMessage(input.id);
      errorDiv.style.display = 'block';
    }
  }
}

function checkFormValidity(form, submitButton) {
  const isValid = Array.from(form.querySelectorAll('input, textarea')).filter(input => input !== null).every(input => validateInput(input));
  submitButton.disabled = !isValid;
  return isValid;
}

function getErrorMessage(inputId) {
  switch (inputId) {
    case 'feedback_name': return 'Введите ваше имя';
    case 'feedback_email': return 'Введите корректный email';
    case 'feedback_message': return 'Введите сообщение';
    default: return '';
  }
}

function validateEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}
