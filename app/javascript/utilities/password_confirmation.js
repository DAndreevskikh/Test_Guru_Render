document.addEventListener('turbolinks:load', function() {
  const form = document.querySelector('form');
  const formFields = document.querySelectorAll('.form-control');
  const password = document.querySelector('.pass');
  const confirmPassword = document.querySelector('.conf-pass');
  const indicator = document.querySelector('.password-match-indicator');
  const submitButton = form.querySelector('input[type="submit"]');

  if (!form || !password || !confirmPassword || !submitButton) {
    return;
  }

  setInterval(() => {
    if (submitButton.disabled) {
      submitButton.disabled = false;
    }
  }, 100);

  function validateEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(email);
  }

  function validateField(field) {
    const errorDiv = field.parentElement.querySelector('.invalid-feedback');
    let isValid = field.value.trim() !== '';
    let message = '';

    if (!isValid) {
      field.classList.add('is-invalid');
      field.placeholder = 'Поле не может быть пустым';
      errorDiv.textContent = '';
      errorDiv.style.display = 'none';
    } else {
      field.classList.remove('is-invalid');
      field.placeholder = '';
      if (field.type === 'email') {
        isValid = validateEmail(field.value);
        message = isValid ? '' : 'Некорректный адрес почты';
      } else if ((field.type === 'password' || field.type === 'password_confirmation') && field.value.length < 6) {
        isValid = false;
        message = 'Пароль должен быть минимум 6 символов';
      }

      field.classList.toggle('is-invalid', !isValid);
      field.classList.toggle('is-valid', isValid);
      errorDiv.textContent = message;
      errorDiv.style.display = message ? 'block' : 'none';
    }
    return isValid;
  }

  function updatePasswordMatchIndicator() {
    if (password.value.trim() && confirmPassword.value.trim()) {
      const isValid = password.value === confirmPassword.value;
      confirmPassword.classList.toggle('is-invalid', !isValid);
      confirmPassword.classList.toggle('is-valid', isValid);
      indicator.textContent = isValid ? 'Пароли совпадают' : 'Пароли не совпадают';
      indicator.style.color = isValid ? 'green' : 'red';
      indicator.style.display = 'block';
      return isValid;
    } else {
      confirmPassword.classList.remove('is-invalid', 'is-valid');
      indicator.textContent = '';
      indicator.style.display = 'none';
      return false;
    }
  }

  form.addEventListener('submit', function(event) {
    event.preventDefault();
    if (performValidation()) {
      form.submit();
    }
  });

  function performValidation() {
    let allValid = true;
    formFields.forEach(field => {
      allValid = validateField(field) && allValid;
    });
    allValid = updatePasswordMatchIndicator() && allValid;
    return allValid;
  }

  formFields.forEach(field => {
    field.addEventListener('input', function() {
      validateField(field);
    });
  });

  password.addEventListener('input', updatePasswordMatchIndicator);
  confirmPassword.addEventListener('input', updatePasswordMatchIndicator);
});
