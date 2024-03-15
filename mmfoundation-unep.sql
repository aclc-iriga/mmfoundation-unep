-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2024 at 11:49 PM
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
-- Database: `mmfoundation-unep`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'DEVELOPMENT', 'no-avatar.jpg', 'admin', 'admin', NULL, NULL, NULL, '2023-02-19 07:36:32', '2023-05-28 05:27:35');

-- --------------------------------------------------------

--
-- Table structure for table `arrangements`
--

CREATE TABLE `arrangements` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `competition_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `competition_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'mrsanagustin-iriga-2023', 'Mr. San Agustin 2023', '2023-04-06 13:25:10', '2023-04-23 09:58:35'),
(2, 1, 'mssanagustin-iriga-2023', 'Ms. San Agustin 2023', '2023-04-23 09:59:52', '2023-04-23 09:59:52');

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE `competitions` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 'mmfoundation-unep-2023', 'Mr. and Ms. Foundation 2024', '2023-04-06 13:24:04', '2023-04-06 13:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `percentage` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id`, `event_id`, `title`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 'Scale', 100, '2024-03-15 16:59:51', '2024-03-15 22:46:35'),
(2, 2, 'Scale', 100, '2024-03-15 17:00:03', '2024-03-15 22:46:39'),
(3, 3, 'Scale', 100, '2024-03-15 17:00:12', '2024-03-15 22:46:42'),
(4, 4, 'Beauty of the Face', 50, '2024-03-15 17:00:25', '2024-03-15 22:46:44'),
(5, 5, 'Scale', 100, '2024-03-15 17:00:36', '2024-03-15 22:46:46'),
(6, 6, 'Scale', 100, '2024-03-15 17:00:46', '2024-03-15 22:46:48'),
(7, 7, 'Scale', 100, '2024-03-15 17:00:55', '2024-03-15 22:46:50'),
(8, 8, 'Beauty of the Face', 50, '2024-03-15 17:03:29', '2024-03-15 22:46:52'),
(9, 8, 'Intelligence', 50, '2024-03-15 17:03:40', '2024-03-15 22:46:54'),
(10, 4, 'Intelligence', 50, '2024-03-15 17:03:53', '2024-03-15 22:46:57');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `duos`
--

CREATE TABLE `duos` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `event_id_1` smallint(5) UNSIGNED NOT NULL,
  `event_id_2` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `duos`
--

INSERT INTO `duos` (`id`, `slug`, `title`, `event_id_1`, `event_id_2`, `created_at`, `updated_at`) VALUES
(1, 'production', 'PRODUCTION', 1, 5, '2023-04-24 01:29:03', '2023-04-24 01:29:03'),
(2, 'swimwear', 'SWIMWEAR', 2, 6, '2023-04-24 01:29:37', '2023-04-24 01:29:37'),
(3, 'formal-wear-long-gown', 'FORMAL WEAR & LONG GOWN', 3, 7, '2023-04-24 01:30:43', '2023-04-24 01:30:43'),
(4, 'final-qa', 'FINAL Q&A', 4, 8, '2023-04-24 01:31:44', '2024-03-15 17:04:42');

-- --------------------------------------------------------

--
-- Table structure for table `eliminations`
--

CREATE TABLE `eliminations` (
  `id` mediumint(9) NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eliminations`
--

INSERT INTO `eliminations` (`id`, `event_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 1, 18, '2024-03-15 21:44:03', '2024-03-15 21:44:03'),
(2, 1, 19, '2024-03-15 21:44:04', '2024-03-15 21:44:04'),
(3, 1, 20, '2024-03-15 21:44:05', '2024-03-15 21:44:05'),
(4, 1, 21, '2024-03-15 21:44:06', '2024-03-15 21:44:06'),
(5, 1, 22, '2024-03-15 21:44:08', '2024-03-15 21:44:08'),
(6, 1, 23, '2024-03-15 21:44:09', '2024-03-15 21:44:09'),
(7, 1, 24, '2024-03-15 21:44:10', '2024-03-15 21:44:10'),
(8, 1, 25, '2024-03-15 21:44:11', '2024-03-15 21:44:11'),
(9, 1, 26, '2024-03-15 21:44:12', '2024-03-15 21:44:12'),
(10, 1, 27, '2024-03-15 21:44:13', '2024-03-15 21:44:13'),
(11, 1, 28, '2024-03-15 21:44:16', '2024-03-15 21:44:16'),
(12, 1, 29, '2024-03-15 21:44:17', '2024-03-15 21:44:17'),
(13, 1, 30, '2024-03-15 21:44:18', '2024-03-15 21:44:18'),
(14, 1, 31, '2024-03-15 21:44:19', '2024-03-15 21:44:19'),
(15, 1, 32, '2024-03-15 21:44:20', '2024-03-15 21:44:20'),
(16, 1, 33, '2024-03-15 21:44:22', '2024-03-15 21:44:22'),
(17, 1, 34, '2024-03-15 21:44:23', '2024-03-15 21:44:23'),
(18, 2, 18, '2024-03-15 21:44:31', '2024-03-15 21:44:31'),
(19, 2, 19, '2024-03-15 21:44:31', '2024-03-15 21:44:31'),
(20, 2, 20, '2024-03-15 21:44:37', '2024-03-15 21:44:37'),
(21, 2, 21, '2024-03-15 21:44:38', '2024-03-15 21:44:38'),
(22, 2, 22, '2024-03-15 21:44:39', '2024-03-15 21:44:39'),
(23, 2, 23, '2024-03-15 21:44:40', '2024-03-15 21:44:40'),
(24, 2, 24, '2024-03-15 21:44:41', '2024-03-15 21:44:41'),
(25, 2, 25, '2024-03-15 21:44:47', '2024-03-15 21:44:47'),
(26, 2, 26, '2024-03-15 21:44:48', '2024-03-15 21:44:48'),
(27, 2, 27, '2024-03-15 21:44:49', '2024-03-15 21:44:49'),
(28, 2, 28, '2024-03-15 21:44:50', '2024-03-15 21:44:50'),
(29, 2, 29, '2024-03-15 21:44:52', '2024-03-15 21:44:52'),
(30, 2, 30, '2024-03-15 21:44:53', '2024-03-15 21:44:53'),
(31, 2, 31, '2024-03-15 21:44:54', '2024-03-15 21:44:54'),
(32, 2, 32, '2024-03-15 21:44:55', '2024-03-15 21:44:55'),
(33, 2, 33, '2024-03-15 21:44:56', '2024-03-15 21:44:56'),
(34, 2, 34, '2024-03-15 21:44:57', '2024-03-15 21:44:57'),
(35, 3, 18, '2024-03-15 21:45:08', '2024-03-15 21:45:08'),
(36, 3, 19, '2024-03-15 21:45:09', '2024-03-15 21:45:09'),
(37, 3, 20, '2024-03-15 21:45:10', '2024-03-15 21:45:10'),
(38, 3, 21, '2024-03-15 21:45:11', '2024-03-15 21:45:11'),
(39, 3, 22, '2024-03-15 21:45:12', '2024-03-15 21:45:12'),
(40, 3, 23, '2024-03-15 21:45:14', '2024-03-15 21:45:14'),
(41, 3, 24, '2024-03-15 21:45:15', '2024-03-15 21:45:15'),
(42, 3, 25, '2024-03-15 21:45:16', '2024-03-15 21:45:16'),
(43, 3, 26, '2024-03-15 21:45:17', '2024-03-15 21:45:17'),
(44, 3, 27, '2024-03-15 21:45:19', '2024-03-15 21:45:19'),
(45, 3, 28, '2024-03-15 21:45:22', '2024-03-15 21:45:22'),
(46, 3, 29, '2024-03-15 21:45:23', '2024-03-15 21:45:23'),
(47, 3, 30, '2024-03-15 21:45:24', '2024-03-15 21:45:24'),
(48, 3, 31, '2024-03-15 21:45:25', '2024-03-15 21:45:25'),
(49, 3, 32, '2024-03-15 21:45:26', '2024-03-15 21:45:26'),
(50, 3, 33, '2024-03-15 21:45:27', '2024-03-15 21:45:27'),
(51, 3, 34, '2024-03-15 21:45:28', '2024-03-15 21:45:28'),
(52, 4, 1, '2024-03-15 21:45:57', '2024-03-15 21:45:57'),
(53, 4, 18, '2024-03-15 21:45:58', '2024-03-15 21:45:58'),
(54, 4, 2, '2024-03-15 21:45:59', '2024-03-15 21:45:59'),
(55, 4, 19, '2024-03-15 21:45:59', '2024-03-15 21:45:59'),
(56, 4, 3, '2024-03-15 21:46:00', '2024-03-15 21:46:00'),
(57, 4, 20, '2024-03-15 21:46:00', '2024-03-15 21:46:00'),
(58, 4, 4, '2024-03-15 21:46:01', '2024-03-15 21:46:01'),
(59, 4, 21, '2024-03-15 21:46:01', '2024-03-15 21:46:01'),
(60, 4, 5, '2024-03-15 21:46:02', '2024-03-15 21:46:02'),
(61, 4, 22, '2024-03-15 21:46:03', '2024-03-15 21:46:03'),
(62, 4, 6, '2024-03-15 21:46:04', '2024-03-15 21:46:04'),
(63, 4, 23, '2024-03-15 21:46:04', '2024-03-15 21:46:04'),
(64, 4, 7, '2024-03-15 21:46:04', '2024-03-15 21:46:04'),
(65, 4, 24, '2024-03-15 21:46:05', '2024-03-15 21:46:05'),
(66, 4, 8, '2024-03-15 21:46:05', '2024-03-15 21:46:05'),
(67, 4, 25, '2024-03-15 21:46:06', '2024-03-15 21:46:06'),
(68, 4, 9, '2024-03-15 21:46:06', '2024-03-15 21:46:06'),
(69, 4, 26, '2024-03-15 21:46:06', '2024-03-15 21:46:06'),
(70, 4, 10, '2024-03-15 21:46:07', '2024-03-15 21:46:07'),
(71, 4, 27, '2024-03-15 21:46:08', '2024-03-15 21:46:08'),
(72, 4, 11, '2024-03-15 21:46:08', '2024-03-15 21:46:08'),
(73, 4, 28, '2024-03-15 21:46:09', '2024-03-15 21:46:09'),
(74, 4, 12, '2024-03-15 21:46:10', '2024-03-15 21:46:10'),
(75, 4, 29, '2024-03-15 21:46:10', '2024-03-15 21:46:10'),
(76, 4, 13, '2024-03-15 21:46:11', '2024-03-15 21:46:11'),
(77, 4, 30, '2024-03-15 21:46:12', '2024-03-15 21:46:12'),
(78, 4, 31, '2024-03-15 21:46:13', '2024-03-15 21:46:13'),
(79, 4, 14, '2024-03-15 21:46:14', '2024-03-15 21:46:14'),
(80, 4, 15, '2024-03-15 21:46:14', '2024-03-15 21:46:14'),
(81, 4, 32, '2024-03-15 21:46:15', '2024-03-15 21:46:15'),
(82, 4, 16, '2024-03-15 21:46:16', '2024-03-15 21:46:16'),
(83, 4, 33, '2024-03-15 21:46:16', '2024-03-15 21:46:16'),
(84, 4, 17, '2024-03-15 21:46:17', '2024-03-15 21:46:17'),
(85, 4, 34, '2024-03-15 21:46:17', '2024-03-15 21:46:17'),
(86, 5, 1, '2024-03-15 21:46:23', '2024-03-15 21:46:23'),
(87, 5, 2, '2024-03-15 21:46:24', '2024-03-15 21:46:24'),
(88, 5, 3, '2024-03-15 21:46:25', '2024-03-15 21:46:25'),
(89, 5, 4, '2024-03-15 21:46:27', '2024-03-15 21:46:27'),
(90, 5, 5, '2024-03-15 21:46:29', '2024-03-15 21:46:29'),
(91, 5, 6, '2024-03-15 21:46:29', '2024-03-15 21:46:29'),
(92, 5, 7, '2024-03-15 21:46:30', '2024-03-15 21:46:30'),
(93, 5, 8, '2024-03-15 21:46:31', '2024-03-15 21:46:31'),
(94, 5, 9, '2024-03-15 21:46:36', '2024-03-15 21:46:36'),
(95, 5, 10, '2024-03-15 21:46:37', '2024-03-15 21:46:37'),
(96, 5, 11, '2024-03-15 21:46:38', '2024-03-15 21:46:38'),
(97, 5, 12, '2024-03-15 21:46:39', '2024-03-15 21:46:39'),
(98, 5, 13, '2024-03-15 21:46:42', '2024-03-15 21:46:42'),
(99, 5, 14, '2024-03-15 21:46:45', '2024-03-15 21:46:45'),
(100, 5, 15, '2024-03-15 21:46:46', '2024-03-15 21:46:46'),
(101, 5, 16, '2024-03-15 21:46:48', '2024-03-15 21:46:48'),
(102, 5, 17, '2024-03-15 21:46:49', '2024-03-15 21:46:49'),
(103, 6, 1, '2024-03-15 21:46:58', '2024-03-15 21:46:58'),
(104, 6, 2, '2024-03-15 21:46:59', '2024-03-15 21:46:59'),
(105, 6, 3, '2024-03-15 21:47:00', '2024-03-15 21:47:00'),
(106, 6, 4, '2024-03-15 21:47:00', '2024-03-15 21:47:00'),
(107, 6, 5, '2024-03-15 21:47:01', '2024-03-15 21:47:01'),
(108, 6, 6, '2024-03-15 21:47:05', '2024-03-15 21:47:05'),
(109, 6, 7, '2024-03-15 21:47:06', '2024-03-15 21:47:06'),
(110, 6, 8, '2024-03-15 21:47:07', '2024-03-15 21:47:07'),
(111, 6, 9, '2024-03-15 21:47:08', '2024-03-15 21:47:08'),
(112, 6, 10, '2024-03-15 21:47:09', '2024-03-15 21:47:09'),
(113, 6, 11, '2024-03-15 21:47:10', '2024-03-15 21:47:10'),
(114, 6, 12, '2024-03-15 21:47:12', '2024-03-15 21:47:12'),
(115, 6, 13, '2024-03-15 21:47:12', '2024-03-15 21:47:12'),
(116, 6, 14, '2024-03-15 21:47:13', '2024-03-15 21:47:13'),
(117, 6, 15, '2024-03-15 21:47:29', '2024-03-15 21:47:29'),
(118, 6, 16, '2024-03-15 21:47:30', '2024-03-15 21:47:30'),
(119, 6, 17, '2024-03-15 21:47:30', '2024-03-15 21:47:30'),
(120, 7, 1, '2024-03-15 21:47:33', '2024-03-15 21:47:33'),
(121, 7, 2, '2024-03-15 21:47:34', '2024-03-15 21:47:34'),
(122, 7, 3, '2024-03-15 21:47:35', '2024-03-15 21:47:35'),
(123, 7, 4, '2024-03-15 21:47:36', '2024-03-15 21:47:36'),
(124, 7, 5, '2024-03-15 21:47:37', '2024-03-15 21:47:37'),
(125, 7, 6, '2024-03-15 21:47:38', '2024-03-15 21:47:38'),
(126, 7, 7, '2024-03-15 21:47:39', '2024-03-15 21:47:39'),
(127, 7, 8, '2024-03-15 21:47:40', '2024-03-15 21:47:40'),
(128, 7, 9, '2024-03-15 21:47:42', '2024-03-15 21:47:42'),
(129, 7, 10, '2024-03-15 21:47:44', '2024-03-15 21:47:44'),
(130, 7, 11, '2024-03-15 21:47:45', '2024-03-15 21:47:45'),
(131, 7, 12, '2024-03-15 21:47:47', '2024-03-15 21:47:47'),
(132, 7, 13, '2024-03-15 21:47:48', '2024-03-15 21:47:48'),
(133, 7, 14, '2024-03-15 21:47:57', '2024-03-15 21:47:57'),
(134, 7, 15, '2024-03-15 21:47:58', '2024-03-15 21:47:58'),
(135, 7, 16, '2024-03-15 21:47:59', '2024-03-15 21:47:59'),
(136, 7, 17, '2024-03-15 21:48:00', '2024-03-15 21:48:00'),
(137, 8, 1, '2024-03-15 21:48:03', '2024-03-15 21:48:03'),
(138, 8, 18, '2024-03-15 21:48:03', '2024-03-15 21:48:03'),
(139, 8, 2, '2024-03-15 21:48:04', '2024-03-15 21:48:04'),
(140, 8, 19, '2024-03-15 21:48:05', '2024-03-15 21:48:05'),
(141, 8, 3, '2024-03-15 21:48:05', '2024-03-15 21:48:05'),
(142, 8, 20, '2024-03-15 21:48:05', '2024-03-15 21:48:05'),
(143, 8, 4, '2024-03-15 21:48:06', '2024-03-15 21:48:06'),
(144, 8, 21, '2024-03-15 21:48:07', '2024-03-15 21:48:07'),
(145, 8, 5, '2024-03-15 21:48:08', '2024-03-15 21:48:08'),
(146, 8, 22, '2024-03-15 21:48:08', '2024-03-15 21:48:08'),
(147, 8, 6, '2024-03-15 21:48:09', '2024-03-15 21:48:09'),
(148, 8, 23, '2024-03-15 21:48:09', '2024-03-15 21:48:09'),
(149, 8, 7, '2024-03-15 21:48:09', '2024-03-15 21:48:09'),
(150, 8, 24, '2024-03-15 21:48:10', '2024-03-15 21:48:10'),
(151, 8, 8, '2024-03-15 21:48:11', '2024-03-15 21:48:11'),
(152, 8, 25, '2024-03-15 21:48:12', '2024-03-15 21:48:12'),
(153, 8, 9, '2024-03-15 21:48:12', '2024-03-15 21:48:12'),
(154, 8, 26, '2024-03-15 21:48:13', '2024-03-15 21:48:13'),
(155, 8, 10, '2024-03-15 21:48:13', '2024-03-15 21:48:13'),
(156, 8, 27, '2024-03-15 21:48:14', '2024-03-15 21:48:14'),
(157, 8, 11, '2024-03-15 21:48:15', '2024-03-15 21:48:15'),
(158, 8, 28, '2024-03-15 21:48:15', '2024-03-15 21:48:15'),
(159, 8, 12, '2024-03-15 21:48:16', '2024-03-15 21:48:16'),
(160, 8, 29, '2024-03-15 21:48:17', '2024-03-15 21:48:17'),
(161, 8, 13, '2024-03-15 21:48:17', '2024-03-15 21:48:17'),
(162, 8, 30, '2024-03-15 21:48:18', '2024-03-15 21:48:18'),
(163, 8, 14, '2024-03-15 21:48:18', '2024-03-15 21:48:18'),
(164, 8, 31, '2024-03-15 21:48:19', '2024-03-15 21:48:19'),
(165, 8, 15, '2024-03-15 21:48:19', '2024-03-15 21:48:19'),
(166, 8, 32, '2024-03-15 21:48:19', '2024-03-15 21:48:19'),
(167, 8, 16, '2024-03-15 21:48:20', '2024-03-15 21:48:20'),
(168, 8, 33, '2024-03-15 21:48:21', '2024-03-15 21:48:21'),
(169, 8, 17, '2024-03-15 21:48:22', '2024-03-15 21:48:22'),
(170, 8, 34, '2024-03-15 21:48:23', '2024-03-15 21:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `category_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'production-1', '(M) PRODUCTION', '2023-04-23 09:27:10', '2023-05-03 06:09:03'),
(2, 1, 'swimwear-1', '(M) SWIMWEAR', '2023-04-23 09:28:36', '2023-05-03 06:09:13'),
(3, 1, 'formal-wear', '(M) FORMAL WEAR', '2023-04-23 09:29:12', '2023-05-03 06:09:41'),
(4, 1, 'final-qa-1', '(M) FINAL Q&A', '2023-04-23 09:30:11', '2024-03-15 16:58:38'),
(5, 2, 'production-2', '(F) PRODUCTION', '2023-04-23 10:08:26', '2024-03-15 16:58:41'),
(6, 2, 'swimwear-2', '(F) SWIMWEAR', '2023-04-23 10:08:43', '2024-03-15 16:58:45'),
(7, 2, 'long-gown', '(F) LONG GOWN', '2023-04-23 10:09:14', '2024-03-15 16:58:47'),
(8, 2, 'final-qa-2', '(F) FINAL Q&A', '2023-04-23 10:10:04', '2024-03-15 16:58:49');

-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE `judges` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judges`
--

INSERT INTO `judges` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Judge 01', 'no-avatar.jpg', 'judge01', 'judge01', NULL, NULL, NULL, '2023-04-06 13:58:11', '2024-03-15 22:37:16'),
(2, 2, 'Judge 02', 'no-avatar.jpg', 'judge02', 'judge02', NULL, NULL, NULL, '2023-04-06 13:58:28', '2024-03-15 22:20:46'),
(3, 3, 'Judge 03', 'no-avatar.jpg', 'judge03', 'judge03', NULL, NULL, NULL, '2023-04-06 13:58:42', '2024-03-15 22:24:50'),
(4, 4, 'Judge 04', 'no-avatar.jpg', 'judge04', 'judge04', NULL, NULL, NULL, '2023-04-06 13:59:26', '2024-03-15 22:24:50'),
(5, 5, 'Judge 05', 'no-avatar.jpg', 'judge05', 'judge05', NULL, NULL, NULL, '2023-04-06 14:00:00', '2024-03-15 22:24:50'),
(6, 6, 'Judge 06', 'no-avatar.jpg', 'judge06', 'judge06', NULL, NULL, NULL, '2024-03-15 17:07:48', '2024-03-15 17:07:48');

-- --------------------------------------------------------

--
-- Table structure for table `judge_event`
--

CREATE TABLE `judge_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `is_chairman` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judge_event`
--

INSERT INTO `judge_event` (`id`, `judge_id`, `event_id`, `is_chairman`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2024-03-15 22:08:14', '2024-03-15 22:08:14'),
(2, 1, 2, 0, '2024-03-15 22:08:20', '2024-03-15 22:08:20'),
(3, 1, 3, 0, '2024-03-15 22:09:42', '2024-03-15 22:09:42'),
(4, 1, 4, 0, '2024-03-15 22:09:46', '2024-03-15 22:09:46'),
(5, 1, 5, 0, '2024-03-15 22:09:50', '2024-03-15 22:09:50'),
(6, 1, 6, 0, '2024-03-15 22:09:53', '2024-03-15 22:09:53'),
(7, 1, 7, 0, '2024-03-15 22:09:57', '2024-03-15 22:09:57'),
(8, 1, 8, 0, '2024-03-15 22:10:02', '2024-03-15 22:10:02'),
(9, 2, 1, 0, '2024-03-15 22:20:44', '2024-03-15 22:20:44'),
(10, 2, 2, 0, '2024-03-15 22:20:49', '2024-03-15 22:20:49'),
(11, 2, 3, 0, '2024-03-15 22:21:36', '2024-03-15 22:21:36'),
(12, 2, 4, 0, '2024-03-15 22:21:39', '2024-03-15 22:21:39'),
(13, 2, 5, 0, '2024-03-15 22:21:43', '2024-03-15 22:21:43'),
(14, 2, 6, 0, '2024-03-15 22:21:46', '2024-03-15 22:21:46'),
(15, 2, 7, 0, '2024-03-15 22:21:50', '2024-03-15 22:21:50'),
(16, 2, 8, 0, '2024-03-15 22:21:55', '2024-03-15 22:21:55'),
(17, 3, 1, 0, '2024-03-15 22:22:16', '2024-03-15 22:22:16'),
(18, 3, 2, 0, '2024-03-15 22:22:20', '2024-03-15 22:22:20'),
(19, 3, 3, 0, '2024-03-15 22:22:23', '2024-03-15 22:22:23'),
(20, 3, 4, 0, '2024-03-15 22:22:27', '2024-03-15 22:22:27'),
(21, 3, 5, 0, '2024-03-15 22:22:30', '2024-03-15 22:22:30'),
(22, 3, 6, 0, '2024-03-15 22:22:34', '2024-03-15 22:22:34'),
(23, 3, 7, 0, '2024-03-15 22:22:38', '2024-03-15 22:22:38'),
(24, 3, 8, 0, '2024-03-15 22:22:42', '2024-03-15 22:22:42'),
(25, 4, 1, 0, '2024-03-15 22:22:51', '2024-03-15 22:22:51'),
(26, 4, 2, 0, '2024-03-15 22:22:55', '2024-03-15 22:22:55'),
(27, 4, 3, 0, '2024-03-15 22:22:58', '2024-03-15 22:22:58'),
(28, 4, 4, 0, '2024-03-15 22:23:02', '2024-03-15 22:23:02'),
(29, 4, 5, 0, '2024-03-15 22:23:06', '2024-03-15 22:23:06'),
(30, 4, 6, 0, '2024-03-15 22:23:09', '2024-03-15 22:23:09'),
(31, 4, 7, 0, '2024-03-15 22:23:13', '2024-03-15 22:23:13'),
(32, 4, 8, 0, '2024-03-15 22:23:16', '2024-03-15 22:23:16'),
(33, 5, 1, 0, '2024-03-15 22:23:24', '2024-03-15 22:23:24'),
(34, 5, 2, 0, '2024-03-15 22:23:28', '2024-03-15 22:23:28'),
(35, 5, 3, 0, '2024-03-15 22:23:31', '2024-03-15 22:23:31'),
(36, 5, 4, 0, '2024-03-15 22:23:35', '2024-03-15 22:23:35'),
(37, 5, 5, 0, '2024-03-15 22:23:38', '2024-03-15 22:23:38'),
(38, 5, 6, 0, '2024-03-15 22:23:41', '2024-03-15 22:23:41'),
(39, 5, 7, 0, '2024-03-15 22:23:45', '2024-03-15 22:23:45'),
(40, 5, 8, 0, '2024-03-15 22:23:48', '2024-03-15 22:23:48'),
(41, 6, 1, 0, '2024-03-15 22:23:58', '2024-03-15 22:23:58'),
(42, 6, 2, 0, '2024-03-15 22:24:02', '2024-03-15 22:24:02'),
(43, 6, 3, 0, '2024-03-15 22:24:05', '2024-03-15 22:24:05'),
(44, 6, 4, 0, '2024-03-15 22:24:09', '2024-03-15 22:24:09'),
(45, 6, 5, 0, '2024-03-15 22:24:12', '2024-03-15 22:24:12'),
(46, 6, 6, 0, '2024-03-15 22:24:16', '2024-03-15 22:24:16'),
(47, 6, 7, 0, '2024-03-15 22:24:19', '2024-03-15 22:24:19'),
(48, 6, 8, 0, '2024-03-15 22:24:23', '2024-03-15 22:24:23');

-- --------------------------------------------------------

--
-- Table structure for table `noshows`
--

CREATE TABLE `noshows` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `number` smallint(5) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `event_id`, `rank`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(2, 1, 2, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(3, 1, 3, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(4, 1, 4, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(5, 1, 5, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(6, 1, 6, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(7, 1, 7, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(8, 1, 8, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(9, 1, 9, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(10, 1, 10, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(11, 1, 11, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(12, 1, 12, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(13, 1, 13, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(14, 1, 14, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(15, 1, 15, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(16, 1, 16, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(17, 2, 1, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(18, 2, 2, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(19, 2, 3, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(20, 2, 4, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(21, 2, 5, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(22, 2, 6, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(23, 2, 7, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(24, 2, 8, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(25, 2, 9, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(26, 2, 10, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(27, 2, 11, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(28, 2, 12, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(29, 2, 13, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(30, 2, 14, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(31, 2, 15, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(32, 2, 16, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(33, 3, 1, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(34, 3, 2, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(35, 3, 3, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(36, 3, 4, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(37, 3, 5, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(38, 3, 6, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(39, 3, 7, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(40, 3, 8, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(41, 3, 9, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(42, 3, 10, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(43, 3, 11, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(44, 3, 12, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(45, 3, 13, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(46, 3, 14, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(47, 3, 15, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(48, 3, 16, 0, '2023-04-23 09:44:08', '2023-04-23 09:44:08'),
(65, 4, 1, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(66, 4, 2, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(67, 4, 3, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(68, 4, 4, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(69, 4, 5, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(70, 4, 6, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(71, 4, 7, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(72, 4, 8, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(73, 4, 9, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(74, 4, 10, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(75, 4, 11, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(76, 4, 12, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(77, 4, 13, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(78, 4, 14, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(79, 4, 15, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09'),
(80, 4, 16, 0, '2023-04-23 09:44:09', '2023-04-23 09:44:09');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `criteria_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `location` varchar(32) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `number`, `name`, `location`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 1, 'Greg U. Legson', 'ASMC', 'mr-01-greg-u-legson.jpg', '2024-03-15 21:17:55', '2024-03-15 21:39:10'),
(2, 2, 'Samuel James M. Atrasado', 'CCDI-Sorsogon', 'mr-02-samuel-james-m-atrasado.jpg', '2024-03-15 21:19:50', '2024-03-15 21:39:17'),
(3, 3, 'Rommel R. Ramirez', 'ASMC', 'mr-03-rommel-r-ramirez.jpg', '2024-03-15 21:20:09', '2024-03-15 21:39:21'),
(4, 4, 'Jessie V. Gaspi', 'UNEP', 'mr-04-jessie-v-gaspi.jpg', '2024-03-15 21:20:30', '2024-03-15 21:39:26'),
(5, 5, 'Jethro A. Paloma', 'Partido College', 'mr-05-jethro-a-paloma.jpg', '2024-03-15 21:21:58', '2024-03-15 21:39:30'),
(6, 6, 'Diony Jay A. Barbosa ', 'UNEP', 'mr-06-diony-jay-a-barbosa.jpg', '2024-03-15 21:22:22', '2024-03-15 21:39:35'),
(7, 7, 'Jan Adrian Lee', 'FAFC', 'mr-07-jan-adrian-lee.jpg', '2024-03-15 21:22:43', '2024-03-15 21:39:40'),
(8, 8, 'Philip V. Salvadora', 'ASMC', 'mr-08-philip-v-salvadora.jpg', '2024-03-15 21:23:10', '2024-03-15 21:39:44'),
(9, 9, 'Marcky N. Lara', 'CCDI- Naga', 'mr-09-marcky-n-lara.jpg', '2024-03-15 21:23:40', '2024-03-15 21:39:49'),
(10, 10, 'Densel Ross R. Esplana', 'UNEP', 'mr-10-densel-ross-r-esplana.jpg', '2024-03-15 21:24:07', '2024-03-15 21:39:53'),
(11, 11, 'Scott Thomas B. Mcmahon Jr.', 'Partido College', 'mr-11-scott-thomas-b-mcmahon-jr.jpg', '2024-03-15 21:26:29', '2024-03-15 21:40:00'),
(12, 12, 'James Eduard T. Bogay', 'CCDI-Naga', 'mr-12-james-eduard-t-bogay.jpg', '2024-03-15 21:26:55', '2024-03-15 21:40:04'),
(13, 13, 'Benny R. Del Rosario', 'FAFC', 'mr-13-benny-r-del-rosario.jpg', '2024-03-15 21:27:21', '2024-03-15 21:40:12'),
(14, 14, 'Reymond S. Garde', 'Partido College', 'mr-14-reymond-s-garde.jpg', '2024-03-15 21:27:42', '2024-03-15 21:40:16'),
(15, 15, 'Sebastian M. Garcia', 'CCDI-Sorsogon', 'mr-15-sebastian-m-garcia.jpg', '2024-03-15 21:28:00', '2024-03-15 21:40:22'),
(16, 16, 'Jodel B. Magonles', 'CCDI-Legazpi', 'mr-16-jodel-b-magonles.jpg', '2024-03-15 21:28:21', '2024-03-15 21:40:26'),
(17, 17, 'AJ A. Espartinez', 'CCDI-Legazpi', 'mr-17-aj-a-espartinez.jpg', '2024-03-15 21:28:49', '2024-03-15 21:40:30'),
(18, 1, 'Ziena A. Guinoo', 'CCDI-Sorsogon', 'ms-01-ziena-a-guinoo.jpg', '2024-03-15 21:29:37', '2024-03-15 21:40:34'),
(19, 2, 'Katherine Anne D. Moreno', 'Partido College', 'ms-02-katherine-anne-moreno.jpg', '2024-03-15 21:30:02', '2024-03-15 21:40:38'),
(20, 3, 'Jovie Biag', 'UNEP', 'ms-03-jovie-biag.jpg', '2024-03-15 21:31:26', '2024-03-15 21:40:42'),
(21, 4, 'Agatha A. Liggayu', 'UNEP', 'ms-04-agatha-a-liggayu.jpg', '2024-03-15 21:31:49', '2024-03-15 21:40:45'),
(22, 5, 'Mary Ashley A. Lopez', 'CCDI-Naga', 'ms-05-mary-ashley-a-lopez.jpg', '2024-03-15 21:32:29', '2024-03-15 21:40:50'),
(23, 6, 'Althea Nicole R. Verceluz', 'ASMC', 'ms-06-althea-nicole-r-verceluz.jpg', '2024-03-15 21:32:59', '2024-03-15 21:41:07'),
(24, 7, 'Alissa B. Marcial', 'FAFC', 'ms-07-alissa-marcial.jpg', '2024-03-15 21:33:20', '2024-03-15 21:41:11'),
(25, 8, 'Janice S. Rivarez', 'FAFC', 'ms-08-janice-s-rivarez.jpg', '2024-03-15 21:33:45', '2024-03-15 21:41:15'),
(26, 9, 'Paula Elaine E. Roxas', 'ASMC', 'ms-09-paula-elaine-e-roxas.jpg', '2024-03-15 21:34:09', '2024-03-15 21:41:20'),
(27, 10, 'Mary Queen O. Corbalan', 'Partido College', 'ms-10-mary-queen-o-corbalan.jpg', '2024-03-15 21:34:40', '2024-03-15 21:41:24'),
(28, 11, 'Erica Akiko P. Araki ', 'ASMC', 'ms-11-erica-akiko-p-araki.jpg', '2024-03-15 21:35:15', '2024-03-15 21:41:28'),
(29, 12, 'Melody D. Serra', 'Partido College', 'ms-12-melody-d-serra.jpg', '2024-03-15 21:35:45', '2024-03-15 21:41:32'),
(30, 13, 'Sherilyn C. Binalla', 'CCDI- Naga', 'ms-13-sherilyn-c-binalla.jpg', '2024-03-15 21:36:30', '2024-03-15 21:41:36'),
(31, 14, 'Kimberly S. Biag', 'UNEP', 'ms-14-kimberly-s-biag.jpg', '2024-03-15 21:36:50', '2024-03-15 21:41:40'),
(32, 15, 'Alisandra P. Labayani', 'CCDI-Sorsogon', 'ms-15-alisandra-p-labayani.jpg', '2024-03-15 21:37:18', '2024-03-15 21:41:45'),
(33, 16, 'Mary Cris P. Ariate', 'CCDI-Legazpi', 'ms-16-mary-cris-p-ariate.jpg', '2024-03-15 21:37:40', '2024-03-15 21:41:50'),
(34, 17, 'Luisa Marie Leron', 'CCDI-Legazpi', 'ms-17-luisa-marie-leron.jpg', '2024-03-15 21:38:32', '2024-03-15 21:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `technicals`
--

CREATE TABLE `technicals` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technicals`
--

INSERT INTO `technicals` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Technical 01', 'no-avatar.jpg', 'technical01', 'technical01', NULL, NULL, NULL, '2023-02-19 08:58:58', '2023-04-06 14:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `technical_event`
--

CREATE TABLE `technical_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `event_id`, `rank`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Best in Production (Male)', '2023-04-23 10:31:50', '2023-04-23 10:33:52'),
(2, 2, 1, 'Best in Swimwear (Male)', '2023-04-23 10:32:05', '2023-04-23 10:33:54'),
(3, 3, 1, 'Best in Formal Wear', '2023-04-23 10:32:24', '2023-04-23 10:33:57'),
(4, 4, 1, 'Mr. Foundation 2024', '2023-04-23 10:23:43', '2024-03-15 18:59:30'),
(5, 4, 2, '1st Runner Up', '2023-04-23 10:23:43', '2024-03-15 18:59:42'),
(6, 4, 3, '2nd Runner Up', '2023-04-23 10:23:43', '2024-03-15 18:59:50'),
(7, 4, 4, '3rd Runner Up', '2023-04-23 10:23:43', '2024-03-15 18:59:58'),
(8, 4, 5, '4th Runner Up', '2023-04-23 10:23:43', '2024-03-15 19:00:12'),
(9, 5, 1, 'Best in Production (Female)', '2023-04-23 10:32:42', '2023-04-23 10:35:37'),
(10, 6, 1, 'Best in Swimwear (Female)', '2023-04-23 10:32:58', '2023-04-23 10:35:41'),
(11, 7, 1, 'Best in Long Gown', '2023-04-23 10:33:12', '2023-04-23 10:35:44'),
(12, 8, 1, 'Ms. Foundation 2024', '2023-04-23 10:29:10', '2024-03-15 19:00:40'),
(13, 8, 2, '1st Runner Up', '2023-04-23 10:29:10', '2024-03-15 19:01:01'),
(14, 8, 3, '2nd Runner Up', '2023-04-23 10:29:10', '2024-03-15 19:01:09'),
(15, 8, 4, '3rd Runner Up', '2023-04-23 10:29:10', '2024-03-15 19:01:17'),
(16, 8, 5, '4th Runner Up', '2023-04-23 10:29:10', '2024-03-15 19:01:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `duos`
--
ALTER TABLE `duos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event1` (`event_id_1`),
  ADD KEY `event2` (`event_id_2`);

--
-- Indexes for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_id` (`category_id`);

--
-- Indexes for table `judges`
--
ALTER TABLE `judges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `noshows`
--
ALTER TABLE `noshows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `criteria_id` (`criteria_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technicals`
--
ALTER TABLE `technicals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arrangements`
--
ALTER TABLE `arrangements`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `duos`
--
ALTER TABLE `duos`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `eliminations`
--
ALTER TABLE `eliminations`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `judges`
--
ALTER TABLE `judges`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `judge_event`
--
ALTER TABLE `judge_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `noshows`
--
ALTER TABLE `noshows`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `technicals`
--
ALTER TABLE `technicals`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `technical_event`
--
ALTER TABLE `technical_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD CONSTRAINT `arrangements_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arrangements_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `criteria`
--
ALTER TABLE `criteria`
  ADD CONSTRAINT `criteria_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `deductions`
--
ALTER TABLE `deductions`
  ADD CONSTRAINT `deductions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_3` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `duos`
--
ALTER TABLE `duos`
  ADD CONSTRAINT `duos_ibfk_1` FOREIGN KEY (`event_id_1`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `duos_ibfk_2` FOREIGN KEY (`event_id_2`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD CONSTRAINT `eliminations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eliminations_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD CONSTRAINT `judge_event_ibfk_1` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `judge_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `noshows`
--
ALTER TABLE `noshows`
  ADD CONSTRAINT `noshows_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `noshows_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participants_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `points`
--
ALTER TABLE `points`
  ADD CONSTRAINT `points_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `criteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD CONSTRAINT `technical_event_ibfk_2` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technical_event_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
