-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 29, 2026 at 10:29 PM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bluedots_1100erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `resource_type` varchar(50) DEFAULT NULL,
  `resource_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`details`)),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`id`, `user_id`, `action`, `resource_type`, `resource_id`, `ip_address`, `user_agent`, `details`, `created_at`) VALUES
(1, 1, 'create', 'user', 2, '197.211.51.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '{\"username\":\"Joel\",\"role\":\"admin\"}', '2026-01-19 09:59:55'),
(2, 2, 'create_bank_account', 'bank_account', 1, '197.210.53.235', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/144.0.7559.85 Mobile/15E148 Safari/604.1', '{\"bank_name\":\"Access Bank\"}', '2026-01-20 18:39:45'),
(3, 2, 'create_bank_account', 'bank_account', 2, '197.210.53.235', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/144.0.7559.85 Mobile/15E148 Safari/604.1', '{\"bank_name\":\"UBA\"}', '2026-01-20 18:40:17'),
(4, 2, 'create_bank_account', 'bank_account', 3, '197.210.53.235', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/144.0.7559.85 Mobile/15E148 Safari/604.1', '{\"bank_name\":\"First Bank\"}', '2026-01-20 18:40:50');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `show_on_documents` tinyint(1) DEFAULT 0,
  `display_order` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `bank_name`, `account_number`, `account_name`, `is_active`, `show_on_documents`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'Access Bank', '0107309773', 'Bluedots Technologies', 1, 1, 1, '2026-01-20 18:39:45', '2026-01-20 18:39:45'),
(2, 'UBA', '1023821430', 'Bluedots Technologies', 1, 1, 2, '2026-01-20 18:40:17', '2026-01-20 18:40:17'),
(3, 'First Bank', '2042072700', 'Bluedots Technologies', 1, 1, 3, '2026-01-20 18:40:50', '2026-01-20 18:40:50');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `company` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `account_balance` decimal(15,2) DEFAULT 0.00,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `email`, `phone`, `address`, `city`, `state`, `country`, `is_active`, `company`, `notes`, `account_balance`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'BIU Energy', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-19 10:04:19', '2026-01-19 10:04:19'),
(2, 'Keytobs', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-19 13:44:18', '2026-01-19 13:44:18'),
(3, 'Benjamin Maku Owhefere', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-20 18:46:30', '2026-01-20 18:46:30'),
(4, 'MC Lastborn', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-20 23:45:12', '2026-01-20 23:45:12'),
(5, 'Emmanuel Iroroamavwe', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-21 01:14:13', '2026-01-21 01:14:13'),
(6, 'Mrs Agu', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-21 09:22:11', '2026-01-21 09:22:11'),
(7, 'Wisdom Oduware', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-21 15:26:57', '2026-01-21 15:26:57'),
(8, 'Church', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-23 13:41:36', '2026-01-23 13:41:36'),
(9, 'Millennium Heights Hotel', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-24 11:48:53', '2026-01-24 11:48:53'),
(10, 'Mr Atemubaghan', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-26 10:08:13', '2026-01-26 10:08:13'),
(11, 'Mr Christopher', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-26 17:59:10', '2026-01-26 17:59:10'),
(12, 'Mr Manny', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-27 13:44:22', '2026-01-27 13:44:22'),
(13, 'Goldcoast Osaze', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-01-28 15:02:20', '2026-01-28 15:02:20'),
(14, 'Mr Uyi', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-02-08 21:31:24', '2026-02-08 21:31:24'),
(15, 'Guest Customer', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-02-12 14:35:56', '2026-02-12 14:35:56'),
(16, 'Mr Armstrong', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-02-14 01:03:29', '2026-02-14 01:03:29'),
(17, 'Benson Idahosa Univeristy', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-02-19 08:17:56', '2026-02-19 08:17:56'),
(18, 'Fast food', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-02-28 07:48:59', '2026-02-28 07:48:59'),
(19, 'Mr Gabriel', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-02 10:43:55', '2026-03-02 10:43:55'),
(20, 'Engr Ebalu', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-03 20:17:26', '2026-03-03 20:17:26'),
(21, 'JD Hotel', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-05 18:18:07', '2026-03-05 18:18:07'),
(22, 'JD Golden', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-07 17:39:50', '2026-03-07 17:39:50'),
(23, 'JD Golden Hotel', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-07 18:05:08', '2026-03-07 18:05:08'),
(24, 'Mr Idahosa', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-08 16:27:12', '2026-03-08 16:27:12'),
(25, 'Proposed Quote', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-14 22:47:43', '2026-03-14 22:47:43'),
(26, 'Estate Gate', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-20 12:44:09', '2026-03-20 12:44:09'),
(27, 'Mr Chinaka henry', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-22 10:04:38', '2026-03-22 10:04:38'),
(28, 'Mr Osasu', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-22 13:04:13', '2026-03-22 13:04:13'),
(29, 'Mr Osasu Idahosa', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-22 13:24:27', '2026-03-22 13:24:27'),
(30, 'Mr Elaiho', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-23 10:57:20', '2026-03-23 10:57:20'),
(31, 'Driveway', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-23 11:26:55', '2026-03-23 11:26:55'),
(32, 'DJ Owizzy', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-24 13:05:23', '2026-03-24 13:05:23'),
(33, 'Mr Evans', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-24 16:14:57', '2026-03-24 16:14:57'),
(34, 'Capt Elaiho', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-25 08:42:24', '2026-03-25 08:42:24'),
(35, 'Pear Systems Development Company', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-25 12:33:20', '2026-03-25 12:33:20'),
(36, 'Mrs Joy Ehigiator', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-26 05:56:25', '2026-03-26 05:56:25'),
(37, 'The Thames Hotel', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0.00, NULL, '2026-03-26 15:17:56', '2026-03-26 15:17:56');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `quote_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_title` varchar(255) NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `salesperson` varchar(255) NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_vat` decimal(15,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `amount_paid` decimal(15,2) NOT NULL DEFAULT 0.00,
  `balance_due` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment_terms` varchar(255) DEFAULT NULL,
  `status` enum('draft','sent','paid','overdue','cancelled','partial','finalized') DEFAULT 'draft',
  `notes` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `quote_id`, `invoice_title`, `customer_id`, `customer_name`, `salesperson`, `invoice_date`, `due_date`, `subtotal`, `total_vat`, `grand_total`, `amount_paid`, `balance_due`, `payment_terms`, `status`, `notes`, `created_by`, `is_archived`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'INV-0001', 4, 'Cola 3600', 3, 'Benjamin Maku Owhefere', 'Joel Okenabirhie', '2026-01-20', NULL, 880000.00, 0.00, 880000.00, 550000.00, 330000.00, '64% before and balance + 10% within 30 daya', 'partial', NULL, 2, 0, NULL, '2026-01-20 18:54:57', '2026-01-20 19:49:19'),
(2, 'INV-0002', 5, 'Relocation of installation', 4, 'MC Lastborn', 'Joel Okenabirhie', '2026-01-20', NULL, 685000.00, 0.00, 685000.00, 400000.00, 285000.00, '80% Initial Deposit', 'partial', NULL, 2, 0, NULL, '2026-01-20 23:45:49', '2026-01-20 23:46:26'),
(3, 'INV-0003', 6, '5kva Promo', 5, 'Emmanuel Iroroamavwe', 'Joel Okenabirhie', '2026-01-21', NULL, 1450000.00, 0.00, 1450000.00, 1400000.00, 50000.00, '100% Supply', 'partial', NULL, 2, 0, NULL, '2026-01-21 01:15:23', '2026-01-21 01:18:06'),
(4, 'INV-0004', 3, '10KWH Inveter System (Copy)', 1, 'BIU Energy', 'Joel Okenabirhie', '2026-01-23', NULL, 6130000.00, 0.00, 6130000.00, 5600000.00, 530000.00, '80% Initial Deposit', 'partial', NULL, 2, 0, NULL, '2026-01-23 13:31:19', '2026-01-23 13:33:44'),
(5, 'INV-0005', 14, 'Welion Inverter Repair', 11, 'Mr Christopher', 'Joel Okenabirhie', '2026-01-26', NULL, 88000.00, 0.00, 88000.00, 0.00, 88000.00, '', 'finalized', NULL, 2, 0, NULL, '2026-01-26 18:02:11', '2026-01-26 18:02:16');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_line_items`
--

CREATE TABLE `invoice_line_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `item_number` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `vat_applicable` tinyint(1) DEFAULT 0,
  `vat_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `line_total` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_line_items`
--

INSERT INTO `invoice_line_items` (`id`, `invoice_id`, `product_id`, `item_number`, `quantity`, `description`, `unit_price`, `vat_applicable`, `vat_amount`, `line_total`, `created_at`) VALUES
(1, 1, NULL, 1, 1.00, 'Cola3600 solar Generator', 850000.00, 0, 0.00, 850000.00, '2026-01-20 18:54:57'),
(2, 1, NULL, 2, 1.00, '10% of Balance', 30000.00, 0, 0.00, 30000.00, '2026-01-20 18:54:57'),
(3, 2, NULL, 1, 1.00, 'Relocation and installation Accessories', 685000.00, 0, 0.00, 685000.00, '2026-01-20 23:45:49'),
(4, 3, NULL, 1, 1.00, '6KVA Hybrid Inverter', 550000.00, 0, 0.00, 550000.00, '2026-01-21 01:15:23'),
(5, 3, NULL, 2, 1.00, '5KWH Lithium Battery', 900000.00, 0, 0.00, 900000.00, '2026-01-21 01:15:23'),
(6, 4, NULL, 1, 1.00, '10KWH  Inveter System with 16KWH Lithium Battery Setup', 3650000.00, 0, 0.00, 3650000.00, '2026-01-23 13:31:19'),
(7, 4, NULL, 2, 10.00, '670W Solar Panels', 160000.00, 0, 0.00, 1600000.00, '2026-01-23 13:31:19'),
(8, 4, NULL, 3, 1.00, 'Installation Accessories', 680000.00, 0, 0.00, 680000.00, '2026-01-23 13:31:19'),
(9, 4, NULL, 4, 1.00, 'Installation, Setup and logistics', 200000.00, 0, 0.00, 200000.00, '2026-01-23 13:31:19'),
(10, 5, NULL, 1, 1.00, 'Inverter Repair', 40000.00, 0, 0.00, 40000.00, '2026-01-26 18:02:11'),
(11, 5, NULL, 2, 1.00, 'Logisitics', 18000.00, 0, 0.00, 18000.00, '2026-01-26 18:02:11'),
(12, 5, NULL, 3, 1.00, 'Blower', 20000.00, 0, 0.00, 20000.00, '2026-01-26 18:02:11'),
(13, 5, NULL, 4, 1.00, 'Service CHarge', 10000.00, 0, 0.00, 10000.00, '2026-01-26 18:02:11');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `payment_number` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `customer_id`, `amount`, `payment_date`, `payment_method`, `reference`, `notes`, `created_by`, `payment_number`, `created_at`, `deleted_at`) VALUES
(2, 3, 250000.00, '2026-01-19', 'Bank Transfer', 'Transfer 260119020100370770475473', '', 2, 'PAY-2601-002', '2026-01-20 18:59:52', NULL),
(3, 3, 300000.00, '2026-01-20', 'Bank Transfer', 'Transfer 260112020100180037919456', 'Transfer to Access Bank via Opay', 2, 'PAY-2601-003', '2026-01-20 19:49:19', NULL),
(4, 4, 400000.00, '2026-01-20', 'Bank Transfer', '', '', 2, 'PAY-2601-003', '2026-01-20 23:46:26', NULL),
(5, 5, 1400000.00, '2026-01-19', 'Bank Transfer', 'TRF|2MPTjvh8|2013228665689628672', 'Transfer from Trust God Blessed Enterprise Moniepoint MFB', 2, 'PAY-2601-004', '2026-01-21 01:18:06', NULL),
(6, 1, 5600000.00, '2026-01-23', 'Bank Transfer', '', '', 2, 'PAY-2601-005', '2026-01-23 13:33:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT 'General',
  `description` text DEFAULT NULL,
  `unit_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `vat_applicable` tinyint(1) DEFAULT 1,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` int(10) UNSIGNED NOT NULL,
  `quote_number` varchar(50) NOT NULL,
  `quote_title` varchar(255) NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `salesperson` varchar(255) NOT NULL,
  `quote_date` date NOT NULL,
  `subtotal` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_vat` decimal(15,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment_terms` varchar(255) DEFAULT '80% Initial Deposit',
  `delivery_period` varchar(255) DEFAULT NULL,
  `status` enum('draft','finalized','approved','rejected','expired') DEFAULT 'draft',
  `notes` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `quote_number`, `quote_title`, `customer_id`, `customer_name`, `salesperson`, `quote_date`, `subtotal`, `total_vat`, `grand_total`, `payment_terms`, `delivery_period`, `status`, `notes`, `created_by`, `is_archived`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'QUOT-2026-001', '30KW Inveter System', 1, 'BIU Energy', 'Joel Okenabirhie', '2026-01-19', 12970000.00, 56250.00, 13026250.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-01-19 10:04:19', '2026-01-19 10:59:43'),
(2, 'QUOT-2026-002', '5KVA 5KWH System', 2, 'Keytobs', 'Joel Okenabirhie', '2026-01-19', 2695000.00, 45000.00, 2740000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-01-19 13:44:18', '2026-01-19 13:44:18'),
(3, 'QUO--2025', '10KWH Inveter System (Copy)', 1, 'BIU Energy', 'Joel Okenabirhie', '2026-01-19', 6130000.00, 0.00, 6130000.00, '80% Initial Deposit', NULL, 'finalized', NULL, 2, 0, NULL, '2026-01-19 14:50:28', '2026-01-23 13:30:58'),
(4, 'QUOT-2026-003', 'Cola 3600', 3, 'Benjamin Maku Owhefere', 'Joel Okenabirhie', '2026-01-20', 880000.00, 0.00, 880000.00, '64% before and balance + 10% within 30 daya', '10 Days', 'finalized', NULL, 2, 0, NULL, '2026-01-20 18:46:30', '2026-01-20 18:54:51'),
(5, 'QUOT-2026-004', 'Relocation of installation', 4, 'MC Lastborn', 'Joel Okenabirhie', '2026-01-20', 685000.00, 0.00, 685000.00, '80% Initial Deposit', '10 Days', 'finalized', NULL, 2, 0, NULL, '2026-01-20 23:45:12', '2026-01-20 23:45:41'),
(6, 'QUOT-2026-005', '5kva Promo', 5, 'Emmanuel Iroroamavwe', 'Joel Okenabirhie', '2026-01-21', 1450000.00, 0.00, 1450000.00, '100% Supply', '10 Days', 'finalized', NULL, 2, 0, NULL, '2026-01-21 01:14:13', '2026-01-21 01:15:17'),
(7, 'QUOT-2026-006', '1.2kva Cola zome', 6, 'Mrs Agu', 'Joel Okenabirhie', '2026-01-21', 1570000.00, 0.00, 1570000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-01-21 09:22:11', '2026-01-21 09:22:11'),
(8, 'QUOT-2026-007', '3KVA 2 Batteries and 4 600W solar panels', 7, 'Wisdom Oduware', 'Joel Okenabirhie', '2026-01-21', 2120000.00, 0.00, 2120000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-01-21 15:26:57', '2026-01-21 19:00:19'),
(9, 'QUOT-2026-008', '12KVA Inverter 20KWH Battery 11KW Solar', 8, 'Church', 'Joel Okenabirhie', '2026-01-23', 8250000.00, 0.00, 8250000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-01-23 13:41:36', '2026-01-23 13:41:36'),
(10, 'QUOT-2026-009', 'WiFi Expansion Millennium Heights Hotel', 9, 'Millennium Heights Hotel', 'Joel Okenabirhie', '2026-01-24', 1480000.00, 0.00, 1480000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-01-24 11:48:53', '2026-01-26 14:42:54'),
(13, 'QUOT-2026-010', '12KVA', 10, 'Mr Atemubaghan', 'Joel Okenabirhie', '2026-01-26', 12166000.00, 0.00, 12166000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-01-26 10:08:13', '2026-01-26 12:37:30'),
(14, 'QUOT-2026-011', 'Welion Inverter Repair', 11, 'Mr Christopher', 'Joel Okenabirhie', '2026-01-26', 88000.00, 0.00, 88000.00, '', '10 Days', 'finalized', NULL, 2, 0, NULL, '2026-01-26 17:59:10', '2026-01-26 18:02:07'),
(15, 'QUOT-2026-012', 'System', 12, 'Mr Manny', 'Joel Okenabirhie', '2026-01-27', 11510000.00, 0.00, 11510000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-01-27 13:44:22', '2026-01-27 21:36:54'),
(16, 'QUOT-2026-013', '8KVA INVERTER 15KWH LITHIUM BATTERY 6700W SOLAR SETUP', 13, 'Estate Gate', 'Joel Okenabirhie', '2026-01-28', 8740000.00, 0.00, 8740000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-01-28 15:02:20', '2026-02-07 07:09:41'),
(20, 'QUOT-2026-014', '12KVA 10kwh battery 10kw solar', 14, 'Mr Uyi', 'Joel Okenabirhie', '2026-02-08', 6152000.00, 0.00, 6152000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-02-08 21:31:24', '2026-02-08 21:31:24'),
(22, 'QUOT-2026-015', '8kva Inverter', 15, 'Guest Customer', 'Joel Okenabirhie', '2026-02-12', 4500000.00, 0.00, 4500000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-02-12 14:35:56', '2026-02-12 14:35:56'),
(24, 'QUOT-2026-016', '6kva 10kwh', 16, 'Mr Jindu', 'Joel Okenabirhie', '2026-02-14', 3080000.00, 0.00, 3080000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-02-14 01:03:29', '2026-02-24 11:20:43'),
(25, 'QUOT-2026-017', '10KVA Hybrid Inverter System', 15, 'Guest Customer', 'Joel Okenabirhie', '2026-02-17', 4990000.00, 0.00, 4990000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-02-17 08:40:09', '2026-02-17 08:40:09'),
(26, 'QUOT-2026-018', '6kva inverter, 10KWH Battery and 4900 Watt Solar', 14, 'Mr Uyi', 'Joel Okenabirhie', '2026-02-18', 4370000.00, 0.00, 4370000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-02-18 21:51:12', '2026-02-18 21:51:12'),
(27, 'QUOT-2026-019', 'Solar Panel Installation (BIU Porter\'s Lodge)', 17, 'Benson Idahosa Univeristy', 'Joel O', '2026-02-19', 1935000.00, 145125.00, 2080125.00, '80% Initial Deposit', '10 Days after Mobilization', 'draft', NULL, 2, 0, NULL, '2026-02-19 08:17:56', '2026-02-19 08:18:24'),
(28, 'QUOT-2026-020', 'Solar Installation Agbado', 15, 'Guest Customer', 'Joel Okenabirhie', '2026-02-24', 329750.00, 0.00, 329750.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-02-24 09:16:54', '2026-02-24 11:04:02'),
(36, 'QUOT-2026-021', 'BIU energy fast food', 18, 'Fast food', 'Joel Okenabirhie', '2026-02-28', 5200000.00, 0.00, 5200000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-02-28 07:48:59', '2026-03-10 18:37:44'),
(37, 'QUOT-2026-022', '1KVA setup', 19, 'Mr Gabriel', 'Joel Okenabirhie', '2026-03-02', 980000.00, 0.00, 980000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-02 10:43:55', '2026-03-02 10:43:55'),
(39, 'QUOT-2026-023', '1KVA hybrid max setup', 19, 'Mr Gabriel', 'Joel Okenabirhie', '2026-03-02', 980000.00, 0.00, 980000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-02 10:44:50', '2026-03-02 10:44:50'),
(40, 'QUOT-2026-024', 'Day', 20, 'Engr Ebalu', 'Joel Okenabirhie', '2026-03-03', 17100000.00, 0.00, 17100000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-03 20:17:26', '2026-03-05 17:35:14'),
(41, 'QUOT-2026-025', 'JD hotel', 21, 'JD Hotel', 'Joel Okenabirhie', '2026-03-05', 31650000.00, 0.00, 31650000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-05 18:18:07', '2026-03-05 18:33:25'),
(43, 'QUOT-2026-026', 'Reception Building', 22, 'JD Golden', 'Joel Okenabirhie', '2026-03-07', 14050000.00, 0.00, 14050000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-07 17:39:50', '2026-03-07 17:53:37'),
(44, 'QUOT-2026-027', 'Kitchen and Bar', 23, 'JD Golden Hotel', 'Joel Okenabirhie', '2026-03-07', 7090000.00, 0.00, 7090000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-07 18:05:08', '2026-03-07 18:26:28'),
(45, 'QUOT-2026-028', 'Reception Building', 23, 'JD Golden Hotel', 'Joel Okenabirhie', '2026-03-07', 13610000.00, 0.00, 13610000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-07 18:07:25', '2026-03-07 18:25:45'),
(46, 'QUOT-2026-029', 'Bar Building', 23, 'JD Golden Hotel', 'Joel Okenabirhie', '2026-03-07', 10230000.00, 0.00, 10230000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-07 18:09:05', '2026-03-07 18:24:50'),
(47, 'QUOT-2026-030', 'Hotel Bar and Kitchen', 23, 'JD Golden Hotel', 'Joel Okenabirhie', '2026-03-07', 20900000.00, 0.00, 20900000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-07 18:42:13', '2026-03-07 19:12:58'),
(48, 'QUOT-2026-031', 'Mr Idahosa Upgrade', 24, 'Mr Idahosa', 'Joel Okenabirhie', '2026-03-08', 2950009.00, 0.00, 2950009.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-08 16:27:12', '2026-03-08 16:27:12'),
(49, 'QUOT-2026-032', 'Faculty of Agriculture Network Power and Backup', 17, 'Benson Idahosa Univeristy', 'Joel Okenabirhie', '2026-03-10', 2420000.00, 0.00, 2420000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-10 11:26:16', '2026-03-10 11:43:09'),
(50, 'QUOT-2026-033', 'BIU PG Hostel (Network power Backup)', 17, 'Benson Idahosa Univeristy', 'Joel Okenabirhie', '2026-03-10', 2490000.00, 0.00, 2490000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'finalized', NULL, 2, 0, NULL, '2026-03-10 11:41:29', '2026-03-10 11:41:29'),
(52, 'QUOT-2026-034', '6kva 10kw 5000w solar', 25, 'Proposed Quote', 'Joel Okenabirhie', '2026-03-14', 3450000.00, 0.00, 3450000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-14 22:47:43', '2026-03-14 22:47:43'),
(53, 'QUOT-2026-035', '10kva Inverter suaten', 15, 'Guest Customer', 'Joel Okenabirhie', '2026-03-17', 6770000.00, 0.00, 6770000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-17 09:43:33', '2026-03-17 10:00:43'),
(54, 'QUOT-2026-036', '6kva Inveter 5kwh battery', 15, 'Guest Customer', 'Joel Okenabirhie', '2026-03-18', 2940000.00, 0.00, 2940000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-18 07:21:11', '2026-03-18 07:21:11'),
(55, 'QUOT-2026-037', 'Solar Upgrade', 15, 'Guest Customer', 'Joel Okenabirhie', '2026-03-18', 1240000.00, 0.00, 1240000.00, '100% Payment', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-18 08:00:33', '2026-03-18 08:00:33'),
(56, 'QUOT-2026-038', 'AUCHI 5Kva Inverter 10kWh battery 5000w solar', 15, 'Guest Customer', 'Joel Okenabirhie', '2026-03-18', 4200000.00, 0.00, 4200000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-18 19:36:38', '2026-03-18 19:36:38'),
(57, 'QUOT-2026-039', '2kva 2 batteries and 1950w solar', 15, 'Guest Customer', 'Joel Okenabirhie', '2026-03-18', 1280000.00, 0.00, 1280000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-18 20:57:51', '2026-03-20 09:18:48'),
(58, 'QUOT-2026-040', '4KW inverter 5KWH battery 3600w solar', 15, 'Guest Customer', 'Joel Okenabirhie', '2026-03-19', 2740000.00, 0.00, 2740000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-19 12:23:29', '2026-03-19 12:23:29'),
(59, 'QUOT-2026-041', '2kw/3.6kwh power station with 2000w solar', 15, 'Guest Customer', 'Joel Okenabirhie', '2026-03-19', 1870000.00, 0.00, 1870000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-19 18:52:13', '2026-03-19 18:52:13'),
(60, 'QUOT-2026-042', 'System Upgrade', 26, 'Estate Gate', 'Joel Okenabirhie', '2026-03-20', 4336000.00, 0.00, 4336000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-20 12:44:09', '2026-03-20 12:44:09'),
(61, 'QUOT-2026-043', '10KVA Inverter 15KWH Battery', 15, 'Guest Customer', 'Joel Okenabirhie', '2026-03-20', 5450000.00, 0.00, 5450000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-20 20:41:12', '2026-03-20 20:41:12'),
(62, 'QUOT-2026-044', '6Kva Inverter 10kWh battery 5000w solar', 27, 'Mr Chinaka henry', 'Joel Okenabirhie', '2026-03-22', 3930000.00, 0.00, 3930000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-22 10:04:38', '2026-03-22 10:04:38'),
(63, 'QUOT-2026-045', '4kva inverter, 5kwh battery and  4000w solar', 27, 'Mr Chinaka henry', 'Joel Okenabirhie', '2026-03-22', 2670000.00, 0.00, 2670000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-22 10:15:01', '2026-03-22 10:15:01'),
(64, 'QUOT-2026-046', 'CCTV for Apartment', 28, 'Mr Osasu', 'Joel Okenabirhie', '2026-03-22', 920000.00, 0.00, 920000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-22 13:04:13', '2026-03-22 13:04:13'),
(65, 'QUOT-2026-047', 'Inverter for Apartments', 29, 'Mr Osasu Idahosa', 'Joel Okenabirhie', '2026-03-22', 14670000.00, 0.00, 14670000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-22 13:24:27', '2026-03-22 13:24:27'),
(66, 'QUOT-2026-048', 'Battery Upgrade', 30, 'Mr Elaiho', 'Joel Okenabirhie', '2026-03-23', 1930000.00, 0.00, 1930000.00, 'Full Payment', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-23 10:57:20', '2026-03-23 10:57:20'),
(67, 'QUOT-2026-049', 'PV installation', 30, 'Mr Elaiho', 'Joel Okenabirhie', '2026-03-23', 900000.00, 0.00, 900000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-23 11:16:42', '2026-03-23 11:16:42'),
(68, 'QUOT-2026-050', 'PV Relocation', 31, 'Driveway', 'Joel Okenabirhie', '2026-03-23', 526400.00, 0.00, 526400.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-23 11:26:55', '2026-03-23 11:26:55'),
(69, 'QUOT-2026-051', '4KVA Inverter, 2 Tubular Batteries 1400 Watt Solar', 15, 'Guest Customer', 'Joel Okenabirhie', '2026-03-23', 1910000.00, 0.00, 1910000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-23 11:46:15', '2026-03-23 11:59:32'),
(70, 'QUOT-2026-052', '6kva Inverter 15kw Battery and 5200w Solar', 32, 'DJ Owizzy', 'Joel Okenabirhie', '2026-03-24', 4460000.00, 0.00, 4460000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-24 13:05:23', '2026-03-24 13:05:23'),
(71, 'QUOT-2026-053', '10KVA Inveter 20KWH 10.4KW solar', 33, 'Mr Evans', 'Joel Okenabirhie', '2026-03-24', 7500000.00, 0.00, 7500000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-24 16:14:57', '2026-03-24 16:14:57'),
(72, 'QUOT-2026-054', '10KVa Inveter Supply', 34, 'Capt Elaiho', 'Joel Okenabirhie', '2026-03-25', 900000.00, 0.00, 900000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-25 08:42:24', '2026-03-25 08:42:24'),
(73, 'QUOT-2026-055', 'PEARSDC Base Stations', 35, 'Pear Systems Development Company', 'Joel Okenabirhie', '2026-03-25', 8144000.00, 0.00, 8144000.00, '80% Initial Deposit', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-25 12:33:20', '2026-03-25 12:35:07'),
(74, 'QUOT-2026-056', 'Dual System (Duplex)', 36, 'Mrs Joy Ehigiator', 'Joel Okenabirhie', '2026-03-26', 15600000.00, 0.00, 15600000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-26 05:56:25', '2026-03-26 05:58:28'),
(75, 'QUOT-2026-057', '6kw system for resturant', 36, 'Mrs Joy Ehigiator', 'Joel Okenabirhie', '2026-03-26', 4500000.00, 0.00, 4500000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-26 06:40:01', '2026-03-28 18:55:45'),
(76, 'QUOT-2026-058', 'Thames Hotel Solar installation', 37, 'Mesorein Luxury Hotel', 'Joel Okenabirhie', '2026-03-26', 12550000.00, 0.00, 12550000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-26 15:17:56', '2026-03-27 08:47:57'),
(78, 'QUOT-2026-059', 'Church 10KVA 15Kw and 11kw solar', 34, 'Capt Elaiho', 'Joel Okenabirhie', '2026-03-26', 6350000.00, 0.00, 6350000.00, 'Payment due within 30 days of invoice date.', '10 Days', 'draft', NULL, 2, 0, NULL, '2026-03-26 15:23:16', '2026-03-26 15:23:16');

-- --------------------------------------------------------

--
-- Table structure for table `quote_line_items`
--

CREATE TABLE `quote_line_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quote_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `item_number` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `vat_applicable` tinyint(1) DEFAULT 0,
  `vat_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `line_total` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quote_line_items`
--

INSERT INTO `quote_line_items` (`id`, `quote_id`, `product_id`, `item_number`, `quantity`, `description`, `unit_price`, `vat_applicable`, `vat_amount`, `line_total`, `created_at`) VALUES
(5, 1, NULL, 1, 1.00, '30KW  Inveter System with 48KWH Lithium Battery Setup', 9500000.00, 0, 0.00, 9500000.00, '2026-01-19 10:59:43'),
(6, 1, NULL, 2, 20.00, '650w Solar Panels', 136000.00, 0, 0.00, 2720000.00, '2026-01-19 10:59:43'),
(7, 1, NULL, 3, 1.00, 'Installation Accessories', 450000.00, 1, 33750.00, 483750.00, '2026-01-19 10:59:43'),
(8, 1, NULL, 4, 1.00, 'Installation, Setup and logistics', 300000.00, 1, 22500.00, 322500.00, '2026-01-19 10:59:43'),
(9, 2, NULL, 1, 1.00, '4.2KVA Hybrid Inverter', 450000.00, 0, 0.00, 450000.00, '2026-01-19 13:44:18'),
(10, 2, NULL, 2, 1.00, '5KWH Lithium Battery', 970000.00, 0, 0.00, 970000.00, '2026-01-19 13:44:18'),
(11, 2, NULL, 3, 5.00, '600W Solar Panels', 135000.00, 0, 0.00, 675000.00, '2026-01-19 13:44:18'),
(12, 2, NULL, 4, 1.00, 'Installation Accessories', 350000.00, 1, 26250.00, 376250.00, '2026-01-19 13:44:18'),
(13, 2, NULL, 5, 1.00, 'Installation & Logistics', 250000.00, 1, 18750.00, 268750.00, '2026-01-19 13:44:18'),
(29, 4, NULL, 1, 1.00, 'Cola3600 solar Generator', 850000.00, 0, 0.00, 850000.00, '2026-01-20 18:54:51'),
(30, 4, NULL, 2, 1.00, '10% of Balance', 30000.00, 0, 0.00, 30000.00, '2026-01-20 18:54:51'),
(32, 5, NULL, 1, 1.00, 'Relocation and installation Accessories', 685000.00, 0, 0.00, 685000.00, '2026-01-20 23:45:41'),
(35, 6, NULL, 1, 1.00, '6KVA Hybrid Inverter', 550000.00, 0, 0.00, 550000.00, '2026-01-21 01:15:17'),
(36, 6, NULL, 2, 1.00, '5KWH Lithium Battery', 900000.00, 0, 0.00, 900000.00, '2026-01-21 01:15:17'),
(37, 7, NULL, 1, 1.00, '2KVA Hybrid Inverter', 300000.00, 0, 0.00, 300000.00, '2026-01-21 09:22:11'),
(38, 7, NULL, 2, 2.00, '220AH Tubular Battery', 290000.00, 0, 0.00, 580000.00, '2026-01-21 09:22:11'),
(39, 7, NULL, 3, 3.00, '650W solar Panels', 140000.00, 0, 0.00, 420000.00, '2026-01-21 09:22:11'),
(40, 7, NULL, 4, 1.00, 'Installation Accessories', 250000.00, 0, 0.00, 250000.00, '2026-01-21 09:22:11'),
(41, 7, NULL, 5, 1.00, 'Installation', 20000.00, 0, 0.00, 20000.00, '2026-01-21 09:22:11'),
(47, 8, NULL, 1, 1.00, '3 KVA Hybrid Inverter', 350000.00, 0, 0.00, 350000.00, '2026-01-21 19:00:19'),
(48, 8, NULL, 2, 4.00, '500w Solar Panels', 130000.00, 0, 0.00, 520000.00, '2026-01-21 19:00:19'),
(49, 8, NULL, 3, 2.00, '220AH Tubular Battery', 310000.00, 0, 0.00, 620000.00, '2026-01-21 19:00:19'),
(50, 8, NULL, 4, 1.00, 'Installation Accessories', 380000.00, 0, 0.00, 380000.00, '2026-01-21 19:00:19'),
(51, 8, NULL, 5, 1.00, 'Installation', 250000.00, 0, 0.00, 250000.00, '2026-01-21 19:00:19'),
(52, 3, NULL, 1, 1.00, '10KWH  Inveter System with 16KWH Lithium Battery Setup', 3650000.00, 0, 0.00, 3650000.00, '2026-01-23 13:30:58'),
(53, 3, NULL, 2, 10.00, '670W Solar Panels', 160000.00, 0, 0.00, 1600000.00, '2026-01-23 13:30:58'),
(54, 3, NULL, 3, 1.00, 'Installation Accessories', 680000.00, 0, 0.00, 680000.00, '2026-01-23 13:30:58'),
(55, 3, NULL, 4, 1.00, 'Installation, Setup and logistics', 200000.00, 0, 0.00, 200000.00, '2026-01-23 13:30:58'),
(56, 9, NULL, 1, 1.00, '12 KVA Hybrid Inverter', 1350000.00, 0, 0.00, 1350000.00, '2026-01-23 13:41:36'),
(57, 9, NULL, 2, 20.00, '600w Solar Panels', 140000.00, 0, 0.00, 2800000.00, '2026-01-23 13:41:36'),
(58, 9, NULL, 3, 1.00, '20KWH Lithium Battery', 3300000.00, 0, 0.00, 3300000.00, '2026-01-23 13:41:36'),
(59, 9, NULL, 4, 1.00, 'Installation Accessories', 450000.00, 0, 0.00, 450000.00, '2026-01-23 13:41:36'),
(60, 9, NULL, 5, 1.00, 'Installation', 350000.00, 0, 0.00, 350000.00, '2026-01-23 13:41:36'),
(73, 13, NULL, 1, 1.00, '12KVA Hybrid Inverter System', 1400000.00, 0, 0.00, 1400000.00, '2026-01-26 12:37:30'),
(74, 13, NULL, 2, 2.00, '20KWH Lithium Battery', 3450000.00, 0, 0.00, 6900000.00, '2026-01-26 12:37:30'),
(75, 13, NULL, 3, 20.00, '600w Solar Panels', 145000.00, 0, 0.00, 2900000.00, '2026-01-26 12:37:30'),
(76, 13, NULL, 4, 1.00, 'Standard Installation Accessories', 350000.00, 0, 0.00, 350000.00, '2026-01-26 12:37:30'),
(77, 13, NULL, 5, 70.00, '80m of 6mm² copper flex solar wire', 3800.00, 0, 0.00, 266000.00, '2026-01-26 12:37:30'),
(78, 13, NULL, 6, 1.00, 'Installation', 350000.00, 0, 0.00, 350000.00, '2026-01-26 12:37:30'),
(79, 10, NULL, 1, 9.00, 'Celling mounted Miami Wireless Access point', 150000.00, 0, 0.00, 1350000.00, '2026-01-26 14:42:54'),
(80, 10, NULL, 2, 1.00, 'Installation Accessories', 30000.00, 0, 0.00, 30000.00, '2026-01-26 14:42:54'),
(81, 10, NULL, 3, 1.00, 'Installation', 100000.00, 0, 0.00, 100000.00, '2026-01-26 14:42:54'),
(86, 14, NULL, 1, 1.00, 'Inverter Repair', 40000.00, 0, 0.00, 40000.00, '2026-01-26 18:02:07'),
(87, 14, NULL, 2, 1.00, 'Logisitics', 18000.00, 0, 0.00, 18000.00, '2026-01-26 18:02:07'),
(88, 14, NULL, 3, 1.00, 'Blower', 20000.00, 0, 0.00, 20000.00, '2026-01-26 18:02:07'),
(89, 14, NULL, 4, 1.00, 'Service CHarge', 10000.00, 0, 0.00, 10000.00, '2026-01-26 18:02:07'),
(118, 15, NULL, 1, 1.00, '10KVA Hybrid Inverter', 1000000.00, 0, 0.00, 1000000.00, '2026-01-27 21:36:54'),
(119, 15, NULL, 2, 1.00, '6KVA Hybrid Inverter', 650000.00, 0, 0.00, 650000.00, '2026-01-27 21:36:54'),
(120, 15, NULL, 3, 1.00, '10KWH Lithium Battery', 1950000.00, 0, 0.00, 1950000.00, '2026-01-27 21:36:54'),
(121, 15, NULL, 4, 1.00, '20Kwh lithium battery', 3500000.00, 0, 0.00, 3500000.00, '2026-01-27 21:36:54'),
(122, 15, NULL, 5, 21.00, '650 Solar Panels', 160000.00, 0, 0.00, 3360000.00, '2026-01-27 21:36:54'),
(123, 15, NULL, 6, 1.00, 'Installation Accessories', 650000.00, 0, 0.00, 650000.00, '2026-01-27 21:36:54'),
(124, 15, NULL, 7, 1.00, 'Installation', 400000.00, 0, 0.00, 400000.00, '2026-01-27 21:36:54'),
(145, 16, NULL, 1, 1.00, '10KVa hybrid inverter system', 1050000.00, 0, 0.00, 1050000.00, '2026-02-07 07:09:41'),
(146, 16, NULL, 2, 18.00, '700w Solar Panels', 155000.00, 0, 0.00, 2790000.00, '2026-02-07 07:09:41'),
(147, 16, NULL, 3, 2.00, '15KWH lithium battery', 2000000.00, 0, 0.00, 4000000.00, '2026-02-07 07:09:41'),
(148, 16, NULL, 4, 1.00, 'Installation accessories', 500000.00, 0, 0.00, 500000.00, '2026-02-07 07:09:41'),
(149, 16, NULL, 5, 1.00, 'Installation', 400000.00, 0, 0.00, 400000.00, '2026-02-07 07:09:41'),
(150, 20, NULL, 1, 1.00, '12KWH Inverter', 1250000.00, 0, 0.00, 1250000.00, '2026-02-08 21:31:24'),
(151, 20, NULL, 2, 1.00, '10KWH Battery', 1850000.00, 0, 0.00, 1850000.00, '2026-02-08 21:31:24'),
(152, 20, NULL, 3, 14.00, '720w Solar Panels', 168000.00, 0, 0.00, 2352000.00, '2026-02-08 21:31:24'),
(153, 20, NULL, 4, 1.00, 'installation accessories', 400000.00, 0, 0.00, 400000.00, '2026-02-08 21:31:24'),
(154, 20, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-02-08 21:31:24'),
(155, 22, NULL, 1, 1.00, '8KVA Hybrid Inverter', 700000.00, 0, 0.00, 700000.00, '2026-02-12 14:35:56'),
(156, 22, NULL, 2, 1.00, '10kwh Lithium Battery', 1950000.00, 0, 0.00, 1950000.00, '2026-02-12 14:35:56'),
(157, 22, NULL, 3, 10.00, '500W Solar Panels', 120000.00, 0, 0.00, 1200000.00, '2026-02-12 14:35:56'),
(158, 22, NULL, 4, 1.00, 'Installation Accessories', 350000.00, 0, 0.00, 350000.00, '2026-02-12 14:35:56'),
(159, 22, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-02-12 14:35:56'),
(165, 25, NULL, 1, 1.00, '10 KVA Hybrid Inverter', 890000.00, 0, 0.00, 890000.00, '2026-02-17 08:40:09'),
(166, 25, NULL, 2, 1.00, '15kwh Lithium Battery', 2300000.00, 0, 0.00, 2300000.00, '2026-02-17 08:40:09'),
(167, 25, NULL, 3, 8.00, '700w Solar Panels', 150000.00, 0, 0.00, 1200000.00, '2026-02-17 08:40:09'),
(168, 25, NULL, 4, 1.00, 'Installation Accessories', 350000.00, 0, 0.00, 350000.00, '2026-02-17 08:40:09'),
(169, 25, NULL, 5, 1.00, 'Installation', 250000.00, 0, 0.00, 250000.00, '2026-02-17 08:40:09'),
(170, 26, NULL, 1, 1.00, '6 KVA Hybrid Inverter', 650000.00, 0, 0.00, 650000.00, '2026-02-18 21:51:12'),
(171, 26, NULL, 2, 1.00, '10kwh Lithium Battery', 1900000.00, 0, 0.00, 1900000.00, '2026-02-18 21:51:12'),
(172, 26, NULL, 3, 7.00, '720w Solar Panels', 160000.00, 0, 0.00, 1120000.00, '2026-02-18 21:51:12'),
(173, 26, NULL, 4, 1.00, 'Installation Accessories', 400000.00, 0, 0.00, 400000.00, '2026-02-18 21:51:12'),
(174, 26, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-02-18 21:51:12'),
(179, 27, NULL, 1, 1.00, '700W Monocrystalline Solar Panel', 165000.00, 1, 12375.00, 177375.00, '2026-02-19 08:18:24'),
(180, 27, NULL, 2, 14.00, 'Mounting Structure & Hardware', 100000.00, 1, 105000.00, 1505000.00, '2026-02-19 08:18:24'),
(181, 27, NULL, 3, 1.00, 'DC Cabling & Connectors', 250000.00, 1, 18750.00, 268750.00, '2026-02-19 08:18:24'),
(182, 27, NULL, 4, 1.00, 'Installation & Commissioning', 120000.00, 1, 9000.00, 129000.00, '2026-02-19 08:18:24'),
(213, 28, NULL, 1, 1.00, '100A Digital AVR', 20000.00, 0, 0.00, 20000.00, '2026-02-24 11:04:02'),
(214, 28, NULL, 2, 1.00, '2 Pole DC Breaker', 10000.00, 0, 0.00, 10000.00, '2026-02-24 11:04:02'),
(215, 28, NULL, 3, 25.00, 'yards 2.5mm wire', 950.00, 0, 0.00, 23750.00, '2026-02-24 11:04:02'),
(216, 28, NULL, 4, 15.00, 'yards 6mm solar wires', 3900.00, 0, 0.00, 58500.00, '2026-02-24 11:04:02'),
(217, 28, NULL, 5, 5.00, 'Aluminium interlock profiles', 9500.00, 0, 0.00, 47500.00, '2026-02-24 11:04:02'),
(218, 28, NULL, 6, 1.00, 'Installation and Service charge', 170000.00, 0, 0.00, 170000.00, '2026-02-24 11:04:02'),
(224, 24, NULL, 1, 1.00, '6kva hybrid Inverter', 60000.00, 0, 0.00, 60000.00, '2026-02-24 11:20:43'),
(225, 24, NULL, 2, 1.00, '10kwh Lithium battery', 1950000.00, 0, 0.00, 1950000.00, '2026-02-24 11:20:43'),
(226, 24, NULL, 3, 6.00, '300w Solar Panels', 95000.00, 0, 0.00, 570000.00, '2026-02-24 11:20:43'),
(227, 24, NULL, 4, 1.00, 'Installation Accessories', 300000.00, 0, 0.00, 300000.00, '2026-02-24 11:20:43'),
(228, 24, NULL, 5, 1.00, 'Installation', 200000.00, 0, 0.00, 200000.00, '2026-02-24 11:20:43'),
(229, 24, NULL, 6, 1.00, 'Old System Swap (Inverter + 2 Batteries )\r\nN350,000', 0.00, 0, 0.00, 0.00, '2026-02-24 11:20:43'),
(245, 37, NULL, 1, 1.00, '1Kva Hybrid Inverter', 220000.00, 0, 0.00, 220000.00, '2026-03-02 10:43:55'),
(246, 37, NULL, 2, 3.00, '250w solar Panels', 55000.00, 0, 0.00, 165000.00, '2026-03-02 10:43:55'),
(247, 37, NULL, 3, 1.00, '220AH Tubular Battery', 295000.00, 0, 0.00, 295000.00, '2026-03-02 10:43:55'),
(248, 37, NULL, 4, 1.00, 'Installation Accessories', 200000.00, 0, 0.00, 200000.00, '2026-03-02 10:43:55'),
(249, 37, NULL, 5, 1.00, 'Installation', 100000.00, 0, 0.00, 100000.00, '2026-03-02 10:43:55'),
(250, 39, NULL, 1, 1.00, '1Kva Hybrid Inverter', 220000.00, 0, 0.00, 220000.00, '2026-03-02 10:44:50'),
(251, 39, NULL, 2, 3.00, '200W solar Panels', 55000.00, 0, 0.00, 165000.00, '2026-03-02 10:44:50'),
(252, 39, NULL, 3, 1.00, '220AH Tubular Battery', 295000.00, 0, 0.00, 295000.00, '2026-03-02 10:44:50'),
(253, 39, NULL, 4, 1.00, 'Installation Accessories', 200000.00, 0, 0.00, 200000.00, '2026-03-02 10:44:50'),
(254, 39, NULL, 5, 1.00, 'Installation', 100000.00, 0, 0.00, 100000.00, '2026-03-02 10:44:50'),
(300, 40, NULL, 1, 1.00, '20 KVA Hybrid Inverter', 2650000.00, 0, 0.00, 2650000.00, '2026-03-05 17:35:14'),
(301, 40, NULL, 2, 3.00, '17.5kwh Lithium Battery', 2850000.00, 0, 0.00, 8550000.00, '2026-03-05 17:35:14'),
(302, 40, NULL, 3, 30.00, '720w Solar Panels', 155000.00, 0, 0.00, 4650000.00, '2026-03-05 17:35:14'),
(303, 40, NULL, 4, 1.00, 'Installation Accessories', 750000.00, 0, 0.00, 750000.00, '2026-03-05 17:35:14'),
(304, 40, NULL, 5, 1.00, 'Installation', 500000.00, 0, 0.00, 500000.00, '2026-03-05 17:35:14'),
(340, 41, NULL, 1, 5.00, '12 KVA Hybrid Inverter', 1350000.00, 0, 0.00, 6750000.00, '2026-03-05 18:33:25'),
(341, 41, NULL, 2, 64.00, '600w Solar Panels', 150000.00, 0, 0.00, 9600000.00, '2026-03-05 18:33:25'),
(342, 41, NULL, 3, 4.00, '20KWH Lithium Battery', 2950000.00, 0, 0.00, 11800000.00, '2026-03-05 18:33:25'),
(343, 41, NULL, 4, 1.00, 'Installation Accessories', 2800000.00, 0, 0.00, 2800000.00, '2026-03-05 18:33:25'),
(344, 41, NULL, 5, 1.00, 'Installation', 700000.00, 0, 0.00, 700000.00, '2026-03-05 18:33:25'),
(355, 43, NULL, 1, 2.00, '12 KVA Hybrid Inverter', 1350000.00, 0, 0.00, 2700000.00, '2026-03-07 17:53:37'),
(356, 43, NULL, 2, 28.00, '700w Solar Panels', 150000.00, 0, 0.00, 4200000.00, '2026-03-07 17:53:37'),
(357, 43, NULL, 3, 2.00, '20KWH Lithium Battery', 2950000.00, 0, 0.00, 5900000.00, '2026-03-07 17:53:37'),
(358, 43, NULL, 4, 1.00, 'Installation Accessories', 950000.00, 0, 0.00, 950000.00, '2026-03-07 17:53:37'),
(359, 43, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-07 17:53:37'),
(395, 46, NULL, 1, 2.00, '12 KVA Hybrid Inverter', 1300000.00, 0, 0.00, 2600000.00, '2026-03-07 18:24:50'),
(396, 46, NULL, 2, 24.00, '720W Solar Panels', 145000.00, 0, 0.00, 3480000.00, '2026-03-07 18:24:50'),
(397, 46, NULL, 3, 1.00, '20KWH Lithium Battery', 2900000.00, 0, 0.00, 2900000.00, '2026-03-07 18:24:50'),
(398, 46, NULL, 4, 1.00, 'Installation Accessories', 850000.00, 0, 0.00, 850000.00, '2026-03-07 18:24:50'),
(399, 46, NULL, 5, 1.00, 'Installation', 400000.00, 0, 0.00, 400000.00, '2026-03-07 18:24:50'),
(400, 45, NULL, 1, 2.00, '12 KVA Hybrid Inverter', 1300000.00, 0, 0.00, 2600000.00, '2026-03-07 18:25:45'),
(401, 45, NULL, 2, 28.00, '720W Solar Panels', 145000.00, 0, 0.00, 4060000.00, '2026-03-07 18:25:45'),
(402, 45, NULL, 3, 2.00, '20KWH Lithium Battery', 2900000.00, 0, 0.00, 5800000.00, '2026-03-07 18:25:45'),
(403, 45, NULL, 4, 1.00, 'Installation Accessories', 850000.00, 0, 0.00, 850000.00, '2026-03-07 18:25:45'),
(404, 45, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-07 18:25:45'),
(405, 44, NULL, 1, 1.00, '12 KVA Hybrid Inverter', 1300000.00, 0, 0.00, 1300000.00, '2026-03-07 18:26:28'),
(406, 44, NULL, 2, 12.00, '720W Solar Panels', 145000.00, 0, 0.00, 1740000.00, '2026-03-07 18:26:28'),
(407, 44, NULL, 3, 1.00, '20KWH Lithium Battery', 2900000.00, 0, 0.00, 2900000.00, '2026-03-07 18:26:28'),
(408, 44, NULL, 4, 1.00, 'Installation Accessories', 850000.00, 0, 0.00, 850000.00, '2026-03-07 18:26:28'),
(409, 44, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-07 18:26:28'),
(445, 47, NULL, 1, 3.00, '12 KVA Hybrid Inverter', 1300000.00, 0, 0.00, 3900000.00, '2026-03-07 19:12:58'),
(446, 47, NULL, 2, 40.00, '720W Solar Panels', 145000.00, 0, 0.00, 5800000.00, '2026-03-07 19:12:58'),
(447, 47, NULL, 3, 3.00, '20KWH Lithium Battery', 2900000.00, 0, 0.00, 8700000.00, '2026-03-07 19:12:58'),
(448, 47, NULL, 4, 1.00, 'Installation Accessories', 1900000.00, 0, 0.00, 1900000.00, '2026-03-07 19:12:58'),
(449, 47, NULL, 5, 1.00, 'Installation', 600000.00, 0, 0.00, 600000.00, '2026-03-07 19:12:58'),
(450, 48, NULL, 1, 1.00, '6 KVA Hybrid Inverter', 550009.00, 0, 0.00, 550009.00, '2026-03-08 16:27:12'),
(451, 48, NULL, 2, 1.00, '10kwh Lithium Battery', 1750000.00, 0, 0.00, 1750000.00, '2026-03-08 16:27:12'),
(452, 48, NULL, 3, 4.00, '500w Solar Panels', 100000.00, 0, 0.00, 400000.00, '2026-03-08 16:27:12'),
(453, 48, NULL, 4, 1.00, 'Installation Accessories', 100000.00, 0, 0.00, 100000.00, '2026-03-08 16:27:12'),
(454, 48, NULL, 5, 1.00, 'Installation', 150000.00, 0, 0.00, 150000.00, '2026-03-08 16:27:12'),
(460, 50, NULL, 1, 1.00, '4 KVA Hybrid Inverter', 480000.00, 0, 0.00, 480000.00, '2026-03-10 11:41:29'),
(461, 50, NULL, 2, 4.00, '650 Solar Panels', 150000.00, 0, 0.00, 600000.00, '2026-03-10 11:41:29'),
(462, 50, NULL, 3, 1.00, '5kWh Lithium Battery', 990000.00, 0, 0.00, 990000.00, '2026-03-10 11:41:29'),
(463, 50, NULL, 4, 1.00, 'Installation Accessories', 320000.00, 0, 0.00, 320000.00, '2026-03-10 11:41:29'),
(464, 50, NULL, 5, 1.00, 'Installation', 100000.00, 0, 0.00, 100000.00, '2026-03-10 11:41:29'),
(465, 49, NULL, 1, 1.00, '4 KVA Hybrid Inverter', 480000.00, 0, 0.00, 480000.00, '2026-03-10 11:43:09'),
(466, 49, NULL, 2, 4.00, '650 Solar Panels', 150000.00, 0, 0.00, 600000.00, '2026-03-10 11:43:09'),
(467, 49, NULL, 3, 1.00, '5kWh Lithium Battery', 990000.00, 0, 0.00, 990000.00, '2026-03-10 11:43:09'),
(468, 49, NULL, 4, 1.00, 'Installation Accessories', 250000.00, 0, 0.00, 250000.00, '2026-03-10 11:43:09'),
(469, 49, NULL, 5, 1.00, 'Installation', 100000.00, 0, 0.00, 100000.00, '2026-03-10 11:43:09'),
(470, 36, NULL, 1, 1.00, '10 KVA Hybrid Inverter', 930000.00, 0, 0.00, 930000.00, '2026-03-10 18:37:44'),
(471, 36, NULL, 2, 12.00, '630 Solar Panels', 135000.00, 0, 0.00, 1620000.00, '2026-03-10 18:37:44'),
(472, 36, NULL, 3, 1.00, '20kWh Lithium Battery', 1950000.00, 0, 0.00, 1950000.00, '2026-03-10 18:37:44'),
(473, 36, NULL, 4, 1.00, 'Installation Accessories', 350000.00, 0, 0.00, 350000.00, '2026-03-10 18:37:44'),
(474, 36, NULL, 5, 1.00, 'Installation', 350000.00, 0, 0.00, 350000.00, '2026-03-10 18:37:44'),
(475, 52, NULL, 1, 1.00, '6 KVA Hybrid Inverter', 500000.00, 0, 0.00, 500000.00, '2026-03-14 22:47:43'),
(476, 52, NULL, 2, 1.00, '10kwh Lithium Battery', 1600000.00, 0, 0.00, 1600000.00, '2026-03-14 22:47:43'),
(477, 52, NULL, 3, 6.00, '720w Solar Panels', 150000.00, 0, 0.00, 900000.00, '2026-03-14 22:47:43'),
(478, 52, NULL, 4, 1.00, 'Installation Accessories', 300000.00, 0, 0.00, 300000.00, '2026-03-14 22:47:43'),
(479, 52, NULL, 5, 1.00, 'Installation', 150000.00, 0, 0.00, 150000.00, '2026-03-14 22:47:43'),
(485, 53, NULL, 1, 1.00, '10 KVA Hybrid Inverter', 950000.00, 0, 0.00, 950000.00, '2026-03-17 10:00:43'),
(486, 53, NULL, 2, 1.00, '20 kwh Lithium Battery', 2950000.00, 0, 0.00, 2950000.00, '2026-03-17 10:00:43'),
(487, 53, NULL, 3, 14.00, '720w Solar Panels', 155000.00, 0, 0.00, 2170000.00, '2026-03-17 10:00:43'),
(488, 53, NULL, 4, 1.00, 'Installation Accessories', 400000.00, 0, 0.00, 400000.00, '2026-03-17 10:00:43'),
(489, 53, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-17 10:00:43'),
(490, 54, NULL, 1, 1.00, '6 KVA Hybrid Inverter', 650000.00, 0, 0.00, 650000.00, '2026-03-18 07:21:11'),
(491, 54, NULL, 2, 1.00, '5kWh Lithium Battery', 950000.00, 0, 0.00, 950000.00, '2026-03-18 07:21:11'),
(492, 54, NULL, 3, 4.00, '720w Solar Panels', 160000.00, 0, 0.00, 640000.00, '2026-03-18 07:21:11'),
(493, 54, NULL, 4, 1.00, 'Installation Accessories', 400000.00, 0, 0.00, 400000.00, '2026-03-18 07:21:11'),
(494, 54, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-18 07:21:11'),
(495, 55, NULL, 1, 4.00, '720W Bi-Facial Solar Panels', 165000.00, 0, 0.00, 660000.00, '2026-03-18 08:00:33'),
(496, 55, NULL, 2, 1.00, 'Installation and logistics', 50000.00, 0, 0.00, 50000.00, '2026-03-18 08:00:33'),
(497, 55, NULL, 3, 1.00, 'Previous balance', 530000.00, 0, 0.00, 530000.00, '2026-03-18 08:00:33'),
(498, 56, NULL, 1, 1.00, '5 KVA Hybrid Inverter', 600000.00, 0, 0.00, 600000.00, '2026-03-18 19:36:38'),
(499, 56, NULL, 2, 7.00, '700w Solar Panels', 150000.00, 0, 0.00, 1050000.00, '2026-03-18 19:36:38'),
(500, 56, NULL, 3, 1.00, '10kWh Lithium Battery', 1950000.00, 0, 0.00, 1950000.00, '2026-03-18 19:36:38'),
(501, 56, NULL, 4, 1.00, 'Installation Accessories', 350000.00, 0, 0.00, 350000.00, '2026-03-18 19:36:38'),
(502, 56, NULL, 5, 1.00, 'Installation', 250000.00, 0, 0.00, 250000.00, '2026-03-18 19:36:38'),
(508, 58, NULL, 1, 1.00, '4.2 KVA Hybrid Inverter', 400000.00, 0, 0.00, 400000.00, '2026-03-19 12:23:29'),
(509, 58, NULL, 2, 6.00, '650W Solar Panels', 140000.00, 0, 0.00, 840000.00, '2026-03-19 12:23:29'),
(510, 58, NULL, 3, 1.00, '5kWh Lithium Battery', 950000.00, 0, 0.00, 950000.00, '2026-03-19 12:23:29'),
(511, 58, NULL, 4, 1.00, 'Installation Accessories', 300000.00, 0, 0.00, 300000.00, '2026-03-19 12:23:29'),
(512, 58, NULL, 5, 1.00, 'Installation', 250000.00, 0, 0.00, 250000.00, '2026-03-19 12:23:29'),
(513, 59, NULL, 1, 1.00, '3.6Kwh portable power station', 900000.00, 0, 0.00, 900000.00, '2026-03-19 18:52:13'),
(514, 59, NULL, 2, 4.00, '550w Solar Panels', 130000.00, 0, 0.00, 520000.00, '2026-03-19 18:52:13'),
(515, 59, NULL, 3, 1.00, 'Installation Accessories', 300000.00, 0, 0.00, 300000.00, '2026-03-19 18:52:13'),
(516, 59, NULL, 4, 1.00, 'Installation', 150000.00, 0, 0.00, 150000.00, '2026-03-19 18:52:13'),
(517, 57, NULL, 1, 1.00, '2 KVA Hybrid Inverter', 300000.00, 0, 0.00, 300000.00, '2026-03-20 09:18:48'),
(518, 57, NULL, 2, 2.00, '220AH Tubular Battery', 300000.00, 0, 0.00, 600000.00, '2026-03-20 09:18:48'),
(519, 57, NULL, 3, 1.00, 'Installation Accessories', 200000.00, 0, 0.00, 200000.00, '2026-03-20 09:18:48'),
(520, 57, NULL, 4, 1.00, 'Installation', 180000.00, 0, 0.00, 180000.00, '2026-03-20 09:18:48'),
(521, 60, NULL, 1, 10.00, '700w Solar Panles', 155000.00, 0, 0.00, 1550000.00, '2026-03-20 12:44:09'),
(522, 60, NULL, 2, 1.00, '15kwh Lithium Battery', 2000000.00, 0, 0.00, 2000000.00, '2026-03-20 12:44:09'),
(523, 60, NULL, 3, 30.00, '30m 6mm x 2 DC Wires', 4000.00, 0, 0.00, 120000.00, '2026-03-20 12:44:09'),
(524, 60, NULL, 4, 1.00, 'Installation accessories (Rails, clamps, sealants Surges, Breakers etc)', 120000.00, 0, 0.00, 120000.00, '2026-03-20 12:44:09'),
(525, 60, NULL, 5, 1.00, 'Previous Balance', 246000.00, 0, 0.00, 246000.00, '2026-03-20 12:44:09'),
(526, 60, NULL, 6, 1.00, 'Installation and additional logistics', 300000.00, 0, 0.00, 300000.00, '2026-03-20 12:44:09'),
(527, 61, NULL, 1, 1.00, '10 KVA Hybrid Inverter', 900000.00, 0, 0.00, 900000.00, '2026-03-20 20:41:12'),
(528, 61, NULL, 2, 12.00, '700 Solar Panels', 150000.00, 0, 0.00, 1800000.00, '2026-03-20 20:41:12'),
(529, 61, NULL, 3, 1.00, '15kWh Lithium Battery', 2000000.00, 0, 0.00, 2000000.00, '2026-03-20 20:41:12'),
(530, 61, NULL, 4, 1.00, 'Installation Accessories', 450000.00, 0, 0.00, 450000.00, '2026-03-20 20:41:12'),
(531, 61, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-20 20:41:12'),
(532, 62, NULL, 1, 1.00, '6 KVA Hybrid Inverter', 600000.00, 0, 0.00, 600000.00, '2026-03-22 10:04:38'),
(533, 62, NULL, 2, 7.00, '650w Solar Panels', 140000.00, 0, 0.00, 980000.00, '2026-03-22 10:04:38'),
(534, 62, NULL, 3, 1.00, '10kWh Lithium Battery', 1950000.00, 0, 0.00, 1950000.00, '2026-03-22 10:04:38'),
(535, 62, NULL, 4, 1.00, 'Installation Accessories', 200000.00, 0, 0.00, 200000.00, '2026-03-22 10:04:38'),
(536, 62, NULL, 5, 1.00, 'Installation', 200000.00, 0, 0.00, 200000.00, '2026-03-22 10:04:38'),
(537, 63, NULL, 1, 1.00, '4 KVA Hybrid Inverter', 450000.00, 0, 0.00, 450000.00, '2026-03-22 10:15:01'),
(538, 63, NULL, 2, 6.00, '650w Solar Panels', 145000.00, 0, 0.00, 870000.00, '2026-03-22 10:15:01'),
(539, 63, NULL, 3, 1.00, '5kWh Lithium Battery', 950000.00, 0, 0.00, 950000.00, '2026-03-22 10:15:01'),
(540, 63, NULL, 4, 1.00, 'Installation Accessories', 200000.00, 0, 0.00, 200000.00, '2026-03-22 10:15:01'),
(541, 63, NULL, 5, 1.00, 'Installation', 200000.00, 0, 0.00, 200000.00, '2026-03-22 10:15:01'),
(542, 64, NULL, 1, 8.00, 'Outdoor IP Camera', 45000.00, 0, 0.00, 360000.00, '2026-03-22 13:04:13'),
(543, 64, NULL, 2, 1.00, '16 Channel NVR', 140000.00, 0, 0.00, 140000.00, '2026-03-22 13:04:13'),
(544, 64, NULL, 3, 1.00, '16 Port POE Switch', 90000.00, 0, 0.00, 90000.00, '2026-03-22 13:04:13'),
(545, 64, NULL, 4, 1.00, 'Hard Drive', 130000.00, 0, 0.00, 130000.00, '2026-03-22 13:04:13'),
(546, 64, NULL, 5, 1.00, 'Installation Accessories', 50000.00, 0, 0.00, 50000.00, '2026-03-22 13:04:13'),
(547, 64, NULL, 6, 1.00, 'Install Cost', 150000.00, 0, 0.00, 150000.00, '2026-03-22 13:04:13'),
(548, 65, NULL, 1, 3.00, '6 KVA Hybrid Inverter (flats)', 650000.00, 0, 0.00, 1950000.00, '2026-03-22 13:24:27'),
(549, 65, NULL, 2, 3.00, '15kWh Lithium Battery (flats)', 1950000.00, 0, 0.00, 5850000.00, '2026-03-22 13:24:27'),
(550, 65, NULL, 3, 24.00, '650w Solar Panels', 150000.00, 0, 0.00, 3600000.00, '2026-03-22 13:24:27'),
(551, 65, NULL, 4, 1.00, '10kwh Lithium Battery (reception & gym)', 1650000.00, 0, 0.00, 1650000.00, '2026-03-22 13:24:27'),
(552, 65, NULL, 5, 1.00, 'Installation Accessories', 920000.00, 0, 0.00, 920000.00, '2026-03-22 13:24:27'),
(553, 65, NULL, 6, 1.00, 'Installation', 700000.00, 0, 0.00, 700000.00, '2026-03-22 13:24:27'),
(554, 66, NULL, 1, 1.00, '15kwh Lithium Battery', 1900000.00, 0, 0.00, 1900000.00, '2026-03-23 10:57:20'),
(555, 66, NULL, 2, 1.00, 'Installation and Logistics', 30000.00, 0, 0.00, 30000.00, '2026-03-23 10:57:20'),
(556, 67, NULL, 1, 4.00, '700w Solar Panels', 145000.00, 0, 0.00, 580000.00, '2026-03-23 11:16:42'),
(557, 67, NULL, 2, 1.00, 'Installation Accessories', 200000.00, 0, 0.00, 200000.00, '2026-03-23 11:16:42'),
(558, 67, NULL, 3, 1.00, 'Installation & Logistics', 120000.00, 0, 0.00, 120000.00, '2026-03-23 11:16:42'),
(559, 68, NULL, 1, 8.00, 'Aluminum Rails', 9800.00, 0, 0.00, 78400.00, '2026-03-23 11:26:55'),
(560, 68, NULL, 2, 1.00, 'Sealant, couplers bolt and nuts', 8000.00, 0, 0.00, 8000.00, '2026-03-23 11:26:55'),
(561, 68, NULL, 3, 60.00, '6mmx2 DC Wire', 4000.00, 0, 0.00, 240000.00, '2026-03-23 11:26:55'),
(562, 68, NULL, 4, 1.00, 'Installation charge', 200000.00, 0, 0.00, 200000.00, '2026-03-23 11:26:55'),
(573, 69, NULL, 1, 1.00, '4.2 KVA Hybrid Inverter', 400000.00, 0, 0.00, 400000.00, '2026-03-23 11:59:32'),
(574, 69, NULL, 2, 4.00, '350W Solar Panels', 90000.00, 0, 0.00, 360000.00, '2026-03-23 11:59:32'),
(575, 69, NULL, 3, 2.00, '220AH Tubular Batteries', 300000.00, 0, 0.00, 600000.00, '2026-03-23 11:59:32'),
(576, 69, NULL, 4, 1.00, 'Installation Accessories', 300000.00, 0, 0.00, 300000.00, '2026-03-23 11:59:32'),
(577, 69, NULL, 5, 1.00, 'Installation', 250000.00, 0, 0.00, 250000.00, '2026-03-23 11:59:32'),
(578, 70, NULL, 1, 1.00, '6 KVA Hybrid Inverter', 650000.00, 0, 0.00, 650000.00, '2026-03-24 13:05:23'),
(579, 70, NULL, 2, 1.00, '15kWh Lithium Battery', 1950000.00, 0, 0.00, 1950000.00, '2026-03-24 13:05:23'),
(580, 70, NULL, 3, 8.00, '650w Solar Panels', 145000.00, 0, 0.00, 1160000.00, '2026-03-24 13:05:23'),
(581, 70, NULL, 4, 1.00, 'Installation Accessories', 400000.00, 0, 0.00, 400000.00, '2026-03-24 13:05:23'),
(582, 70, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-24 13:05:23'),
(583, 71, NULL, 1, 1.00, '10 KVA Hybrid Inverter', 1350000.00, 0, 0.00, 1350000.00, '2026-03-24 16:14:57'),
(584, 71, NULL, 2, 16.00, '650W Solar Panels', 150000.00, 0, 0.00, 2400000.00, '2026-03-24 16:14:57'),
(585, 71, NULL, 3, 1.00, '20kWh Lithium Battery', 2900000.00, 0, 0.00, 2900000.00, '2026-03-24 16:14:57'),
(586, 71, NULL, 4, 1.00, 'Installation Accessories', 550000.00, 0, 0.00, 550000.00, '2026-03-24 16:14:57'),
(587, 71, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-24 16:14:57'),
(588, 72, NULL, 1, 1.00, '10.2 KVA Hybrid Inveter', 900000.00, 0, 0.00, 900000.00, '2026-03-25 08:42:24'),
(595, 73, NULL, 1, 1.00, 'Starlink + Installation accessories', 620000.00, 0, 0.00, 620000.00, '2026-03-25 12:35:07'),
(596, 73, NULL, 2, 12.00, 'Starlink 1 Year subscription', 57000.00, 0, 0.00, 684000.00, '2026-03-25 12:35:07'),
(597, 73, NULL, 3, 12.00, 'MTN Fibre X 1Gb/s +Annual Subscription', 200000.00, 0, 0.00, 2400000.00, '2026-03-25 12:35:07'),
(598, 73, NULL, 4, 12.00, 'MTN Fibre X 100mb/s Plan + Annual Subscription', 45000.00, 0, 0.00, 540000.00, '2026-03-25 12:35:07'),
(599, 73, NULL, 5, 1.00, 'Okha Base station Inverter', 2400000.00, 0, 0.00, 2400000.00, '2026-03-25 12:35:07'),
(600, 73, NULL, 6, 1.00, 'Mini Base Station Inverter', 1500000.00, 0, 0.00, 1500000.00, '2026-03-25 12:35:07'),
(608, 74, NULL, 1, 1.00, '6 KVA Hybrid Inverter', 650000.00, 0, 0.00, 650000.00, '2026-03-26 05:58:28'),
(609, 74, NULL, 2, 1.00, '11KVA Hybrid Inverter', 1350000.00, 0, 0.00, 1350000.00, '2026-03-26 05:58:28'),
(610, 74, NULL, 3, 1.00, '10kwh Lithium Battery', 1800000.00, 0, 0.00, 1800000.00, '2026-03-26 05:58:28'),
(611, 74, NULL, 4, 2.00, '20kwh Lithium Battery', 3000000.00, 0, 0.00, 6000000.00, '2026-03-26 05:58:28'),
(612, 74, NULL, 5, 30.00, '650w Solar Panles', 150000.00, 0, 0.00, 4500000.00, '2026-03-26 05:58:28'),
(613, 74, NULL, 6, 1.00, 'Installation Accessories', 800000.00, 0, 0.00, 800000.00, '2026-03-26 05:58:28'),
(614, 74, NULL, 7, 1.00, 'Installation', 500000.00, 0, 0.00, 500000.00, '2026-03-26 05:58:28'),
(626, 78, NULL, 1, 1.00, '10 KVA Hybrid Inverter', 900000.00, 0, 0.00, 900000.00, '2026-03-26 15:23:16'),
(627, 78, NULL, 2, 18.00, '650w Solar Panels', 150000.00, 0, 0.00, 2700000.00, '2026-03-26 15:23:16'),
(628, 78, NULL, 3, 1.00, '15kWh Lithium Battery', 2000000.00, 0, 0.00, 2000000.00, '2026-03-26 15:23:16'),
(629, 78, NULL, 4, 1.00, 'Installation Accessories', 450000.00, 0, 0.00, 450000.00, '2026-03-26 15:23:16'),
(630, 78, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-26 15:23:16'),
(639, 76, NULL, 1, 2.00, '20 KVA Hybrid Inverter + 16kwh lithium batteries ESS', 3050000.00, 0, 0.00, 6100000.00, '2026-03-27 08:47:57'),
(640, 76, NULL, 2, 36.00, '650 Solar Panels', 150000.00, 0, 0.00, 5400000.00, '2026-03-27 08:47:57'),
(641, 76, NULL, 3, 1.00, 'Installation Accessories', 700000.00, 0, 0.00, 700000.00, '2026-03-27 08:47:57'),
(642, 76, NULL, 4, 1.00, 'Installation', 350000.00, 0, 0.00, 350000.00, '2026-03-27 08:47:57'),
(643, 75, NULL, 1, 1.00, '6 KVA Hybrid Inverter', 650000.00, 0, 0.00, 650000.00, '2026-03-28 18:55:45'),
(644, 75, NULL, 2, 1.00, '15kWh Lithium Battery', 1950000.00, 0, 0.00, 1950000.00, '2026-03-28 18:55:45'),
(645, 75, NULL, 3, 8.00, '650w Solar Panels', 150000.00, 0, 0.00, 1200000.00, '2026-03-28 18:55:45'),
(646, 75, NULL, 4, 1.00, 'Installation Accessories', 400000.00, 0, 0.00, 400000.00, '2026-03-28 18:55:45'),
(647, 75, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-28 18:55:45');

-- --------------------------------------------------------

--
-- Table structure for table `readymade_quote_categories`
--

CREATE TABLE `readymade_quote_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `readymade_quote_categories`
--

INSERT INTO `readymade_quote_categories` (`id`, `category_name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'General', 'Default Category', 1, '2026-01-19 08:03:56', '2026-01-19 08:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `readymade_quote_templates`
--

CREATE TABLE `readymade_quote_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `template_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `payment_terms` text DEFAULT NULL,
  `default_project_title` varchar(255) DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_vat` decimal(15,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `readymade_quote_templates`
--

INSERT INTO `readymade_quote_templates` (`id`, `category_id`, `template_name`, `description`, `payment_terms`, `default_project_title`, `subtotal`, `total_vat`, `grand_total`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test', '', 'Payment due within 30 days of invoice date.', 'test', 256.00, 0.00, 256.00, 0, '2026-01-19 09:03:05', '2026-01-19 11:04:58'),
(2, 1, '3 KVA  2 batteries 2000 Watt Solar', '', 'Payment due within 30 days of invoice date.', '3 KVA  2 batteries 2000 Watt Solar', 1860000.00, 0.00, 1860000.00, 1, '2026-01-21 15:17:02', '2026-01-21 15:17:02'),
(3, 1, '12KVA Inverter 20KWH Battery 11KW Solar', '', 'Payment due within 30 days of invoice date.', '12KVA Inverter 20KWH Battery 11KW Solar', 8250000.00, 0.00, 8250000.00, 1, '2026-01-23 13:35:22', '2026-01-23 13:39:45'),
(4, 1, '3 KVA  2 batteries 2000 Watt Solar (Copy)', '', 'Payment due within 30 days of invoice date.', '3 KVA  2 batteries 2000 Watt Solar', 1860000.00, 0.00, 1860000.00, 1, '2026-02-18 17:36:42', '2026-02-18 17:36:42'),
(5, 1, '6kva inverter, 5KWH Battery and 4900 Watt Solar', '', 'Payment due within 30 days of invoice date.', '6kva inverter, 5KWH Battery and 4900 Watt Solar', 2940000.00, 0.00, 2940000.00, 1, '2026-02-18 21:45:27', '2026-03-22 09:57:13'),
(6, 1, '1kva Inveter ', '1kva mini setup', 'Payment due within 30 days of invoice date.', '1kva mini', 980000.00, 0.00, 980000.00, 1, '2026-03-02 10:43:09', '2026-03-02 10:43:09'),
(7, 1, '12KVA Inverter 20KWH Battery', '', 'Payment due within 30 days of invoice date.', '12KVA Inverter 20KWH Battery 11KW Solar', 7150000.00, 0.00, 7150000.00, 1, '2026-03-07 18:00:25', '2026-03-07 18:03:52'),
(8, 1, '4kva Inverter 5kWh battery 2400Watt Solar', '', 'Payment due within 30 days of invoice date.', '4kva Inverter 5kWh battery 2400Watt Solar', 2420000.00, 0.00, 2420000.00, 1, '2026-03-10 11:16:24', '2026-03-18 07:19:27'),
(9, 1, 'Portable Power Station 3600', '1.2Kw Power Station with 3.6kwh lithium battery and 1500 Watts solar', 'Payment due within 30 days of invoice date.', '3.6kWh Power station with 1500w solar', 1690000.00, 0.00, 1690000.00, 1, '2026-03-10 11:39:36', '2026-03-10 11:39:36'),
(10, 1, '6Kva Inverter 10kWh battery 5000w solar', '6Kva Inverter 10kWh battery 5000w solar', 'Payment due within 30 days of invoice date.', '6Kva Inverter 10kWh battery 5000w solar', 4390000.00, 0.00, 4390000.00, 1, '2026-03-18 19:33:36', '2026-03-22 10:01:31'),
(11, 1, '2 KVA  2batteries 1800 Watt Solar', '', 'Payment due within 30 days of invoice date.', '3 KVA  2 batteries 1800 Watt Solar', 1885000.00, 0.00, 1885000.00, 1, '2026-03-18 20:51:00', '2026-03-18 20:53:38'),
(12, 1, '4KVA 5kWh Lithium Battery 3600 Watt Solar', '4KVA 5kWh Lithium Battery 3600 Watt Solar', 'Payment due within 30 days of invoice date.', '4KVA 5kWh Lithium Battery 3600 Watt Solar', 2740000.00, 0.00, 2740000.00, 1, '2026-03-19 11:50:44', '2026-03-19 12:15:32'),
(13, 1, '10KVA Inverter 15KWH Battery', '10KVA Inverter 15KWH Battery', 'Payment due within 30 days of invoice date.', '10KVA Inverter 15KWH Battery', 5450000.00, 0.00, 5450000.00, 1, '2026-03-20 20:35:12', '2026-03-20 20:38:43'),
(14, 1, '4KVA Inverter l, 2 Tubular Batteries 2400 Watt Solar', '4KVA Inverter, 2 Tubular Batteries 2400 Watt Solar', 'Payment due within 30 days of invoice date.', '4KVA Inverter, 2 Tubular Batteries 2400 Watt Solar', 2110000.00, 0.00, 2110000.00, 1, '2026-03-23 11:43:14', '2026-03-23 11:58:01'),
(15, 1, '6kva inverter, 15KWH Battery and 5200 Solar', '', 'Payment due within 30 days of invoice date.', '6kva inverter, 15KWH Battery and 5200 Watt Solar', 4460000.00, 0.00, 4460000.00, 1, '2026-03-24 12:59:23', '2026-03-24 13:04:32');

-- --------------------------------------------------------

--
-- Table structure for table `readymade_quote_template_items`
--

CREATE TABLE `readymade_quote_template_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `template_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `item_number` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `vat_applicable` tinyint(1) DEFAULT 0,
  `vat_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `line_total` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `readymade_quote_template_items`
--

INSERT INTO `readymade_quote_template_items` (`id`, `template_id`, `product_id`, `item_number`, `quantity`, `description`, `unit_price`, `vat_applicable`, `vat_amount`, `line_total`, `created_at`) VALUES
(1, 1, NULL, 1, 1.00, 'test', 34.00, 0, 0.00, 34.00, '2026-01-19 09:03:05'),
(2, 1, NULL, 2, 1.00, 'test 2', 222.00, 0, 0.00, 222.00, '2026-01-19 09:03:05'),
(3, 2, NULL, 1, 1.00, '3 KVA Hybrid Inverter', 350000.00, 0, 0.00, 350000.00, '2026-01-21 15:17:02'),
(4, 2, NULL, 2, 4.00, '600w Solar Panels', 140000.00, 0, 0.00, 560000.00, '2026-01-21 15:17:02'),
(5, 2, NULL, 3, 2.00, '220AH Tubular Battery', 160000.00, 0, 0.00, 320000.00, '2026-01-21 15:17:02'),
(6, 2, NULL, 4, 1.00, 'Installation Accessories', 380000.00, 0, 0.00, 380000.00, '2026-01-21 15:17:02'),
(7, 2, NULL, 5, 1.00, 'Installation', 250000.00, 0, 0.00, 250000.00, '2026-01-21 15:17:02'),
(13, 3, NULL, 1, 1.00, '12 KVA Hybrid Inverter', 1350000.00, 0, 0.00, 1350000.00, '2026-01-23 13:39:45'),
(14, 3, NULL, 2, 20.00, '600w Solar Panels', 140000.00, 0, 0.00, 2800000.00, '2026-01-23 13:39:45'),
(15, 3, NULL, 3, 1.00, '20KWH Lithium Battery', 3300000.00, 0, 0.00, 3300000.00, '2026-01-23 13:39:45'),
(16, 3, NULL, 4, 1.00, 'Installation Accessories', 450000.00, 0, 0.00, 450000.00, '2026-01-23 13:39:45'),
(17, 3, NULL, 5, 1.00, 'Installation', 350000.00, 0, 0.00, 350000.00, '2026-01-23 13:39:45'),
(18, 4, NULL, 1, 1.00, '3 KVA Hybrid Inverter', 350000.00, 0, 0.00, 350000.00, '2026-02-18 17:36:42'),
(19, 4, NULL, 2, 4.00, '600w Solar Panels', 140000.00, 0, 0.00, 560000.00, '2026-02-18 17:36:42'),
(20, 4, NULL, 3, 2.00, '220AH Tubular Battery', 160000.00, 0, 0.00, 320000.00, '2026-02-18 17:36:42'),
(21, 4, NULL, 4, 1.00, 'Installation Accessories', 380000.00, 0, 0.00, 380000.00, '2026-02-18 17:36:42'),
(22, 4, NULL, 5, 1.00, 'Installation', 250000.00, 0, 0.00, 250000.00, '2026-02-18 17:36:42'),
(33, 6, NULL, 1, 1.00, '1Kva Hybrid Inverter ', 220000.00, 0, 0.00, 220000.00, '2026-03-02 10:43:09'),
(34, 6, NULL, 2, 3.00, '200W solar Panels', 55000.00, 0, 0.00, 165000.00, '2026-03-02 10:43:09'),
(35, 6, NULL, 3, 1.00, '220AH Tubular Battery', 295000.00, 0, 0.00, 295000.00, '2026-03-02 10:43:09'),
(36, 6, NULL, 4, 1.00, 'Installation Accessories ', 200000.00, 0, 0.00, 200000.00, '2026-03-02 10:43:09'),
(37, 6, NULL, 5, 1.00, 'Installation ', 100000.00, 0, 0.00, 100000.00, '2026-03-02 10:43:09'),
(43, 7, NULL, 1, 1.00, '12 KVA Hybrid Inverter', 1350000.00, 0, 0.00, 1350000.00, '2026-03-07 18:03:52'),
(44, 7, NULL, 2, 12.00, '720W Solar Panels', 150000.00, 0, 0.00, 1800000.00, '2026-03-07 18:03:52'),
(45, 7, NULL, 3, 1.00, '20KWH Lithium Battery', 2950000.00, 0, 0.00, 2950000.00, '2026-03-07 18:03:52'),
(46, 7, NULL, 4, 1.00, 'Installation Accessories', 750000.00, 0, 0.00, 750000.00, '2026-03-07 18:03:52'),
(47, 7, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-07 18:03:52'),
(58, 9, NULL, 1, 1.00, '1.2kva 3.6Kw portable power station', 900000.00, 0, 0.00, 900000.00, '2026-03-10 11:39:36'),
(59, 9, NULL, 2, 3.00, '550w Solar Panels', 130000.00, 0, 0.00, 390000.00, '2026-03-10 11:39:36'),
(60, 9, NULL, 3, 1.00, 'Installation Accessories ', 300000.00, 0, 0.00, 300000.00, '2026-03-10 11:39:36'),
(61, 9, NULL, 4, 1.00, 'Installation ', 100000.00, 0, 0.00, 100000.00, '2026-03-10 11:39:36'),
(62, 8, NULL, 1, 1.00, '4 KVA Hybrid Inverter', 480000.00, 0, 0.00, 480000.00, '2026-03-18 07:19:27'),
(63, 8, NULL, 2, 4.00, '650 Solar Panels', 150000.00, 0, 0.00, 600000.00, '2026-03-18 07:19:27'),
(64, 8, NULL, 3, 1.00, '5kWh Lithium Battery', 990000.00, 0, 0.00, 990000.00, '2026-03-18 07:19:27'),
(65, 8, NULL, 4, 1.00, 'Installation Accessories', 250000.00, 0, 0.00, 250000.00, '2026-03-18 07:19:27'),
(66, 8, NULL, 5, 1.00, 'Installation', 100000.00, 0, 0.00, 100000.00, '2026-03-18 07:19:27'),
(87, 11, NULL, 1, 1.00, '2 KVA Hybrid Inverter', 300000.00, 0, 0.00, 300000.00, '2026-03-18 20:53:38'),
(88, 11, NULL, 2, 3.00, '650W Solar Panels', 145000.00, 0, 0.00, 435000.00, '2026-03-18 20:53:38'),
(89, 11, NULL, 3, 2.00, '220AH Tubular Battery', 300000.00, 0, 0.00, 600000.00, '2026-03-18 20:53:38'),
(90, 11, NULL, 4, 1.00, 'Installation Accessories', 300000.00, 0, 0.00, 300000.00, '2026-03-18 20:53:38'),
(91, 11, NULL, 5, 1.00, 'Installation', 250000.00, 0, 0.00, 250000.00, '2026-03-18 20:53:38'),
(102, 12, NULL, 1, 1.00, '4.2 KVA Hybrid Inverter', 400000.00, 0, 0.00, 400000.00, '2026-03-19 12:15:32'),
(103, 12, NULL, 2, 6.00, '650W Solar Panels', 140000.00, 0, 0.00, 840000.00, '2026-03-19 12:15:32'),
(104, 12, NULL, 3, 1.00, '5kWh Lithium Battery', 950000.00, 0, 0.00, 950000.00, '2026-03-19 12:15:32'),
(105, 12, NULL, 4, 1.00, 'Installation Accessories', 300000.00, 0, 0.00, 300000.00, '2026-03-19 12:15:32'),
(106, 12, NULL, 5, 1.00, 'Installation', 250000.00, 0, 0.00, 250000.00, '2026-03-19 12:15:32'),
(112, 13, NULL, 1, 1.00, '10 KVA Hybrid Inverter', 900000.00, 0, 0.00, 900000.00, '2026-03-20 20:38:43'),
(113, 13, NULL, 2, 12.00, '700 Solar Panels', 150000.00, 0, 0.00, 1800000.00, '2026-03-20 20:38:43'),
(114, 13, NULL, 3, 1.00, '15kWh Lithium Battery', 2000000.00, 0, 0.00, 2000000.00, '2026-03-20 20:38:43'),
(115, 13, NULL, 4, 1.00, 'Installation Accessories', 450000.00, 0, 0.00, 450000.00, '2026-03-20 20:38:43'),
(116, 13, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-20 20:38:43'),
(117, 5, NULL, 1, 1.00, '6 KVA Hybrid Inverter', 650000.00, 0, 0.00, 650000.00, '2026-03-22 09:57:13'),
(118, 5, NULL, 2, 1.00, '5kWh Lithium Battery ', 950000.00, 0, 0.00, 950000.00, '2026-03-22 09:57:13'),
(119, 5, NULL, 3, 4.00, '720w Solar Panels', 160000.00, 0, 0.00, 640000.00, '2026-03-22 09:57:13'),
(120, 5, NULL, 4, 1.00, 'Installation Accessories', 400000.00, 0, 0.00, 400000.00, '2026-03-22 09:57:13'),
(121, 5, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-22 09:57:13'),
(127, 10, NULL, 1, 1.00, '6 KVA Hybrid Inverter', 650000.00, 0, 0.00, 650000.00, '2026-03-22 10:01:31'),
(128, 10, NULL, 2, 8.00, '650w Solar Panels', 145000.00, 0, 0.00, 1160000.00, '2026-03-22 10:01:31'),
(129, 10, NULL, 3, 1.00, '10kWh Lithium Battery', 1950000.00, 0, 0.00, 1950000.00, '2026-03-22 10:01:31'),
(130, 10, NULL, 4, 1.00, 'Installation Accessories', 380000.00, 0, 0.00, 380000.00, '2026-03-22 10:01:31'),
(131, 10, NULL, 5, 1.00, 'Installation', 250000.00, 0, 0.00, 250000.00, '2026-03-22 10:01:31'),
(142, 14, NULL, 1, 1.00, '4.2 KVA Hybrid Inverter', 400000.00, 0, 0.00, 400000.00, '2026-03-23 11:58:01'),
(143, 14, NULL, 2, 4.00, '600W Solar Panels', 140000.00, 0, 0.00, 560000.00, '2026-03-23 11:58:01'),
(144, 14, NULL, 3, 2.00, '220AH Tubular Batteries ', 300000.00, 0, 0.00, 600000.00, '2026-03-23 11:58:01'),
(145, 14, NULL, 4, 1.00, 'Installation Accessories', 300000.00, 0, 0.00, 300000.00, '2026-03-23 11:58:01'),
(146, 14, NULL, 5, 1.00, 'Installation', 250000.00, 0, 0.00, 250000.00, '2026-03-23 11:58:01'),
(152, 15, NULL, 1, 1.00, '6 KVA Hybrid Inverter', 650000.00, 0, 0.00, 650000.00, '2026-03-24 13:04:32'),
(153, 15, NULL, 2, 1.00, '15kWh Lithium Battery ', 1950000.00, 0, 0.00, 1950000.00, '2026-03-24 13:04:32'),
(154, 15, NULL, 3, 8.00, '650w Solar Panels', 145000.00, 0, 0.00, 1160000.00, '2026-03-24 13:04:32'),
(155, 15, NULL, 4, 1.00, 'Installation Accessories', 400000.00, 0, 0.00, 400000.00, '2026-03-24 13:04:32'),
(156, 15, NULL, 5, 1.00, 'Installation', 300000.00, 0, 0.00, 300000.00, '2026-03-24 13:04:32');

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `id` int(10) UNSIGNED NOT NULL,
  `receipt_number` varchar(50) NOT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `amount_paid` decimal(15,2) NOT NULL,
  `payment_method` enum('cash','bank_transfer','cheque','card','other') DEFAULT 'cash',
  `payment_date` date NOT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('valid','void') DEFAULT 'valid',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`id`, `receipt_number`, `invoice_id`, `customer_id`, `customer_name`, `amount_paid`, `payment_method`, `payment_date`, `reference_number`, `notes`, `payment_id`, `status`, `created_by`, `is_archived`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'REC-2026-001', 1, NULL, '', 500000.00, '', '2026-01-12', 'Bank Transfer 260112020100180037919456', ' | VOIDED on 2026-01-20 19:45 by 2. Reason: Wrong Value | PARENT PAYMENT DELETED on 2026-01-20 22:27 by 2', 1, 'void', 2, 0, '2026-01-20 22:27:47', '2026-01-20 18:58:31', '2026-01-20 22:27:47'),
(2, 'REC-2026-002', 1, NULL, '', 250000.00, '', '2026-01-19', 'Transfer 260119020100370770475473', '', 2, 'valid', 2, 0, NULL, '2026-01-20 18:59:52', '2026-01-20 18:59:52'),
(3, 'REC-2026-003', 1, NULL, '', 300000.00, '', '2026-01-20', 'Transfer 260112020100180037919456', 'Transfer to Access Bank via Opay', 3, 'valid', 2, 0, NULL, '2026-01-20 19:49:19', '2026-01-20 19:49:19'),
(4, 'REC-2026-004', 2, NULL, '', 400000.00, '', '2026-01-20', '', '', 4, 'valid', 2, 0, NULL, '2026-01-20 23:46:26', '2026-01-20 23:46:26'),
(5, 'REC-2026-005', 3, NULL, '', 1400000.00, '', '2026-01-19', 'TRF|2MPTjvh8|2013228665689628672', 'Transfer from Trust God Blessed Enterprise Moniepoint MFB', 5, 'valid', 2, 0, NULL, '2026-01-21 01:18:06', '2026-01-21 01:18:06'),
(6, 'REC-2026-006', 4, NULL, '', 5600000.00, '', '2026-01-23', '', '', 6, 'valid', 2, 0, NULL, '2026-01-23 13:33:44', '2026-01-23 13:33:44');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_key` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`, `created_at`, `updated_at`) VALUES
(1, 'installation_completed', '1', '2026-01-19 08:03:56', '2026-01-19 08:03:56'),
(2, 'installation_date', '2026-01-19 09:03:56', '2026-01-19 08:03:56', '2026-01-19 08:03:56'),
(3, 'version', '2.0.0', '2026-01-19 08:03:56', '2026-01-19 08:03:56'),
(4, 'company_name', 'Bluedots Technologies', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(5, 'company_email', 'bluedotsng@gmail.com', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(6, 'company_phone', '07087986297', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(7, 'company_address', '26 Ugbor Village Road, \r\nBeside Matice Games and More\r\nUgbor, GRA, Benin City, Edo State', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(8, 'vat_rate', '7.5', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(9, 'currency_symbol', '₦', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(10, 'items_per_page', '25', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(11, 'audit_retention_days', '90', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(12, 'log_user_actions', '1', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(13, 'log_document_create', '1', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(14, 'log_document_edit', '1', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(15, 'log_document_delete', '1', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(16, 'log_user_management', '1', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(17, 'log_settings_changes', '1', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(18, 'log_email_sent', '1', '2026-01-19 08:03:58', '2026-01-19 08:03:58'),
(23, 'company_website', 'www.bluedots.com.ng', '2026-01-19 09:44:52', '2026-01-20 23:18:00'),
(24, 'company_tax_id', '', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(25, 'email_method', 'php_mail', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(26, 'email_from_address', 'noreply@bluedots.com.ng', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(27, 'email_from_name', 'Bluedots Technologies', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(28, 'smtp_host', 'smtp.gmail.com', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(29, 'smtp_port', '587', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(30, 'smtp_username', 'admin', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(31, 'smtp_password', 'Important@1', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(32, 'smtp_encryption', 'tls', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(34, 'quote_prefix', 'QUOT-', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(35, 'invoice_prefix', 'INV-', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(36, 'receipt_prefix', 'REC-', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(38, 'date_format', 'd/m/Y', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(39, 'auto_archive_days', '0', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(40, 'bank1_name', '', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(41, 'bank1_account', '', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(42, 'bank2_name', '', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(43, 'bank2_account', '', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(44, 'bank_account_name', '', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(46, 'show_dashboard_charts', '1', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(47, 'show_recent_activity', '1', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(48, 'pdf_quality', 'high', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(49, 'theme_color', '#0076be', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(50, 'footer_text', 'We appreciate your business! Thank you', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(51, 'tinymce_api_key', 'vuqee7gm95lliih7fs9a7dbt38w25f2hqhmcaj3zzbwd5pkl', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(52, 'quote_terms', '<div class=\"document-section\">\r\n<h2><strong>BLUEDOTS TERMS, CONDITIONS &amp; WARRANTY</strong></h2>\r\n<h3><strong>1. PAYMENT TERMS</strong></h3>\r\n<ul>\r\n<li>All invoices are&nbsp;<strong>final</strong>&nbsp;and&nbsp;<strong>VAT exclusive</strong>.</li>\r\n<li><strong>Sales:</strong>&nbsp;100% payment upon purchase.</li>\r\n<li><strong>Projects:</strong>&nbsp;85% down payment before commencement, 15% balance due within&nbsp;<strong>24 hours of project completion</strong>.</li>\r\n<li><strong>Late Payments:</strong>&nbsp;Outstanding balances beyond 72 hours attract&nbsp;<strong>5% interest per week</strong>&nbsp;until full settlement.</li>\r\n<li><strong>Ownership of Products:</strong>&nbsp;Products remain the property of&nbsp;<strong>BLUEDOTS Technologies</strong>&nbsp;until full payment is received.</li>\r\n</ul>\r\n<h3><strong>2. DELIVERY TERMS</strong></h3>\r\n<ul>\r\n<li>Prices quoted are&nbsp;<strong>exclusive of delivery charges</strong>, unless otherwise stated.</li>\r\n<li>Delivery timelines are&nbsp;<strong>estimates</strong>&nbsp;only; BLUEDOTS shall not be liable for delays caused by third parties, supply shortages, or force majeure.</li>\r\n</ul>\r\n<h3><strong>3. TRANSPORT CHARGES</strong></h3>\r\n<ul>\r\n<li>Clients are responsible for arranging their own transport, including loading and offloading ex-warehouse. Execpt explicity stated by Bluedots technologies.</li>\r\n<li>If BLUEDOTS is consulted for delivery, our transport options will be provided at the client\'s cost.</li>\r\n<li>BLUEDOTS shall not be liable for damages incurred during&nbsp;<strong>third-party transportation</strong>.</li>\r\n</ul>\r\n<h3><strong>4. WARRANTY TERMS</strong></h3>\r\n<ul>\r\n<li><strong>Inverter / Charge Controller / Online UPS:</strong>&nbsp;Standard manufacturer\'s warranty against operational defects.</li>\r\n<li><strong>Battery:</strong>&nbsp;Standard manufacturer\'s warranty against operational defects.</li>\r\n<li><strong>Solar Panel:</strong>&nbsp;10-year manufacturer\'s warranty against operational defects.</li>\r\n<li>Warranties are strictly limited to&nbsp;<strong>repair or replacement</strong>&nbsp;of defective items and do not cover consequential damages.</li>\r\n</ul>\r\n<h3><strong>5. WARRANTY CLAIMS PROCEDURE</strong></h3>\r\n<ul>\r\n<li>Products must be returned to BLUEDOTS\' office for testing. Valid claims will be repaired or replaced at no charge.</li>\r\n<li>Products must be returned with all original accessories/items.</li>\r\n<li>All warranty claims that&nbsp;<strong>attract transportation and logistics charges</strong>&nbsp;are payable by the client.</li>\r\n<li>Warranty is valid only if products are installed and used according to BLUEDOTS\' or manufacturer\'s specifications.</li>\r\n</ul>\r\n<h3><strong>GENERAL WARRANTY EXCLUSIONS</strong></h3>\r\n<p>Warranty is void if damage arises from:</p>\r\n<ol>\r\n<li>Poor electrical wiring or load distribution at client\'s site.</li>\r\n<li>Physical damage due to negligent handling (operation, transit, or otherwise).</li>\r\n<li>Improper installation/application (manuals and datasheets must be followed).</li>\r\n<li>Unauthorized repairs, modifications, or tampering.</li>\r\n<li>Acts of God, force majeure, fire, flood, lightning, or vandalism.</li>\r\n<li>Cost of logistics/transportation to the manufacturer (covered by client).</li>\r\n</ol>\r\n<h3><strong>SPECIFIC WARRANTY EXCLUSIONS</strong></h3>\r\n<h4><strong>BATTERIES</strong></h4>\r\n<p>Warranty is void if:</p>\r\n<ol>\r\n<li>Any of the&nbsp;<strong>general exclusions</strong>&nbsp;apply.</li>\r\n<li>Batteries are mixed with old or other brands in one installation.</li>\r\n<li>Batteries of different capacities, composition or brand are combined in one installation.</li>\r\n<li>AGM and GEL batteries are combined in one installation.</li>\r\n<li>Batteries are short-circuited or physically damaged.</li>\r\n</ol>\r\n<p>For valid claims, the&nbsp;<strong>inverter used with the batteries must be brought to BLUEDOTS</strong>. If this is not possible, client must arrange logistics for BLUEDOTS\' technical inspection at site.</p>\r\n<h4><strong>INVERTERS / UPS / CHARGE CONTROLLERS</strong></h4>\r\n<p>Warranty is void if:</p>\r\n<ol>\r\n<li>Any of the&nbsp;<strong>general exclusions</strong>&nbsp;apply.</li>\r\n<li>Damage results from transient grid surges/spikes.</li>\r\n<li>Damage results from improper load application.</li>\r\n<li>Units are kept in unsuitable environments (dust, rain, humidity, direct sunlight).</li>\r\n<li>Internal seal is broken or unit has been tampered with.</li>\r\n</ol>\r\n<h4><strong>SOLAR PANELS</strong></h4>\r\n<ul>\r\n<li>Warranty is void if any&nbsp;<strong>general exclusions</strong>&nbsp;apply.</li>\r\n<li>Panels must be inspected for defects&nbsp;<strong>before sale</strong>. Once supplied, warranty claims are void.</li>\r\n</ul>\r\n<h3><strong>LIMITATION OF LIABILITY</strong></h3>\r\n<ol>\r\n<li>BLUEDOTS shall not be liable for&nbsp;<strong>indirect, incidental, or consequential damages</strong>, including but not limited to: business loss, downtime, loss of profit, or data loss.</li>\r\n<li>BLUEDOTS\' total liability under any claim is strictly limited to the&nbsp;<strong>value of the defective product supplied</strong>.</li>\r\n</ol>\r\n<h3><strong>INSTALLATION &amp; MAINTENANCE</strong></h3>\r\n<ul>\r\n<li>Installation must be done by&nbsp;<strong>BLUEDOTS-approved technicians</strong>&nbsp;or certified professionals. Otherwise, warranties are void.</li>\r\n<li>Periodic maintenance is the client\'s responsibility unless otherwise contracted.</li>\r\n</ul>\r\n<h3><strong>QUOTATIONS &amp; VALIDITY</strong></h3>\r\n<ul>\r\n<li>All quotations are valid for&nbsp;<strong>14 days</strong>&nbsp;unless otherwise stated.</li>\r\n<li>BLUEDOTS reserves the right to revise prices due to currency fluctuations, supplier adjustments, or other market conditions.</li>\r\n</ul>\r\n<h3><strong>INTELLECTUAL PROPERTY</strong></h3>\r\n<ul>\r\n<li>All design proposals, technical drawings, manuals, and reports provided by BLUEDOTS remain&nbsp;<strong>intellectual property of BLUEDOTS</strong> and may not be shared, copied, or reproduced without written consent.</li>\r\n</ul>\r\n</div>', '2026-01-19 09:44:52', '2026-01-19 10:56:19'),
(53, 'quote_warranty', '', '2026-01-19 09:44:52', '2026-01-19 09:44:52'),
(194, 'company_logo', 'uploads/logo/company_logo_1768820357.png', '2026-01-19 10:59:17', '2026-01-19 10:59:17'),
(195, 'company_favicon', 'uploads/logo/favicon.png', '2026-01-19 10:59:17', '2026-01-19 10:59:17'),
(231, 'groq_api_key', '', '2026-01-20 23:18:00', '2026-01-20 23:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('admin','manager','sales','viewer') DEFAULT 'sales',
  `is_active` tinyint(1) DEFAULT 1,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `email`, `role`, `is_active`, `last_login`, `created_at`, `updated_at`, `phone`) VALUES
(1, 'admin', '$2y$10$t55t4ZMtt1NRbME1qLf4XO50stwquki6Bs5GQxWX4.46sld4Wxj72', 'Admin', 'bluedotsng@gmail.com', 'admin', 1, '2026-01-19 09:36:42', '2026-01-19 08:03:57', '2026-01-19 09:36:42', NULL),
(2, 'Joel', '$2y$10$mucLt8gA1v8eP8n4dIT51Oe0CAtNJyWAYGUYu6T2rkIemzWj4lp3K', 'Joel Okenabirhie', 'ejovwoke@gmail.com', 'admin', 1, '2026-03-29 17:49:30', '2026-01-19 09:59:55', '2026-03-29 17:49:30', '07031635955');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_action` (`action`),
  ADD KEY `idx_resource` (`resource_type`,`resource_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bank_name` (`bank_name`),
  ADD KEY `idx_is_active` (`is_active`),
  ADD KEY `idx_display_order` (`display_order`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_customer_name` (`customer_name`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_is_active` (`is_active`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `idx_invoice_number` (`invoice_number`),
  ADD KEY `idx_customer_name` (`customer_name`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_due_date` (`due_date`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `invoice_line_items`
--
ALTER TABLE `invoice_line_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_invoice_id` (`invoice_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_payment_date` (`payment_date`),
  ADD KEY `idx_customer_id` (`customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`product_code`),
  ADD KEY `idx_product_code` (`product_code`),
  ADD KEY `idx_product_name` (`product_name`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_is_active` (`is_active`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `quote_number` (`quote_number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `idx_quote_number` (`quote_number`),
  ADD KEY `idx_customer_name` (`customer_name`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `quote_line_items`
--
ALTER TABLE `quote_line_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_quote_id` (`quote_id`);

--
-- Indexes for table `readymade_quote_categories`
--
ALTER TABLE `readymade_quote_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category_name` (`category_name`);

--
-- Indexes for table `readymade_quote_templates`
--
ALTER TABLE `readymade_quote_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template_name` (`template_name`),
  ADD KEY `idx_category_id` (`category_id`);

--
-- Indexes for table `readymade_quote_template_items`
--
ALTER TABLE `readymade_quote_template_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_template_id` (`template_id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `receipt_number` (`receipt_number`),
  ADD UNIQUE KEY `unique_receipt_number` (`receipt_number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `idx_receipt_number` (`receipt_number`),
  ADD KEY `idx_customer_name` (`customer_name`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`),
  ADD KEY `idx_setting_key` (`setting_key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice_line_items`
--
ALTER TABLE `invoice_line_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `quote_line_items`
--
ALTER TABLE `quote_line_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=648;

--
-- AUTO_INCREMENT for table `readymade_quote_categories`
--
ALTER TABLE `readymade_quote_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `readymade_quote_templates`
--
ALTER TABLE `readymade_quote_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `readymade_quote_template_items`
--
ALTER TABLE `readymade_quote_template_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `audit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invoice_line_items`
--
ALTER TABLE `invoice_line_items`
  ADD CONSTRAINT `invoice_line_items_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_line_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `quotes`
--
ALTER TABLE `quotes`
  ADD CONSTRAINT `quotes_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `quotes_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `quote_line_items`
--
ALTER TABLE `quote_line_items`
  ADD CONSTRAINT `quote_line_items_ibfk_1` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quote_line_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `readymade_quote_templates`
--
ALTER TABLE `readymade_quote_templates`
  ADD CONSTRAINT `readymade_quote_templates_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `readymade_quote_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `readymade_quote_template_items`
--
ALTER TABLE `readymade_quote_template_items`
  ADD CONSTRAINT `readymade_quote_template_items_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `readymade_quote_templates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `readymade_quote_template_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `receipts_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `receipts_ibfk_2` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `receipts_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
