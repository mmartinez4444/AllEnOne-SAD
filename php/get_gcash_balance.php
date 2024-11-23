<?php
include 'connect.php';

$sql = "SELECT balance FROM gcash ORDER BY id DESC LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode(['balance' => $row['balance']]);
} else {
    echo json_encode(['balance' => '0.00']);
}

$conn->close();
?>