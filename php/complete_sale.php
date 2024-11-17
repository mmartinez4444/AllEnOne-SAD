<?php
include 'connect.php';

$bill = json_decode($_POST['bill'], true);

foreach ($bill as $item) {
    $product_id = $item['productId'];
    $quantity = $item['quantity'];
    $total_price = $item['price'] * $quantity;

    // Insert into sales table
    $sql = "INSERT INTO sales (product_id, quantity, total_price) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iid", $product_id, $quantity, $total_price);
    $stmt->execute();

    // Update inventory stock
    $sql = "UPDATE inventory SET stock = stock - ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $quantity, $product_id);
    $stmt->execute();
}

echo json_encode(['success' => true]);

$conn->close();
?>