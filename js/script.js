// Add this script to your existing script.js file

function togglePassword() {
    const passwordFields = document.querySelectorAll('.password-container input');
    const toggleIcons = document.querySelectorAll('.password-container .toggle-password');
    passwordFields.forEach((field, index) => {
        if (field.type === "password") {
            field.type = "text";
            toggleIcons[index].classList.remove('fa-eye');
            toggleIcons[index].classList.add('fa-eye-slash');
        } else {
            field.type = "password";
            toggleIcons[index].classList.remove('fa-eye-slash');
            toggleIcons[index].classList.add('fa-eye');
        }
    });
}

function showRegister() {
    document.getElementById('login-form').style.display = 'none';
    document.getElementById('register-form').style.display = 'block';
    document.getElementById('form-title').textContent = 'Register';
    document.querySelector('.form-section').style.opacity = '0';
    setTimeout(() => {
        document.querySelector('.form-section').style.opacity = '1';
    }, 100);
}

function showLogin() {
    document.getElementById('login-form').style.display = 'block';
    document.getElementById('register-form').style.display = 'none';
    document.getElementById('form-title').textContent = 'Login';
    document.querySelector('.form-section').style.opacity = '0';
    setTimeout(() => {
        document.querySelector('.form-section').style.opacity = '1';
    }, 100);
}