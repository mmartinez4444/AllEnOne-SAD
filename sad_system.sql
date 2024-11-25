-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2024 at 11:58 AM
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
(18, 'asdadasdas'),
(8, 'Basic Medicines'),
(1, 'Beveragesa'),
(3, 'Canned and Preserved Goods'),
(4, 'Condiments and Cooking Essentials'),
(10, 'Fresh Goods'),
(16, 'GCashasd'),
(22, 'Hotwheels'),
(7, 'Household Items'),
(15, 'Ikinamada'),
(12, 'Mobile Load and Accessoriessasd'),
(6, 'Personal Care Products'),
(5, 'Rice and Grains'),
(11, 'School and Office Supplies'),
(2, 'Snacks'),
(9, 'Tobacco and Alcohol'),
(23, 'yoyoy');

-- --------------------------------------------------------

--
-- Table structure for table `gcash`
--

CREATE TABLE `gcash` (
  `id` int(11) NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gcash`
--

INSERT INTO `gcash` (`id`, `balance`) VALUES
(1, 800.00);

-- --------------------------------------------------------

--
-- Table structure for table `gcash_log`
--

CREATE TABLE `gcash_log` (
  `id` int(11) NOT NULL,
  `transaction_type` enum('cash_in','cash_out','load') NOT NULL,
  `gcash_number` varchar(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `balance` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gcash_log`
--

INSERT INTO `gcash_log` (`id`, `transaction_type`, `gcash_number`, `amount`, `transaction_date`, `user_id`, `balance`) VALUES
(1, 'cash_in', '123', 123.00, '2024-11-21 17:34:10', 1, 0.00),
(2, 'cash_out', '123312', 12.00, '2024-11-21 17:57:28', 1, 0.00),
(3, 'cash_in', '1', 1.00, '2024-11-21 17:59:32', 50, 0.00),
(4, 'load', '09123456789', 99.00, '2024-11-21 18:22:28', 82, 0.00),
(5, 'cash_out', '09123456789', 98.00, '2024-11-21 18:23:52', 82, 0.00),
(6, 'cash_in', '09123456789', 196.00, '2024-11-21 18:24:16', 82, 0.00),
(7, 'cash_out', '444469', 100.00, '2024-11-22 12:22:25', 82, 0.00),
(8, 'load', '123', 100.00, '2024-11-22 14:29:38', 82, 0.00),
(9, 'cash_in', 'cashin', 100.00, '2024-11-22 14:30:52', 82, 0.00),
(10, 'cash_in', '123', 100.00, '2024-11-22 14:35:15', 82, 0.00),
(11, 'cash_out', '123', 100.00, '2024-11-22 14:35:26', 82, 0.00),
(12, 'load', '123', 100.00, '2024-11-22 14:35:33', 82, 0.00),
(13, 'cash_out', 'ferrari', 999.00, '2024-11-22 18:36:42', 82, 0.00),
(14, 'load', 'ferrari', 999.00, '2024-11-22 18:36:53', 82, 0.00),
(15, 'cash_in', 'ferrari', 999.00, '2024-11-22 18:37:04', 82, 0.00),
(16, 'cash_in', 'ferrari', 1000.00, '2024-11-22 18:37:31', 82, 0.00),
(17, 'cash_out', 'ferrari', 1000.00, '2024-11-22 18:37:53', 82, 0.00),
(18, 'cash_out', 'ferrari', 1000.00, '2024-11-22 18:38:05', 82, 0.00),
(19, 'cash_in', '2', 2.00, '2024-11-23 09:09:27', 82, 0.00),
(20, 'cash_out', '2', 2.00, '2024-11-23 09:09:35', 82, 0.00),
(21, 'load', '2', 2.00, '2024-11-23 09:09:43', 82, 0.00),
(22, 'cash_in', '2', 100.00, '2024-11-23 09:14:10', 82, 0.00),
(23, 'cash_out', '200', 200.00, '2024-11-23 09:16:01', 82, 0.00),
(24, 'cash_in', '123', 123.00, '2024-11-23 09:24:22', 82, 0.00),
(25, 'cash_out', '3123', 100.00, '2024-11-23 09:31:28', 82, 900.00),
(26, 'cash_out', '3123', 100.00, '2024-11-23 09:32:27', 82, 800.00),
(27, 'cash_in', '3123', 100.00, '2024-11-23 09:32:51', 82, 900.00),
(28, 'load', '3123', 100.00, '2024-11-23 09:33:38', 82, 1000.00),
(29, 'cash_in', 'ferrari', 100.00, '2024-11-23 09:38:51', 82, 900.00),
(30, 'cash_out', 'ferrari', 100.00, '2024-11-23 09:39:03', 82, 1000.00),
(31, 'load', 'ferrari', 100.00, '2024-11-23 09:39:25', 82, 900.00),
(32, 'cash_out', '123', 100.00, '2024-11-23 11:27:03', 84, 1000.00),
(33, 'cash_in', '1', 100.00, '2024-11-23 11:33:17', 84, 900.00),
(34, 'cash_out', '1', 100.00, '2024-11-23 11:33:27', 84, 1000.00),
(35, 'load', '1', 100.00, '2024-11-23 11:33:37', 84, 900.00),
(36, 'cash_in', '1', 100.00, '2024-11-24 13:03:34', 86, 800.00),
(37, 'cash_out', '1', 100.00, '2024-11-24 13:03:50', 86, 900.00),
(38, 'load', '1', 100.00, '2024-11-24 13:03:58', 86, 800.00);

-- --------------------------------------------------------

--
-- Table structure for table `gcash_transactions`
--

CREATE TABLE `gcash_transactions` (
  `id` int(11) NOT NULL,
  `transaction_type` enum('cash_in','cash_out','load') NOT NULL,
  `sale_id` int(11) NOT NULL,
  `gcash_number` varchar(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gcash_transactions`
--

INSERT INTO `gcash_transactions` (`id`, `transaction_type`, `sale_id`, `gcash_number`, `amount`, `balance`, `transaction_date`, `notes`) VALUES
(2, 'cash_in', 165, 'testtite2', 130.00, 0.00, '2024-11-19 08:16:15', 'as'),
(3, 'cash_in', 166, 'testtite2', 130.00, 0.00, '2024-11-19 08:16:15', 'as'),
(4, 'cash_in', 167, 'testtite2', 130.00, 0.00, '2024-11-19 08:16:16', 'as'),
(5, 'cash_in', 168, 'gagoka', 195.00, 0.00, '2024-11-19 08:21:16', 'notesss'),
(6, 'cash_in', 169, 'gagoka', 195.00, 0.00, '2024-11-19 08:21:16', 'notesss'),
(7, 'cash_in', 170, 'gagoka', 195.00, 0.00, '2024-11-19 08:21:16', 'notesss'),
(8, 'cash_in', 171, 'gagoka', 195.00, 0.00, '2024-11-19 08:21:16', 'notesss'),
(9, 'cash_in', 172, '123', 650.00, 0.00, '2024-11-19 08:28:44', 'tite'),
(10, 'cash_in', 173, 'zxc', 91.00, 0.00, '2024-11-19 08:41:06', '1asd'),
(11, 'cash_in', 174, 'zxc', 91.00, 0.00, '2024-11-19 08:41:07', '1asd'),
(12, 'cash_in', 175, 'zxc', 91.00, 0.00, '2024-11-19 08:41:07', '1asd'),
(13, 'cash_in', 176, '123', 123.00, 0.00, '2024-11-19 08:44:12', '21sczxczc'),
(14, 'cash_in', 177, '123', 123.00, 0.00, '2024-11-19 08:44:12', '21sczxczc'),
(15, 'cash_in', 178, '123', 123.00, 0.00, '2024-11-19 08:44:12', '21sczxczc'),
(16, 'cash_in', 181, '9999', 100.00, 0.00, '2024-11-19 08:54:36', '75 t anginamo'),
(17, 'cash_in', 205, 'qweqwe2ss', 50.00, 0.00, '2024-11-19 15:08:22', '9999999'),
(18, 'cash_in', 221, 'Zeus', 400.00, 0.00, '2024-11-19 16:57:30', 'Wala lang'),
(19, 'cash_in', 222, 'Zeus', 400.00, 0.00, '2024-11-19 16:57:30', 'Wala lang'),
(20, 'cash_in', 223, 'Zeus', 400.00, 0.00, '2024-11-19 16:57:30', 'Wala lang'),
(21, 'cash_in', 231, 'nice', 123.00, 0.00, '2024-11-19 17:30:17', '123'),
(22, 'cash_in', 326, 'asd', 123.00, 0.00, '2024-11-19 18:23:14', '1233123123'),
(23, 'cash_in', 372, 'gcashhhh', 24.00, 0.00, '2024-11-20 16:13:02', 'tanginamogago kata'),
(24, 'cash_in', 373, '', 200.00, 0.00, '2024-11-20 16:24:23', '200 test'),
(25, 'cash_in', 427, 'hays', 500.00, 0.00, '2024-11-20 17:02:01', '213'),
(26, 'cash_in', 428, 'hays', 500.00, 0.00, '2024-11-20 17:02:01', '213'),
(27, 'cash_in', 429, 'hays', 500.00, 0.00, '2024-11-20 17:02:01', '213'),
(28, 'cash_in', 432, 'qweqweqwe', 1100.00, 0.00, '2024-11-20 18:24:46', 'tasdzxc'),
(29, 'cash_in', 433, 'qweqweqwe', 1100.00, 0.00, '2024-11-20 18:24:47', 'tasdzxc'),
(30, 'cash_in', 439, 'vampire', 1111.00, 0.00, '2024-11-21 07:05:50', 'vampire'),
(31, 'cash_in', 440, 'Test', 630.00, 0.00, '2024-11-21 09:29:17', '123'),
(32, 'cash_in', 441, 'Test', 630.00, 0.00, '2024-11-21 09:29:17', '123'),
(33, 'cash_in', 445, '123', 1111.00, 0.00, '2024-11-21 10:45:47', '123'),
(34, 'cash_in', 452, 'uy', 132.00, 0.00, '2024-11-21 16:41:54', 'waasada'),
(35, 'cash_in', 471, 'fuuuuck', 200.00, 0.00, '2024-11-22 14:48:04', ''),
(36, 'cash_in', 474, 'oliviarodrigo', 500.00, 0.00, '2024-11-22 17:05:18', 'qwe'),
(37, 'cash_in', 478, 'yo', 420.00, 0.00, '2024-11-22 18:28:37', 'tite'),
(38, 'cash_in', 497, 'cash g', 450.00, 0.00, '2024-11-22 18:35:26', '1232'),
(39, 'cash_in', 506, 'supernatural;', 24.00, 0.00, '2024-11-23 08:47:34', '123'),
(40, 'cash_in', 510, 'vampire', 800.00, 0.00, '2024-11-23 08:59:53', 'not her'),
(41, 'cash_in', 611, '123', 627.00, 0.00, '2024-11-23 11:36:14', 'hehehehe'),
(42, 'cash_in', 816, 'tite', 2584.00, 0.00, '2024-11-24 11:12:16', 'scanner'),
(43, 'cash_in', 823, 'yes', 1567.00, 0.00, '2024-11-24 12:18:11', ''),
(44, 'cash_in', 825, '123', 1.00, 0.00, '2024-11-24 12:21:33', '');

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
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `discount_eligible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_code`, `product_name`, `category_id`, `stock`, `price`, `buying_price`, `image`, `date_added`, `updated_at`, `discount_eligible`) VALUES
(1, '2409273811', 'Coca-Cola 1.5L5123asdfbmjnuaweyioghftnawuieogt', 1, 20, 783.75, 100.00, 'coca cola.webp', '2024-11-15 16:11:01', '2024-11-24 19:02:57', 1),
(2, 'BEV002', 'Royal Tru-Orange 500ml', 1, 0, 5.15, 25.00, 'trabis.webp', '2024-11-15 16:11:01', '2024-11-30 18:32:09', 1),
(3, 'SNK001', 'Piattos Cheese', 2, 0, 25.00, 20.00, 'trabis.webp', '2024-11-15 16:11:01', '2024-11-23 11:11:33', 0),
(4, 'SNK002', 'Nova Multigrain Chips', 2, 0, 20.00, 15.00, 'trabis.webp', '2024-11-15 16:11:01', '2024-11-23 11:11:33', 1),
(5, 'CND001', 'Century Tuna Hot & Spicy', 3, 0, 35.00, 30.00, 'Oliv.jpg', '2024-11-15 16:11:01', '2024-11-24 11:02:46', 0),
(6, 'CND002', '555 Sardines in Tomato Sauce', 3, 0, 20.00, 15.00, '1fba2514-3f00-4787-a049-9a952e645e38-1661841297142.jpeg', '2024-11-15 16:11:01', '2024-11-24 10:57:29', 0),
(7, 'COND001', 'Datu Puti Soy Sauce 1L', 4, 0, 45.00, 40.00, '1fba2514-3f00-4787-a049-9a952e645e38-1661841297142.jpeg', '2024-11-15 16:11:01', '2024-11-24 12:10:19', 0),
(8, 'COND002', 'Silver Swan Vinegar 750ml', 4, 2, 40.00, 35.00, 'Oliv.jpg', '2024-11-15 16:11:01', '2024-11-24 12:21:33', 0),
(9, 'RCE001', 'Sinandomeng Rice 5kg', 5, 5, 250.00, 220.00, 'e4b8ed1e8dcb3bf993cb91f4b00b203c_large.png', '2024-11-15 16:11:01', '2024-11-24 14:01:14', 0),
(10, 'RCE002', 'Jasmine Rice 5kg', 5, 0, 300.00, 270.00, 'logo-ptc.png', '2024-11-15 16:11:01', '2024-11-24 11:12:15', 0),
(11, 'PC001', 'Safeguard Soap White', 6, 0, 30.00, 25.00, 'AllenOne-grocery-pharmacy.webp', '2024-11-15 16:11:01', '2024-11-24 18:59:27', 0),
(12, 'PC002', 'Colgate Toothpaste 150g', 6, 0, 85.00, 75.00, '1fba2514-3f00-4787-a049-9a952e645e38-1661841297142.jpeg', '2024-11-15 16:11:01', '2024-11-24 19:00:31', 0),
(13, 'HH001', 'Surf Detergent Powder 65g', 7, 47, 10.00, 8.00, 'surf.png', '2024-11-15 16:11:01', '2024-11-24 11:12:16', 0),
(14, 'HH002', 'Downy Fabric Conditioner 200ml', 7, 10, 45.00, 40.00, 'downy.png', '2024-11-15 16:11:01', '2024-11-24 11:12:16', 0),
(15, 'MED001', 'Bioflu 500mg Tablet', 8, 85, 8.00, 6.00, 'bioflu.png', '2024-11-15 16:11:01', '2024-11-24 11:12:16', 0),
(16, 'MED002', 'Alaxan FR Capsule', 8, 36, 12.00, 10.00, 'alaxan.png', '2024-11-15 16:11:01', '2024-11-24 11:12:16', 0),
(18, 'TBA002', 'San Miguel Pale Pilsen', 9, 37, 45.00, 40.00, 'san-miguel.png', '2024-11-15 16:11:01', '2024-11-23 11:20:33', 0),
(19, 'FRS001', 'Red Onions 1kg', 10, 30, 120.00, 100.00, 'onions.png', '2024-11-15 16:11:01', '2024-11-23 11:20:33', 0),
(20, 'FRS002', 'Fresh Eggs 1 Dozen', 10, 18, 85.00, 75.00, 'eggs.png', '2024-11-15 16:11:01', '2024-11-23 11:20:33', 0),
(21, 'SOS001', 'Pilot G2 Gel Pen Black', 11, 91, 30.00, 25.00, 'pilot-pen.png', '2024-11-15 16:11:01', '2024-11-23 11:20:33', 0),
(23, 'ML001', 'Globe Load 500', 12, 417, 420.00, 420.00, 'globe-load.png', '2024-11-15 16:11:01', '2024-11-23 11:20:34', 1),
(24, 'ML002', 'Smart Load 50', 12, 288, 50.00, 47.00, 'trabis.webp', '2024-11-15 16:11:01', '2024-11-24 11:03:40', 0),
(30, 'Gcash', 'Gcash Cash-In Cash-Out', 16, 274, 0.00, 0.00, 'trabis.webp', '2024-11-20 16:02:56', '2024-11-24 11:03:40', 0),
(32, 'check lang', 'ch', 8, 3, 12.00, 12.00, 'coca cola.webp', '2024-11-20 18:52:14', '2024-11-24 11:03:40', 0),
(34, 'jasperrasdasdasd', '123123', 18, 0, 111.00, 123.00, 'Mario+2.jpg', '2024-11-21 18:20:23', '2024-11-21 18:25:51', 0),
(35, '123', '123', 18, 119, 23.00, 32.00, 'trabis.webp', '2024-11-22 17:11:32', '2024-11-23 11:15:22', 0),
(36, 'eliglebi', 'eliglebi', 8, 118, 123.00, 123.00, 'trabis.webp', '2024-11-22 17:56:18', '2024-11-23 11:20:34', 0),
(37, '123zxc', '3123123123123', 18, 407, 412.00, 124.00, 'AllenOne-grocery-pharmacy.webp', '2024-11-22 18:27:45', '2024-11-23 11:20:34', 0),
(38, '027084120134', 'McLaraen F1', 22, 0, 139.00, 139.00, 'trabis.webp', '2024-11-24 09:45:32', '2024-11-24 12:18:11', 0),
(39, 'c', 'cx', 9, 2, 2.00, 23.00, '462298159_8866723430025403_1635298703307656754_n.png', '2024-11-24 12:08:42', '2024-11-24 12:08:57', 1);

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
(538, 50, 'logout', '2024-11-20 16:01:50'),
(540, 1, 'login', '2024-11-21 06:34:11'),
(541, 1, 'logout', '2024-11-21 17:59:04'),
(542, 50, 'login', '2024-11-21 17:59:11'),
(543, 50, 'logout', '2024-11-21 18:14:28'),
(544, 1, 'login', '2024-11-21 18:14:37'),
(545, 1, 'logout', '2024-11-21 18:15:21'),
(546, 82, 'login', '2024-11-21 18:16:49'),
(547, 82, 'logout', '2024-11-21 18:18:16'),
(548, 82, 'login', '2024-11-21 18:18:17'),
(549, 82, 'logout', '2024-11-21 18:18:21'),
(550, 82, 'login', '2024-11-21 18:18:23'),
(551, 82, 'logout', '2024-11-21 18:18:50'),
(552, 82, 'login', '2024-11-21 18:18:51'),
(553, 82, 'logout', '2024-11-21 18:19:15'),
(554, 82, 'login', '2024-11-21 18:19:21'),
(555, 82, 'logout', '2024-11-21 18:19:30'),
(556, 82, 'login', '2024-11-21 18:19:31'),
(557, 82, 'login', '2024-11-22 12:19:36'),
(558, 82, 'logout', '2024-11-22 16:36:12'),
(559, 82, 'login', '2024-11-22 16:36:13'),
(560, 82, 'logout', '2024-11-23 09:40:58'),
(561, 84, 'login', '2024-11-23 09:41:34'),
(562, 84, 'login', '2024-11-23 14:37:29'),
(563, 84, 'logout', '2024-11-23 15:30:48'),
(564, 50, 'login', '2024-11-23 15:30:52'),
(565, 50, 'logout', '2024-11-23 15:30:59'),
(566, 84, 'login', '2024-11-23 15:31:03'),
(567, 84, 'login', '2024-11-23 15:34:52'),
(568, 84, 'logout', '2024-11-24 11:15:57'),
(569, 50, 'login', '2024-11-24 11:16:03'),
(570, 50, 'logout', '2024-11-24 11:16:08'),
(571, 86, 'login', '2024-11-24 11:16:30'),
(572, 86, 'logout', '2024-11-24 16:41:22'),
(573, 1, 'login', '2024-11-24 16:41:31'),
(574, 1, 'logout', '2024-11-24 16:55:57'),
(575, 84, 'login', '2024-11-24 16:56:03'),
(576, 84, 'logout', '2024-11-24 18:35:54'),
(577, 84, 'login', '2024-11-24 18:36:01');

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
  `change_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tendered_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sc_pwd_discount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `quantity`, `total_price`, `sale_date`, `user_id`, `payment_mode`, `change_amount`, `tendered_amount`, `sc_pwd_discount`) VALUES
(779, 38, 8, 1112.00, '2024-11-24 10:40:34', 84, 'cash', 0.00, 1112.00, 0.00),
(780, 38, 8, 1112.00, '2024-11-24 10:51:52', 84, 'cash', 0.00, 1874.00, 156.75),
(781, 1, 1, 783.75, '2024-11-24 10:51:52', 84, 'cash', 0.00, 1874.00, 156.75),
(782, 5, 1, 35.00, '2024-11-24 10:51:52', 84, 'cash', 0.00, 1874.00, 156.75),
(783, 6, 5, 100.00, '2024-11-24 10:51:53', 84, 'cash', 0.00, 1874.00, 156.75),
(784, 1, 1, 783.75, '2024-11-24 10:57:29', 84, 'cash', 0.00, 838.75, 0.00),
(785, 5, 1, 35.00, '2024-11-24 10:57:29', 84, 'cash', 0.00, 838.75, 0.00),
(786, 6, 1, 20.00, '2024-11-24 10:57:29', 84, 'cash', 0.00, 838.75, 0.00),
(787, 1, 1, 783.75, '2024-11-24 10:58:18', 84, 'cash', 327.25, 1111.00, 0.00),
(788, 1, 4, 3135.00, '2024-11-24 10:59:07', 84, 'cash', 7976.00, 11111.00, 0.00),
(789, 5, 4, 140.00, '2024-11-24 11:02:46', 84, 'cash', 0.00, 140.00, 0.00),
(790, 7, 1, 45.00, '2024-11-24 11:03:39', 84, 'cash', 0.00, 1714.00, 0.00),
(791, 8, 1, 40.00, '2024-11-24 11:03:39', 84, 'cash', 0.00, 1714.00, 0.00),
(792, 12, 3, 255.00, '2024-11-24 11:03:39', 84, 'cash', 0.00, 1714.00, 0.00),
(793, 11, 2, 60.00, '2024-11-24 11:03:39', 84, 'cash', 0.00, 1714.00, 0.00),
(794, 10, 2, 600.00, '2024-11-24 11:03:39', 84, 'cash', 0.00, 1714.00, 0.00),
(795, 9, 2, 500.00, '2024-11-24 11:03:39', 84, 'cash', 0.00, 1714.00, 0.00),
(796, 13, 1, 10.00, '2024-11-24 11:03:39', 84, 'cash', 0.00, 1714.00, 0.00),
(797, 14, 2, 90.00, '2024-11-24 11:03:39', 84, 'cash', 0.00, 1714.00, 0.00),
(798, 15, 2, 16.00, '2024-11-24 11:03:39', 84, 'cash', 0.00, 1714.00, 0.00),
(799, 16, 1, 12.00, '2024-11-24 11:03:39', 84, 'cash', 0.00, 1714.00, 0.00),
(800, 32, 3, 36.00, '2024-11-24 11:03:39', 84, 'cash', 0.00, 1714.00, 0.00),
(801, 30, 2, 0.00, '2024-11-24 11:03:40', 84, 'cash', 0.00, 1714.00, 0.00),
(802, 24, 1, 50.00, '2024-11-24 11:03:40', 84, 'cash', 0.00, 1714.00, 0.00),
(803, 7, 1, 45.00, '2024-11-24 11:04:44', 84, 'cash', 0.00, 85.00, 0.00),
(804, 8, 1, 40.00, '2024-11-24 11:04:44', 84, 'cash', 0.00, 85.00, 0.00),
(805, 7, 1, 45.00, '2024-11-24 11:05:11', 84, 'cash', 0.00, 45.00, 0.00),
(806, 7, 1, 45.00, '2024-11-24 11:05:33', 84, 'cash', 0.00, 45.00, 0.00),
(807, 7, 2, 90.00, '2024-11-24 11:12:15', 84, 'gcash', 0.00, 2584.00, 0.00),
(808, 8, 2, 80.00, '2024-11-24 11:12:15', 84, 'gcash', 0.00, 2584.00, 0.00),
(809, 10, 6, 1800.00, '2024-11-24 11:12:15', 84, 'gcash', 0.00, 2584.00, 0.00),
(810, 12, 1, 85.00, '2024-11-24 11:12:15', 84, 'gcash', 0.00, 2584.00, 0.00),
(811, 11, 6, 180.00, '2024-11-24 11:12:15', 84, 'gcash', 0.00, 2584.00, 0.00),
(812, 9, 1, 250.00, '2024-11-24 11:12:15', 84, 'gcash', 0.00, 2584.00, 0.00),
(813, 13, 1, 10.00, '2024-11-24 11:12:15', 84, 'gcash', 0.00, 2584.00, 0.00),
(814, 14, 1, 45.00, '2024-11-24 11:12:16', 84, 'gcash', 0.00, 2584.00, 0.00),
(815, 15, 1, 8.00, '2024-11-24 11:12:16', 84, 'gcash', 0.00, 2584.00, 0.00),
(816, 16, 3, 36.00, '2024-11-24 11:12:16', 84, 'gcash', 0.00, 2584.00, 0.00),
(817, 38, 4, 556.00, '2024-11-24 11:18:42', 86, 'cash', 0.00, 556.00, 0.00),
(818, 38, 17, 2363.00, '2024-11-24 11:23:37', 86, 'cash', 0.00, 2363.00, 0.00),
(819, 7, 1, 45.00, '2024-11-24 12:09:42', 86, 'cash', 0.00, 45.00, 0.00),
(820, 7, 1, 45.00, '2024-11-24 12:10:19', 86, 'cash', 0.00, 45.00, 0.00),
(821, 1, 1, 783.75, '2024-11-24 12:14:56', 86, 'cash', 217.25, 1001.00, 0.00),
(822, 1, 10, 7837.50, '2024-11-24 12:18:11', 86, 'gcash', 0.00, 1567.00, 1567.50),
(823, 38, 13, 1807.00, '2024-11-24 12:18:11', 86, 'gcash', 0.00, 1567.00, 1567.50),
(824, 8, 2, 80.00, '2024-11-24 12:21:33', 86, 'gcash', 0.00, 1.00, 0.00),
(825, 12, 4, 340.00, '2024-11-24 12:21:33', 86, 'gcash', 0.00, 1.00, 0.00),
(826, 9, 1, 250.00, '2024-11-24 14:01:14', 86, 'cash', 0.00, 250.00, 0.00),
(836, 8, 10, 4000.00, '2024-11-25 02:00:00', 84, 'cash', 0.00, 4000.00, 0.00),
(837, 12, 8, 680.00, '2024-11-26 04:30:00', 86, 'gcash', 0.00, 680.00, 0.00),
(838, 1, 5, 3918.75, '2024-11-27 07:00:00', 84, 'cash', 0.00, 3918.75, 0.00),
(839, 38, 20, 2780.00, '2024-11-28 10:00:00', 86, 'cash', 0.00, 2780.00, 0.00),
(840, 7, 6, 270.00, '2024-11-29 11:45:00', 84, 'gcash', 0.00, 270.00, 0.00),
(841, 9, 15, 3750.00, '2024-12-01 03:00:00', 86, 'cash', 0.00, 3750.00, 0.00),
(842, 6, 12, 1440.00, '2024-12-03 06:00:00', 84, 'cash', 0.00, 1440.00, 0.00),
(843, 3, 20, 6300.00, '2024-12-07 08:00:00', 86, 'gcash', 0.00, 6300.00, 0.00),
(844, 15, 10, 80.00, '2024-12-10 09:30:00', 84, 'cash', 0.00, 80.00, 0.00),
(845, 14, 5, 225.00, '2024-12-15 11:30:00', 86, 'gcash', 0.00, 225.00, 0.00),
(846, 1, 30, 23512.50, '2024-11-24 16:45:28', 1, 'cash', 0.00, 23512.50, 0.00),
(847, 1, 15, 11756.25, '2024-11-25 02:15:00', NULL, 'cash', 0.00, 11756.25, 0.00),
(848, 2, 10, 5300.00, '2024-11-25 03:30:00', NULL, 'cash', 0.00, 5300.00, 0.00),
(849, 3, 5, 2325.00, '2024-11-25 04:00:00', NULL, 'cash', 0.00, 2325.00, 0.00),
(850, 4, 8, 4600.00, '2024-11-25 06:00:00', NULL, 'cash', 0.00, 4600.00, 0.00),
(851, 5, 12, 9000.00, '2024-11-25 07:30:00', NULL, 'cash', 0.00, 9000.00, 0.00),
(852, 1, 20, 15750.00, '2024-11-24 00:00:00', NULL, 'cash', 0.00, 15750.00, 0.00),
(853, 2, 25, 13250.00, '2024-11-23 01:30:00', NULL, 'cash', 0.00, 13250.00, 0.00),
(854, 3, 10, 4650.00, '2024-11-22 06:15:00', NULL, 'cash', 0.00, 4650.00, 0.00),
(855, 4, 12, 6900.00, '2024-11-21 08:30:00', NULL, 'cash', 0.00, 6900.00, 0.00),
(856, 5, 30, 22500.00, '2024-11-20 09:00:00', NULL, 'cash', 0.00, 22500.00, 0.00),
(857, 1, 40, 31500.00, '2024-11-20 02:00:00', NULL, 'cash', 0.00, 31500.00, 0.00),
(858, 2, 35, 18550.00, '2024-11-15 03:30:00', NULL, 'cash', 0.00, 18550.00, 0.00),
(859, 3, 50, 23250.00, '2024-11-10 04:45:00', NULL, 'cash', 0.00, 23250.00, 0.00),
(860, 4, 60, 34500.00, '2024-11-05 06:00:00', NULL, 'cash', 0.00, 34500.00, 0.00),
(861, 5, 25, 18750.00, '2024-11-01 08:30:00', NULL, 'cash', 0.00, 18750.00, 0.00),
(862, 1, 100, 78500.00, '2024-11-25 04:00:00', NULL, 'cash', 0.00, 78500.00, 0.00),
(863, 2, 150, 79500.00, '2024-11-22 05:00:00', NULL, 'cash', 0.00, 79500.00, 0.00),
(864, 3, 200, 93000.00, '2024-11-20 07:30:00', NULL, 'cash', 0.00, 93000.00, 0.00),
(865, 4, 120, 69000.00, '2024-11-18 09:00:00', NULL, 'cash', 0.00, 69000.00, 0.00),
(866, 5, 250, 187500.00, '2024-11-10 10:45:00', NULL, 'cash', 0.00, 187500.00, 0.00),
(867, 2, 1, 5.15, '2024-11-30 18:32:09', 84, 'cash', 0.00, 5.15, 0.00);

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
(1, 'Travis', 'Scott', 'laflame', 'trabistagalog@gmail.com', '$2y$10$68UcJcRegDsOfhnl8Vt5KuUPqz6oFQT5JIN6HVRmoyV//BWApnlte', 'cashier', '2024-10-26 17:56:32', 'trabis.webp', 'active'),
(50, 'Cashier', 'Test', 'Cashier', 'Cashier@c', '$2y$10$OphC6HuEGOZI9ct4t8GjMeQyNLdbPBboAVevPQp0/4wvI9wsVL6.C', 'cashier', '2024-11-05 16:43:59', 'trabis.webp', 'active'),
(55, 'TEst', 'test', 'test', 'test@test', '$2y$10$AsT2P9z2qNZ2GSruHg.mgeiNr27PUYyS7E8ga4CM.7Cu9OqELCTym', 'admin', '2024-11-05 17:53:04', 'default.jpg', 'active'),
(56, 'beta', 'beta', 'beta', 'beta@test', '$2y$10$nUjTMkaEvr2jlO31cgE5te6zq5vAzoHjsoyo0jOTtLdlDxjX/QQe6', 'admin', '2024-11-05 17:54:34', 'AT-pro-logo.png', 'active'),
(63, 'Add', 'Add', 'add', 'Add@add', '$2y$10$30HXBLztJ/GIqy2tpxAW5e4XG.19V.d.jPloH0wCedZcr01b9jM6y', 'admin', '2024-11-06 11:41:26', 'Activity 2_Entrepreneurial Mind_Martinez.png', 'active'),
(64, 'Nissan', 'Nassin', 'car', 'car@car', '$2y$10$djdQMk07XoF9aWsIu5y1He3Fo5dkiWxTz1ONiuewXucVVTDpnXOi6', 'admin', '2024-11-06 12:03:39', 'bowser_jr_____super_mario_bros__wonder_by_rubychu96_dg7h9a9-fullview-removebg-preview.png', 'active'),
(65, 'Alice', 'Smith', 'alice123', 'alice.smith@example.com', 'password123', 'admin', '2024-11-06 12:11:27', 'trabis.webp', 'active'),
(66, 'Bob', 'Johnson', 'bobby_j', 'bob.johnson@example.com', 'password456', 'cashier', '2024-11-06 12:11:27', 'default.jpg', 'active'),
(67, 'Charlieeeee', 'Brownnnn', 'charlie_bbb', 'charlie.brown@example.commmmmm', 'password789', 'admin', '2024-11-06 12:11:27', 'charlie.png', 'active'),
(70, 'Karina', 'Up', 'katarina', 'aespa@aespa', '$2y$10$HJdVgWEmX4p6uTHxclWyWuWyffgFk3nZhiWMEzM1wsma5p48FvO3i', 'admin', '2024-11-06 12:36:02', 'default.jpg', 'active'),
(72, 'Laufey', 'Scott', 'LaufeyLaufey', 'Laufey@LaufeyLaufeyLaufey', '$2y$10$QIFWWhJpog5xLbdStLCfqOFg2YkKyy7uIpqgJhvOSMmBKKRZm8E6e', 'admin', '2024-11-06 16:00:13', 'trabis.webp', 'inactive'),
(76, 'asdasdasdasd', 'asd', 'zxcasd', 'zxcasd@zxcasd', '$2y$10$qWyrXcBuLpJ.GIIq1mp.g.aUJTi6xam6voLddyVJnwjaU.lPnI706', 'admin', '2024-11-10 15:36:34', 'default.jpg', 'active'),
(77, 'omay', 'gad', 'a@a', 'a@a', '$2y$10$dAyLqkdcAp9wvZL.D6wtzuRT0uSZXukDEX7pOopbJXi4B3hhYf2gy', 'admin', '2024-11-12 15:37:06', 'default.jpg', 'active'),
(79, 'gagokatalaga', 'tanginamo', 'sheesh', 'sheesh@sh', '$2y$10$jZqRWymXF6AsVKBlYy/itOrNZwL3/u/gpk7vTaT/zzqIhY0NiVC.2', 'admin', '2024-11-16 02:04:55', 'trabis.webp', 'active'),
(81, 'yasuo', 'yasuo', 'yasuo', 'yasuo@a', '$2y$10$5ZkF/0CcmkBTrqOM0gsW/.9PX1wuClVBXicJBek29MDOgMT1UUvpe', 'cashier', '2024-11-19 09:04:28', 'e4b8ed1e8dcb3bf993cb91f4b00b203c_large.png', 'active'),
(82, 'Jasper', 'Miranda', 'jasper', 'allen@allena', '$2y$10$UYuDNrlUkm.AYq3bx7B1OOugWz5fx42YNZpslj.jd0ONd9BwU9L2S', 'admin', '2024-11-21 18:16:42', 'jasper.jpg', 'active'),
(83, 'yoyoyo', 'yoyoyoy', 'yoyoyo', 'yoyoyo@yo', '$2y$10$svGHJji5AiFRx0GEYrQ9gO7OT1cPBVHns/QpkXy2GqgFB3UUljMdG', 'admin', '2024-11-22 17:06:07', 'default.jpg', 'active'),
(84, 'Olivia', 'Rodrigo', 'olivia', 'or2@gmail.com', '$2y$10$71DIptv0.5sQi98MqE/22ebdQadGhQY3lJEa8xsLP4bj1iGFb68tO', 'admin', '2024-11-23 09:41:30', 'Oliv.jpg', 'active'),
(85, 'ol', 'qwe', '123', 'qwe@a', '$2y$10$pSn8O7CnEc9Ab1xyeR99PubtFlugttQ/.GclRe84TxY9R45sA26Vm', 'admin', '2024-11-23 09:44:00', 'default.jpg', 'active'),
(86, 'Oliver', 'huh', 'Rodriguez', 'huh@huh', '$2y$10$E5irsLSR/uJ3MYboCWlTd..7qPHGCEj0yzSP3ns67jzZu9wbXofVC', 'admin', '2024-11-24 11:16:27', 'e4b8ed1e8dcb3bf993cb91f4b00b203c_large.png', 'active'),
(89, 'yoyoyo', 'zxczxc', 'tansad2', '123@asd', '$2y$10$YMg8gH8nP9g6M2180Nf4z.U4SwCNJshIND5Zg2b.S6izxXMSl0mc.', 'admin', '2024-11-24 18:40:18', 'default.jpg', 'active');

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
-- Indexes for table `gcash`
--
ALTER TABLE `gcash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gcash_log`
--
ALTER TABLE `gcash_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `gcash`
--
ALTER TABLE `gcash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gcash_log`
--
ALTER TABLE `gcash_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `gcash_transactions`
--
ALTER TABLE `gcash_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `login_activity`
--
ALTER TABLE `login_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=578;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=868;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gcash_log`
--
ALTER TABLE `gcash_log`
  ADD CONSTRAINT `gcash_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
-- Constraints for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD CONSTRAINT `login_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
