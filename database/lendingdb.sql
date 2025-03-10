-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2025 at 03:17 AM
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
(30, 'LN-224578', 5, 'Regular', 3776.74, 7, '2025-03-06', 4, '2026-03-06', 30, 'qwe', '2025-03-06 10:30:58', '2025-03-06 11:41:11');

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_balance`
--

INSERT INTO `loan_balance` (`id`, `loan_reference_no`, `borrower_id`, `loan_balance`, `month_term_duration`, `created_at`, `updated_at`) VALUES
(3, 'LN-224578', 5, 6332.05, 12, '2025-03-06 02:30:58', '2025-03-06 03:43:56');

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
(153, 30, '2025-04-06', 986.23, 71.30, 1057.53, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:03:08'),
(154, 30, '2025-05-06', 898.62, 59.37, 957.99, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:27:36'),
(155, 30, '2025-06-06', 903.86, 54.13, 957.99, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:35:28'),
(156, 30, '2025-07-06', 909.14, 48.86, 957.99, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:36:54'),
(157, 30, '2025-08-06', 914.44, 43.56, 957.99, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:37:29'),
(158, 30, '2025-09-06', 919.77, 38.22, 957.99, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:37:30'),
(159, 30, '2025-10-06', 925.14, 32.86, 957.99, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:40:53'),
(160, 30, '2025-11-06', 930.53, 27.46, 957.99, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:41:11'),
(161, 30, '2025-12-06', 930.53, 27.46, 957.99, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:37:29'),
(162, 30, '2026-01-06', 935.96, 22.03, 957.99, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:27:36'),
(163, 30, '2026-02-06', 941.42, 16.57, 957.99, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:27:36'),
(164, 30, '2026-03-06', 946.91, 11.08, 957.99, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:27:36'),
(165, 30, '2026-04-06', 952.44, 5.56, 957.99, 'pending', '2025-03-06 11:03:08', '2025-03-06 11:27:36');

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

INSERT INTO `payment` (`id`, `reference_no`, `borrower_id`, `payment_amount`, `paid_amount`, `payment_date`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(86, 'PMT-C50A3C', 5, 1057.53, 1057.53, '2025-04-06', 'pending', 'paid', '2025-03-06 11:03:08', '2025-03-06 11:24:41'),
(87, 'PMT-8179E3', 5, 957.99, 900.00, '2025-05-06', 'pending', 'paid', '2025-03-06 11:27:36', '2025-03-06 11:31:10'),
(88, 'PMT-0CD782', 5, 957.99, 957.99, '2025-06-06', 'pending', 'paid', '2025-03-06 11:35:28', '2025-03-06 11:35:46'),
(89, 'PMT-6D8C3E', 5, 957.99, 957.99, '2025-07-06', 'pending', 'paid', '2025-03-06 11:36:54', '2025-03-06 11:38:50'),
(90, 'PMT-907203', 5, 957.99, 200.00, '2025-08-06', 'pending', 'paid', '2025-03-06 11:37:29', '2025-03-06 11:39:03'),
(91, 'PMT-A6DD53', 5, 957.99, 957.99, '2025-09-06', 'pending', 'paid', '2025-03-06 11:37:30', '2025-03-06 11:41:29'),
(92, 'PMT-5B38CA', 5, 957.99, 957.99, '2025-10-06', 'pending', 'paid', '2025-03-06 11:40:53', '2025-03-06 11:43:43'),
(93, 'PMT-76809E', 5, 957.99, 957.99, '2025-11-06', 'pending', 'paid', '2025-03-06 11:41:11', '2025-03-06 11:43:56');

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
(30, '1741228258_67c908e223bab.png', '2025-03-06 10:30:58');

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
(16, 'LN-B701C9', 'loan', 100000.00, 6, '2025-03-04 14:17:31', '2025-03-04 14:17:31'),
(17, 'LN-F8FA59', 'loan', 120000.00, 5, '2025-03-04 15:29:51', '2025-03-04 15:29:51'),
(18, 'LN-89516F', 'loan', 10000.00, 5, '2025-03-04 15:47:20', '2025-03-04 15:47:20'),
(19, 'LN-326D36', 'loan', 20000.00, 6, '2025-03-06 09:43:15', '2025-03-06 09:43:15'),
(20, 'LN-FB0308', 'loan', 120000.00, 6, '2025-03-06 09:59:59', '2025-03-06 09:59:59'),
(21, 'LN-B263BD', 'loan', 12000.00, 5, '2025-03-06 10:15:55', '2025-03-06 10:15:55'),
(22, 'LN-224578', 'loan', 12222.00, 5, '2025-03-06 10:30:58', '2025-03-06 10:30:58');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `loan_balance`
--
ALTER TABLE `loan_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loan_schedules`
--
ALTER TABLE `loan_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `promissory_files`
--
ALTER TABLE `promissory_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
