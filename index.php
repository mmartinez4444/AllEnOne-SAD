<?php
session_start();
include 'php/connect.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

$role = $_SESSION['role'];
?>

<!DOCTYPE html>
<html>
<head>
    <title>AllEn One Store</title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    
    <link rel="icon" type="image/png" href="assets/logo.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
    <link rel="stylesheet" type="text/css" href="fontawesome-free/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
    
</head>
<body class="overlay-scrollbar">
    <!-- navbar -->
    <div class="navbar">
        <!-- nav left -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link">
                    <i class="fas fa-bars" onclick="collapseSidebar()"></i>
                </a>
            </li>
            <li class="nav-item">
                <img src="assets/Allen-Orig.png" alt="ATPro logo" class="logo logo-light">
                <img src="assets/Allen-White.png" alt="ATPro logo" class="logo logo-dark">
            </li>
        </ul>
        <!-- end nav left -->
        <!-- nav right -->
        <ul class="navbar-nav nav-right">
            <li class="nav-item mode">
                <a class="nav-link" href="#" onclick="switchTheme()">
                    <i class="fas fa-moon dark-icon"></i>
                    <i class="fas fa-sun light-icon"></i>
                </a>
            </li>
            <li class="nav-item greeting">
                <?php
                if (isset($_SESSION['user_id'])) {
                    $user_id = $_SESSION['user_id'];
                    $sql = "SELECT first_name, image FROM users WHERE id='$user_id'";
                    $result = $conn->query($sql);
                    if ($result && $result->num_rows > 0) {
                        $row = $result->fetch_assoc();
                        $first_name = $row['first_name'];
                        $image = $row['image'];
                    } else {
                        $first_name = 'User';
                        $image = 'default.jpg'; // Fallback image
                    }
                } else {
                    $first_name = 'User';
                    $image = 'default.jpg'; // Fallback image
                }
                ?>
                <span>Hello, <?php echo htmlspecialchars($first_name); ?>!</span>
            </li>
            <li class="nav-item avt-wrapper">
                <div class="avt dropdown">
                    <img src="uploads/<?php echo htmlspecialchars($image); ?>" alt="User image" class="dropdown-toggle" data-toggle="user-menu">
                    <ul id="user-menu" class="dropdown-menu">
                                            <li class="dropdown-menu-item">
                            <a class="dropdown-menu-link" href="#" onclick="openProfileEditModal()">
                                <div>
                                    <i class="fas fa-user-tie"></i>
                                </div>
                                <span>Profile</span>
                            </a>
                        </li>
                        <li class="dropdown-menu-item">
                            <a href="php/logout.php" class="dropdown-menu-link">
                                <div>
                                    <i class="fas fa-sign-out-alt"></i>
                                </div>
                                <span>Logout</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
        <!-- end nav right -->
    </div>
    <!-- end navbar -->

    <!-- sidebar -->
    <div class="sidebar">
        <ul class="sidebar-nav">
            <li class="sidebar-nav-item">
                <a href="#" class="sidebar-nav-link active" data-content="home">
                    <div>
                        <i class="fas fa-home"></i>
                    </div>
                    <span>Home</span>
                </a>
            </li>
            <li class="sidebar-nav-item">
                <a href="#" class="sidebar-nav-link" data-content="inventory">
                    <div>
                        <i class="fas fa-boxes"></i>
                    </div>
                    <span>Inventory</span>
                </a>
            </li>
            <li class="sidebar-nav-item">
                <a href="#" class="sidebar-nav-link" data-content="pos">
                    <div>
                        <i class="fas fa-cash-register"></i>
                    </div>
                    <span>POS</span>
                </a>
            </li>
            <li class="sidebar-nav-item">
                <a href="#" class="sidebar-nav-link" data-content="sales">
                    <div>
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <span>Sales</span>
                </a>
            </li>
            <?php if ($role == 'admin'): ?>
            <li class="sidebar-nav-item">
                <a href="#" class="sidebar-nav-link" data-content="user">
                    <div>
                        <i class="fas fa-user"></i>
                    </div>
                    <span>Users</span>
                </a>
            </li>
            <?php endif; ?>
            <li class="sidebar-nav-item">
                <a href="#" class="sidebar-nav-link" data-content="backup">
                    <div>
                        <i class="fas fa-database"></i>
                    </div>
                    <span>Backup</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- End of Sidebar -->

    <!-- main content -->


    <div id="main-content">
        <div id="home" class="content-section" style="display: none;">
            <h1>Home Content</h1>
        </div>



<!-- Start of Inventory Section -->
<div id="inventory" class="content-section" style="display: none;">
    <div class="inventory-container">
        <div class="inventory-table-wrapper">
            <div class="table-title">
                <div class="row align-items-center">
                    <div class="col-sm-5">
                        <h2>Inventory <b>Management</b></h2>
                    </div>
                    <div class="col-sm-7 text-right">
                    <?php if ($role === 'admin'): ?>
                            <a href="#" class="btn btn-primary" onclick="openAddProductModal()"><i class="fas fa-plus"></i> <span>Add New Product</span></a>
                            <a href="#" class="btn btn-secondary" onclick="openCategoryModal()"><i class="fas fa-plus"></i> <span>Category</span></a>
                            <?php endif; ?>
                        <input type="text" id="searchInventoryInput" class="search-input" placeholder="Search products..." onkeyup="searchInventory()">
                        <select id="filterCategoryDropdown" class="filter-dropdown" onchange="filterInventory()">
                            <option value="">All Categories</option>
                            <!-- Populate categories dynamically -->
                            <?php
                            $sql = "SELECT id, category_name FROM categories";
                            $result = $conn->query($sql);
                            if ($result->num_rows > 0) {
                                while ($row = $result->fetch_assoc()) {
                                    echo "<option value='{$row['category_name']}'>{$row['category_name']}</option>";
                                }
                            }
                            ?>
                        </select>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-hover inventory-table">
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
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="inventoryTableBody">
                    <?php
$sql = "SELECT inventory.id, inventory.image, inventory.product_code, inventory.product_name, categories.category_name, inventory.stock, inventory.price, inventory.buying_price, inventory.date_added, inventory.updated_at 
        FROM inventory 
        JOIN categories ON inventory.category_id = categories.id
        ORDER BY inventory.id ASC";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        // Determine the stock level class
        $stockClass = '';
        if ($row['stock'] <= 10) {
            $stockClass = 'low-stock';
        } elseif ($row['stock'] <= 20) {
            $stockClass = 'medium-stock';
        } else {
            $stockClass = 'high-stock';
        }

        echo "<tr>";
        echo "<td>{$row['id']}</td>";
        echo "<td><img src='uploads/{$row['image']}' alt='{$row['product_name']}' width='50'></td>";
        echo "<td>{$row['product_code']}</td>";
        echo "<td>{$row['product_name']}</td>";
        echo "<td>{$row['category_name']}</td>";
        echo "<td class='{$stockClass}'>{$row['stock']}</td>";
        echo "<td>{$row['price']}</td>";
        echo "<td>{$row['buying_price']}</td>";
        echo "<td>{$row['date_added']}</td>";
        echo "<td>{$row['updated_at']}</td>";
        echo "<td>";
      
            echo "<a href='#' class='inventory-edit-btn' onclick='openEditInventoryProductModal({$row['id']})'><i class='fas fa-edit'></i></a>";
            echo "<a href='#' class='delete-btn' data-id='{$row['id']}' onclick='openInventoryDeleteModal({$row['id']})'><i class='fas fa-trash'></i></a>";
        }
        echo "</td>";
        echo "</tr>";
    }
    echo "<tr><td colspan='11'>No records found</td></tr>";

?>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-6">
                        <div id="inventoryCountMessage"></div>
                    </div>
                    <div class="col-sm-6 text-right">
                        <div class="pagination">
                            <button class="btn btn-secondary" onclick="prevInventoryPage()">Previous</button>
                            <span id="inventoryPageInfo"></span>
                            <button class="btn btn-secondary" onclick="nextInventoryPage()">Next</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Edit Inventory Modal -->
<div id="editInventoryProductModal" class="inventory-edit-modal">
    <div class="inventory-edit-modal-content">
        <span class="close" onclick="closeEditInventoryProductModal()">&times;</span>
        <h2>Edit Product</h2>
        <form id="editInventoryProductForm" enctype="multipart/form-data">
            <div class="input-group">
                <label for="editInventoryProductImage">Product Image</label>
                <img id="editInventoryProductImagePreview" src="" alt="Product Image" style="width: 100px; height: auto; border-radius: 8px;">
                <input type="file" id="editInventoryProductImage" name="image" accept="image/*" onchange="previewEditInventoryProductImage()">
            </div>
            <div class="input-group">
                <label for="editInventoryProductCode">Product Code</label>
                <input type="text" id="editInventoryProductCode" name="product_code" required>
            </div>
            <div class="input-group">
                <label for="editInventoryProductName">Product Name</label>
                <input type="text" id="editInventoryProductName" name="product_name" required>
            </div>
            <div class="input-group">
                <label for="editInventoryStock">Stock</label>
                <input type="number" id="editInventoryStock" name="stock" required>
            </div>
            <div class="input-group">
                <label for="editInventoryPrice">Selling Price</label>
                <input type="number" step="0.01" id="editInventoryPrice" name="price" required>
            </div>
            <div class="input-group">
                <label for="editInventoryBuyingPrice">Buying Price</label>
                <input type="number" step="0.01" id="editInventoryBuyingPrice" name="buying_price" required>
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </div>
</div>

<!-- Add Product Modal -->
<div id="addProductModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeAddProductModal()">&times;</span>
        <h2>Add New Product</h2>
        <form id="addProductForm" enctype="multipart/form-data">
            <div class="input-group">
                <label for="productCode">Product Code</label>
                <input type="text" id="productCode" name="product_code" required>
            </div>
            <div class="input-group">
                <label for="productName">Product Name</label>
                <input type="text" id="productName" name="product_name" required>
            </div>
            <div class="input-group">
                <label for="categoryId">Category</label>
                <select id="categoryId" name="category_id" required>
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
            <div class="input-group">
                <label for="stock">Stock</label>
                <input type="number" id="stock" name="stock" required>
            </div>
            <div class="input-group">
                <label for="price">Selling Price</label>
                <input type="number" step="0.01" id="price" name="price" required>
            </div>
            <div class="input-group">
                <label for="buyingPrice">Buying Price</label>
                <input type="number" step="0.01" id="buyingPrice" name="buying_price" required>
            </div>
            <div class="input-group">
                <label for="productImage">Product Image</label>
                <input type="file" id="productImage" name="image" accept="image/*" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>
    </div>
</div>

<!-- Inventory Delete Modal -->
<div id="inventoryDeleteModal" class="inventory-modal">
    <div class="inventory-modal-content">
        <span class="close" onclick="closeInventoryDeleteModal()">&times;</span>
        <h2>Confirm Delete</h2>
        <p>Are you sure you want to delete this product?</p>
        <button class="btn btn-danger" onclick="confirmInventoryDelete()">Yes</button>
        <button class="btn btn-secondary" onclick="closeInventoryDeleteModal()">Cancel</button>
    </div>
</div>

<!-- Inventory Success Modal -->
<div id="inventorySuccessModal" class="inventory-modal">
    <div class="inventory-modal-content">
        <span class="close" onclick="closeInventorySuccessModal()">&times;</span>
        <h2>Success!</h2>
        <p>Product has been deleted successfully.</p>
        <button class="btn btn-success" onclick="closeInventorySuccessModal()">OK</button>
    </div>
</div>

<!-- Backdrop -->
<div id="backdrop" class="backdrop"></div>


<!-- Category Management Modal -->
<div id="categoryModal" class="category-modal">
    <div class="category-modal-content">
        <span class="close" onclick="closeCategoryModal()">&times;</span>
        <h2>Category Management</h2>
        <form id="addCategoryForm">
            <div class="input-group">
                <label for="categoryName">Category Name</label>
                <input type="text" id="categoryName" name="category_name" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Category</button>
        </form>
        <h3>Existing Categories</h3>
        <table class="table table-striped table-hover" id="categoryTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Category Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <?php
            // Fetch categories from the database
            $sql = "SELECT id, category_name FROM categories ORDER BY id ASC";
            $result = $conn->query($sql);
            $categories = [];
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $categories[] = $row;
                }
            }

            foreach ($categories as $category) {
                echo "<tr>
                        <td>{$category['id']}</td>
                        <td>{$category['category_name']}</td>
                        <td style='width: 20%; text-align: center;'>
                            <a href='#' class='btn btn-sm btn-info' title='Edit' data-toggle='tooltip' onclick='openEditCategoryModal({$category['id']}, \"{$category['category_name']}\")'><i class='fas fa-edit'></i></a>
                            <a href='#' class='btn btn-sm btn-danger' title='Delete' data-toggle='tooltip' onclick='deleteCategory({$category['id']})'><i class='fas fa-trash'></i></a>
                        </td>
                      </tr>";
            }
            ?>
            </tbody>
        </table>
    </div>
</div>

<!-- Mini Edit Category Modal -->
<div id="editCategoryModal" class="mini-category-modal">
    <div class="mini-category-modal-content">
        <span class="close" onclick="closeEditCategoryModal()">&times;</span>
        <h2>Edit Category</h2>
        <form id="editCategoryForm">
            <input type="hidden" id="editCategoryId" name="category_id">
            <div class="input-group">
                <label for="editCategoryName">Category Name</label>
                <input type="text" id="editCategoryName" name="category_name" required>
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </div>
</div>

<!-- Overlay for Mini Modal -->
<div id="miniModalOverlay" class="mini-modal-overlay"></div>

<!-- End of Inventory Section -->






<div id="pos" class="content-section" style="display: none;">
    <div class="pos-container" style="display: flex; flex-direction: row;">
        <!-- Section 1: Categories -->
        <div id="categories-section" class="pos-section">
            <h2>Categories</h2>
            <ul id="categories-list"></ul>
        </div>
        <!-- Section 2: Items -->
        <div id="items-section" class="pos-section">
            <h2>Items</h2>
            <div id="items-list" class="items-container"></div>
        </div>
        <!-- Section 3: Bill -->
        <div id="bill-section" class="pos-section">
            <h2>Bill</h2>
            <table id="bill-table">
                <thead>
                    <tr>
                        <th>Description</th>
                        <th>Qty</th>
                        <th>Price</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="bill-list"></tbody>
            </table>
            <div class="bill-summary">
                <div class="bill-summary-item">
                    <span>Total:</span>
                    <span id="total-amount">₱0.00</span>
                </div>
                <div class="bill-summary-item">
                    <label for="cash-amount">Cash:</label>
                    <input type="number" id="cash-amount" class="cash-input">
                </div>
                <div class="bill-summary-item">
                    <span>Balance:</span>
                    <span id="balance-amount">₱0.00</span>
                </div>
                <div class="bill-summary-item">
                    <label for="payment-method">Payment Method:</label>
                    <select id="payment-method">
                        <option value="cash">Cash</option>
                        <option value="gcash">GCash</option>
                    </select>
                </div>
                <div id="gcash-details" style="display: none;">
                    <label for="gcash-number">Reference Number:</label>
                    <input type="text" id="gcash-number">
                    <label for="gcash-amount">Amount Paid:</label>
                    <input type="number" id="gcash-amount">
                    <label for="gcash-notes">Notes:</label>
                    <textarea id="gcash-notes"></textarea>
                </div>
                <button id="complete-sale-btn">Complete Sale</button>
            </div>
        </div>
    </div>
</div>

<!-- Receipt Modal -->
<div id="receipt-modal" class="receipt-modal">
    <div class="receipt-modal-content">
        <span class="receipt-close-btn">&times;</span>
        <div class="receipt-header">
            <h2>AllEnOne Store</h2>
            <p>Address: 123 Main St, City, Country</p>
            <p>Tel: (123) 456-7890</p>
        </div>
        <div class="receipt-body">
            <p>Cashier: <span id="cashier-name"></span></p>
            <p>ID: <span id="sale-id"></span></p>
            <p>Date: <span id="sale-date"></span></p>
            <p>Mode of Payment: <span id="payment-mode"></span></p>
            <table id="receipt-table">
                <thead>
                    <tr>
                        <th>Description</th>
                        <th>Qty</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody id="receipt-list"></tbody>
            </table>
            <div class="receipt-summary">
                <p>Total: <span id="receipt-total"></span></p>
                <p>Qty Total: <span id="receipt-qty-total"></span></p>
            </div>
        </div>
        <div class="receipt-footer">
            <p>Thank you, come again!</p>
        </div>
    </div>
</div>


        <div id="sales" class="content-section" style="display: none;">
            <h1>Sales Content</h1>
        </div>


                        <!-- Start User Section  -->
     
<div id="user" class="content-section" style="display: none;">
    <div class="container-xl">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row align-items-center">
                        <div class="col-sm-5">
                            <h2>User <b>Management</b></h2>
                        </div>
                        <div class="col-sm-7 text-right">
                            <a href="#" class="btn btn-primary" onclick="openAddUserModal()"><i class="fas fa-user-plus"></i> <span>Add New User</span></a>
                            <a href="#" class="btn btn-info" onclick="openActivityModal()"><i class="fas fa-list"></i> <span>Logged Activity</span></a>
                            <input type="text" id="searchInput" placeholder="Search users..." onkeyup="searchUsers()">
                            <select id="filterDropdown" onchange="filterUsers()">
                                <option value="">All Roles & Statuses</option>
                                <option value="admin">Admin</option>
                                <option value="cashier">Cashier</option>
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover" id="userTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Date Created</th>
                            <th class="text-center">Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php
                    // Fetch users from the database
                    $sql = "SELECT id, first_name, last_name, username, email, role, COALESCE(image, 'default.jpg') AS image, created_at, status FROM users";
                    $result = $conn->query($sql);
                    $users = [];
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            $users[] = $row;
                        }
                    }
                    ?>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-6">
                        <div id="userCountMessage"></div>
                    </div>
                    <div class="col-sm-6 text-right">
                        <div class="pagination">
                            <button class="btn btn-secondary" onclick="prevPage()">Previous</button>
                            <span id="pageInfo"></span>
                            <button class="btn btn-secondary" onclick="nextPage()">Next</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    const users = <?php echo json_encode($users); ?>;
</script>


<!-- Activity Modal -->
<div id="activityModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeActivityModal()">&times;</span>
        <h2>Logged Activity</h2>
        <div class="table-responsive">
            <table class="table table-striped table-hover" id="activityTable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Activity Type</th>
                        <th>Activity Time</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Activity records will be populated here -->
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div id="activityCountMessage"></div>
            </div>
            <div class="col-sm-6 text-right">
                <div class="pagination">
                    <button class="btn btn-secondary" onclick="prevActivityPage()">Previous</button>
                    <span id="activityPageInfo"></span>
                    <button class="btn btn-secondary" onclick="nextActivityPage()">Next</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Edit Modal -->
<div id="editModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeEditModal()">&times;</span>
        <h2>Edit User</h2>
        <form id="editForm">
            <div class="profile-picture-container">
                <img id="profilePicturePreview" src="uploads/default.jpg" alt="Profile Picture" class="profile-picture">
                <label for="editImage" class="change-image-label">
                    <i class="fas fa-camera"></i>
                </label>
                <input type="file" id="editImage" name="image" accept="image/*" style="display: none;" onchange="previewProfilePicture(event)">
            </div>
            <input type="hidden" id="editUserId" name="user_id">
            <div class="input-group-horizontal">
                <div class="input-group">
                    <label for="editFirstName">First Name</label>
                    <input type="text" id="editFirstName" name="first_name" required>
                </div>
                <div class="input-group">
                    <label for="editLastName">Last Name</label>
                    <input type="text" id="editLastName" name="last_name" required>
                </div>
            </div>
            <div class="input-group">
                <label for="editUsername">Username</label>
                <input type="text" id="editUsername" name="username" required>
            </div>
            <div class="input-group">
                <label for="editEmail">Email</label>
                <input type="email" id="editEmail" name="email" required>
            </div>
            <div class="input-group">
                <label for="editRole">Role</label>
                <select id="editRole" name="role" required>
                    <option value="admin">Admin</option>
                    <option value="cashier">Cashier</option>
                </select>
            </div>
            <div class="input-group">
                <label for="editStatus">Status</label>
                <select id="editStatus" name="status" required>
                    <option value="active">Active</option>
                    <option value="inactive">Inactive</option>
                </select>
            </div>
            <div class="input-group">
                <label for="editPassword">Password</label>
                <input type="password" id="editPassword" name="password">
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </div>
</div>

<!-- Delete Modal -->
<div id="deleteModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeDeleteModal()">&times;</span>
        <h2>Confirm Delete</h2>
        <p>Are you sure you want to delete this user?</p>
        <button class="btn btn-danger" onclick="confirmDelete()">Yes</button>
        <button class="btn btn-secondary" onclick="closeDeleteModal()">Cancel</button>
    </div>
</div>

<!-- Success Modal -->
<div id="successModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeSuccessModal()">&times;</span>
        <h2>Success!</h2>
        <p>User has been deleted successfully.</p>
        <button class="btn btn-success" onclick="closeSuccessModal()">OK</button>
    </div>
</div>

<!-- Backdrop -->
<div id="backdrop" class="backdrop"></div>

<!-- Add New User Modal -->
<div id="addUserModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeAddUserModal()">&times;</span>
        <h2>Add New User</h2>
        <form id="addUserForm">
            <div class="profile-picture-container">
                <img id="addProfilePicturePreview" src="uploads/default.jpg" alt="Profile Picture" class="profile-picture">
                <label for="addImage" class="change-image-label">
                    <i class="fas fa-camera"></i>
                </label>
                <input type="file" id="addImage" name="image" accept="image/*" style="display: none;" onchange="previewAddProfilePicture(event)">
            </div>
            <div class="input-group-horizontal">
                <div class="input-group">
                    <label for="addFirstName">First Name</label>
                    <input type="text" id="addFirstName" name="first_name" required>
                </div>
                <div class="input-group">
                    <label for="addLastName">Last Name</label>
                    <input type="text" id="addLastName" name="last_name" required>
                </div>
            </div>
            <div class="input-group">
                <label for="addUsername">Username</label>
                <input type="text" id="addUsername" name="username" required>
            </div>
            <div class="input-group">
                <label for="addEmail">Email</label>
                <input type="email" id="addEmail" name="email" required>
            </div>
            <div class="input-group">
                <label for="addRole">Role</label>
                <select id="addRole" name="role" required>
                    <option value="admin">Admin</option>
                    <option value="cashier">Cashier</option>
                </select>
            </div>
            <div class="input-group">
                <label for="addStatus">Status</label>
                <select id="addStatus" name="status" required>
                    <option value="active">Active</option>
                    <option value="inactive">Inactive</option>
                </select>
            </div>
            <div class="input-group">
                <label for="addPassword">Password</label>
                <input type="password" id="addPassword" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Add User</button>
        </form>
    </div>
</div>
            <!-- End User Section  -->

        <div id="backup" class="content-section" style="display: none;">
            <h1>Backup Content</h1>
        </div>
    </div>
    <!-- end main content -->

    <!-- import script -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
    <script src="index.js"></script>

    <script>const userId = <?php echo json_encode($_SESSION['user_id']); ?>;</script>

    
    <script>
        const role = '<?php echo $role; ?>';
    </script>

    <!-- Start Add Product Modal -->

    <script>
function openAddProductModal() {
    document.getElementById('addProductModal').style.display = 'block';
}

function closeAddProductModal() {
    document.getElementById('addProductModal').style.display = 'none';
}
</script>

<!-- End Add Product Modal -->

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


    <!-- end import script -->
</body>
</html>