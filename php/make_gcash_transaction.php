<?php
include 'connect.php';

// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Log errors to a file
ini_set('log_errors', 1);
ini_set('error_log', 'php-error.log');

$transactionType = $_POST['transaction_type'];
$gcashNumber = $_POST['gcash_number'];
$amount = $_POST['amount'];
$userId = $_POST['user_id'];

// Insert the transaction into the gcash_log table
$sql = "INSERT INTO gcash_log (transaction_type, gcash_number, amount, user_id) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
if (!$stmt) {
    error_log('Prepare failed: ' . $conn->error);
    echo json_encode(['success' => false, 'message' => 'Database prepare error: ' . $conn->error]);
    exit;
}
$stmt->bind_param('ssdi', $transactionType, $gcashNumber, $amount, $userId);

if ($stmt->execute()) {
    // Update the balance in the gcash table
    if ($transactionType == 'cash_in') {
        $updateSql = "UPDATE gcash SET balance = balance - ? WHERE id = 1";
    } elseif ($transactionType == 'cash_out' || $transactionType == 'load') {
        $updateSql = "UPDATE gcash SET balance = balance + ? WHERE id = 1";
    }
    $updateStmt = $conn->prepare($updateSql);
    if (!$updateStmt) {
        error_log('Prepare failed: ' . $conn->error);
        echo json_encode(['success' => false, 'message' => 'Database prepare error: ' . $conn->error]);
        exit;
    }
    $updateStmt->bind_param('d', $amount);
    if ($updateStmt->execute()) {
        echo json_encode(['success' => true]);
    } else {
        error_log('Execute failed: ' . $updateStmt->error);
        echo json_encode(['success' => false, 'message' => 'Error updating balance: ' . $updateStmt->error]);
    }
    $updateStmt->close();
} else {
    error_log('Execute failed: ' . $stmt->error);
    echo json_encode(['success' => false, 'message' => 'Error recording transaction: ' . $stmt->error]);
}

$stmt->close();
$conn->close();
?>