-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2024 at 07:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sad_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`) VALUES
(8, 'Basic Medicines'),
(1, 'Beveragesa'),
(3, 'Canned and Preserved Goods'),
(4, 'Condiments and Cooking Essentials'),
(10, 'Fresh Goods'),
(16, 'GCash'),
(7, 'Household Items'),
(15, 'Ikinamada'),
(12, 'Mobile Load and Accessoriessasd'),
(6, 'Personal Care Products'),
(5, 'Rice and Grains'),
(11, 'School and Office Supplies'),
(2, 'Snacks'),
(9, 'Tobacco and Alcohol');

-- --------------------------------------------------------

--
-- Table structure for table `gcash_transactions`
--

CREATE TABLE `gcash_transactions` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `gcash_number` varchar(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gcash_transactions`
--

INSERT INTO `gcash_transactions` (`id`, `sale_id`, `gcash_number`, `amount`, `transaction_date`, `notes`) VALUES
(2, 165, 'testtite2', 130.00, '2024-11-19 08:16:15', 'as'),
(3, 166, 'testtite2', 130.00, '2024-11-19 08:16:15', 'as'),
(4, 167, 'testtite2', 130.00, '2024-11-19 08:16:16', 'as'),
(5, 168, 'gagoka', 195.00, '2024-11-19 08:21:16', 'notesss'),
(6, 169, 'gagoka', 195.00, '2024-11-19 08:21:16', 'notesss'),
(7, 170, 'gagoka', 195.00, '2024-11-19 08:21:16', 'notesss'),
(8, 171, 'gagoka', 195.00, '2024-11-19 08:21:16', 'notesss'),
(9, 172, '123', 650.00, '2024-11-19 08:28:44', 'tite'),
(10, 173, 'zxc', 91.00, '2024-11-19 08:41:06', '1asd'),
(11, 174, 'zxc', 91.00, '2024-11-19 08:41:07', '1asd'),
(12, 175, 'zxc', 91.00, '2024-11-19 08:41:07', '1asd'),
(13, 176, '123', 123.00, '2024-11-19 08:44:12', '21sczxczc'),
(14, 177, '123', 123.00, '2024-11-19 08:44:12', '21sczxczc'),
(15, 178, '123', 123.00, '2024-11-19 08:44:12', '21sczxczc'),
(16, 181, '9999', 100.00, '2024-11-19 08:54:36', '75 t anginamo'),
(17, 205, 'qweqwe2ss', 50.00, '2024-11-19 15:08:22', '9999999'),
(18, 221, 'Zeus', 400.00, '2024-11-19 16:57:30', 'Wala lang'),
(19, 222, 'Zeus', 400.00, '2024-11-19 16:57:30', 'Wala lang'),
(20, 223, 'Zeus', 400.00, '2024-11-19 16:57:30', 'Wala lang'),
(21, 231, 'nice', 123.00, '2024-11-19 17:30:17', '123'),
(22, 326, 'asd', 123.00, '2024-11-19 18:23:14', '1233123123'),
(23, 372, 'gcashhhh', 24.00, '2024-11-20 16:13:02', 'tanginamogago kata'),
(24, 373, '', 200.00, '2024-11-20 16:24:23', '200 test'),
(25, 427, 'hays', 500.00, '2024-11-20 17:02:01', '213'),
(26, 428, 'hays', 500.00, '2024-11-20 17:02:01', '213'),
(27, 429, 'hays', 500.00, '2024-11-20 17:02:01', '213'),
(28, 432, 'qweqweqwe', 1100.00, '2024-11-20 18:24:46', 'tasdzxc'),
(29, 433, 'qweqweqwe', 1100.00, '2024-11-20 18:24:47', 'tasdzxc');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `buying_price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT 'products.png',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_code`, `product_name`, `category_id`, `stock`, `price`, `buying_price`, `image`, `date_added`, `updated_at`) VALUES
(1, 'BEV001', 'Coca-Cola 1.5L5123', 1, 0, 65.00, 55.00, 'coca cola.webp', '2024-11-15 16:11:01', '2024-11-20 18:29:58'),
(2, 'BEV002', 'Royal Tru-Orange 500ml', 1, 0, 30.00, 25.00, 'trabis.webp', '2024-11-15 16:11:01', '2024-11-19 18:52:30'),
(3, 'SNK001', 'Piattos Cheese', 2, 0, 25.00, 20.00, 'trabis.webp', '2024-11-15 16:11:01', '2024-11-19 16:57:30'),
(4, 'SNK002', 'Nova Multigrain Chips', 2, -18, 20.00, 15.00, 'trabis.webp', '2024-11-15 16:11:01', '2024-11-19 18:53:31'),
(5, 'CND001', 'Century Tuna Hot & Spicy', 3, 0, 35.00, 30.00, 'Oliv.jpg', '2024-11-15 16:11:01', '2024-11-17 19:07:41'),
(6, 'CND002', '555 Sardines in Tomato Sauce', 3, 0, 20.00, 15.00, '1fba2514-3f00-4787-a049-9a952e645e38-1661841297142.jpeg', '2024-11-15 16:11:01', '2024-11-17 19:24:20'),
(7, 'COND001', 'Datu Puti Soy Sauce 1L', 4, 0, 45.00, 40.00, '1fba2514-3f00-4787-a049-9a952e645e38-1661841297142.jpeg', '2024-11-15 16:11:01', '2024-11-19 15:08:22'),
(8, 'COND002', 'Silver Swan Vinegar 750ml', 4, 0, 40.00, 35.00, 'Oliv.jpg', '2024-11-15 16:11:01', '2024-11-19 08:28:44'),
(9, 'RCE001', 'Sinandomeng Rice 5kg', 5, 0, 250.00, 220.00, 'e4b8ed1e8dcb3bf993cb91f4b00b203c_large.png', '2024-11-15 16:11:01', '2024-11-17 18:15:16'),
(10, 'RCE002', 'Jasmine Rice 5kg', 5, 19, 300.00, 270.00, 'logo-ptc.png', '2024-11-15 16:11:01', '2024-11-20 18:53:40'),
(11, 'PC001', 'Safeguard Soap White', 6, 4, 30.00, 25.00, 'safeguard.png', '2024-11-15 16:11:01', '2024-11-20 18:41:15'),
(12, 'PC002', 'Colgate Toothpaste 150g', 6, 11, 85.00, 75.00, 'colgate.png', '2024-11-15 16:11:01', '2024-11-20 17:02:01'),
(13, 'HH001', 'Surf Detergent Powder 65g', 7, 55, 10.00, 8.00, 'surf.png', '2024-11-15 16:11:01', '2024-11-20 16:49:02'),
(14, 'HH002', 'Downy Fabric Conditioner 200ml', 7, 19, 45.00, 40.00, 'downy.png', '2024-11-15 16:11:01', '2024-11-20 16:49:02'),
(15, 'MED001', 'Bioflu 500mg Tablet', 8, 94, 8.00, 6.00, 'bioflu.png', '2024-11-15 16:11:01', '2024-11-20 16:49:02'),
(16, 'MED002', 'Alaxan FR Capsule', 8, 46, 12.00, 10.00, 'alaxan.png', '2024-11-15 16:11:01', '2024-11-20 16:49:02'),
(17, 'TBA001', 'Marlboro Red', 9, 24, 120.00, 100.00, 'marlboro.png', '2024-11-15 16:11:01', '2024-11-20 16:49:02'),
(18, 'TBA002', 'San Miguel Pale Pilsen', 9, 44, 45.00, 40.00, 'san-miguel.png', '2024-11-15 16:11:01', '2024-11-20 16:49:02'),
(19, 'FRS001', 'Red Onions 1kg', 10, 36, 120.00, 100.00, 'onions.png', '2024-11-15 16:11:01', '2024-11-20 16:49:02'),
(20, 'FRS002', 'Fresh Eggs 1 Dozen', 10, 24, 85.00, 75.00, 'eggs.png', '2024-11-15 16:11:01', '2024-11-20 16:49:03'),
(21, 'SOS001', 'Pilot G2 Gel Pen Black', 11, 97, 30.00, 25.00, 'pilot-pen.png', '2024-11-15 16:11:01', '2024-11-20 16:49:03'),
(23, 'ML001', 'Globe Load 100', 12, 192, 100.00, 95.00, 'globe-load.png', '2024-11-15 16:11:01', '2024-11-20 16:49:03'),
(24, 'ML002', 'Smart Load 50', 12, 297, 50.00, 47.00, 'trabis.webp', '2024-11-15 16:11:01', '2024-11-20 16:49:03'),
(30, 'Gcash', 'Gcash Cash-In Cash-Out', 16, 283, 0.00, 0.00, 'trabis.webp', '2024-11-20 16:02:56', '2024-11-20 17:01:30'),
(32, 'check lang', 'ch', 8, 12, 12.00, 12.00, 'coca cola.webp', '2024-11-20 18:52:14', '2024-11-20 18:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `login_activity`
--

CREATE TABLE `login_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_type` enum('login','logout') NOT NULL,
  `activity_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_activity`
--

INSERT INTO `login_activity` (`id`, `user_id`, `activity_type`, `activity_time`) VALUES
(516, 50, 'logout', '2024-11-19 08:27:13'),
(517, 50, 'login', '2024-11-19 08:27:14'),
(518, 50, 'logout', '2024-11-19 09:03:34'),
(519, 81, 'login', '2024-11-19 09:04:32'),
(520, 81, 'logout', '2024-11-19 09:18:02'),
(521, 50, 'login', '2024-11-19 09:18:08'),
(522, 50, 'logout', '2024-11-19 09:58:21'),
(523, 1, 'login', '2024-11-19 09:58:31'),
(524, 1, 'logout', '2024-11-19 17:30:43'),
(525, 81, 'login', '2024-11-19 17:30:50'),
(526, 81, 'logout', '2024-11-19 17:44:28'),
(527, 50, 'login', '2024-11-19 17:48:36'),
(528, 50, 'logout', '2024-11-19 18:23:41'),
(529, 1, 'login', '2024-11-19 18:23:47'),
(530, 1, 'login', '2024-11-19 18:48:52'),
(531, 1, 'logout', '2024-11-19 18:49:21'),
(532, 81, 'login', '2024-11-19 18:49:28'),
(533, 81, 'logout', '2024-11-19 18:51:18'),
(534, 1, 'login', '2024-11-19 18:51:30'),
(535, 1, 'login', '2024-11-20 13:47:46'),
(536, 1, 'logout', '2024-11-20 15:47:17'),
(537, 50, 'login', '2024-11-20 15:47:20'),
(538, 50, 'logout', '2024-11-20 16:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `payment_mode` enum('cash','gcash') NOT NULL,
  `change_amount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `quantity`, `total_price`, `sale_date`, `user_id`, `payment_mode`, `change_amount`) VALUES
(164, 3, 1, 25.00, '2024-11-19 08:16:15', NULL, 'gcash', 0.00),
(165, 7, 1, 45.00, '2024-11-19 08:16:15', NULL, 'gcash', 0.00),
(166, 8, 1, 40.00, '2024-11-19 08:16:15', NULL, 'gcash', 0.00),
(167, 4, 1, 20.00, '2024-11-19 08:16:16', NULL, 'gcash', 0.00),
(168, 3, 1, 25.00, '2024-11-19 08:21:16', NULL, 'gcash', 0.00),
(169, 7, 1, 45.00, '2024-11-19 08:21:16', NULL, 'gcash', 0.00),
(170, 8, 1, 40.00, '2024-11-19 08:21:16', NULL, 'gcash', 0.00),
(171, 12, 1, 85.00, '2024-11-19 08:21:16', NULL, 'gcash', 0.00),
(172, 8, 15, 600.00, '2024-11-19 08:28:44', NULL, 'gcash', 0.00),
(173, 4, 1, 20.00, '2024-11-19 08:41:06', NULL, 'gcash', 0.00),
(174, 3, 1, 25.00, '2024-11-19 08:41:06', NULL, 'gcash', 0.00),
(175, 7, 1, 45.00, '2024-11-19 08:41:07', NULL, 'gcash', 0.00),
(176, 3, 1, 25.00, '2024-11-19 08:44:12', NULL, 'gcash', 0.00),
(177, 4, 1, 20.00, '2024-11-19 08:44:12', NULL, 'gcash', 0.00),
(178, 7, 1, 45.00, '2024-11-19 08:44:12', NULL, 'gcash', 0.00),
(179, 4, 1, 20.00, '2024-11-19 08:54:08', NULL, 'cash', 1.00),
(180, 7, 1, 45.00, '2024-11-19 08:54:08', NULL, 'cash', 1.00),
(181, 3, 1, 25.00, '2024-11-19 08:54:36', NULL, 'gcash', 0.00),
(182, 3, 1, 25.00, '2024-11-19 09:03:12', NULL, 'cash', 5.00),
(183, 4, 1, 20.00, '2024-11-19 09:03:13', NULL, 'cash', 5.00),
(184, 3, 1, 25.00, '2024-11-19 09:04:41', NULL, 'cash', 9.00),
(185, 7, 1, 45.00, '2024-11-19 09:04:41', NULL, 'cash', 9.00),
(186, 4, 1, 20.00, '2024-11-19 09:04:41', NULL, 'cash', 9.00),
(187, 3, 1, 25.00, '2024-11-19 09:10:18', NULL, 'cash', -70.00),
(188, 7, 1, 45.00, '2024-11-19 09:10:18', NULL, 'cash', -70.00),
(189, 3, 1, 25.00, '2024-11-19 09:17:37', 1, 'cash', 7.00),
(190, 7, 1, 45.00, '2024-11-19 09:17:37', 1, 'cash', 7.00),
(191, 3, 1, 25.00, '2024-11-19 09:18:17', 1, 'cash', 0.00),
(192, 4, 1, 20.00, '2024-11-19 09:18:17', 1, 'cash', 0.00),
(200, 3, 1, 25.00, '2024-11-19 10:04:02', 1, 'cash', 41.00),
(201, 7, 1, 45.00, '2024-11-19 10:04:02', 1, 'cash', 41.00),
(202, 3, 1, 25.00, '2024-11-19 15:07:50', 1, 'cash', 10.00),
(203, 7, 1, 45.00, '2024-11-19 15:07:50', 1, 'cash', 10.00),
(204, 4, 1, 20.00, '2024-11-19 15:07:51', 1, 'cash', 10.00),
(205, 7, 1, 45.00, '2024-11-19 15:08:22', 1, 'gcash', 0.00),
(206, 3, 2, 50.00, '2024-11-19 15:09:27', 1, 'cash', 50.00),
(207, 3, 2, 50.00, '2024-11-19 15:27:24', 1, 'cash', 73.00),
(208, 4, 1, 20.00, '2024-11-19 15:27:25', 1, 'cash', 73.00),
(209, 11, 3, 90.00, '2024-11-19 15:27:25', 1, 'cash', 73.00),
(210, 12, 3, 255.00, '2024-11-19 15:27:25', 1, 'cash', 73.00),
(211, 10, 3, 900.00, '2024-11-19 15:27:25', 1, 'cash', 73.00),
(212, 16, 1, 12.00, '2024-11-19 15:27:25', 1, 'cash', 73.00),
(213, 13, 2, 20.00, '2024-11-19 15:27:25', 1, 'cash', 73.00),
(214, 14, 3, 135.00, '2024-11-19 15:27:25', 1, 'cash', 73.00),
(215, 18, 3, 135.00, '2024-11-19 15:27:25', 1, 'cash', 73.00),
(216, 17, 3, 360.00, '2024-11-19 15:27:25', 1, 'cash', 73.00),
(217, 23, 1, 100.00, '2024-11-19 15:27:25', 1, 'cash', 73.00),
(218, 24, 1, 50.00, '2024-11-19 15:27:25', 1, 'cash', 73.00),
(219, 3, 18, 450.00, '2024-11-19 16:37:43', 1, 'cash', 250.00),
(220, 10, 1, 300.00, '2024-11-19 16:37:43', 1, 'cash', 250.00),
(221, 3, 1, 25.00, '2024-11-19 16:57:30', 1, 'gcash', 0.00),
(222, 10, 1, 300.00, '2024-11-19 16:57:30', 1, 'gcash', 0.00),
(223, 11, 1, 30.00, '2024-11-19 16:57:30', 1, 'gcash', 0.00),
(224, 4, 2, 40.00, '2024-11-19 16:58:42', 1, 'cash', 10.00),
(225, 4, 1, 20.00, '2024-11-19 17:00:35', 1, 'cash', 0.00),
(227, 4, 1, 20.00, '2024-11-19 17:04:13', 1, 'cash', -1.00),
(228, 4, 1, 20.00, '2024-11-19 17:07:53', 1, 'cash', 480.00),
(229, 4, 1, 20.00, '2024-11-19 17:25:16', 1, 'cash', 0.00),
(230, 4, 1, 20.00, '2024-11-19 17:29:42', 1, 'cash', 0.00),
(231, 4, 1, 20.00, '2024-11-19 17:30:17', 1, 'gcash', 0.00),
(232, 4, 1, 20.00, '2024-11-19 17:31:08', 1, 'cash', 5.00),
(233, 4, 1, 20.00, '2024-11-19 17:31:45', 1, 'cash', 0.00),
(234, 4, 1, 20.00, '2024-11-19 17:40:24', 81, 'cash', 0.00),
(235, 4, 1, 20.00, '2024-11-19 17:44:14', 81, 'cash', 0.00),
(236, 4, 1, 20.00, '2024-11-19 17:48:41', 50, 'cash', 0.00),
(237, 4, 1, 20.00, '2024-11-19 17:48:42', 50, 'cash', 0.00),
(238, 4, 1, 20.00, '2024-11-19 17:48:45', 50, 'cash', 0.00),
(239, 4, 1, 20.00, '2024-11-19 17:48:45', 50, 'cash', 0.00),
(240, 4, 1, 20.00, '2024-11-19 17:48:45', 50, 'cash', 0.00),
(241, 4, 1, 20.00, '2024-11-19 17:48:55', 50, 'cash', 0.00),
(242, 4, 1, 20.00, '2024-11-19 17:48:56', 50, 'cash', 0.00),
(243, 4, 1, 20.00, '2024-11-19 17:48:57', 50, 'cash', 0.00),
(244, 4, 1, 20.00, '2024-11-19 17:48:57', 50, 'cash', 0.00),
(245, 4, 1, 20.00, '2024-11-19 17:48:57', 50, 'cash', 0.00),
(246, 4, 1, 20.00, '2024-11-19 17:49:11', 50, 'cash', 0.00),
(247, 4, 1, 20.00, '2024-11-19 17:49:17', 50, 'cash', 0.00),
(248, 4, 1, 20.00, '2024-11-19 17:49:18', 50, 'cash', 0.00),
(249, 4, 1, 20.00, '2024-11-19 17:49:20', 50, 'cash', 0.00),
(250, 4, 1, 20.00, '2024-11-19 17:49:20', 50, 'cash', 0.00),
(251, 4, 1, 20.00, '2024-11-19 17:49:20', 50, 'cash', 0.00),
(252, 4, 1, 20.00, '2024-11-19 17:49:30', 50, 'cash', 0.00),
(253, 4, 1, 20.00, '2024-11-19 17:51:32', 50, 'cash', 0.00),
(254, 4, 1, 20.00, '2024-11-19 17:57:46', 50, 'cash', 0.00),
(255, 4, 1, 20.00, '2024-11-19 17:57:47', 50, 'cash', 0.00),
(256, 4, 1, 20.00, '2024-11-19 17:57:47', 50, 'cash', 0.00),
(257, 4, 1, 20.00, '2024-11-19 17:57:48', 50, 'cash', 0.00),
(258, 4, 1, 20.00, '2024-11-19 17:58:04', 50, 'cash', 195.00),
(259, 4, 1, 20.00, '2024-11-19 17:58:05', 50, 'cash', 195.00),
(260, 4, 1, 20.00, '2024-11-19 18:01:10', 50, 'cash', 0.00),
(261, 4, 1, 20.00, '2024-11-19 18:01:19', 50, 'cash', 0.00),
(262, 4, 1, 20.00, '2024-11-19 18:01:25', 50, 'cash', 0.00),
(263, 4, 1, 20.00, '2024-11-19 18:01:31', 50, 'cash', 0.00),
(264, 4, 1, 20.00, '2024-11-19 18:01:43', 1, 'cash', 0.00),
(265, 4, 1, 20.00, '2024-11-19 18:01:50', 1, 'cash', 0.00),
(266, 4, 1, 20.00, '2024-11-19 18:01:50', 1, 'cash', 0.00),
(267, 4, 2, 40.00, '2024-11-19 18:02:01', 1, 'cash', 10.00),
(268, 4, 2, 40.00, '2024-11-19 18:02:02', 1, 'cash', 10.00),
(269, 10, 1, 300.00, '2024-11-19 18:02:25', 50, 'cash', 0.00),
(270, 4, 1, 20.00, '2024-11-19 18:02:44', 1, 'cash', 0.00),
(271, 4, 1, 20.00, '2024-11-19 18:02:52', 1, 'cash', 0.00),
(272, 4, 3, 60.00, '2024-11-19 18:03:20', 50, 'cash', 40.00),
(273, 4, 3, 60.00, '2024-11-19 18:03:21', 50, 'cash', 40.00),
(274, 4, 3, 60.00, '2024-11-19 18:03:21', 50, 'cash', 40.00),
(275, 4, 3, 60.00, '2024-11-19 18:03:21', 50, 'cash', 40.00),
(276, 4, 3, 60.00, '2024-11-19 18:05:22', 50, 'cash', 530.00),
(277, 4, 3, 60.00, '2024-11-19 18:05:23', 50, 'cash', 530.00),
(278, 4, 2, 40.00, '2024-11-19 18:05:48', 50, 'cash', 10.00),
(279, 4, 2, 40.00, '2024-11-19 18:05:48', 50, 'cash', 10.00),
(280, 4, 1, 20.00, '2024-11-19 18:08:47', 50, 'cash', 0.00),
(281, 4, 1, 20.00, '2024-11-19 18:08:48', 50, 'cash', 0.00),
(282, 4, 1, 20.00, '2024-11-19 18:08:48', 50, 'cash', 0.00),
(283, 4, 1, 20.00, '2024-11-19 18:08:49', 50, 'cash', 0.00),
(284, 4, 1, 20.00, '2024-11-19 18:08:59', 50, 'cash', 0.00),
(285, 4, 1, 20.00, '2024-11-19 18:08:59', 50, 'cash', 0.00),
(286, 4, 1, 20.00, '2024-11-19 18:08:59', 50, 'cash', 0.00),
(287, 4, 1, 20.00, '2024-11-19 18:08:59', 50, 'cash', 0.00),
(288, 4, 1, 20.00, '2024-11-19 18:09:00', 50, 'cash', 0.00),
(289, 4, 1, 20.00, '2024-11-19 18:09:00', 50, 'cash', 0.00),
(290, 4, 1, 20.00, '2024-11-19 18:09:05', 50, 'cash', 0.00),
(291, 4, 1, 20.00, '2024-11-19 18:09:05', 50, 'cash', 0.00),
(292, 4, 1, 20.00, '2024-11-19 18:09:05', 50, 'cash', 0.00),
(293, 4, 1, 20.00, '2024-11-19 18:09:06', 50, 'cash', 0.00),
(294, 4, 1, 20.00, '2024-11-19 18:09:06', 50, 'cash', 0.00),
(295, 4, 1, 20.00, '2024-11-19 18:09:15', 50, 'cash', 0.00),
(296, 4, 1, 20.00, '2024-11-19 18:09:15', 50, 'cash', 0.00),
(297, 4, 1, 20.00, '2024-11-19 18:09:15', 50, 'cash', 0.00),
(298, 4, 1, 20.00, '2024-11-19 18:09:15', 50, 'cash', 0.00),
(299, 4, 1, 20.00, '2024-11-19 18:09:15', 50, 'cash', 0.00),
(300, 4, 1, 20.00, '2024-11-19 18:09:16', 50, 'cash', 0.00),
(301, 4, 1, 20.00, '2024-11-19 18:09:16', 50, 'cash', 0.00),
(302, 4, 1, 20.00, '2024-11-19 18:12:09', 50, 'cash', 0.00),
(303, 4, 1, 20.00, '2024-11-19 18:14:55', 50, 'cash', 0.00),
(304, 4, 1, 20.00, '2024-11-19 18:14:56', 50, 'cash', 0.00),
(305, 4, 1, 20.00, '2024-11-19 18:14:56', 50, 'cash', 0.00),
(306, 4, 1, 20.00, '2024-11-19 18:14:56', 50, 'cash', 0.00),
(307, 4, 1, 20.00, '2024-11-19 18:15:03', 50, 'cash', 0.00),
(308, 4, 1, 20.00, '2024-11-19 18:15:03', 50, 'cash', 0.00),
(309, 4, 1, 20.00, '2024-11-19 18:15:03', 50, 'cash', 0.00),
(310, 4, 1, 20.00, '2024-11-19 18:15:04', 50, 'cash', 0.00),
(311, 4, 1, 20.00, '2024-11-19 18:15:04', 50, 'cash', 0.00),
(312, 4, 1, 20.00, '2024-11-19 18:15:04', 50, 'cash', 0.00),
(313, 4, 1, 20.00, '2024-11-19 18:15:04', 50, 'cash', 0.00),
(314, 4, 6, 120.00, '2024-11-19 18:15:47', 50, 'cash', 0.00),
(315, 4, 6, 120.00, '2024-11-19 18:15:48', 50, 'cash', 0.00),
(316, 4, 6, 120.00, '2024-11-19 18:15:48', 50, 'cash', 0.00),
(317, 4, 1, 20.00, '2024-11-19 18:17:03', 50, 'cash', 0.00),
(318, 4, 1, 20.00, '2024-11-19 18:17:03', 50, 'cash', 0.00),
(319, 4, 1, 20.00, '2024-11-19 18:17:04', 50, 'cash', 0.00),
(320, 4, 1, 20.00, '2024-11-19 18:17:04', 50, 'cash', 0.00),
(321, 4, 1, 20.00, '2024-11-19 18:17:04', 50, 'cash', 0.00),
(322, 4, 1, 20.00, '2024-11-19 18:18:06', 1, 'cash', 0.00),
(323, 4, 1, 20.00, '2024-11-19 18:18:51', 1, 'cash', 0.00),
(324, 4, 1, 20.00, '2024-11-19 18:19:41', 50, 'cash', 0.00),
(325, 4, 1, 20.00, '2024-11-19 18:23:03', 50, 'cash', 0.00),
(326, 4, 1, 20.00, '2024-11-19 18:23:14', 50, 'gcash', 0.00),
(327, 4, 1, 20.00, '2024-11-19 18:24:06', 1, 'cash', 0.00),
(328, 4, 1, 20.00, '2024-11-19 18:49:05', 1, 'cash', 0.00),
(329, 11, 2, 60.00, '2024-11-19 18:49:05', 1, 'cash', 0.00),
(330, 10, 1, 300.00, '2024-11-19 18:49:05', 1, 'cash', 0.00),
(331, 4, 3, 60.00, '2024-11-19 18:49:37', 81, 'cash', 40.00),
(332, 2, 15, 450.00, '2024-11-19 18:52:01', 1, 'cash', 50.00),
(333, 2, 50, 1500.00, '2024-11-19 18:52:30', 1, 'cash', 99999999.99),
(334, 4, 33, 660.00, '2024-11-19 18:53:31', 1, 'cash', 280.00),
(335, 11, 2, 60.00, '2024-11-19 18:53:31', 1, 'cash', 280.00),
(336, 10, 1, 300.00, '2024-11-20 13:48:00', 1, 'cash', 200.00),
(337, 10, 1, 300.00, '2024-11-20 13:48:47', 1, 'cash', 200.00),
(338, 1, 1, 65.00, '2024-11-20 13:56:22', 1, 'cash', 35.00),
(339, 1, 1, 65.00, '2024-11-20 14:15:25', 1, 'cash', 35.00),
(340, 1, 1, 65.00, '2024-11-20 14:19:24', 1, 'cash', 0.00),
(341, 1, 1, 65.00, '2024-11-20 14:19:25', 1, 'cash', 0.00),
(342, 1, 1, 65.00, '2024-11-20 14:19:29', 1, 'cash', 0.00),
(343, 1, 1, 65.00, '2024-11-20 14:19:58', 1, 'cash', 0.00),
(344, 1, 1, 65.00, '2024-11-20 14:20:11', 1, 'cash', 0.00),
(345, 1, 1, 65.00, '2024-11-20 14:20:18', 1, 'cash', 46.00),
(346, 1, 1, 65.00, '2024-11-20 14:23:48', 1, 'cash', 46.00),
(347, 1, 1, 65.00, '2024-11-20 14:24:36', 1, 'cash', 46.00),
(348, 1, 1, 65.00, '2024-11-20 14:28:34', 1, 'cash', 46.00),
(349, 1, 1, 65.00, '2024-11-20 14:33:33', 1, 'cash', 46.00),
(350, 1, 1, 65.00, '2024-11-20 14:34:09', 1, 'cash', 46.00),
(351, 1, 1, 65.00, '2024-11-20 14:37:31', 1, 'cash', 46.00),
(352, 1, 1, 65.00, '2024-11-20 14:44:29', 1, 'cash', 46.00),
(353, 1, 1, 65.00, '2024-11-20 14:45:32', 1, 'cash', 46.00),
(354, 1, 1, 65.00, '2024-11-20 14:49:41', 1, 'cash', 46.00),
(355, 1, 1, 65.00, '2024-11-20 14:53:46', 1, 'cash', 46.00),
(356, 1, 1, 65.00, '2024-11-20 14:54:01', 1, 'cash', 46.00),
(357, 1, 1, 65.00, '2024-11-20 14:57:51', 1, 'cash', 46.00),
(358, 1, 1, 65.00, '2024-11-20 15:04:02', 1, 'cash', 46.00),
(359, 1, 1, 65.00, '2024-11-20 15:10:40', 1, 'cash', 46.00),
(360, 1, 1, 65.00, '2024-11-20 15:19:01', 1, 'cash', 46.00),
(361, 1, 1, 65.00, '2024-11-20 15:23:55', 1, 'cash', 934.00),
(362, 1, 1, 65.00, '2024-11-20 15:25:46', 1, 'cash', 1046.00),
(363, 1, 1, 65.00, '2024-11-20 15:34:58', 1, 'cash', 46.00),
(364, 1, 1, 65.00, '2024-11-20 15:40:33', 1, 'cash', 1046.00),
(365, 1, 1, 65.00, '2024-11-20 15:40:57', 1, 'cash', 1046.00),
(366, 1, 1, 65.00, '2024-11-20 15:41:10', 1, 'cash', 46.00),
(367, 1, 1, 65.00, '2024-11-20 15:43:57', 1, 'cash', 11046.00),
(368, 1, 1, 65.00, '2024-11-20 15:44:27', 1, 'cash', 11046.00),
(369, 1, 24, 1560.00, '2024-11-20 15:46:32', 1, 'cash', 0.00),
(370, 10, 2, 600.00, '2024-11-20 15:47:25', 50, 'cash', 0.00),
(371, 30, 1, 0.00, '2024-11-20 16:04:52', 1, 'cash', 123.00),
(372, 15, 3, 24.00, '2024-11-20 16:13:02', 1, 'gcash', 0.00),
(373, 30, 1, 0.00, '2024-11-20 16:24:23', 1, '', 0.00),
(374, 30, 1, 0.00, '2024-11-20 16:46:39', 1, 'cash', 0.00),
(375, 30, 200, 0.00, '2024-11-20 16:47:03', 1, 'cash', 0.00),
(376, 10, 2, 600.00, '2024-11-20 16:48:37', 1, 'cash', 0.00),
(377, 11, 1, 30.00, '2024-11-20 16:48:37', 1, 'cash', 0.00),
(378, 12, 1, 85.00, '2024-11-20 16:48:37', 1, 'cash', 0.00),
(379, 23, 2, 200.00, '2024-11-20 16:48:38', 1, 'cash', 0.00),
(382, 30, 1, 0.00, '2024-11-20 16:48:38', 1, 'cash', 0.00),
(383, 21, 1, 30.00, '2024-11-20 16:48:38', 1, 'cash', 0.00),
(384, 19, 1, 120.00, '2024-11-20 16:48:38', 1, 'cash', 0.00),
(385, 18, 1, 45.00, '2024-11-20 16:48:38', 1, 'cash', 0.00),
(386, 17, 1, 120.00, '2024-11-20 16:48:38', 1, 'cash', 0.00),
(387, 13, 1, 10.00, '2024-11-20 16:48:38', 1, 'cash', 0.00),
(388, 14, 1, 45.00, '2024-11-20 16:48:38', 1, 'cash', 0.00),
(389, 15, 1, 8.00, '2024-11-20 16:48:38', 1, 'cash', 0.00),
(390, 16, 1, 12.00, '2024-11-20 16:48:38', 1, 'cash', 0.00),
(391, 10, 2, 600.00, '2024-11-20 16:48:38', 1, 'cash', 0.00),
(392, 11, 1, 30.00, '2024-11-20 16:48:39', 1, 'cash', 0.00),
(393, 12, 1, 85.00, '2024-11-20 16:48:39', 1, 'cash', 0.00),
(394, 23, 2, 200.00, '2024-11-20 16:48:39', 1, 'cash', 0.00),
(397, 30, 1, 0.00, '2024-11-20 16:48:39', 1, 'cash', 0.00),
(398, 21, 1, 30.00, '2024-11-20 16:48:39', 1, 'cash', 0.00),
(399, 19, 1, 120.00, '2024-11-20 16:48:39', 1, 'cash', 0.00),
(400, 18, 1, 45.00, '2024-11-20 16:48:39', 1, 'cash', 0.00),
(401, 17, 1, 120.00, '2024-11-20 16:48:39', 1, 'cash', 0.00),
(402, 13, 1, 10.00, '2024-11-20 16:48:39', 1, 'cash', 0.00),
(403, 14, 1, 45.00, '2024-11-20 16:48:39', 1, 'cash', 0.00),
(404, 15, 1, 8.00, '2024-11-20 16:48:39', 1, 'cash', 0.00),
(405, 16, 1, 12.00, '2024-11-20 16:48:39', 1, 'cash', 0.00),
(406, 10, 1, 300.00, '2024-11-20 16:49:02', 1, 'cash', 0.00),
(407, 11, 1, 30.00, '2024-11-20 16:49:02', 1, 'cash', 0.00),
(408, 12, 1, 85.00, '2024-11-20 16:49:02', 1, 'cash', 0.00),
(409, 13, 1, 10.00, '2024-11-20 16:49:02', 1, 'cash', 0.00),
(410, 14, 1, 45.00, '2024-11-20 16:49:02', 1, 'cash', 0.00),
(411, 15, 1, 8.00, '2024-11-20 16:49:02', 1, 'cash', 0.00),
(412, 16, 1, 12.00, '2024-11-20 16:49:02', 1, 'cash', 0.00),
(413, 17, 1, 120.00, '2024-11-20 16:49:02', 1, 'cash', 0.00),
(414, 18, 1, 45.00, '2024-11-20 16:49:02', 1, 'cash', 0.00),
(415, 19, 1, 120.00, '2024-11-20 16:49:02', 1, 'cash', 0.00),
(416, 20, 1, 85.00, '2024-11-20 16:49:02', 1, 'cash', 0.00),
(417, 21, 1, 30.00, '2024-11-20 16:49:03', 1, 'cash', 0.00),
(419, 23, 1, 100.00, '2024-11-20 16:49:03', 1, 'cash', 0.00),
(420, 24, 1, 50.00, '2024-11-20 16:49:03', 1, 'cash', 0.00),
(421, 30, 1, 0.00, '2024-11-20 16:49:03', 1, 'cash', 0.00),
(422, 30, 1, 0.00, '2024-11-20 16:57:02', 1, 'cash', 0.00),
(423, 10, 2, 600.00, '2024-11-20 16:59:49', 1, 'cash', 370.00),
(424, 11, 1, 30.00, '2024-11-20 16:59:49', 1, 'cash', 370.00),
(425, 10, 2, 600.00, '2024-11-20 17:00:20', 1, 'cash', 400.00),
(426, 30, 13, 0.00, '2024-11-20 17:01:30', 1, 'cash', 0.00),
(427, 10, 1, 300.00, '2024-11-20 17:02:01', 1, 'gcash', 0.00),
(428, 11, 1, 30.00, '2024-11-20 17:02:01', 1, 'gcash', 0.00),
(429, 12, 1, 85.00, '2024-11-20 17:02:01', 1, 'gcash', 0.00),
(430, 10, 5, 1500.00, '2024-11-20 17:22:00', 1, 'cash', 0.00),
(432, 10, 2, 600.00, '2024-11-20 18:24:46', 50, 'gcash', 0.00),
(433, 11, 2, 60.00, '2024-11-20 18:24:47', 50, 'gcash', 0.00),
(434, 10, 1, 300.00, '2024-11-20 18:32:45', 50, 'cash', 122823.00),
(435, 10, 1, 300.00, '2024-11-20 18:41:15', 50, 'cash', 0.00),
(436, 11, 1, 30.00, '2024-11-20 18:41:15', 50, 'cash', 0.00),
(437, 10, 2, 600.00, '2024-11-20 18:53:40', 50, 'cash', 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','cashier') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT 'default.jpg',
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `role`, `created_at`, `image`, `status`) VALUES
(1, 'Travis', 'Scott', 'laflame', 'trabistagalog@gmail.com', '$2y$10$68UcJcRegDsOfhnl8Vt5KuUPqz6oFQT5JIN6HVRmoyV//BWApnlte', 'admin', '2024-10-26 17:56:32', 'trabis.webp', 'active'),
(50, 'Cashier', 'Test', 'Cashier', 'Cashier@c', '$2y$10$OphC6HuEGOZI9ct4t8GjMeQyNLdbPBboAVevPQp0/4wvI9wsVL6.C', 'cashier', '2024-11-05 16:43:59', 'trabis.webp', 'active'),
(55, 'TEst', 'test', 'test', 'test@test', '$2y$10$AsT2P9z2qNZ2GSruHg.mgeiNr27PUYyS7E8ga4CM.7Cu9OqELCTym', 'admin', '2024-11-05 17:53:04', 'default.jpg', 'active'),
(56, 'beta', 'beta', 'beta', 'beta@test', '$2y$10$nUjTMkaEvr2jlO31cgE5te6zq5vAzoHjsoyo0jOTtLdlDxjX/QQe6', 'admin', '2024-11-05 17:54:34', 'AT-pro-logo.png', 'active'),
(63, 'Add', 'Add', 'add', 'Add@add', '$2y$10$30HXBLztJ/GIqy2tpxAW5e4XG.19V.d.jPloH0wCedZcr01b9jM6y', 'admin', '2024-11-06 11:41:26', 'Activity 2_Entrepreneurial Mind_Martinez.png', 'active'),
(64, 'Nissan', 'Nassin', 'car', 'car@car', '$2y$10$djdQMk07XoF9aWsIu5y1He3Fo5dkiWxTz1ONiuewXucVVTDpnXOi6', 'admin', '2024-11-06 12:03:39', 'bowser_jr_____super_mario_bros__wonder_by_rubychu96_dg7h9a9-fullview-removebg-preview.png', 'active'),
(65, 'Alice', 'Smith', 'alice123', 'alice.smith@example.com', 'password123', 'admin', '2024-11-06 12:11:27', 'trabis.webp', 'active'),
(66, 'Bob', 'Johnson', 'bobby_j', 'bob.johnson@example.com', 'password456', 'cashier', '2024-11-06 12:11:27', 'default.jpg', 'active'),
(67, 'Charlieeeee', 'Brownnnn', 'charlie_bbb', 'charlie.brown@example.commmmmm', 'password789', 'admin', '2024-11-06 12:11:27', 'charlie.png', 'active'),
(68, 'Dianaeeeeeeeeeasdasdasd', 'Prince', 'dianaP', 'diana.prince@example.com', 'password321', 'cashier', '2024-11-06 12:11:27', 'trabis.webp', 'active'),
(70, 'Karina', 'Up', 'katarina', 'aespa@aespa', '$2y$10$HJdVgWEmX4p6uTHxclWyWuWyffgFk3nZhiWMEzM1wsma5p48FvO3i', 'admin', '2024-11-06 12:36:02', 'default.jpg', 'active'),
(72, 'Laufey', 'Scott', 'LaufeyLaufey', 'Laufey@LaufeyLaufeyLaufey', '$2y$10$QIFWWhJpog5xLbdStLCfqOFg2YkKyy7uIpqgJhvOSMmBKKRZm8E6e', 'admin', '2024-11-06 16:00:13', 'trabis.webp', 'inactive'),
(76, 'asdasdasdasd', 'asd', 'zxcasd', 'zxcasd@zxcasd', '$2y$10$qWyrXcBuLpJ.GIIq1mp.g.aUJTi6xam6voLddyVJnwjaU.lPnI706', 'admin', '2024-11-10 15:36:34', 'default.jpg', 'active'),
(77, 'omay', 'gad', 'a@a', 'a@a', '$2y$10$dAyLqkdcAp9wvZL.D6wtzuRT0uSZXukDEX7pOopbJXi4B3hhYf2gy', 'admin', '2024-11-12 15:37:06', 'default.jpg', 'active'),
(79, 'gagokatalaga', 'tanginamo', 'sheesh', 'sheesh@sh', '$2y$10$jZqRWymXF6AsVKBlYy/itOrNZwL3/u/gpk7vTaT/zzqIhY0NiVC.2', 'admin', '2024-11-16 02:04:55', 'trabis.webp', 'active'),
(81, 'yasuo', 'yasuo', 'yasuo', 'yasuo@a', '$2y$10$5ZkF/0CcmkBTrqOM0gsW/.9PX1wuClVBXicJBek29MDOgMT1UUvpe', 'cashier', '2024-11-19 09:04:28', 'e4b8ed1e8dcb3bf993cb91f4b00b203c_large.png', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `gcash_transactions`
--
ALTER TABLE `gcash_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`product_code`),
  ADD KEY `inventory_ibfk_1` (`category_id`);

--
-- Indexes for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `gcash_transactions`
--
ALTER TABLE `gcash_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `login_activity`
--
ALTER TABLE `login_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=540;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=438;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gcash_transactions`
--
ALTER TABLE `gcash_transactions`
  ADD CONSTRAINT `gcash_transactions_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `inventory` (`id`),
  ADD CONSTRAINT `sales_ibfk_10` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sales_ibfk_11` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sales_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sales_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sales_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sales_ibfk_7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sales_ibfk_8` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sales_ibfk_9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
