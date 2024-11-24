<?php
include 'connect.php';

// Function to get sales stats for a given time period
function getSalesStats($conn, $interval) {
    $sql = "
        SELECT 
            SUM(s.total_price) AS totalSales, 
            SUM((s.total_price - (i.buying_price * s.quantity))) AS totalProfit, 
            SUM(s.quantity) AS totalProductsSold 
        FROM sales s
        JOIN inventory i ON s.product_id = i.id
        WHERE s.sale_date >= NOW() - INTERVAL $interval
    ";
    $result = $conn->query($sql);

    if (!$result) {
        die("Query failed: " . $conn->error);
    }

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return [
            'totalSales' => (float)$row['totalSales'],
            'totalProfit' => (float)$row['totalProfit'],
            'totalProductsSold' => (int)$row['totalProductsSold']
        ];
    } else {
        return [
            'totalSales' => 0,
            'totalProfit' => 0,
            'totalProductsSold' => 0
        ];
    }
}

$period = $_GET['period'] ?? 'daily';
$interval = '1 DAY';

switch ($period) {
    case 'weekly':
        $interval = '1 WEEK';
        break;
    case 'monthly':
        $interval = '1 MONTH';
        break;
    case 'yearly':
        $interval = '1 YEAR';
        break;
}

$data = getSalesStats($conn, $interval);

echo json_encode($data);

$conn->close();
?>