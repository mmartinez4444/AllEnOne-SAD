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
    
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">

    
    <link rel="icon" type="image/png" href="assets/logo.png"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
    <link rel="stylesheet" type="text/css" href="fontawesome-free/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
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
            <li class="nav-item avt-wrapper">
                <div class="avt dropdown">
                    <?php
                    if (isset($_SESSION['user_id'])) {
                        $user_id = $_SESSION['user_id'];
                        $sql = "SELECT image FROM users WHERE id='$user_id'";
                        $result = $conn->query($sql);
                        if ($result && $result->num_rows > 0) {
                            $row = $result->fetch_assoc();
                            $image = $row['image'];
                        } else {
                            $image = 'default.jpg'; // Fallback image
                        }
                    } else {
                        $image = 'default.jpg'; // Fallback image
                    }
                    ?>
                    <img src="uploads/<?php echo htmlspecialchars($image); ?>" alt="User image" class="dropdown-toggle" data-toggle="user-menu">
                    <ul id="user-menu" class="dropdown-menu">
                        <li class="dropdown-menu-item">
                            <a class="dropdown-menu-link">
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
        <div id="inventory" class="content-section" style="display: none;">
            <h1>Inventory Content</h1>
        </div>
        <div id="pos" class="content-section" style="display: none;">
            <h1>POS Content</h1>
        </div>
        <div id="sales" class="content-section" style="display: none;">
            <h1>Sales Content</h1>
        </div>
        <?php if ($role == 'admin'): ?>
        <div id="user" class="content-section" style="display: none;">
            <h1>Users Content</h1>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-box clearfix">
                            <div class="table-responsive">
                                <table class="table user-list">
                                    <thead>
                                        <tr>
                                            <th><span>User</span></th>
                                            <th><span>Created</span></th>
                                            <th class="text-center"><span>Status</span></th>
                                            <th><span>Email</span></th>
                                            <th>&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $sql = "SELECT id, first_name, last_name, username, email, role, image, created_at, status FROM users";
                                        $result = $conn->query($sql);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $status_class = $row['status'] == 'active' ? 'label-success' : 'label-default';
                                                $status_text = ucfirst($row['status']);
                                                echo "<tr>
                                                    <td>
                                                        <img src='uploads/{$row['image']}' alt=''>
                                                        <a href='#' class='user-link'>{$row['first_name']} {$row['last_name']}</a>
                                                        <span class='user-subhead'>{$row['role']}</span>
                                                    </td>
                                                    <td>{$row['created_at']}</td>
                                                    <td class='text-center'>
                                                        <span class='label {$status_class}'>{$status_text}</span>
                                                    </td>
                                                    <td><a href='mailto:{$row['email']}'>{$row['email']}</a></td>
                                                    <td style='width: 20%;'>
                                                        <a href='#' class='table-link'>
                                                            <span class='fa-stack'>
                                                                <i class='fa fa-square fa-stack-2x'></i>
                                                                <i class='fa fa-search-plus fa-stack-1x fa-inverse'></i>
                                                            </span>
                                                        </a>
                                                        <a href='#' class='table-link'>
                                                            <span class='fa-stack'>
                                                                <i class='fa fa-square fa-stack-2x'></i>
                                                                <i class='fa fa-pencil fa-stack-1x fa-inverse'></i>
                                                            </span>
                                                        </a>
                                                        <a href='#' class='table-link danger'>
                                                            <span class='fa-stack'>
                                                                <i class='fa fa-square fa-stack-2x'></i>
                                                                <i class='fa fa-trash-o fa-stack-1x fa-inverse'></i>
                                                            </span>
                                                        </a>
                                                    </td>
                                                </tr>";
                                            }
                                        } else {
                                            echo "<tr><td colspan='5'>No users found</td></tr>";
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                            <ul class="pagination pull-right">
                                <li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php endif; ?>
        <div id="backup" class="content-section" style="display: none;">
            <h1>Backup Content</h1>
        </div>
    </div>
    <!-- end main content -->

    <!-- import script -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
    <script src="index.js"></script>

    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <script type="text/javascript"></script>
    <!-- end import script -->
</body>
</html>