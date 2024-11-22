//useless

<?php
include 'connect.php';

$amount = $_POST['amount'];
$action = $_POST['action'];

if ($action === 'deduct') {
    $sql = "UPDATE inventory SET stock = stock - ? WHERE product_name = 'GCash Cash-In Cash-Out'";
} else if ($action === 'add') {
    $sql = "UPDATE inventory SET stock = stock + ? WHERE product_name = 'GCash Cash-In Cash-Out'";
}

$stmt = $conn->prepare($sql);
if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'Prepare failed: ' . $conn->error]);
    $conn->close();
    exit();
}
$stmt->bind_param("i", $amount);
if (!$stmt->execute()) {
    echo json_encode(['success' => false, 'message' => 'Execute failed: ' . $stmt->error]);
    $conn->close();
    exit();
}

echo json_encode(['success' => true, 'message' => 'Inventory updated successfully']);
$conn->close();
?>