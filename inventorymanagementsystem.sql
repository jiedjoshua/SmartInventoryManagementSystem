-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 13, 2024 at 08:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventorymanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('asd@yahoo.com|127.0.0.1', 'i:1;', 1731076564),
('asd@yahoo.com|127.0.0.1:timer', 'i:1731076564;', 1731076564),
('asdas@gmail.com|127.0.0.1', 'i:1;', 1729601625),
('asdas@gmail.com|127.0.0.1:timer', 'i:1729601625;', 1729601625);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candles`
--

CREATE TABLE `candles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candles`
--

INSERT INTO `candles` (`id`, `name`, `quantity`, `price`) VALUES
(1, 'White Candle', 100, 90.00),
(2, 'Lavender Bliss', 0, 150.00),
(3, 'Vanilla Dream', 60, 100.00),
(4, 'Citrus Breeze', 90, 110.00),
(5, 'Eucalyptus Fresh', 40, 140.00),
(6, 'Ocean Mist', 80, 130.00),
(7, 'Rosemary Sage', 70, 125.00),
(8, 'Cinnamon Spice', 55, 135.00),
(9, 'Tropical Escape', 65, 115.00),
(10, 'Winter Wonderland', 85, 145.00),
(11, 'Scented Rose', 0, 120.00);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flowers`
--

CREATE TABLE `flowers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flowers`
--

INSERT INTO `flowers` (`id`, `name`, `quantity`, `price`) VALUES
(1, 'Rose', 80, 10.00),
(2, 'Tulip', 50, 15.00),
(3, 'Lily', 60, 12.00),
(4, 'Sunflower', 100, 15.00),
(5, 'Orchid', 30, 20.00),
(6, 'Daisy', 10, 19.00),
(7, 'Peony', 70, 18.00),
(8, 'Jasmine', 40, 22.00),
(9, 'Lavender', 90, 14.00),
(10, 'Carnation', 110, 15.00);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_29_162010_create_flowers_table', 2),
(5, '2024_10_29_163324_create_candles_table', 3),
(8, '2024_11_10_120319_create_sales_data_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_data`
--

CREATE TABLE `sales_data` (
  `sales_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `quantity_sold` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_data`
--

INSERT INTO `sales_data` (`sales_id`, `product_id`, `product_type`, `quantity_sold`, `year`, `month`, `created_at`, `updated_at`) VALUES
(1, 1, 'App\\Models\\Candle', 30, 2023, 'January', NULL, NULL),
(2, 2, 'App\\Models\\Flower', 25, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(3, 3, 'App\\Models\\Flower', 20, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(4, 4, 'App\\Models\\Flower', 10, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(5, 5, 'App\\Models\\Flower', 18, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(6, 6, 'App\\Models\\Flower', 30, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(7, 7, 'App\\Models\\Flower', 22, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(8, 8, 'App\\Models\\Flower', 16, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(9, 9, 'App\\Models\\Flower', 12, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(10, 10, 'App\\Models\\Flower', 20, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(12, 1, 'App\\Models\\Candle', 40, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(13, 2, 'App\\Models\\Candle', 30, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(14, 3, 'App\\Models\\Candle', 35, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(15, 4, 'App\\Models\\Candle', 45, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(16, 5, 'App\\Models\\Candle', 25, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(17, 6, 'App\\Models\\Candle', 50, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(18, 7, 'App\\Models\\Candle', 28, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(19, 8, 'App\\Models\\Candle', 20, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(20, 9, 'App\\Models\\Candle', 33, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(21, 10, 'App\\Models\\Candle', 55, 2023, 'January', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(22, 1, 'App\\Models\\Flower', 17, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(23, 2, 'App\\Models\\Flower', 22, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(24, 3, 'App\\Models\\Flower', 12, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(25, 4, 'App\\Models\\Flower', 9, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(26, 5, 'App\\Models\\Flower', 14, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(27, 6, 'App\\Models\\Flower', 28, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(28, 7, 'App\\Models\\Flower', 19, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(29, 8, 'App\\Models\\Flower', 15, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(30, 9, 'App\\Models\\Flower', 10, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(31, 10, 'App\\Models\\Flower', 22, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(33, 1, 'App\\Models\\Candle', 38, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(34, 2, 'App\\Models\\Candle', 32, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(35, 3, 'App\\Models\\Candle', 30, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(36, 4, 'App\\Models\\Candle', 40, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(37, 5, 'App\\Models\\Candle', 26, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(38, 6, 'App\\Models\\Candle', 47, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(39, 7, 'App\\Models\\Candle', 29, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(40, 8, 'App\\Models\\Candle', 22, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(41, 9, 'App\\Models\\Candle', 31, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(42, 10, 'App\\Models\\Candle', 50, 2023, 'February', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(43, 1, 'App\\Models\\Flower', 20, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(44, 2, 'App\\Models\\Flower', 28, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(45, 3, 'App\\Models\\Flower', 15, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(46, 4, 'App\\Models\\Flower', 8, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(47, 5, 'App\\Models\\Flower', 19, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(48, 6, 'App\\Models\\Flower', 33, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(49, 7, 'App\\Models\\Flower', 25, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(50, 8, 'App\\Models\\Flower', 18, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(51, 9, 'App\\Models\\Flower', 14, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(52, 10, 'App\\Models\\Flower', 24, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(54, 1, 'App\\Models\\Candle', 42, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(55, 2, 'App\\Models\\Candle', 33, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(56, 3, 'App\\Models\\Candle', 37, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(57, 4, 'App\\Models\\Candle', 43, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(58, 5, 'App\\Models\\Candle', 28, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(59, 6, 'App\\Models\\Candle', 51, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(60, 7, 'App\\Models\\Candle', 32, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(61, 8, 'App\\Models\\Candle', 26, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(62, 9, 'App\\Models\\Candle', 34, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(63, 10, 'App\\Models\\Candle', 53, 2023, 'March', '2024-11-10 14:28:52', '2024-11-10 14:28:52'),
(64, 1, 'App\\Models\\Flower', 22, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(65, 2, 'App\\Models\\Flower', 27, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(66, 3, 'App\\Models\\Flower', 18, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(67, 4, 'App\\Models\\Flower', 12, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(68, 5, 'App\\Models\\Flower', 21, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(69, 6, 'App\\Models\\Flower', 35, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(70, 7, 'App\\Models\\Flower', 23, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(71, 8, 'App\\Models\\Flower', 17, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(72, 9, 'App\\Models\\Flower', 14, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(73, 10, 'App\\Models\\Flower', 26, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(75, 1, 'App\\Models\\Candle', 45, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(76, 2, 'App\\Models\\Candle', 38, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(77, 3, 'App\\Models\\Candle', 33, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(78, 4, 'App\\Models\\Candle', 46, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(79, 5, 'App\\Models\\Candle', 28, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(80, 6, 'App\\Models\\Candle', 55, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(81, 7, 'App\\Models\\Candle', 34, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(82, 8, 'App\\Models\\Candle', 25, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(83, 9, 'App\\Models\\Candle', 30, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(84, 10, 'App\\Models\\Candle', 52, 2023, 'April', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(85, 1, 'App\\Models\\Flower', 20, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(86, 2, 'App\\Models\\Flower', 26, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(87, 3, 'App\\Models\\Flower', 19, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(88, 4, 'App\\Models\\Flower', 11, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(89, 5, 'App\\Models\\Flower', 23, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(90, 6, 'App\\Models\\Flower', 37, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(91, 7, 'App\\Models\\Flower', 24, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(92, 8, 'App\\Models\\Flower', 18, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(93, 9, 'App\\Models\\Flower', 16, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(94, 10, 'App\\Models\\Flower', 28, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(96, 1, 'App\\Models\\Candle', 47, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(97, 2, 'App\\Models\\Candle', 40, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(98, 3, 'App\\Models\\Candle', 36, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(99, 4, 'App\\Models\\Candle', 49, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(100, 5, 'App\\Models\\Candle', 30, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(101, 6, 'App\\Models\\Candle', 57, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(102, 7, 'App\\Models\\Candle', 38, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(103, 8, 'App\\Models\\Candle', 29, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(104, 9, 'App\\Models\\Candle', 35, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(105, 10, 'App\\Models\\Candle', 54, 2023, 'May', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(106, 1, 'App\\Models\\Flower', 18, 2023, 'June', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(107, 2, 'App\\Models\\Flower', 25, 2023, 'June', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(108, 3, 'App\\Models\\Flower', 21, 2023, 'June', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(109, 4, 'App\\Models\\Flower', 13, 2023, 'June', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(110, 5, 'App\\Models\\Flower', 19, 2023, 'June', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(111, 6, 'App\\Models\\Flower', 40, 2023, 'June', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(112, 7, 'App\\Models\\Flower', 29, 2023, 'June', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(113, 8, 'App\\Models\\Flower', 20, 2023, 'June', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(114, 9, 'App\\Models\\Flower', 17, 2023, 'June', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(115, 10, 'App\\Models\\Flower', 26, 2023, 'June', '2024-11-10 14:36:30', '2024-11-10 14:36:30'),
(117, 1, 'App\\Models\\Candle', 50, 2023, 'June', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(118, 2, 'App\\Models\\Candle', 43, 2023, 'June', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(119, 3, 'App\\Models\\Candle', 38, 2023, 'June', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(120, 4, 'App\\Models\\Candle', 51, 2023, 'June', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(121, 5, 'App\\Models\\Candle', 32, 2023, 'June', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(122, 6, 'App\\Models\\Candle', 58, 2023, 'June', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(123, 7, 'App\\Models\\Candle', 40, 2023, 'June', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(124, 8, 'App\\Models\\Candle', 28, 2023, 'June', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(125, 9, 'App\\Models\\Candle', 37, 2023, 'June', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(126, 10, 'App\\Models\\Candle', 56, 2023, 'June', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(127, 1, 'App\\Models\\Flower', 21, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(128, 2, 'App\\Models\\Flower', 28, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(129, 3, 'App\\Models\\Flower', 20, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(130, 4, 'App\\Models\\Flower', 14, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(131, 5, 'App\\Models\\Flower', 22, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(132, 6, 'App\\Models\\Flower', 38, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(133, 7, 'App\\Models\\Flower', 25, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(134, 8, 'App\\Models\\Flower', 19, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(135, 9, 'App\\Models\\Flower', 15, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(136, 10, 'App\\Models\\Flower', 27, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(138, 1, 'App\\Models\\Candle', 52, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(139, 2, 'App\\Models\\Candle', 45, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(140, 3, 'App\\Models\\Candle', 39, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(141, 4, 'App\\Models\\Candle', 54, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(142, 5, 'App\\Models\\Candle', 33, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(143, 6, 'App\\Models\\Candle', 59, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(144, 7, 'App\\Models\\Candle', 42, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(145, 8, 'App\\Models\\Candle', 30, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(146, 9, 'App\\Models\\Candle', 38, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(147, 10, 'App\\Models\\Candle', 57, 2023, 'July', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(148, 1, 'App\\Models\\Flower', 19, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(149, 2, 'App\\Models\\Flower', 24, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(150, 3, 'App\\Models\\Flower', 22, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(151, 4, 'App\\Models\\Flower', 13, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(152, 5, 'App\\Models\\Flower', 21, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(153, 6, 'App\\Models\\Flower', 36, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(154, 7, 'App\\Models\\Flower', 23, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(155, 8, 'App\\Models\\Flower', 18, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(156, 9, 'App\\Models\\Flower', 14, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(157, 10, 'App\\Models\\Flower', 25, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(159, 1, 'App\\Models\\Candle', 50, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(160, 2, 'App\\Models\\Candle', 42, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(161, 3, 'App\\Models\\Candle', 35, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(162, 4, 'App\\Models\\Candle', 48, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(163, 5, 'App\\Models\\Candle', 31, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(164, 6, 'App\\Models\\Candle', 56, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(165, 7, 'App\\Models\\Candle', 41, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(166, 8, 'App\\Models\\Candle', 29, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(167, 9, 'App\\Models\\Candle', 36, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(168, 10, 'App\\Models\\Candle', 55, 2023, 'August', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(169, 1, 'App\\Models\\Flower', 20, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(170, 2, 'App\\Models\\Flower', 26, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(171, 3, 'App\\Models\\Flower', 18, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(172, 4, 'App\\Models\\Flower', 12, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(173, 5, 'App\\Models\\Flower', 24, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(174, 6, 'App\\Models\\Flower', 39, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(175, 7, 'App\\Models\\Flower', 27, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(176, 8, 'App\\Models\\Flower', 21, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(177, 9, 'App\\Models\\Flower', 15, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(178, 10, 'App\\Models\\Flower', 28, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(180, 1, 'App\\Models\\Candle', 51, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(181, 2, 'App\\Models\\Candle', 44, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(182, 3, 'App\\Models\\Candle', 37, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(183, 4, 'App\\Models\\Candle', 50, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(184, 5, 'App\\Models\\Candle', 32, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(185, 6, 'App\\Models\\Candle', 60, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(186, 7, 'App\\Models\\Candle', 43, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(187, 8, 'App\\Models\\Candle', 31, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(188, 9, 'App\\Models\\Candle', 38, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(189, 10, 'App\\Models\\Candle', 59, 2023, 'September', '2024-11-10 14:37:41', '2024-11-10 14:37:41'),
(190, 1, 'App\\Models\\Flower', 21, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(191, 2, 'App\\Models\\Flower', 27, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(192, 3, 'App\\Models\\Flower', 19, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(193, 4, 'App\\Models\\Flower', 14, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(194, 5, 'App\\Models\\Flower', 22, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(195, 6, 'App\\Models\\Flower', 41, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(196, 7, 'App\\Models\\Flower', 29, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(197, 8, 'App\\Models\\Flower', 20, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(198, 9, 'App\\Models\\Flower', 16, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(199, 10, 'App\\Models\\Flower', 27, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(201, 1, 'App\\Models\\Candle', 53, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(202, 2, 'App\\Models\\Candle', 46, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(203, 3, 'App\\Models\\Candle', 40, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(204, 4, 'App\\Models\\Candle', 52, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(205, 5, 'App\\Models\\Candle', 34, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(206, 6, 'App\\Models\\Candle', 61, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(207, 7, 'App\\Models\\Candle', 44, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(208, 8, 'App\\Models\\Candle', 32, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(209, 9, 'App\\Models\\Candle', 39, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(210, 10, 'App\\Models\\Candle', 58, 2023, 'October', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(211, 1, 'App\\Models\\Flower', 22, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(212, 2, 'App\\Models\\Flower', 30, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(213, 3, 'App\\Models\\Flower', 21, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(214, 4, 'App\\Models\\Flower', 15, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(215, 5, 'App\\Models\\Flower', 23, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(216, 6, 'App\\Models\\Flower', 42, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(217, 7, 'App\\Models\\Flower', 28, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(218, 8, 'App\\Models\\Flower', 21, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(219, 9, 'App\\Models\\Flower', 17, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(220, 10, 'App\\Models\\Flower', 29, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(222, 1, 'App\\Models\\Candle', 55, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(223, 2, 'App\\Models\\Candle', 48, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(224, 3, 'App\\Models\\Candle', 43, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(225, 4, 'App\\Models\\Candle', 54, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(226, 5, 'App\\Models\\Candle', 36, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(227, 6, 'App\\Models\\Candle', 62, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(228, 7, 'App\\Models\\Candle', 46, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(229, 8, 'App\\Models\\Candle', 33, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(230, 9, 'App\\Models\\Candle', 40, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(231, 10, 'App\\Models\\Candle', 59, 2023, 'November', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(232, 1, 'App\\Models\\Flower', 23, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(233, 2, 'App\\Models\\Flower', 31, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(234, 3, 'App\\Models\\Flower', 22, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(235, 4, 'App\\Models\\Flower', 16, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(236, 5, 'App\\Models\\Flower', 25, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(237, 6, 'App\\Models\\Flower', 44, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(238, 7, 'App\\Models\\Flower', 30, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(239, 8, 'App\\Models\\Flower', 22, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(240, 9, 'App\\Models\\Flower', 18, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(241, 10, 'App\\Models\\Flower', 30, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(243, 1, 'App\\Models\\Candle', 57, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(244, 2, 'App\\Models\\Candle', 50, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(245, 3, 'App\\Models\\Candle', 45, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(246, 4, 'App\\Models\\Candle', 58, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(247, 5, 'App\\Models\\Candle', 39, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(248, 6, 'App\\Models\\Candle', 64, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(249, 7, 'App\\Models\\Candle', 48, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(250, 8, 'App\\Models\\Candle', 35, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(251, 9, 'App\\Models\\Candle', 42, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02'),
(252, 10, 'App\\Models\\Candle', 60, 2023, 'December', '2024-11-10 14:39:02', '2024-11-10 14:39:02');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ilpBqTJGuYVLCRKiOrRdEMamYWfg7W8Pqjhvkrwr', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVGdiSVNTTmZRMUNvd0dxTk5WQk16bHEzVXZiWWZIQUJWTE5aVW5QQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9maWx0ZXItc2FsZXM/bW9udGg9TWFyY2giO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1731483560),
('sdOzHEFOmbI6M6Xq4AEAEusf1u2Ns5GgzAzLPIjP', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUmNUWTRsUXV3VElDVG03QU81d3JPeUx1bHcwNE82WXJkU2Eya1hXOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9maWx0ZXItc2FsZXM/bW9udGg9Tm92ZW1iZXIiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1731338250);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@dev.com', NULL, '$2y$12$Lc4Yb0NtdbqRtJ7lYjWIT.oixBQy6Cwuo7Ocn9iVSdNQP2IlJk6ZG', NULL, '2024-10-13 00:44:39', '2024-10-13 00:44:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `candles`
--
ALTER TABLE `candles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `flowers`
--
ALTER TABLE `flowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sales_data`
--
ALTER TABLE `sales_data`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `sales_data_product_id_product_type_index` (`product_id`,`product_type`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candles`
--
ALTER TABLE `candles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flowers`
--
ALTER TABLE `flowers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sales_data`
--
ALTER TABLE `sales_data`
  MODIFY `sales_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
