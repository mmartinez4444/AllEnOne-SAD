<?php
include 'connect.php';

$category_id = $_GET['id'];

// Check if there are any related rows in the inventory table
$checkSql = "SELECT COUNT(*) as count FROM inventory WHERE category_id = ?";
$checkStmt = $conn->prepare($checkSql);
$checkStmt->bind_param("i", $category_id);
$checkStmt->execute();
$checkResult = $checkStmt->get_result();
$checkRow = $checkResult->fetch_assoc();

$response = [];
if ($checkRow['count'] > 0) {
    $response['success'] = false;
    $response['message'] = 'Cannot delete category because it is referenced by items in the inventory.';
} else {
    $sql = "DELETE FROM categories WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $category_id);

    if ($stmt->execute()) {
        $response['success'] = true;
    } else {
        $response['success'] = false;
        $response['message'] = $stmt->error;
    }

    $stmt->close();
}

$checkStmt->close();
$conn->close();

echo json_encode($response);
?>