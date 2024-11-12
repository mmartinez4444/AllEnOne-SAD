<?php
include 'connect.php';

$category_id = $_POST['category_id'];
$category_name = $_POST['category_name'];

$sql = "UPDATE categories SET category_name = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("si", $category_name, $category_id);

$response = [];
if ($stmt->execute()) {
    $response['success'] = true;
} else {
    $response['success'] = false;
    $response['message'] = $stmt->error;
}

$stmt->close();
$conn->close();

echo json_encode($response);
?>