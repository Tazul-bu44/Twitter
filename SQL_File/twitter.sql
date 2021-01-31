-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 31, 2021 at 05:17 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twitter`
--

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'Post of Mr. X', '2021-01-31 05:44:15', '2021-01-31 05:44:15'),
(2, 2, 'Post Of Mr. X follower and friends', '2021-01-31 05:44:15', '2021-01-31 05:44:15'),
(3, 5, 'Post Of Mr. X follower', '2021-01-31 05:44:15', '2021-01-31 05:44:15'),
(4, 3, 'Mr. X follower this user post', '2021-01-31 05:44:15', '2021-01-31 05:44:15'),
(5, 7, 'unknown Person', '2021-01-31 05:50:26', '2021-01-31 05:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `number`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'glynch', '(129) 488-6605', 'glynch@yundt.info', 0, '2021-01-30 15:39:30', '2021-01-30 15:39:30'),
(2, 'jerrod', '(566) 350-9131\r\n', 'jerrod.tillman@koepp.com', 0, '2021-01-30 15:39:30', '2021-01-30 15:39:30'),
(3, 'hgoodwin', '(454) 130-7736\r\n\r\n', 'hgoodwin@yahoo.com', 0, '2021-01-30 15:39:30', '2021-01-30 15:39:30'),
(4, 'vlarson', '(421) 108-9874', 'vlarson@powlowski.org', 0, '2021-01-30 15:39:30', '2021-01-30 15:39:30'),
(5, 'hermann', '(213) 785-6809', 'hermann.hudson@yahoo.com', 0, '2021-01-30 15:39:30', '2021-01-30 15:39:30'),
(6, 'kautzer', '(562) 858-8225', 'kautzer.neal@hotmail.com', 0, '2021-01-30 15:39:30', '2021-01-30 15:39:30'),
(7, 'morton90', '(770) 638-1425', 'morton90@fritsch.com', 0, '2021-01-30 15:39:30', '2021-01-30 15:39:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_relation`
--

CREATE TABLE `user_relation` (
  `id` bigint(20) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `followed_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_relation`
--

INSERT INTO `user_relation` (`id`, `follower_id`, `followed_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2021-01-30 15:41:26', '2021-01-30 15:41:26'),
(2, 2, 1, '2021-01-30 15:41:26', '2021-01-30 15:41:26'),
(3, 1, 3, '2021-01-30 15:41:26', '2021-01-30 15:41:26'),
(4, 1, 4, '2021-01-30 15:41:26', '2021-01-30 15:41:26'),
(5, 5, 1, '2021-01-30 15:41:26', '2021-01-30 15:41:26'),
(6, 6, 7, '2021-01-31 07:01:02', '2021-01-31 07:01:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_relation`
--
ALTER TABLE `user_relation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_relation`
--
ALTER TABLE `user_relation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
