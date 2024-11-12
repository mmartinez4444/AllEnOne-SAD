<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login/Register</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        .alert {
            text-align: left; /* Align text to the left */
            margin: 0px;
            padding: 10px;
            border-radius: 5px;
            width: 50%;
            white-space: nowrap; /* Prevent line breaks */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="image-section">
            <img src="assets/Login.jpg" alt="Login Image">
        </div>
        <div class="form-section">
            <div class="form-container">
                <div class="logo">
                    <img src="assets/Logo.png" alt="Logo">
                </div>
                <h2 id="form-title">Welcome to AllEn One</h2>
                <?php if (isset($_GET['message'])): ?>
                    <div class="alert" style="color: <?php echo htmlspecialchars($_GET['color']); ?>;">
                        <?php echo htmlspecialchars($_GET['message']); ?>
                    </div>
                <?php endif; ?>
                <form id="login-form" action="php/login.php" method="POST">
                    <div class="input-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" value="<?php echo isset($_COOKIE['username']) ? $_COOKIE['username'] : ''; ?>" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Password</label>
                        <div class="password-container">
                            <input type="password" id="password" name="password" value="<?php echo isset($_COOKIE['password']) ? $_COOKIE['password'] : ''; ?>" required>
                            <i class="fas fa-eye toggle-password" onclick="togglePassword()"></i>
                        </div>
                    </div>
                    <div class="input-group remember-me">
                        <input type="checkbox" id="remember-me" name="remember-me" <?php echo isset($_COOKIE['username']) ? 'checked' : ''; ?>>
                        <label for="remember-me">Remember Me</label>
                    </div>
                    <button type="submit" class="btn">Login</button>
                    <p class="toggle-form">Don't have an account? <a href="#" onclick="showRegister()">Register</a></p>
                </form>
                <form id="register-form" action="php/register.php" method="POST" enctype="multipart/form-data" style="display: none;">
                    <div class="input-group">
                        <label for="first-name">First Name</label>
                        <input type="text" id="first-name" name="first-name" required>
                    </div>
                    <div class="input-group">
                        <label for="last-name">Last Name</label>
                        <input type="text" id="last-name" name="last-name" required>
                    </div>
                    <div class="input-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" required>
                    </div>
                    <div class="input-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Password</label>
                        <div class="password-container">
                            <input type="password" id="password" name="password" required>
                            <i class="fas fa-eye toggle-password" onclick="togglePassword()"></i>
                        </div>
                    </div>
                    <div class="input-group">
                        <label for="role">Role</label>
                        <select id="role" name="role" required>
                            <option value="admin">Admin</option>
                            <option value="cashier">Cashier</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <label for="image">Profile Image</label>
                        <input type="file" id="image" name="image" accept="image/*">
                    </div>
                    <button type="submit" class="btn">Register</button>
                    <p class="toggle-form">Already have an account? <a href="#" onclick="showLogin()">Login</a></p>
                </form>
            </div>
        </div>
    </div>
    <script>
        function showRegister() {
            document.getElementById('login-form').style.display = 'none';
            document.getElementById('register-form').style.display = 'block';
            clearMessage();
        }

        function showLogin() {
            document.getElementById('register-form').style.display = 'none';
            document.getElementById('login-form').style.display = 'block';
            clearMessage();
        }

        function clearMessage() {
            const alert = document.querySelector('.alert');
            if (alert) {
                alert.remove();
            }
        }

        function togglePassword() {
            const passwordField = document.getElementById('password');
            const passwordToggle = document.querySelector('.toggle-password');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                passwordToggle.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                passwordToggle.classList.remove('fa-eye-slash');
            }
        }
    </script>
    <script src="js/script.js"></script>
</body>
</html>