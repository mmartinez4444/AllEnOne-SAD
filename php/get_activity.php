<?php
include 'connect.php';

$sql = "SELECT users.first_name AS name, login_activity.activity_type, login_activity.activity_time 
        FROM login_activity 
        JOIN users ON login_activity.user_id = users.id 
        ORDER BY login_activity.activity_time DESC";
$result = $conn->query($sql);

$activities = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $activities[] = $row;
    }
}

echo json_encode($activities);

$conn->close();
?>