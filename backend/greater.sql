-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 16, 2023 at 05:34 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `greater`
--

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `category_id` varchar(191) NOT NULL,
  `category_name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`category_id`, `category_name`) VALUES
('3eae8093-14e8-42f8-9eb1-30590fbdfd35', 'Python'),
('9144682f-a79c-4fd5-9c6b-9528b948e92c', 'JavaScript');

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `comment_id` varchar(191) NOT NULL,
  `content` varchar(191) NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `course_id` varchar(191) NOT NULL,
  `comment_date` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `course_id` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `info` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `level` varchar(191) NOT NULL,
  `end_date` datetime(3) NOT NULL,
  `start_date` datetime(3) NOT NULL,
  `category_id` varchar(191) NOT NULL,
  `certificate` tinyint(1) NOT NULL,
  `course_image` varchar(191) DEFAULT NULL,
  `createAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `lesson` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`course_id`, `title`, `description`, `info`, `price`, `level`, `end_date`, `start_date`, `category_id`, `certificate`, `course_image`, `createAt`, `lesson`, `amount`) VALUES
('1110b7d9-ee68-4482-9b3e-5088062ae55d', 'Course A', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', 800, 'ระดับกลาง', '1970-01-01 00:00:00.000', '1970-01-01 00:00:00.000', '3eae8093-14e8-42f8-9eb1-30590fbdfd35', 1, NULL, '2023-05-16 10:12:12.439', 15, 100),
('434ab3b7-007d-45a6-b9bc-eff4db6f9d61', 'Easy pat1', 'pat1 is easy if you know', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1200, 'ระดับเริ่มต้น', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '3eae8093-14e8-42f8-9eb1-30590fbdfd35', 1, 'fileupload-1684236817860.jpg', '2023-05-16 11:33:37.871', 20, 80),
('50bce8cf-f61e-4626-8751-ad850609f28b', 'JS For Beginner', 'JS is not hard if you know', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1200, 'ระดับเริ่มต้น', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '9144682f-a79c-4fd5-9c6b-9528b948e92c', 1, 'fileupload-1684236818723.jpg', '2023-05-16 11:33:38.727', 20, 50),
('5af5bfcf-f1cc-4c74-aea5-48c6d6fa67e0', 'Easy pat1', 'pat1 is easy if you know', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1200, 'ระดับเริ่มต้น', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '3eae8093-14e8-42f8-9eb1-30590fbdfd35', 1, 'fileupload-1684236402158.jpg', '2023-05-16 11:26:42.177', 20, 120),
('7ac778d0-32bb-4450-802a-53cbd6065d20', 'JS very hard', 'Hard js for big brain', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2400, 'ระดับสูง', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '9144682f-a79c-4fd5-9c6b-9528b948e92c', 1, 'fileupload-1684238395438.jpg', '2023-05-16 11:59:55.507', 20, 100),
('ca7f1b2a-1d28-492f-9bd5-08e9d8387997', 'Course B', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', 3000, 'ระดับกลาง', '1970-01-01 00:00:00.000', '1970-01-01 00:00:00.000', '3eae8093-14e8-42f8-9eb1-30590fbdfd35', 0, NULL, '2023-05-16 10:10:12.832', 2, 20),
('edb4df0d-f75b-4ce5-9aa2-f4f9f6252bcb', 'Course C', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', 5000, 'ระดับกลาง', '1970-01-01 00:00:00.000', '1970-01-01 00:00:00.000', '3eae8093-14e8-42f8-9eb1-30590fbdfd35', 0, NULL, '2023-05-16 10:10:30.803', 10, 40);

-- --------------------------------------------------------

--
-- Table structure for table `Enroll`
--

CREATE TABLE `Enroll` (
  `user_id` varchar(191) NOT NULL,
  `course_id` varchar(191) NOT NULL,
  `enroll_date` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

CREATE TABLE `Payment` (
  `cc_id` varchar(191) NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `cc_number` varchar(191) NOT NULL,
  `cc_ccv` varchar(191) NOT NULL,
  `cc_expiry` varchar(191) NOT NULL,
  `cc_first_name` varchar(191) NOT NULL,
  `cc_last_name` varchar(191) NOT NULL,
  `cc_type` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Payment_history`
--

CREATE TABLE `Payment_history` (
  `payment_history_id` varchar(191) NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `course_id` varchar(191) NOT NULL,
  `summary` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` varchar(191) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `role` enum('Student','Admin') NOT NULL DEFAULT 'Student',
  `address` varchar(191) DEFAULT NULL,
  `info` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `user_image` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `Comments_course_id_fkey` (`course_id`),
  ADD KEY `Comments_user_id_fkey` (`user_id`);

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `Course_category_id_fkey` (`category_id`);

--
-- Indexes for table `Enroll`
--
ALTER TABLE `Enroll`
  ADD PRIMARY KEY (`user_id`,`course_id`),
  ADD KEY `Enroll_course_id_fkey` (`course_id`);

--
-- Indexes for table `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`cc_id`),
  ADD KEY `Payment_user_id_fkey` (`user_id`);

--
-- Indexes for table `Payment_history`
--
ALTER TABLE `Payment_history`
  ADD PRIMARY KEY (`payment_history_id`),
  ADD KEY `Payment_history_user_id_fkey` (`user_id`),
  ADD KEY `Payment_history_course_id_fkey` (`course_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `Users_email_key` (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `Comments_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Comments_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Course`
--
ALTER TABLE `Course`
  ADD CONSTRAINT `Course_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `Category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Enroll`
--
ALTER TABLE `Enroll`
  ADD CONSTRAINT `Enroll_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Enroll_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Payment`
--
ALTER TABLE `Payment`
  ADD CONSTRAINT `Payment_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Payment_history`
--
ALTER TABLE `Payment_history`
  ADD CONSTRAINT `Payment_history_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Payment_history_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
