<?php
include 'connect.php';
session_start();

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
    $activity_type = 'logout';
    $activity_sql = "INSERT INTO login_activity (user_id, activity_type) VALUES ('$user_id', '$activity_type')";
    if (!$conn->query($activity_sql)) {
        echo "Error recording logout activity: " . $conn->error;
    }
}

session_destroy();
header("Location: ../login.php");
exit();
?>