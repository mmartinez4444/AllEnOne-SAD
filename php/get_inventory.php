<?php
include 'connect.php';

$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$itemsPerPage = isset($_GET['itemsPerPage']) ? (int)$_GET['itemsPerPage'] : 10;
$search = isset($_GET['search']) ? $_GET['search'] : '';
$category = isset($_GET['category']) ? $_GET['category'] : '';
$offset = ($page - 1) * $itemsPerPage;

$searchQuery = "";
if ($search) {
    $searchQuery = "AND (inventory.product_code LIKE '%$search%' OR inventory.product_name LIKE '%$search%' OR categories.category_name LIKE '%$search%' OR inventory.stock LIKE '%$search%' OR inventory.price LIKE '%$search%' OR inventory.buying_price LIKE '%$search%' OR inventory.date_added LIKE '%$search%' OR inventory.updated_at LIKE '%$search%')";
}

$categoryQuery = "";
if ($category) {
    $categoryQuery = "AND categories.category_name LIKE '%$category%'";
}

$sql = "SELECT inventory.id, inventory.image, inventory.product_code, inventory.product_name, categories.category_name, inventory.stock, inventory.price, inventory.buying_price, inventory.date_added, inventory.updated_at, inventory.discount_eligible 
        FROM inventory 
        JOIN categories ON inventory.category_id = categories.id
        WHERE 1=1 $searchQuery $categoryQuery
        ORDER BY inventory.id ASC
        LIMIT $itemsPerPage OFFSET $offset";
$result = $conn->query($sql);

$items = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $items[] = $row;
    }
}

$sqlTotal = "SELECT COUNT(*) as total FROM inventory JOIN categories ON inventory.category_id = categories.id WHERE 1=1 $searchQuery $categoryQuery";
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