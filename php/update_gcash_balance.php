<?php
include 'connect.php';

$new_balance = $_POST['new_balance'];

$sql = "UPDATE gcash SET balance = ? ORDER BY id DESC LIMIT 1";
$stmt = $conn->prepare($sql);
if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'Prepare failed: ' . $conn->error]);
    $conn->close();
    exit();
}
$stmt->bind_param('d', $new_balance);
if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => 'Execute failed: ' . $stmt->error]);
}
$stmt->close();
$conn->close();
?>