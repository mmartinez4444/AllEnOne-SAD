<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include 'connect.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $remember_me = isset($_POST['remember-me']);

    // Fetch user with active status only
    $sql = "SELECT * FROM users WHERE username = ? AND status = 'active'";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        if (password_verify($password, $row['password'])) {
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['username'] = $username;
            $_SESSION['role'] = $row['role'];

            // Record login activity
            $user_id = $row['id'];
            $activity_type = 'login';
            $activity_sql = "INSERT INTO login_activity (user_id, activity_type) VALUES (?, ?)";
            $activity_stmt = $conn->prepare($activity_sql);
            $activity_stmt->bind_param('is', $user_id, $activity_type);
            $activity_stmt->execute();

            // Set cookies if "Remember Me" is checked
            if ($remember_me) {
                setcookie('username', $username, time() + (86400 * 30), "/"); // 30 days
                setcookie('password', $password, time() + (86400 * 30), "/"); // 30 days
            } else {
                // Clear cookies if "Remember Me" is not checked
                setcookie('username', '', time() - 3600, "/");
                setcookie('password', '', time() - 3600, "/");
            }

            header("Location: ../index.php");
            exit();
        } else {
            header("Location: ../login.php?message=Invalid password&color=red");
            exit();
        }
    } else {
        // If no user found, account is either inactive or username doesn't exist
        header("Location: ../login.php?message=Account is inactive or username not found&color=red");
        exit();
    }
}

$conn->close();
?>