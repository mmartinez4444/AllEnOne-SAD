<?php
include 'connect.php';

$product_id = $_GET['id'];

// Start a transaction
$conn->begin_transaction();

try {
    // Delete related sales records
    $sql = "DELETE FROM sales WHERE product_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $product_id);
    if (!$stmt->execute()) {
        throw new Exception($stmt->error);
    }
    $stmt->close();

    // Delete the product from inventory
    $sql = "DELETE FROM inventory WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $product_id);
    if (!$stmt->execute()) {
        throw new Exception($stmt->error);
    }
    $stmt->close();

    // Commit the transaction
    $conn->commit();
    $response['success'] = true;
} catch (Exception $e) {
    // Rollback the transaction on error
    $conn->rollback();
    $response['success'] = false;
    $response['message'] = $e->getMessage();
}

$conn->close();

echo json_encode($response);
?>