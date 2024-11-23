<?php
include 'connect.php';

$product_id = $_POST['id'];
$product_code = $_POST['product_code'];
$product_name = $_POST['product_name'];
$stock = $_POST['stock'];
$price = $_POST['price'];
$buying_price = $_POST['buying_price'];
$discount_eligible = $_POST['discount_eligible'];

$image = $_FILES['image']['name'];
$target_dir = "../uploads/";
$target_file = $target_dir . basename($image);

if ($image) {
    if (move_uploaded_file($_FILES['image']['tmp_name'], $target_file)) {
        $sql = "UPDATE inventory SET product_code = ?, product_name = ?, stock = ?, price = ?, buying_price = ?, discount_eligible = ?, image = ? WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssiddisi", $product_code, $product_name, $stock, $price, $buying_price, $discount_eligible, $image, $product_id);
    } else {
        $response = ['success' => false, 'message' => 'Failed to upload image'];
        echo json_encode($response);
        exit;
    }
} else {
    $sql = "UPDATE inventory SET product_code = ?, product_name = ?, stock = ?, price = ?, buying_price = ?, discount_eligible = ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssiddii", $product_code, $product_name, $stock, $price, $buying_price, $discount_eligible, $product_id);
}

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