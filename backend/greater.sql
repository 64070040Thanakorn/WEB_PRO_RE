-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2023 at 10:35 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_detail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No detail',
  `category_color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#E99F30'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_detail`, `category_color`) VALUES
('0b53faa0-02ef-492e-9a0c-87a3d0109d95', 'HTML & CSS', 'No detail', '#e85325'),
('3eae8093-14e8-42f8-9eb1-30590fbdfd35', 'Python', 'No detail', '#3672a4'),
('6d76bfa3-6695-4e76-a4da-ddc8d5d6c1ae', 'Java', 'No detail', '#5484a4'),
('9144682f-a79c-4fd5-9c6b-9528b948e92c', 'JavaScript', 'No detail', '#FBBF24');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_date` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `content`, `user_id`, `course_id`, `comment_date`) VALUES
('0179acc0-b75c-4711-ae81-d279cd855313', 'wow nice', '4ffc9d99-f923-40cc-ac44-6ad45353813e', '1110b7d9-ee68-4482-9b3e-5088062ae55d', '2023-05-17 14:11:31.668'),
('20707fc1-c285-49a5-bf31-0d80dc19a0c0', 'new comment', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '434ab3b7-007d-45a6-b9bc-eff4db6f9d61', '2023-05-17 13:05:55.836'),
('2bfd4ecf-628a-42ae-a3f0-7f7f75df7050', '111', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '434ab3b7-007d-45a6-b9bc-eff4db6f9d61', '2023-05-17 13:17:40.666'),
('497ea672-64a6-46e0-a8b2-dc9ea6687724', 'this is good!', 'd54988c8-a6a1-4ff5-a1ff-4020a4b3265d', '6a22609e-3df2-4569-b477-5f809de16401', '2023-05-18 07:41:16.902'),
('74c04527-339e-45bc-a142-38791460e8db', 'test', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '434ab3b7-007d-45a6-b9bc-eff4db6f9d61', '2023-05-17 13:17:03.988'),
('96ebdf43-2db0-460c-8692-e5343d6fa3cd', 'nice nice good', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '1110b7d9-ee68-4482-9b3e-5088062ae55d', '2023-05-17 13:30:25.048'),
('aa4674f0-6944-49f8-851a-38b6a750e3ed', 'Wow good course', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '434ab3b7-007d-45a6-b9bc-eff4db6f9d61', '2023-05-17 12:28:18.340'),
('dabb913b-c229-486a-b55c-40cf8285beae', 'idk?', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '434ab3b7-007d-45a6-b9bc-eff4db6f9d61', '2023-05-17 13:17:22.253');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime(3) NOT NULL,
  `start_date` datetime(3) NOT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificate` tinyint(1) NOT NULL,
  `course_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `lesson` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `title`, `description`, `info`, `price`, `level`, `end_date`, `start_date`, `category_id`, `certificate`, `course_image`, `createAt`, `lesson`, `amount`) VALUES
('1110b7d9-ee68-4482-9b3e-5088062ae55d', 'Course A', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', 800, 'ระดับกลาง', '1970-01-01 00:00:00.000', '1970-01-01 00:00:00.000', '3eae8093-14e8-42f8-9eb1-30590fbdfd35', 1, NULL, '2023-05-16 10:12:12.439', 15, 100),
('434ab3b7-007d-45a6-b9bc-eff4db6f9d61', 'Easy pat1', 'pat1 is easy if you know', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1200, 'ระดับเริ่มต้น', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '3eae8093-14e8-42f8-9eb1-30590fbdfd35', 1, 'fileupload-1684236817860.jpg', '2023-05-16 11:33:37.871', 20, 80),
('50bce8cf-f61e-4626-8751-ad850609f28b', 'JS For Beginner', 'JS is not hard if you know', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1200, 'ระดับเริ่มต้น', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '9144682f-a79c-4fd5-9c6b-9528b948e92c', 1, 'fileupload-1684236818723.jpg', '2023-05-16 11:33:38.727', 20, 50),
('5af5bfcf-f1cc-4c74-aea5-48c6d6fa67e0', 'Easy pat1', 'pat1 is easy if you know', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1200, 'ระดับเริ่มต้น', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '3eae8093-14e8-42f8-9eb1-30590fbdfd35', 1, 'fileupload-1684236402158.jpg', '2023-05-16 11:26:42.177', 20, 120),
('6a22609e-3df2-4569-b477-5f809de16401', 'Easy for every one', 'New course for newbie', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2400, 'ระดับสูง', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '0b53faa0-02ef-492e-9a0c-87a3d0109d95', 1, 'fileupload-1684340747516.jpg', '2023-05-17 16:18:59.380', 30, 50),
('7ac778d0-32bb-4450-802a-53cbd6065d20', 'JS very hard', 'Hard js for big brain', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2400, 'ระดับสูง', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '9144682f-a79c-4fd5-9c6b-9528b948e92c', 1, 'fileupload-1684238395438.jpg', '2023-05-16 11:59:55.507', 20, 100),
('ca7f1b2a-1d28-492f-9bd5-08e9d8387997', 'Course B', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', 3000, 'ระดับกลาง', '1970-01-01 00:00:00.000', '1970-01-01 00:00:00.000', '6d76bfa3-6695-4e76-a4da-ddc8d5d6c1ae', 0, NULL, '2023-05-16 10:10:12.832', 2, 20);

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enroll_date` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`user_id`, `course_id`, `enroll_date`) VALUES
('1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '434ab3b7-007d-45a6-b9bc-eff4db6f9d61', '2023-05-17 14:10:26.946'),
('1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '50bce8cf-f61e-4626-8751-ad850609f28b', '2023-05-17 15:20:56.212'),
('4ffc9d99-f923-40cc-ac44-6ad45353813e', '50bce8cf-f61e-4626-8751-ad850609f28b', '2023-05-17 15:20:34.010');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `cc_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc_ccv` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc_expiry` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `payment_history_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Student','Admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Student',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `password`, `email`, `role`, `address`, `info`, `phone`, `user_image`) VALUES
('1efca52a-60b6-46e6-97ed-b0a6565ccf2f', 'thana', 'korn', '$2b$10$uJAr9jp6qS5BLAS8sp4XT.QqzN393PhKmQj1cBQohZCjvSe04p8Dy', '123@email', 'Student', NULL, NULL, NULL, NULL),
('4ffc9d99-f923-40cc-ac44-6ad45353813e', 'non', 'zaza', '$2b$10$iI8x6htkIzIxQR.wXpdZQ.jX6NQ7lESquqYSuTXRpbJFxgeR3IR/u', 'non@email', 'Student', NULL, NULL, NULL, NULL),
('d54988c8-a6a1-4ff5-a1ff-4020a4b3265d', 'nora', 'nora', '$2b$10$kROGNdDPA2SE4u1HQXKDd.o2TPIqXcqBc6xBwXdgOH/0wORiwYjD.', 'nora@gmail.com', 'Student', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `Comments_course_id_fkey` (`course_id`),
  ADD KEY `Comments_user_id_fkey` (`user_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `Course_category_id_fkey` (`category_id`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`user_id`,`course_id`),
  ADD KEY `Enroll_course_id_fkey` (`course_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`cc_id`),
  ADD KEY `Payment_user_id_fkey` (`user_id`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`payment_history_id`),
  ADD KEY `Payment_history_user_id_fkey` (`user_id`),
  ADD KEY `Payment_history_course_id_fkey` (`course_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `Users_email_key` (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `Comments_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Comments_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `Course_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `Enroll_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Enroll_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `Payment_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD CONSTRAINT `Payment_history_course_id_fkey` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Payment_history_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
