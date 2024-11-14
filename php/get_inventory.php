<?php
include 'connect.php'; // Include your database connection file

$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$itemsPerPage = isset($_GET['itemsPerPage']) ? (int)$_GET['itemsPerPage'] : 10;
$offset = ($page - 1) * $itemsPerPage;

$sql = "SELECT inventory.id, inventory.image, inventory.product_code, inventory.product_name, categories.category_name, inventory.stock, inventory.price, inventory.buying_price, inventory.date_added, inventory.updated_at 
        FROM inventory 
        JOIN categories ON inventory.category_id = categories.id
        ORDER BY inventory.id ASC
        LIMIT $itemsPerPage OFFSET $offset";
$result = $conn->query($sql);

$items = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $items[] = $row;
    }
}

$sqlTotal = "SELECT COUNT(*) as total FROM inventory";
$resultTotal = $conn->query($sqlTotal);
$totalItems = $resultTotal->fetch_assoc()['total'];
$totalPages = ceil($totalItems / $itemsPerPage);

echo json_encode([
    'items' => $items,
    'currentPage' => $page,
    'totalPages' => $totalPages,
    'totalItems' => $totalItems
]);

$conn->close();
?>