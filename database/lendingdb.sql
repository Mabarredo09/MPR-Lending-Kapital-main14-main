-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2025 at 08:16 AM
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
(12, 'LN-042400', 5, 'Regular', 880060.38, 7, '2025-02-26', 14, '2026-04-26', 12, 'qwe', '2025-02-26 10:39:12', '2025-03-04 15:06:32'),
(22, 'LN-B701C9', 6, 'Regular', 348.14, 7, '2025-03-04', 12, '2026-03-04', 22, 'qwe', '2025-03-04 14:17:31', '2025-03-04 15:06:32');

-- --------------------------------------------------------

--
-- Table structure for table `loan_balance`
--

CREATE TABLE `loan_balance` (
  `id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `loan_balance` float(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','overdue') NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_schedules`
--

INSERT INTO `loan_schedules` (`id`, `loan_id`, `due_date`, `principal_amount`, `interest_amount`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(57, 12, '2025-03-04', 70523.95, 413.80, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(58, 12, '2025-04-04', 65390.27, 5547.49, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(59, 12, '2025-05-04', 65771.71, 5166.05, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(60, 12, '2025-06-04', 66155.38, 4782.38, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(61, 12, '2025-07-04', 66541.28, 4396.47, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(62, 12, '2025-08-04', 66929.44, 4008.31, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(63, 12, '2025-09-04', 67319.86, 3617.89, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(64, 12, '2025-10-04', 67712.56, 3225.19, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(65, 12, '2025-11-04', 68107.55, 2830.20, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(66, 12, '2025-12-04', 68504.85, 2432.91, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(67, 12, '2026-01-04', 68904.46, 2033.30, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(68, 12, '2026-02-04', 69306.40, 1631.35, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(69, 12, '2026-03-04', 69710.69, 1227.07, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(70, 12, '2026-04-04', 70117.33, 820.42, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(71, 12, '2026-05-04', 70526.35, 411.40, 70937.75, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(72, 22, '2025-03-04', 32.78, 0.19, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(73, 22, '2025-04-04', 30.75, 2.22, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(74, 22, '2025-05-04', 30.93, 2.04, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(75, 22, '2025-06-04', 31.11, 1.86, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(76, 22, '2025-07-04', 31.30, 1.68, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(77, 22, '2025-08-04', 31.48, 1.50, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(78, 22, '2025-09-04', 31.66, 1.32, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(79, 22, '2025-10-04', 31.85, 1.13, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(80, 22, '2025-11-04', 32.03, 0.95, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(81, 22, '2025-12-04', 32.22, 0.76, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(82, 22, '2026-01-04', 32.41, 0.57, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(83, 22, '2026-02-04', 32.60, 0.38, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32'),
(84, 22, '2026-03-04', 32.79, 0.19, 32.98, 'pending', '2025-03-04 15:05:56', '2025-03-04 15:06:32');

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
  `payment_amount` float(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `remarks` text NOT NULL,
  `status` enum('pending','paid','overdue','') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `reference_no`, `borrower_id`, `payment_amount`, `payment_date`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(57, 'PMT-104595', 5, 89511.54, '0000-00-00', 'Monthly payment generated by cron job', 'pending', '2025-03-04 14:42:25', '2025-03-04 14:42:25'),
(58, 'PMT-104C47', 6, 43.26, '0000-00-00', 'Monthly payment generated by cron job', 'pending', '2025-03-04 14:42:25', '2025-03-04 14:42:25'),
(59, 'PMT-3982FC', 5, 89511.54, '0000-00-00', 'Monthly payment generated by cron job', 'pending', '2025-03-04 14:55:15', '2025-03-04 14:55:15'),
(60, 'PMT-39AFCA', 6, 43.26, '0000-00-00', 'Monthly payment generated by cron job', 'pending', '2025-03-04 14:55:15', '2025-03-04 14:55:15'),
(61, 'PMT-D928D5', 5, 82834.61, '2025-03-04', 'Monthly payment generated by cron job', 'pending', '2025-03-04 15:01:01', '2025-03-04 15:01:01'),
(62, 'PMT-D946B3', 6, 39.52, '2025-03-04', 'Monthly payment generated by cron job', 'pending', '2025-03-04 15:01:01', '2025-03-04 15:01:01'),
(63, 'PMT-474383', 5, 76655.73, '2025-03-04', 'Monthly payment generated by cron job', 'pending', '2025-03-04 15:05:56', '2025-03-04 15:05:56'),
(64, 'PMT-476768', 6, 36.10, '2025-03-04', 'Monthly payment generated by cron job', 'pending', '2025-03-04 15:05:56', '2025-03-04 15:05:56'),
(65, 'PMT-86E74A', 5, 70937.75, '2025-03-04', 'Monthly payment generated by cron job', 'pending', '2025-03-04 15:06:32', '2025-03-04 15:06:32'),
(66, 'PMT-87012F', 6, 32.98, '2025-03-04', 'Monthly payment generated by cron job', 'pending', '2025-03-04 15:06:32', '2025-03-04 15:06:32');

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
(22, '1741069051_67c69afb6f9d8.jpg', '2025-03-04 14:17:31');

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
(9, 'LN-975B15', 'loan', 131312.00, 5, '2025-02-26 10:37:13', '2025-02-26 10:37:13'),
(10, 'LN-042400', 'loan', 1200000.00, 5, '2025-02-26 10:39:12', '2025-02-26 10:39:12'),
(11, 'LN-33D04B', 'loan', 12000.00, 5, '2025-02-26 10:40:35', '2025-02-26 10:40:35'),
(12, 'LN-DC494C', 'loan', 1300.00, 5, '2025-02-26 10:42:21', '2025-02-26 10:42:21'),
(13, 'LN-5D866F', 'loan', 12000000.00, 5, '2025-02-26 10:43:01', '2025-02-26 10:43:01'),
(15, 'GR-7235BD', 'grocery', 11111.00, 5, '2025-02-26 11:20:55', '2025-02-26 11:20:55'),
(16, 'LN-B701C9', 'loan', 100000.00, 6, '2025-03-04 14:17:31', '2025-03-04 14:17:31');

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
  ADD KEY `borrower_id` (`borrower_id`),
  ADD KEY `promissory_id` (`promissory_id`);

--
-- Indexes for table `loan_balance`
--
ALTER TABLE `loan_balance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrower_id` (`borrower_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `loan_balance`
--
ALTER TABLE `loan_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `promissory_files`
--
ALTER TABLE `promissory_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  ADD CONSTRAINT `loan_balance_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`);

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
