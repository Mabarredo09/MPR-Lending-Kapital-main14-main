-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2025 at 03:38 AM
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
-- Database: `lendingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `home_no` varchar(100) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `home_no`, `street`, `barangay`, `city`, `province`, `region`, `created_at`) VALUES
(9, '1213', 'ljk', 'poblacion west 4', 'asdd', 'lkj', 'a', '2025-02-14 02:50:42'),
(10, 'qwe', 'ljk', 'poblacion west 3', 'Aliaga', 'lkj', 'jlkh', '2025-02-14 02:50:42'),
(11, 'qwe', 'ljk', 'qwe', ';l', 'lkj', 'qwe', '2025-02-14 03:22:55'),
(12, 'qwe', 'qwe', 'qwe', 'qwe', 'qwe', 'ewq', '2025-02-14 03:22:55'),
(15, 'qwe', 'ljk', 'qwe', ';l', 'lkj', 'qwe', '2025-02-20 00:56:31'),
(16, 'qwe', 'ljk', 'qwe', ';l', 'lkj', 'qwe', '2025-02-20 00:56:31'),
(17, '1213', 'ljk', 'poblacion west 4', ';l', 'lkj', 'qwe', '2025-02-24 08:19:26'),
(18, 'qwe', 'ljk', 'qwe', ';l', 'lkj', 'qwe', '2025-02-24 08:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `audit_content` varchar(128) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `surname` varchar(100) NOT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `sex` enum('male','female') NOT NULL,
  `dob` date NOT NULL,
  `marital_status` enum('single','married','divorced','widowed') NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`id`, `first_name`, `middle_name`, `surname`, `suffix`, `sex`, `dob`, `marital_status`, `contact_number`, `address_id`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'Maranatha', 'Gapac', 'Barredo', 'None', 'male', '2025-02-13', 'single', '09953838730', 9, 0, '2025-02-14 02:50:42', '0000-00-00 00:00:00', '2025-02-18 05:22:36'),
(6, 'Mark', 'sample', 'Olpot', 'Sr.', 'female', '2025-01-30', 'married', '09953838730', 11, 0, '2025-02-14 03:22:55', '0000-00-00 00:00:00', '2025-02-18 05:22:36'),
(7, 'tado', 'asd', 'olpot', 'None', 'male', '2025-02-13', 'married', '09953838730', 15, 1, '2025-02-20 00:56:31', '2025-02-20 00:56:31', '2025-02-20 00:56:31'),
(8, 'asd', 'barredo', 'olpot', 'Jr.', 'female', '2025-03-04', 'married', '09914362918', 17, 1, '2025-02-24 08:19:26', '2025-02-24 08:19:26', '2025-02-24 08:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `collateral_files`
--

CREATE TABLE `collateral_files` (
  `id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collateral_files`
--

INSERT INTO `collateral_files` (`id`, `borrower_id`, `file_path`, `created_at`) VALUES
(10, 5, 'collateral_files/67aeaf82209e4.png', '2025-02-14 02:50:42'),
(11, 5, 'collateral_files/67aeaf8221252.png', '2025-02-14 02:50:42'),
(12, 5, 'collateral_files/67aeaf8222690.png', '2025-02-14 02:50:42'),
(13, 5, 'collateral_files/67aeaf8223f5f.png', '2025-02-14 02:50:42'),
(14, 5, 'collateral_files/67aeaf8225281.png', '2025-02-14 02:50:42'),
(15, 5, 'collateral_files/67aeaf8225bda.png', '2025-02-14 02:50:42'),
(16, 6, 'collateral_files/67aeb70fb77c1.png', '2025-02-14 03:22:55'),
(17, 6, 'collateral_files/67aeb70fb84c4.png', '2025-02-14 03:22:55'),
(18, 6, 'collateral_files/67aeb70fb8b83.png', '2025-02-14 03:22:55'),
(19, 7, 'collateral_files/67b67dbff1e5a.png', '2025-02-20 00:56:31'),
(20, 7, 'collateral_files/67b67dbff2817.png', '2025-02-20 00:56:31'),
(21, 7, 'collateral_files/67b67dbff2acc.png', '2025-02-20 00:56:31'),
(22, 7, 'collateral_files/67b67dbff2ccf.png', '2025-02-20 00:56:31'),
(23, 8, 'collateral_files/67bc2b8ed8fb4.png', '2025-02-24 08:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `dependents`
--

CREATE TABLE `dependents` (
  `id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_number_dependents` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dependents`
--

INSERT INTO `dependents` (`id`, `borrower_id`, `name`, `contact_number_dependents`, `created_at`) VALUES
(2, 5, 'tado olpot', '09123456789', '2025-02-14 02:50:42'),
(3, 6, '', '', '2025-02-14 03:22:55'),
(4, 7, 'qwe', 'qwe', '2025-02-20 00:56:31'),
(5, 8, 'tado olpot', '098', '2025-02-24 08:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `employment_details`
--

CREATE TABLE `employment_details` (
  `id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `employer_name` varchar(255) NOT NULL,
  `years_with_employer` int(11) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employment_details`
--

INSERT INTO `employment_details` (`id`, `borrower_id`, `employer_name`, `years_with_employer`, `position`, `phone_no`, `salary`, `address_id`, `created_at`) VALUES
(2, 5, 'tado olpot', 8, 'manager', '09953838730', 7676.00, 10, '2025-02-14 02:50:42'),
(3, 6, 'qwe', 123, 'qwe', 'qwe', 123.00, 12, '2025-02-14 03:22:55'),
(4, 7, 'qwe', 1, 'qwe', '123', 123.00, 16, '2025-02-20 00:56:31'),
(5, 8, 'tado olpot', 1, 'qw', '123', 123.00, 18, '2025-02-24 08:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `grocery`
--

CREATE TABLE `grocery` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(20) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `grocery_amount` float(10,2) NOT NULL,
  `grocery_date` date NOT NULL,
  `remarks` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grocery`
--

INSERT INTO `grocery` (`id`, `reference_no`, `borrower_id`, `grocery_amount`, `grocery_date`, `remarks`, `created_at`, `updated_at`) VALUES
(6, 'GR-7235BD', 5, 11111.00, '2025-02-26', 'Grocery added successfully', '2025-02-26 11:20:55', '2025-02-26 11:20:55');

-- --------------------------------------------------------

--
-- Table structure for table `identification_documents`
--

CREATE TABLE `identification_documents` (
  `id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `id_type` enum('SSS','TIN','PAGIBIG','PhilHealth','PAN','GSIS','National ID','Birth Certificate','Voter''s ID','Driver''s License','Passport') NOT NULL,
  `id_no` varchar(50) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `id_photo_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `identification_documents`
--

INSERT INTO `identification_documents` (`id`, `borrower_id`, `id_type`, `id_no`, `expiry_date`, `id_photo_path`, `created_at`) VALUES
(2, 5, 'National ID', '22232', '2025-02-15', 'id_photos/67aebf5b025de.png', '2025-02-14 02:50:42'),
(3, 6, 'Birth Certificate', 'qwe', '2025-02-11', 'id_photos/67aeb70fb66dc.png', '2025-02-14 03:22:55'),
(4, 7, 'PhilHealth', '123123', '2025-02-12', 'id_photos/67b67dbfef9fd.png', '2025-02-20 00:56:31'),
(5, 8, 'Voter\'s ID', '2223212', '2025-02-26', 'id_photos/67bc2b8ed73c1.png', '2025-02-24 08:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `insurance_details`
--

CREATE TABLE `insurance_details` (
  `id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `insurance_provider` varchar(100) NOT NULL,
  `issued_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `insurance_file_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `insurance_details`
--

INSERT INTO `insurance_details` (`id`, `borrower_id`, `insurance_provider`, `issued_date`, `expiry_date`, `insurance_file_path`, `created_at`, `updated_at`) VALUES
(2, 5, 'Health Insurance', '2025-02-26', '2025-02-17', 'insurance_files/67aeaf821e2a3.png', '2025-02-14 02:50:42', '2025-02-20 05:28:59'),
(3, 7, 'Single Premium', '2025-02-13', '2025-02-05', 'insurance_files/67b67dbff06cc.png', '2025-02-20 00:56:31', '2025-02-20 05:28:59'),
(4, 8, 'Sun Life', '2025-02-17', '2025-02-10', 'insurance_files/67bc2b8ed8b4d.png', '2025-02-24 08:19:26', '2025-02-24 08:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(20) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `customer_type` enum('Regular','VIP','Other','') NOT NULL,
  `loan_amount` float(10,2) NOT NULL,
  `interest_rate` int(10) NOT NULL,
  `loan_date` date NOT NULL,
  `term_months` int(11) NOT NULL,
  `repayment_date` date NOT NULL,
  `promissory_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`id`, `reference_no`, `borrower_id`, `customer_type`, `loan_amount`, `interest_rate`, `loan_date`, `term_months`, `repayment_date`, `promissory_id`, `remarks`, `created_at`, `updated_at`) VALUES
(51, 'LN-71A46B', 6, 'Regular', 10000.00, 7, '2025-03-18', 12, '2026-03-18', 51, '1000', '2025-03-18 09:36:23', '2025-03-18 09:36:23'),
(52, 'LN-089310', 6, 'Regular', 1000.00, 7, '2025-03-18', 12, '2026-03-18', 52, 'qwe', '2025-03-18 09:56:00', '2025-03-18 09:56:00'),
(53, 'LN-2230AD', 6, 'VIP', 12000.00, 5, '2025-03-18', 12, '2026-03-18', 53, 'Sample loan', '2025-03-18 10:32:34', '2025-03-18 10:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `loan_balance`
--

CREATE TABLE `loan_balance` (
  `id` int(11) NOT NULL,
  `loan_reference_no` varchar(128) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `loan_balance` float(10,2) NOT NULL DEFAULT 0.00,
  `month_term_duration` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_balance`
--

INSERT INTO `loan_balance` (`id`, `loan_reference_no`, `borrower_id`, `loan_balance`, `month_term_duration`, `status`, `created_at`, `updated_at`) VALUES
(23, 'LN-71A46B', 6, 0.00, 0, 0, '2025-03-18 01:36:23', '2025-03-18 01:55:20'),
(24, 'LN-089310', 6, 0.00, 0, 1, '2025-03-18 01:56:00', '2025-03-18 02:19:26'),
(25, 'LN-2230AD', 6, 0.00, 0, 0, '2025-03-18 02:32:34', '2025-03-18 02:37:55');

-- --------------------------------------------------------

--
-- Table structure for table `loan_schedules`
--

CREATE TABLE `loan_schedules` (
  `id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `principal_amount` decimal(10,2) NOT NULL,
  `interest_amount` decimal(10,2) NOT NULL,
  `shortfall` float(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','overdue') NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_schedules`
--

INSERT INTO `loan_schedules` (`id`, `loan_id`, `due_date`, `principal_amount`, `interest_amount`, `shortfall`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(353, 51, '2025-04-18', 806.93, 58.33, 0.00, 865.27, 'paid', '2025-03-18 09:36:35', '2025-03-18 09:36:47'),
(354, 51, '2025-05-18', 811.91, 53.36, 0.00, 865.27, 'paid', '2025-03-18 09:37:19', '2025-03-18 09:37:47'),
(355, 51, '2025-06-18', 1014.47, 48.32, 0.00, 1062.79, 'paid', '2025-03-18 09:42:30', '2025-03-18 09:42:44'),
(356, 51, '2025-07-18', 1020.39, 42.40, 0.00, 1062.79, 'paid', '2025-03-18 09:42:51', '2025-03-18 09:43:00'),
(357, 51, '2025-08-18', 1184.48, 42.07, 0.00, 1226.55, 'paid', '2025-03-18 09:43:39', '2025-03-18 09:44:05'),
(358, 51, '2025-09-18', 1414.09, 41.73, 0.00, 1455.82, 'paid', '2025-03-18 09:44:09', '2025-03-18 09:44:16'),
(359, 51, '2025-10-18', 1758.34, 41.39, 0.00, 1799.73, 'paid', '2025-03-18 09:44:27', '2025-03-18 09:44:31'),
(360, 51, '2025-11-18', 1768.60, 31.13, 0.00, 1799.73, 'paid', '2025-03-18 09:44:34', '2025-03-18 09:44:40'),
(361, 51, '2025-12-18', 1778.91, 20.81, 0.00, 1799.73, 'paid', '2025-03-18 09:44:51', '2025-03-18 09:44:56'),
(362, 51, '2026-01-18', 1789.28, 10.44, 0.00, 1799.72, 'paid', '2025-03-18 09:45:03', '2025-03-18 09:51:57'),
(363, 52, '2025-04-18', 80.69, 5.83, 0.00, 86.53, 'paid', '2025-03-18 09:56:09', '2025-03-18 10:12:25'),
(364, 52, '2025-05-18', 87.92, 5.81, 0.00, 93.73, 'paid', '2025-03-18 10:16:31', '2025-03-18 10:16:44'),
(365, 52, '2025-06-18', 92.69, 5.55, 0.00, 98.24, 'paid', '2025-03-18 10:16:59', '2025-03-18 10:17:07'),
(366, 52, '2025-07-18', 93.23, 5.01, 0.00, 98.24, 'paid', '2025-03-18 10:17:15', '2025-03-18 10:17:20'),
(367, 52, '2025-08-18', 93.20, 3.87, 0.00, 97.08, 'paid', '2025-03-18 10:17:56', '2025-03-18 10:18:00'),
(368, 52, '2025-09-18', 93.75, 3.33, 0.00, 97.08, 'paid', '2025-03-18 10:18:02', '2025-03-18 10:18:14'),
(369, 52, '2025-10-18', 94.29, 2.78, 0.00, 97.08, 'paid', '2025-03-18 10:18:23', '2025-03-18 10:18:26'),
(370, 52, '2025-11-18', 94.84, 2.23, 0.00, 97.07, 'paid', '2025-03-18 10:18:40', '2025-03-18 10:18:45'),
(371, 52, '2025-12-18', 95.40, 1.68, 0.00, 97.07, 'paid', '2025-03-18 10:18:50', '2025-03-18 10:18:54'),
(372, 52, '2026-01-18', 95.96, 1.12, 0.00, 97.08, 'paid', '2025-03-18 10:19:01', '2025-03-18 10:19:07'),
(373, 52, '2026-02-18', 96.51, 0.56, 0.00, 97.07, 'paid', '2025-03-18 10:19:12', '2025-03-18 10:19:26'),
(374, 53, '2025-04-18', 977.29, 50.00, 0.00, 1027.29, 'paid', '2025-03-18 10:32:52', '2025-03-18 10:34:54'),
(375, 53, '2025-05-18', 894.76, 41.88, 0.00, 936.64, 'paid', '2025-03-18 10:35:11', '2025-03-18 10:35:16'),
(376, 53, '2025-06-18', 898.49, 38.15, 0.00, 936.64, 'paid', '2025-03-18 10:35:22', '2025-03-18 10:35:27'),
(377, 53, '2025-07-18', 902.23, 34.40, 0.00, 936.64, 'paid', '2025-03-18 10:35:32', '2025-03-18 10:35:36'),
(378, 53, '2025-08-18', 905.99, 30.64, 0.00, 936.63, 'paid', '2025-03-18 10:35:40', '2025-03-18 10:35:44'),
(379, 53, '2025-09-18', 909.77, 26.87, 0.00, 936.63, 'paid', '2025-03-18 10:35:55', '2025-03-18 10:35:58'),
(380, 53, '2025-10-18', 913.56, 23.08, 0.00, 936.64, 'paid', '2025-03-18 10:36:01', '2025-03-18 10:36:19'),
(381, 53, '2025-11-18', 917.36, 19.27, 0.00, 936.64, 'paid', '2025-03-18 10:36:23', '2025-03-18 10:36:30'),
(382, 53, '2025-12-18', 921.18, 15.45, 0.00, 936.63, 'paid', '2025-03-18 10:36:36', '2025-03-18 10:37:02'),
(383, 53, '2026-01-18', 925.02, 11.61, 0.00, 936.63, 'paid', '2025-03-18 10:37:05', '2025-03-18 10:37:26'),
(384, 53, '2026-02-18', 928.88, 7.76, 0.00, 936.64, 'paid', '2025-03-18 10:37:35', '2025-03-18 10:37:39'),
(385, 53, '2026-03-18', 932.75, 3.89, 0.00, 936.64, 'paid', '2025-03-18 10:37:43', '2025-03-18 10:37:55');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `notif_content` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(20) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `principal_amount` float(10,2) NOT NULL,
  `interest_amount` float(10,2) NOT NULL,
  `payment_amount` float(10,2) NOT NULL,
  `paid_amount` float(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `remarks` text NOT NULL,
  `status` enum('pending','paid','overdue','') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `reference_no`, `borrower_id`, `principal_amount`, `interest_amount`, `payment_amount`, `paid_amount`, `payment_date`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(255, 'PMT-358549', 6, 46.37, 53.63, 865.27, 100.00, '2025-04-18', 'Monthly payment for schedule #353', 'paid', '2025-03-18 09:36:35', '2025-03-18 09:36:47'),
(256, 'PMT-F1CF8C', 6, 51.38, 48.62, 865.27, 100.00, '2025-05-18', 'Monthly payment for schedule #354', 'paid', '2025-03-18 09:37:19', '2025-03-18 09:37:47'),
(257, 'PMT-69019F', 6, 1014.47, 48.32, 1062.79, 1062.79, '2025-06-18', 'Monthly payment for schedule #355', 'paid', '2025-03-18 09:42:30', '2025-03-18 09:42:44'),
(258, 'PMT-B967CE', 6, 57.60, 42.40, 1062.79, 100.00, '2025-07-18', 'Monthly payment for schedule #356', 'paid', '2025-03-18 09:42:51', '2025-03-18 09:43:00'),
(259, 'PMT-B72126', 6, 57.93, 42.07, 1226.55, 100.00, '2025-08-18', 'Monthly payment for schedule #357', 'paid', '2025-03-18 09:43:39', '2025-03-18 09:44:05'),
(260, 'PMT-9DC555', 6, 58.27, 41.73, 1455.82, 100.00, '2025-09-18', 'Monthly payment for schedule #358', 'paid', '2025-03-18 09:44:09', '2025-03-18 09:44:16'),
(261, 'PMT-B20013', 6, 1758.34, 41.39, 1799.73, 1799.73, '2025-10-18', 'Monthly payment for schedule #359', 'paid', '2025-03-18 09:44:27', '2025-03-18 09:44:31'),
(262, 'PMT-25FB50', 6, 1768.60, 31.13, 1799.73, 1799.73, '2025-11-18', 'Monthly payment for schedule #360', 'paid', '2025-03-18 09:44:34', '2025-03-18 09:44:40'),
(263, 'PMT-327617', 6, 1778.92, 20.81, 1799.73, 1799.73, '2025-12-18', 'Monthly payment for schedule #361', 'paid', '2025-03-18 09:44:51', '2025-03-18 09:44:56'),
(264, 'PMT-F434E1', 6, 1789.28, 10.44, 1799.72, 1799.72, '2026-01-18', 'Monthly payment for schedule #362', 'paid', '2025-03-18 09:45:03', '2025-03-18 09:51:57'),
(265, 'PMT-960A33', 6, 4.17, 5.83, 86.53, 10.00, '2025-04-18', 'Monthly payment for schedule #363', 'paid', '2025-03-18 09:56:09', '2025-03-18 10:12:25'),
(266, 'PMT-F10C86', 6, 44.19, 5.81, 93.73, 50.00, '2025-05-18', 'Monthly payment for schedule #364', 'paid', '2025-03-18 10:16:31', '2025-03-18 10:16:44'),
(267, 'PMT-B09C6D', 6, 92.69, 5.55, 98.24, 98.24, '2025-06-18', 'Monthly payment for schedule #365', 'paid', '2025-03-18 10:16:59', '2025-03-18 10:17:07'),
(268, 'PMT-B231A4', 6, 194.99, 5.01, 98.24, 200.00, '2025-07-18', 'Monthly payment for schedule #366', 'paid', '2025-03-18 10:17:15', '2025-03-18 10:17:20'),
(269, 'PMT-48C931', 6, 93.21, 3.87, 97.08, 97.08, '2025-08-18', 'Monthly payment for schedule #367', 'paid', '2025-03-18 10:17:56', '2025-03-18 10:18:00'),
(270, 'PMT-AE56B9', 6, 93.75, 3.33, 97.08, 97.08, '2025-09-18', 'Monthly payment for schedule #368', 'paid', '2025-03-18 10:18:02', '2025-03-18 10:18:14'),
(271, 'PMT-F6DBD2', 6, 94.30, 2.78, 97.08, 97.08, '2025-10-18', 'Monthly payment for schedule #369', 'paid', '2025-03-18 10:18:23', '2025-03-18 10:18:26'),
(272, 'PMT-009FB8', 6, 94.84, 2.23, 97.07, 97.07, '2025-11-18', 'Monthly payment for schedule #370', 'paid', '2025-03-18 10:18:40', '2025-03-18 10:18:45'),
(273, 'PMT-A00A49', 6, 95.39, 1.68, 97.07, 97.07, '2025-12-18', 'Monthly payment for schedule #371', 'paid', '2025-03-18 10:18:50', '2025-03-18 10:18:54'),
(274, 'PMT-5840E4', 6, 95.96, 1.12, 97.08, 97.08, '2026-01-18', 'Monthly payment for schedule #372', 'paid', '2025-03-18 10:19:01', '2025-03-18 10:19:07'),
(275, 'PMT-0A2132', 6, 96.51, 0.56, 97.07, 97.07, '2026-02-18', 'Monthly payment for schedule #373', 'paid', '2025-03-18 10:19:12', '2025-03-18 10:19:26'),
(276, 'PMT-4BD7C3', 6, 1950.00, 50.00, 1027.29, 2000.00, '2025-04-18', 'Monthly payment for schedule #374', 'paid', '2025-03-18 10:32:52', '2025-03-18 10:34:54'),
(277, 'PMT-F3B673', 6, 894.76, 41.88, 936.64, 936.64, '2025-05-18', 'Monthly payment for schedule #375', 'paid', '2025-03-18 10:35:11', '2025-03-18 10:35:16'),
(278, 'PMT-AF0D53', 6, 898.49, 38.15, 936.64, 936.64, '2025-06-18', 'Monthly payment for schedule #376', 'paid', '2025-03-18 10:35:22', '2025-03-18 10:35:27'),
(279, 'PMT-4DDDE4', 6, 902.24, 34.40, 936.64, 936.64, '2025-07-18', 'Monthly payment for schedule #377', 'paid', '2025-03-18 10:35:32', '2025-03-18 10:35:36'),
(280, 'PMT-CBFD9C', 6, 905.99, 30.64, 936.63, 936.63, '2025-08-18', 'Monthly payment for schedule #378', 'paid', '2025-03-18 10:35:40', '2025-03-18 10:35:44'),
(281, 'PMT-B89CBD', 6, 909.76, 26.87, 936.63, 936.63, '2025-09-18', 'Monthly payment for schedule #379', 'paid', '2025-03-18 10:35:55', '2025-03-18 10:35:58'),
(282, 'PMT-103DA7', 6, 913.56, 23.08, 936.64, 936.64, '2025-10-18', 'Monthly payment for schedule #380', 'paid', '2025-03-18 10:36:01', '2025-03-18 10:36:19'),
(283, 'PMT-7BB1CF', 6, 917.37, 19.27, 936.64, 936.64, '2025-11-18', 'Monthly payment for schedule #381', 'paid', '2025-03-18 10:36:23', '2025-03-18 10:36:30'),
(284, 'PMT-4E021E', 6, 921.18, 15.45, 936.63, 936.63, '2025-12-18', 'Monthly payment for schedule #382', 'paid', '2025-03-18 10:36:36', '2025-03-18 10:37:02'),
(285, 'PMT-1D2666', 6, 925.02, 11.61, 936.63, 936.63, '2026-01-18', 'Monthly payment for schedule #383', 'paid', '2025-03-18 10:37:05', '2025-03-18 10:37:26'),
(286, 'PMT-FD9A8C', 6, 928.88, 7.76, 936.64, 936.64, '2026-02-18', 'Monthly payment for schedule #384', 'paid', '2025-03-18 10:37:35', '2025-03-18 10:37:39'),
(287, 'PMT-7ABDC8', 6, 932.75, 3.89, 936.64, 936.64, '2026-03-18', 'Monthly payment for schedule #385', 'paid', '2025-03-18 10:37:43', '2025-03-18 10:37:55');

-- --------------------------------------------------------

--
-- Table structure for table `promissory_files`
--

CREATE TABLE `promissory_files` (
  `id` int(11) NOT NULL,
  `promissory_file_path` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promissory_files`
--

INSERT INTO `promissory_files` (`id`, `promissory_file_path`, `created_at`) VALUES
(1, '1740387039_67bc32df4b013.png', '2025-02-24 16:50:39'),
(2, '1740387224_67bc3398e8089.png', '2025-02-24 16:53:44'),
(3, '1740387422_67bc345ebd152.pdf', '2025-02-24 16:57:02'),
(11, '1740537433_67be7e5975105.pdf', '2025-02-26 10:37:13'),
(12, '1740537552_67be7ed0418ba.png', '2025-02-26 10:39:12'),
(13, '1740537635_67be7f233cc27.png', '2025-02-26 10:40:35'),
(14, '1740537741_67be7f8dc4149.jpg', '2025-02-26 10:42:21'),
(15, '1740537781_67be7fb5d7d1c.pdf', '2025-02-26 10:43:01'),
(22, '1741069051_67c69afb6f9d8.jpg', '2025-03-04 14:17:31'),
(23, '1741073391_67c6abef8f1a3.png', '2025-03-04 15:29:51'),
(24, '1741074440_67c6b00894272.jpg', '2025-03-04 15:47:20'),
(25, '1741225395_67c8fdb326544.png', '2025-03-06 09:43:15'),
(26, '1741226399_67c9019faf3bd.jpg', '2025-03-06 09:59:59'),
(27, '1741227355_67c9055b25cac.pdf', '2025-03-06 10:15:55'),
(30, '1741228258_67c908e223bab.png', '2025-03-06 10:30:58'),
(31, '1741744190_67d0e83e53d4d.jpg', '2025-03-12 09:49:50'),
(32, '1741745247_67d0ec5f56e36.png', '2025-03-12 10:07:27'),
(33, '1741749179_67d0fbbbee82d.pdf', '2025-03-12 11:12:59'),
(34, '1741751393_67d10461ea53c.png', '2025-03-12 11:49:53'),
(35, '1741756563_67d11893207b0.pdf', '2025-03-12 13:16:03'),
(36, '1741759254_67d12316c462a.pdf', '2025-03-12 14:00:54'),
(37, '1741760431_67d127af173de.jpg', '2025-03-12 14:20:31'),
(38, '1741761014_67d129f6e61b4.pdf', '2025-03-12 14:30:14'),
(39, '1741912607_67d37a1f7581c.pdf', '2025-03-14 08:36:47'),
(40, '1741913149_67d37c3d3f21d.pdf', '2025-03-14 08:45:49'),
(41, '1741917836_67d38e8c053e1.pdf', '2025-03-14 10:03:56'),
(42, '1741918184_67d38fe818a2e.pdf', '2025-03-14 10:09:44'),
(43, '1741918977_67d393017acf5.pdf', '2025-03-14 10:22:57'),
(44, '1741919807_67d3963f998fe.pdf', '2025-03-14 10:36:47'),
(45, '1741922182_67d39f8633ff0.pdf', '2025-03-14 11:16:22'),
(46, '1741922201_67d39f99575af.pdf', '2025-03-14 11:16:41'),
(47, '1741928898_67d3b9c253924.jpg', '2025-03-14 13:08:18'),
(48, '1741935113_67d3d20996277.pdf', '2025-03-14 14:51:53'),
(49, '1741939086_67d3e18e97af2.jpg', '2025-03-14 15:58:06'),
(50, '1741939346_67d3e2925eb9f.jpg', '2025-03-14 16:02:26'),
(51, '1742261783_67d8ce1719de7.jpg', '2025-03-18 09:36:23'),
(52, '1742262960_67d8d2b088d6c.pdf', '2025-03-18 09:56:00'),
(53, '1742265154_67d8db4222cde.pdf', '2025-03-18 10:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(20) NOT NULL,
  `transaction_type` enum('loan','payment','grocery') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `reference_no`, `transaction_type`, `amount`, `borrower_id`, `created_at`, `updated_at`) VALUES
(35, 'LN-17B7E1', 'loan', 1000.00, 5, '2025-03-14 10:22:57', '2025-03-14 10:22:57'),
(36, 'LN-F99D4D', 'loan', 100000.00, 5, '2025-03-14 10:36:47', '2025-03-14 10:36:47'),
(37, 'LN-634AB3', 'loan', 10000.00, 5, '2025-03-14 11:16:22', '2025-03-14 11:16:22'),
(38, 'LN-958265', 'loan', 100000.00, 5, '2025-03-14 11:16:41', '2025-03-14 11:16:41'),
(39, 'LN-254547', 'loan', 10000.00, 6, '2025-03-14 13:08:18', '2025-03-14 13:08:18'),
(40, 'LN-996C03', 'loan', 20000.00, 6, '2025-03-14 14:51:53', '2025-03-14 14:51:53'),
(41, 'LN-E9849D', 'loan', 10000.00, 6, '2025-03-14 15:58:06', '2025-03-14 15:58:06'),
(42, 'LN-25F3C7', 'loan', 100000.00, 6, '2025-03-14 16:02:26', '2025-03-14 16:02:26'),
(43, 'LN-71A46B', 'loan', 10000.00, 6, '2025-03-18 09:36:23', '2025-03-18 09:36:23'),
(44, 'LN-089310', 'loan', 1000.00, 6, '2025-03-18 09:56:00', '2025-03-18 09:56:00'),
(45, 'LN-2230AD', 'loan', 12000.00, 6, '2025-03-18 10:32:34', '2025-03-18 10:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `collateral_files`
--
ALTER TABLE `collateral_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `dependents`
--
ALTER TABLE `dependents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `employment_details`
--
ALTER TABLE `employment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrower_id` (`borrower_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `grocery`
--
ALTER TABLE `grocery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `identification_documents`
--
ALTER TABLE `identification_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `insurance_details`
--
ALTER TABLE `insurance_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference_no` (`reference_no`),
  ADD KEY `borrower_id` (`borrower_id`),
  ADD KEY `promissory_id` (`promissory_id`);

--
-- Indexes for table `loan_balance`
--
ALTER TABLE `loan_balance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrower_id` (`borrower_id`),
  ADD KEY `loan_reference_no` (`loan_reference_no`);

--
-- Indexes for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_id` (`loan_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `promissory_files`
--
ALTER TABLE `promissory_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collateral_files`
--
ALTER TABLE `collateral_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `dependents`
--
ALTER TABLE `dependents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employment_details`
--
ALTER TABLE `employment_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `grocery`
--
ALTER TABLE `grocery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `identification_documents`
--
ALTER TABLE `identification_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `insurance_details`
--
ALTER TABLE `insurance_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `loan_balance`
--
ALTER TABLE `loan_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=386;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=288;

--
-- AUTO_INCREMENT for table `promissory_files`
--
ALTER TABLE `promissory_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD CONSTRAINT `borrowers_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`);

--
-- Constraints for table `collateral_files`
--
ALTER TABLE `collateral_files`
  ADD CONSTRAINT `collateral_files_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`);

--
-- Constraints for table `dependents`
--
ALTER TABLE `dependents`
  ADD CONSTRAINT `dependents_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`);

--
-- Constraints for table `employment_details`
--
ALTER TABLE `employment_details`
  ADD CONSTRAINT `employment_details_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`),
  ADD CONSTRAINT `employment_details_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`);

--
-- Constraints for table `grocery`
--
ALTER TABLE `grocery`
  ADD CONSTRAINT `grocery_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`);

--
-- Constraints for table `identification_documents`
--
ALTER TABLE `identification_documents`
  ADD CONSTRAINT `identification_documents_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`);

--
-- Constraints for table `insurance_details`
--
ALTER TABLE `insurance_details`
  ADD CONSTRAINT `insurance_details_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`);

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`promissory_id`) REFERENCES `promissory_files` (`id`),
  ADD CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`);

--
-- Constraints for table `loan_balance`
--
ALTER TABLE `loan_balance`
  ADD CONSTRAINT `loan_balance_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`),
  ADD CONSTRAINT `loan_balance_ibfk_2` FOREIGN KEY (`loan_reference_no`) REFERENCES `loan` (`reference_no`);

--
-- Constraints for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  ADD CONSTRAINT `loan_schedules_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
