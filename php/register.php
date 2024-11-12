<?php
include 'connect.php';

$first_name = $_POST['first-name'];
$last_name = $_POST['last-name'];
$username = $_POST['username'];
$email = $_POST['email'];
$password = password_hash($_POST['password'], PASSWORD_BCRYPT);
$role = $_POST['role'];

// Handle image upload
$image = 'default.jpg'; // Default image
if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
    $image = basename($_FILES['image']['name']);
    $target_dir = "../uploads/";
    $target_file = $target_dir . $image;

    // Ensure the uploads directory exists
    if (!is_dir($target_dir)) {
        mkdir($target_dir, 0777, true);
    }

    if (move_uploaded_file($_FILES['image']['tmp_name'], $target_file)) {
        echo "Image uploaded successfully.";
    } else {
        echo "Error uploading image.";
    }
}

$sql = "INSERT INTO users (first_name, last_name, username, email, password, role, image) VALUES ('$first_name', '$last_name', '$username', '$email', '$password', '$role', '$image')";

if ($conn->query($sql) === TRUE) {
    $conn->close();
    header("Location: ../login.php?message=Registration successful&color=green");
    exit();
} else {
    $conn->close();
    header("Location: ../login.php?message=Error: " . $conn->error . "&color=red");
    exit();
}
?>