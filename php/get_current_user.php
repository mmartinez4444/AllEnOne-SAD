<?php
include 'connect.php';

// Get the most recent login activity for the current session
$sql = "SELECT user_id FROM login_activity WHERE activity_type = 'login' ORDER BY activity_time DESC LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode(['success' => true, 'userId' => $row['user_id']]);
} else {
    echo json_encode(['success' => false, 'message' => 'No active login found']);
}

$conn->close();
?>