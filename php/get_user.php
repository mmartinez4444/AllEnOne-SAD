<?php
include 'connect.php';

$user_id = $_GET['id'];
$sql = "SELECT id, first_name, last_name, username, email, role, status, COALESCE(image, 'default.jpg') AS image FROM users WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('i', $user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();
    echo json_encode($user);
} else {
    echo json_encode(['error' => 'User not found']);
}

$conn->close();
?>