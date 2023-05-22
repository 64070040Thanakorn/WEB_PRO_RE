-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 22, 2023 at 09:41 AM
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
  `category_name` varchar(191) NOT NULL,
  `category_detail` text NOT NULL DEFAULT 'No detail',
  `category_color` varchar(191) NOT NULL DEFAULT '#E99F30'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`category_id`, `category_name`, `category_detail`, `category_color`) VALUES
('311a8428-70bc-4085-87bb-745af7283ddf', 'Java', 'Java เป็นหนึ่งในภาษาโปรแกรมที่ได้รับความนิยมสูงสุด เปิดตัวในปี 1995 และยังคงใช้กันอย่างแพร่หลายในปัจจุบัน Java มีแอปพลิเคชันมากมาย รวมถึงการพัฒนาซอฟต์แวร์ แอปพลิเคชันมือถือ และการพัฒนาระบบขนาดใหญ่ การรู้จัก Java เปิดโอกาสมากมายสำหรับคุณในฐานะนักพัฒนา', '#5484a4'),
('3eae8093-14e8-42f8-9eb1-30590fbdfd35', 'Python', 'Python เป็นภาษาโปรแกรมที่ใช้งานทั่วไป อเนกประสงค์ และมีประสิทธิภาพ เป็นภาษาแรกที่ยอดเยี่ยมเพราะโค้ด Python กระชับและอ่านง่าย สิ่งที่คุณต้องการทำ python สามารถทำได้ Python คือภาษาสำหรับคุณ ตั้งแต่การพัฒนาเว็บไปจนถึงการเรียนรู้ของเครื่องไปจนถึงวิทยาศาสตร์ข้อมูล', '#3672a4'),
('8fccd513-93f7-4056-b83d-ae48feaeddc2', 'HTML & CSS', ' HTML เป็นรากฐานของหน้าเว็บทั้งหมด กำหนดโครงสร้างของหน้าในขณะที่ CSS กำหนดรูปแบบ HTML และ CSS เป็นจุดเริ่มต้นของทุกสิ่งที่คุณต้องรู้เพื่อสร้างเว็บเพจแรกของคุณ! เรียนรู้ทั้งสองอย่างและเริ่มสร้างเว็บไซต์ที่น่าทึ่ง', '#e85325'),
('9144682f-a79c-4fd5-9c6b-9528b948e92c', 'JavaScript', 'ภาษาการเขียนโปรแกรม JavaScript นั้นสนุกและยืดหยุ่น เป็นหนึ่งในเทคโนโลยีหลักของการพัฒนาเว็บและสามารถใช้ได้ทั้งส่วนหน้าและส่วนหลัง', '#FBBF24'),
('93b932c2-11c3-415a-99d8-6df547021da4', 'PHP', 'PHP เป็นภาษาสคริปต์สำหรับวัตถุประสงค์ทั่วไปที่ใช้กันอย่างแพร่หลายในฐานะภาษาฝั่งเซิร์ฟเวอร์สำหรับการสร้างไดนามิกเว็บเพจ แม้ว่าชื่อเสียงของมันจะไม่หลากหลาย แต่ PHP ก็ยังได้รับความนิยมอย่างมากและถูกใช้ในกว่า 75% ของเว็บไซต์ทั้งหมดที่รู้จักภาษาโปรแกรมฝั่งเซิร์ฟเวอร์', '#4287f5'),
('aaa930e4-f2b1-444f-b2ce-bbc949451b95', 'SQL', 'SQL เป็นภาษาการจัดการข้อมูลเชิงสัมพันธ์มาตรฐาน เราอยู่ในโลกที่ขับเคลื่อนด้วยข้อมูล และมีธุรกิจมากมายที่จัดเก็บข้อมูลของตนไว้ในฐานข้อมูลเชิงสัมพันธ์ขนาดใหญ่ สิ่งนี้ทำให้ SQL เป็นทักษะที่ยอดเยี่ยมไม่เพียงแต่สำหรับนักวิทยาศาสตร์ข้อมูลและวิศวกรเท่านั้น แต่สำหรับใครก็ตามที่ต้องการมีความรู้ด้านข้อมูล', '#626270'),
('e939819a-e3e1-4792-8a62-a85a843e606f', 'C++', 'C++ เป็นภาษาที่ได้รับความนิยมอย่างมากสำหรับแอปพลิเคชันที่เน้นประสิทธิภาพซึ่งอาศัยความเร็วและการจัดการหน่วยความจำที่มีประสิทธิภาพ มีการใช้ในอุตสาหกรรมต่างๆ มากมาย เช่น การพัฒนาซอฟต์แวร์และเกม VR วิทยาการหุ่นยนต์ และการคำนวณทางวิทยาศาสตร์', '#045ca4'),
('eaf6fced-a34b-4546-b55c-414ff9943db9', 'C', 'C เป็นภาษาที่มีมานานแล้วและเป็นหนึ่งในภาษาพื้นฐานของวิทยาการคอมพิวเตอร์ ระบบปฏิบัติการส่วนใหญ่ในปัจจุบัน รวมถึง Linux Kernel นั้นใช้งานด้วยรหัส C เวอร์ชันหลักของภาษาโปรแกรม Python มีชื่อว่า CPython เนื่องจากใช้งานโดยใช้ภาษา C ภาษาโปรแกรม C มีอยู่ทั่วไป การเรียนรู้ภาษานี้จะช่วยให้คุณกลายเป็นโปรแกรมเมอร์ที่ดีขึ้นพร้อมสำหรับความท้าทายต่อไปในสาขาวิทยาการคอมพิวเตอร์!', '#549cd3');

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

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`comment_id`, `content`, `user_id`, `course_id`, `comment_date`) VALUES
('0179acc0-b75c-4711-ae81-d279cd855313', 'wow nice', '4ffc9d99-f923-40cc-ac44-6ad45353813e', '1110b7d9-ee68-4482-9b3e-5088062ae55d', '2023-05-17 14:11:31.668'),
('20707fc1-c285-49a5-bf31-0d80dc19a0c0', 'new comment', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '434ab3b7-007d-45a6-b9bc-eff4db6f9d61', '2023-05-17 13:05:55.836'),
('22635b75-2beb-436e-976c-bbd89fd4c329', 'haha', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '1110b7d9-ee68-4482-9b3e-5088062ae55d', '2023-05-21 23:07:39.834'),
('2bfd4ecf-628a-42ae-a3f0-7f7f75df7050', '111', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '434ab3b7-007d-45a6-b9bc-eff4db6f9d61', '2023-05-17 13:17:40.666'),
('30312a26-78ab-4925-abe5-05207543a63f', 'new comment', 'a7a7251e-9727-4991-a1da-47b79def5abe', '7ac778d0-32bb-4450-802a-53cbd6065d20', '2023-05-21 19:34:48.775'),
('50021654-d090-4d92-bcec-c50cf591f23f', 'test', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '50bce8cf-f61e-4626-8751-ad850609f28b', '2023-05-21 15:12:15.156'),
('74c04527-339e-45bc-a142-38791460e8db', 'test', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '434ab3b7-007d-45a6-b9bc-eff4db6f9d61', '2023-05-17 13:17:03.988'),
('823e78dc-4226-44bc-8818-19d08787836b', 'test', 'a7a7251e-9727-4991-a1da-47b79def5abe', '7ac778d0-32bb-4450-802a-53cbd6065d20', '2023-05-21 19:34:19.202'),
('90804822-d906-4ab6-899d-664b7fce1c53', 'new comment', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '7ac778d0-32bb-4450-802a-53cbd6065d20', '2023-05-21 21:02:51.376'),
('96ebdf43-2db0-460c-8692-e5343d6fa3cd', 'nice nice good', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '1110b7d9-ee68-4482-9b3e-5088062ae55d', '2023-05-17 13:30:25.048'),
('aa4674f0-6944-49f8-851a-38b6a750e3ed', 'Wow good course', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '434ab3b7-007d-45a6-b9bc-eff4db6f9d61', '2023-05-17 12:28:18.340'),
('dabb913b-c229-486a-b55c-40cf8285beae', 'idk?', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '434ab3b7-007d-45a6-b9bc-eff4db6f9d61', '2023-05-17 13:17:22.253');

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `course_id` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
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
('0e7d9757-2ce6-4f08-8a9f-bc1c9cd72a86', 'JAVA JAVA JAVA', 'JAVA is easy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1400, 'ระดับกลาง', '2023-06-10 07:27:00.000', '2023-05-15 07:27:00.000', '311a8428-70bc-4085-87bb-745af7283ddf', 1, 'fileupload-1684740450101.jpg', '2023-05-22 07:20:47.252', 10, 40),
('1110b7d9-ee68-4482-9b3e-5088062ae55d', 'Basic HTML', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', 800, 'ระดับกลาง', '1970-01-01 00:00:00.000', '1970-01-01 00:00:00.000', '8fccd513-93f7-4056-b83d-ae48feaeddc2', 0, NULL, '2023-05-16 10:12:12.439', 15, 100),
('2e039da8-6d23-45f1-a2d2-34ed5b0aedf5', 'Basic C++ for game development', 'c++ for beginner', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1200, 'ระดับเริ่มต้น', '2023-05-24 07:16:00.000', '2023-05-22 07:16:00.000', 'e939819a-e3e1-4792-8a62-a85a843e606f', 1, 'fileupload-1684739883391.jpg', '2023-05-22 07:18:03.405', 7, 11),
('3938cf9b-ff4a-48a7-a688-d2a6a4543242', 'PHP very hard', 'dsdsdsdsdssd', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 'ระดับสูง', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '3eae8093-14e8-42f8-9eb1-30590fbdfd35', 1, 'fileupload-1684714386750.jpg', '2023-05-22 00:13:06.833', 20, 100),
('434ab3b7-007d-45a6-b9bc-eff4db6f9d61', 'Easy PHP', 'pat1 is easy if you know', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1200, 'ระดับเริ่มต้น', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '93b932c2-11c3-415a-99d8-6df547021da4', 0, 'fileupload-1684633250422.png', '2023-05-16 11:33:37.871', 20, 80),
('4a4ea784-db6b-4a98-8f83-7275113228bc', 'SQL very hard eiei', 'dsdsdsdsdssd', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 4000, 'ระดับสูง', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', 'aaa930e4-f2b1-444f-b2ce-bbc949451b95', 0, 'fileupload-1684740233942.jpg', '2023-05-22 07:20:52.895', 12, 3),
('50bce8cf-f61e-4626-8751-ad850609f28b', 'JS For Beginner', 'JS is not hard if you know', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1200, 'ระดับเริ่มต้น', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '9144682f-a79c-4fd5-9c6b-9528b948e92c', 1, 'fileupload-1684633392237.jpg', '2023-05-16 11:33:38.727', 20, 2),
('5af5bfcf-f1cc-4c74-aea5-48c6d6fa67e0', 'Easy pat1', 'pat1 is easy if you know', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1200, 'ระดับเริ่มต้น', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '3eae8093-14e8-42f8-9eb1-30590fbdfd35', 1, 'fileupload-1684236402158.jpg', '2023-05-16 11:26:42.177', 20, 1),
('6a22609e-3df2-4569-b477-5f809de16401', 'Easy for every one', 'New course for newbie', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2400, 'ระดับสูง', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '311a8428-70bc-4085-87bb-745af7283ddf', 1, 'fileupload-1684340747516.jpg', '2023-05-17 16:18:59.380', 30, 50),
('7ac778d0-32bb-4450-802a-53cbd6065d20', 'JS very hard', 'Hard js for big brain', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 2400, 'ระดับสูง', '2022-01-05 03:34:23.550', '2022-01-04 03:34:23.550', '9144682f-a79c-4fd5-9c6b-9528b948e92c', 1, 'fileupload-1684633370402.webp', '2023-05-16 11:59:55.507', 20, 100),
('9031fb97-1515-483b-9d1f-ba0dc4eec637', 'C for beginner', 'c for beginner', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 500, 'ระดับสูง', '2023-05-26 07:26:00.000', '2023-05-21 07:26:00.000', 'eaf6fced-a34b-4546-b55c-414ff9943db9', 0, 'fileupload-1684740384963.webp', '2023-05-22 07:20:52.033', 30, 40),
('9364fc70-8513-4d34-b4e5-8300fd379ec6', 'Python all again', 'this is python course', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 200, 'ระดับกลาง', '2023-05-24 07:24:00.000', '2023-05-14 07:24:00.000', '3eae8093-14e8-42f8-9eb1-30590fbdfd35', 0, 'fileupload-1684740312667.webp', '2023-05-22 07:20:52.451', 5, 5),
('a3d5b4cd-6973-4de7-9fd2-997a12d60d34', 'Learning PHP', 'php for every one', 'this course is all abount php Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 12, 'ระดับกลาง', '2023-05-24 19:43:00.000', '2023-05-21 19:43:00.000', '93b932c2-11c3-415a-99d8-6df547021da4', 1, NULL, '2023-05-21 19:43:41.206', 323, 32);

-- --------------------------------------------------------

--
-- Table structure for table `Enroll`
--

CREATE TABLE `Enroll` (
  `user_id` varchar(191) NOT NULL,
  `course_id` varchar(191) NOT NULL,
  `enroll_date` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Enroll`
--

INSERT INTO `Enroll` (`user_id`, `course_id`, `enroll_date`) VALUES
('1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '1110b7d9-ee68-4482-9b3e-5088062ae55d', '2023-05-21 18:58:15.329'),
('1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '434ab3b7-007d-45a6-b9bc-eff4db6f9d61', '2023-05-17 14:10:26.946'),
('1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '50bce8cf-f61e-4626-8751-ad850609f28b', '2023-05-17 15:20:56.212'),
('1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '6a22609e-3df2-4569-b477-5f809de16401', '2023-05-21 18:57:43.375'),
('1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '7ac778d0-32bb-4450-802a-53cbd6065d20', '2023-05-21 07:40:42.894'),
('1efca52a-60b6-46e6-97ed-b0a6565ccf2f', 'a3d5b4cd-6973-4de7-9fd2-997a12d60d34', '2023-05-21 22:20:27.564'),
('4ffc9d99-f923-40cc-ac44-6ad45353813e', '50bce8cf-f61e-4626-8751-ad850609f28b', '2023-05-17 15:20:34.010'),
('4ffc9d99-f923-40cc-ac44-6ad45353813e', '7ac778d0-32bb-4450-802a-53cbd6065d20', '2023-05-21 18:41:24.784'),
('a7a7251e-9727-4991-a1da-47b79def5abe', '7ac778d0-32bb-4450-802a-53cbd6065d20', '2023-05-21 19:33:49.077');

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

--
-- Dumping data for table `Payment`
--

INSERT INTO `Payment` (`cc_id`, `user_id`, `cc_number`, `cc_ccv`, `cc_expiry`, `cc_first_name`, `cc_last_name`, `cc_type`, `address`, `createdAt`) VALUES
('6e838962-a523-47dd-8e1b-3249ef43e163', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '4132323312', '321', '05/23', 'thanakorn', 'sriwannawit', 'delete', 'delete', '2023-05-21 07:40:42.835'),
('d0875ebf-c096-4de4-949c-9ca4d715f0c1', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '123456789011111323232323232', '321', '12/32/12', 'thdsa', 'twawd', 'delete', 'delete', '2023-05-21 18:45:38.278');

-- --------------------------------------------------------

--
-- Table structure for table `Payment_history`
--

CREATE TABLE `Payment_history` (
  `payment_history_id` varchar(191) NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `course_id` varchar(191) NOT NULL,
  `summary` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `email` varchar(191) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Payment_history`
--

INSERT INTO `Payment_history` (`payment_history_id`, `user_id`, `course_id`, `summary`, `createdAt`, `email`, `first_name`, `last_name`, `phone`) VALUES
('1703960f-4055-417f-9070-df0aaccb0d22', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '1110b7d9-ee68-4482-9b3e-5088062ae55d', 856, '2023-05-21 18:58:15.315', '', '', '', ''),
('1f2c2274-cca0-42a6-81fc-4c494d6f9d9d', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '7ac778d0-32bb-4450-802a-53cbd6065d20', 2568, '2023-05-21 08:17:43.280', '', '', '', ''),
('20a2d49e-217b-458f-80a4-6d9ceb3e9b03', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '6a22609e-3df2-4569-b477-5f809de16401', 2568, '2023-05-21 18:57:43.351', '', '', '', ''),
('226a14a9-5b64-4444-b2e0-c6df26b128b4', 'a7a7251e-9727-4991-a1da-47b79def5abe', '7ac778d0-32bb-4450-802a-53cbd6065d20', 2568, '2023-05-21 19:33:49.029', '', '', '', ''),
('567ecc24-bf53-4088-bc79-9e109a76e897', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '6a22609e-3df2-4569-b477-5f809de16401', 2568, '2023-05-21 18:54:56.666', '', '', '', ''),
('b5caf433-a35e-4e47-aebb-22575307c91d', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '1110b7d9-ee68-4482-9b3e-5088062ae55d', 856, '2023-05-21 18:45:38.299', '', '', '', ''),
('ef2475dc-c5fa-4cea-8db9-ca71a3ec6995', '1efca52a-60b6-46e6-97ed-b0a6565ccf2f', '7ac778d0-32bb-4450-802a-53cbd6065d20', 2568, '2023-05-21 07:40:42.868', '', '', '', '');

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
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `first_name`, `last_name`, `password`, `email`, `role`, `address`, `info`, `phone`, `user_image`) VALUES
('1efca52a-60b6-46e6-97ed-b0a6565ccf2f', 'thana', 'korm', '$2b$10$WnKLbH7D9xOm.4swvfH/T.fbfmLxCIBizhG/t9pBaY1LZk70o72ca', '123@gmail.com', 'Student', '', NULL, '', 'fileupload-1684709464198.jpeg'),
('4ffc9d99-f923-40cc-ac44-6ad45353813e', 'non', 'zaza', '$2b$10$iI8x6htkIzIxQR.wXpdZQ.jX6NQ7lESquqYSuTXRpbJFxgeR3IR/u', 'non@gmail.com', 'Admin', NULL, NULL, NULL, NULL),
('a7a7251e-9727-4991-a1da-47b79def5abe', 'new', 'account', '$2b$10$Q7IrlTjs1Y1k/PXzoxjeGeMFHuKnwkrB8QALenozn2Z8yE2TvHFwu', '2033@gmail.com', 'Student', NULL, NULL, NULL, NULL);

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
