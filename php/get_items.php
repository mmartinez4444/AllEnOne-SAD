<?php
include 'connect.php';

$category_id = isset($_GET['category_id']) ? $_GET['category_id'] : null;

$sql = "SELECT * FROM inventory";
if ($category_id) {
    $sql .= " WHERE category_id = ?";
}

$stmt = $conn->prepare($sql);
if ($category_id) {
    $stmt->bind_param("i", $category_id);
}
$stmt->execute();
$result = $stmt->get_result();

$items = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $items[] = $row;
    }
}

echo json_encode($items);

$stmt->close();
$conn->close();
?>