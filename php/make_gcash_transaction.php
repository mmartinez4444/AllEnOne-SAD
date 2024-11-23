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

// Get the current balance
$sql = "SELECT balance FROM gcash WHERE id = 1";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $currentBalance = $row['balance'];
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to retrieve current balance']);
    exit;
}

// Calculate the new balance
if ($transactionType == 'cash_out') {
    $newBalance = $currentBalance + $amount;
} elseif ($transactionType == 'cash_in' || $transactionType == 'load') {
    $newBalance = $currentBalance - $amount;
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid transaction type']);
    exit;
}

// Insert the transaction into the gcash_log table
$sql = "INSERT INTO gcash_log (transaction_type, gcash_number, amount, user_id, balance) VALUES (?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
if (!$stmt) {
    error_log('Prepare failed: ' . $conn->error);
    echo json_encode(['success' => false, 'message' => 'Database prepare error: ' . $conn->error]);
    exit;
}
$stmt->bind_param('ssdds', $transactionType, $gcashNumber, $amount, $userId, $newBalance);

if ($stmt->execute()) {
    // Update the balance in the gcash table
    $updateSql = "UPDATE gcash SET balance = ? WHERE id = 1";
    $updateStmt = $conn->prepare($updateSql);
    if (!$updateStmt) {
        error_log('Prepare failed: ' . $conn->error);
        echo json_encode(['success' => false, 'message' => 'Database prepare error: ' . $conn->error]);
        exit;
    }
    $updateStmt->bind_param('d', $newBalance);
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