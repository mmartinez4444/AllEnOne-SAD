<?php
include 'connect.php';

$user_id = $_POST['user_id'];
$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$username = $_POST['username'];
$email = $_POST['email'];
$role = $_POST['role'];
$status = $_POST['status'];
$password = !empty($_POST['password']) ? password_hash($_POST['password'], PASSWORD_BCRYPT) : null;
$image = isset($_FILES['image']) && $_FILES['image']['error'] == 0 ? basename($_FILES['image']['name']) : null;

$sql = "UPDATE users SET first_name = ?, last_name = ?, username = ?, email = ?, role = ?, status = ?";
$params = [$first_name, $last_name, $username, $email, $role, $status];

if ($password) {
    $sql .= ", password = ?";
    $params[] = $password;
}

if ($image) {
    $target_dir = "../uploads/";
    $target_file = $target_dir . $image;
    if (move_uploaded_file($_FILES['image']['tmp_name'], $target_file)) {
        $sql .= ", image = ?";
        $params[] = $image;
    }
}

$sql .= " WHERE id = ?";
$params[] = $user_id;

$stmt = $conn->prepare($sql);
$stmt->bind_param(str_repeat('s', count($params)), ...$params);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => $stmt->error]);
}

$conn->close();
?>