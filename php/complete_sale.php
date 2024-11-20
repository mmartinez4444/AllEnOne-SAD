<?php
include 'connect.php';

$bill = json_decode($_POST['bill'], true);
$user_id = $_POST['user_id'];
$payment_method = $_POST['payment_method'];
$cash_amount = $_POST['cash_amount'];
$gcash_number = $_POST['gcash_number'];
$gcash_amount = $_POST['gcash_amount'];
$gcash_notes = $_POST['gcash_notes'];
$change_amount = $_POST['change_amount'];

if (!$bill) {
    echo json_encode(['success' => false, 'message' => 'Invalid bill data']);
    $conn->close();
    exit();
}

foreach ($bill as $item) {
    $product_id = $item['productId'];
    $quantity = $item['quantity'];
    $total_price = $item['price'] * $quantity;

    // Insert into sales table
    $sql = "INSERT INTO sales (product_id, user_id, quantity, total_price, payment_mode, change_amount) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        echo json_encode(['success' => false, 'message' => 'Prepare failed: ' . $conn->error]);
        $conn->close();
        exit();
    }
    $stmt->bind_param("iiidsd", $product_id, $user_id, $quantity, $total_price, $payment_method, $change_amount);
    if (!$stmt->execute()) {
        echo json_encode(['success' => false, 'message' => 'Execute failed: ' . $stmt->error]);
        $conn->close();
        exit();
    }

    $sale_id = $stmt->insert_id;

    // Update inventory stock
    if ($payment_method === 'gcash-cash-in') {
        $sql = "UPDATE inventory SET stock = stock + ? WHERE id = ?";
    } else if ($payment_method === 'gcash-cash-out') {
        $sql = "UPDATE inventory SET stock = stock - ? WHERE id = ?";
    } else {
        $sql = "UPDATE inventory SET stock = stock - ? WHERE id = ?";
    }
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        echo json_encode(['success' => false, 'message' => 'Prepare failed: ' . $conn->error]);
        $conn->close();
        exit();
    }
    $stmt->bind_param("ii", $quantity, $product_id);
    if (!$stmt->execute()) {
        echo json_encode(['success' => false, 'message' => 'Execute failed: ' . $stmt->error]);
        $conn->close();
        exit();
    }

    // Insert GCASH transaction if applicable
    if ($payment_method === 'gcash' || $payment_method === 'gcash-cash-in' || $payment_method === 'gcash-cash-out') {
        $sql = "INSERT INTO gcash_transactions (sale_id, gcash_number, amount, notes) VALUES (?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        if (!$stmt) {
            echo json_encode(['success' => false, 'message' => 'Prepare failed: ' . $conn->error]);
            $conn->close();
            exit();
        }
        $stmt->bind_param("isds", $sale_id, $gcash_number, $gcash_amount, $gcash_notes);
        if (!$stmt->execute()) {
            echo json_encode(['success' => false, 'message' => 'Execute failed: ' . $stmt->error]);
            $conn->close();
            exit();
        }
    }
}

// Get sale date
$sql = "SELECT sale_date FROM sales WHERE id = ?";
$stmt = $conn->prepare($sql);
if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'Prepare failed: ' . $conn->error]);
    $conn->close();
    exit();
}
$stmt->bind_param("i", $sale_id);
$stmt->execute();
$stmt->bind_result($sale_date);
$stmt->fetch();
$stmt->close();

// Get cashier name
$sql = "SELECT first_name, last_name FROM users WHERE id = ?";
$stmt = $conn->prepare($sql);
if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'Prepare failed: ' . $conn->error]);
    $conn->close();
    exit();
}
$stmt->bind_param("i", $user_id);
$stmt->execute();
$stmt->bind_result($first_name, $last_name);
$stmt->fetch();
$cashier_name = $first_name . ' ' . $last_name;
$stmt->close();

echo json_encode(['success' => true, 'saleId' => $sale_id, 'cashierName' => $cashier_name, 'date' => $sale_date]);

$conn->close();
?>