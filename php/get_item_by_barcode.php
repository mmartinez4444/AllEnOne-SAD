<?php
include 'connect.php';

$barcode = $_GET['barcode'];

$sql = "SELECT id, product_name, price, stock, image FROM inventory WHERE product_code = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $barcode);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $item = $result->fetch_assoc();
    echo json_encode(['success' => true, 'item' => $item]);
} else {
    echo json_encode(['success' => false, 'message' => 'Item not found']);
}

$stmt->close();
$conn->close();
?>