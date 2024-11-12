<?php
include 'connect.php';

$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$username = $_POST['username'];
$email = $_POST['email'];
$role = $_POST['role'];
$status = $_POST['status'];
$password = password_hash($_POST['password'], PASSWORD_BCRYPT);
$image = isset($_FILES['image']) && $_FILES['image']['error'] == 0 ? basename($_FILES['image']['name']) : 'default.jpg';

if ($image !== 'default.jpg') {
    $target_dir = "../uploads/";
    $target_file = $target_dir . $image;
    move_uploaded_file($_FILES['image']['tmp_name'], $target_file);
}

$sql = "INSERT INTO users (first_name, last_name, username, email, role, status, password, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param('ssssssss', $first_name, $last_name, $username, $email, $role, $status, $password, $image);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => $stmt->error]);
}

$conn->close();
?>