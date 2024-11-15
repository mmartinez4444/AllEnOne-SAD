<?php
include 'connect.php';

$product_id = $_GET['id'];

$sql = "SELECT * FROM inventory WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();
$product = $result->fetch_assoc();

echo json_encode($product);

$stmt->close();
$conn->close();
?>