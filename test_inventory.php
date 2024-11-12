<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sad_system"; // Replace with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $product_code = $_POST['product_code'];
    $product_name = $_POST['product_name'];
    $category_id = $_POST['category_id'];
    $stock = $_POST['stock'];
    $price = $_POST['price'];
    $buying_price = $_POST['buying_price'];
    $image = isset($_FILES['image']) && $_FILES['image']['error'] == 0 ? basename($_FILES['image']['name']) : 'product.png';

    if ($image !== 'product.png') {
        $target_dir = "uploads/";
        $target_file = $target_dir . $image;

        // Check if the uploads directory exists
        if (!is_dir($target_dir)) {
            mkdir($target_dir, 0755, true);
        }

        // Move uploaded file to target directory
        if (!move_uploaded_file($_FILES['image']['tmp_name'], $target_file)) {
            die("Failed to upload image: " . $_FILES['image']['error']);
        }
    }

    $sql = "INSERT INTO inventory (product_code, product_name, category_id, stock, price, buying_price, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        die("Prepare failed: " . $conn->error);
    }
    $stmt->bind_param('ssiiids', $product_code, $product_name, $category_id, $stock, $price, $buying_price, $image);

    if (!$stmt->execute()) {
        die("Execute failed: " . $stmt->error);
    }

    $stmt->close();
}

// Fetch inventory from the database
$sql = "SELECT inventory.id, product_code, product_name, categories.category_name, stock, price, buying_price, image, date_added, updated_at 
        FROM inventory 
        JOIN categories ON inventory.category_id = categories.id";
$result = $conn->query($sql);
$inventory = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $inventory[] = $row;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Inventory</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container-xl">
        <h1>Add New Product</h1>
        <form action="" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="productCode">Product Code</label>
                <input type="text" class="form-control" id="productCode" name="product_code" required>
            </div>
            <div class="form-group">
                <label for="productName">Product Name</label>
                <input type="text" class="form-control" id="productName" name="product_name" required>
            </div>
            <div class="form-group">
                <label for="categoryId">Category</label>
                <select class="form-control" id="categoryId" name="category_id" required>
                    <!-- Populate categories dynamically -->
                    <?php
                    $sql = "SELECT id, category_name FROM categories";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<option value='{$row['id']}'>{$row['category_name']}</option>";
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="stock">Stock</label>
                <input type="number" class="form-control" id="stock" name="stock" required>
            </div>
            <div class="form-group">
                <label for="price">Selling Price</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" required>
            </div>
            <div class="form-group">
                <label for="buyingPrice">Buying Price</label>
                <input type="number" step="0.01" class="form-control" id="buyingPrice" name="buying_price" required>
            </div>
            <div class="form-group">
                <label for="productImage">Product Image</label>
                <input type="file" class="form-control" id="productImage" name="image" accept="image/*" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>

        <h2>Inventory</h2>
        <table class="table table-striped table-hover" id="inventoryTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Product Code</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Stock</th>
                    <th>Selling Price</th>
                    <th>Buying Price</th>
                    <th>Date Added</th>
                    <th>Updated At</th>
                </tr>
            </thead>
            <tbody>
            <?php
            foreach ($inventory as $product) {
                echo "<tr>
                        <td>{$product['id']}</td>
                        <td><img src='uploads/{$product['image']}' alt='{$product['product_name']}' class='product-image' style='width: 50px; height: 50px;'></td>
                        <td>{$product['product_code']}</td>
                        <td>{$product['product_name']}</td>
                        <td>{$product['category_name']}</td>
                        <td>{$product['stock']}</td>
                        <td>₱{$product['price']}</td>
                        <td>₱{$product['buying_price']}</td>
                        <td>{$product['date_added']}</td>
                        <td>{$product['updated_at']}</td>
                      </tr>";
            }
            ?>
            </tbody>
        </table>
    </div>
</body>
</html>