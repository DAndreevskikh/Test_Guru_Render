document.addEventListener('turbolinks:load', function() {
  const password = document.querySelector('.pass');
  const confirmPassword = document.querySelector('.conf-pass');
  const indicator = document.querySelector('.password-match-indicator');

  if (password && confirmPassword) {
    confirmPassword.addEventListener('input', () => {
      if (confirmPassword.value === '') {
        confirmPassword.classList.remove('is-valid', 'is-invalid');
        indicator.textContent = '';
      } else if (password.value === confirmPassword.value) {
        confirmPassword.classList.remove('is-invalid');
        confirmPassword.classList.add('is-valid');
        indicator.textContent = 'Пароли совпадают';
        indicator.style.color = 'green';
      } else {
        confirmPassword.classList.remove('is-valid');
        confirmPassword.classList.add('is-invalid');
        indicator.textContent = 'Пароли не совпадают';
        indicator.style.color = 'red';
      }
    });
  }
});
