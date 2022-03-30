-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2022 at 08:23 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(2, 'admin', '0192023a7bbd73250516f069df18b500');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` int(11) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(3, 'hello', 17, '17', '2021-12-22 08:58:16', 'no', 78),
(4, 'Good ', 17, '18', '2021-12-28 05:24:03', 'no', 89),
(8, 'good', 11, '17', '2022-01-30 03:22:03', 'no', 103),
(9, 'nice\r\n', 17, '11', '2022-03-22 02:38:57', 'no', 105);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `user_from` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `user_to`, `user_from`) VALUES
(15, 3, 18),
(16, 17, 32),
(26, 40, 18),
(27, 39, 18),
(28, 27, 18),
(30, 2, 18),
(31, 29, 18),
(32, 38, 18),
(33, 34, 18),
(35, 30, 18),
(40, 2, 12),
(42, 40, 11);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(1, 17, 89),
(2, 11, 84),
(4, 17, 88),
(5, 17, 87),
(9, 11, 103),
(10, 17, 105);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `user_from` int(11) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_to`, `user_from`, `body`, `date`, `opened`, `viewed`, `deleted`) VALUES
(12, 3, 17, 'Hello', '2021-12-15 13:02:12', 'no', 'yes', 'no'),
(13, 3, 17, 'Hi', '2021-12-15 13:09:21', 'no', 'yes', 'no'),
(16, 3, 17, 'hello', '2022-01-23 11:53:38', 'no', 'yes', 'no'),
(23, 18, 17, 'hi', '2022-01-23 12:13:47', 'yes', 'yes', 'no'),
(24, 18, 17, 'new message', '2022-01-23 12:21:42', 'yes', 'yes', 'no'),
(25, 18, 17, 'new message', '2022-01-23 12:24:26', 'yes', 'yes', 'no'),
(26, 18, 17, 'new message', '2022-01-23 12:24:54', 'yes', 'yes', 'no'),
(27, 17, 18, 'hello', '2022-01-25 06:21:40', 'yes', 'yes', 'no'),
(28, 17, 11, 'hello', '2022-01-27 12:04:05', 'yes', 'yes', 'no'),
(29, 11, 17, 'hi', '2022-01-27 12:04:35', 'yes', 'yes', 'no'),
(30, 18, 17, 'hi', '2022-01-30 02:46:50', 'no', 'yes', 'no'),
(31, 17, 12, 'Hi', '2022-01-30 06:26:06', 'no', 'yes', 'no'),
(32, 11, 12, 'hello', '2022-01-30 06:28:21', 'yes', 'yes', 'no'),
(33, 11, 17, 'hello', '2022-03-22 02:39:11', 'yes', 'yes', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `user_from` int(11) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_to`, `user_from`, `message`, `link`, `datetime`, `opened`, `viewed`) VALUES
(2, 18, 17, 'Asmita Banstola liked your post', 'post.php?id=88', '2022-01-25 06:37:24', 'yes', 'yes'),
(5, 18, 17, 'Asmita Banstola liked your post', 'post.php?id=87', '2022-01-25 07:04:17', 'yes', 'yes'),
(7, 17, 18, 'Anjana Poudel commented on your post', 'post.php?id=90', '2022-01-25 07:11:32', 'yes', 'yes'),
(8, 17, 18, 'Anjana Poudel liked your post', 'post.php?id=90', '2022-01-29 09:22:37', 'no', 'yes'),
(9, 17, 11, 'Monica Green liked your post', 'post.php?id=103', '2022-01-30 03:21:57', 'no', 'yes'),
(10, 17, 11, 'Monica Green commented on your post', 'post.php?id=103', '2022-01-30 03:22:03', 'no', 'yes'),
(11, 17, 11, 'Monica Green liked your post', 'post.php?id=103', '2022-01-31 07:51:26', 'no', 'yes'),
(12, 11, 17, 'Asmita Banstola liked your post', 'post.php?id=105', '2022-03-22 02:38:49', 'no', 'yes'),
(13, 11, 17, 'Asmita Banstola commented on your post', 'post.php?id=105', '2022-03-22 02:38:57', 'no', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` int(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `likes` int(11) NOT NULL,
  `user_closed` varchar(5) NOT NULL,
  `deleted` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `date_added`, `likes`, `user_closed`, `deleted`) VALUES
(52, 'It is a far, far better thing that I do, than I have ever done; it is a far, far better rest I go to than I have ever known. - a tale of two cities', 2, '2021-12-14 19:28:39', 0, 'false', 'false'),
(53, 'SELECT * FROM posts p left join users added on added.id=p.added_by left join users posted on posted.id=p.user_to left join interest i on i.id=p.interest_id having p.added_by=2', 3, '2021-12-16 19:51:56', 0, 'false', 'false'),
(54, 'SELECT * FROM posts p left join users added on added.id=p.added_by left join users posted on posted.id=p.user_to left join interest i on i.id=p.interest_id having p.added_by=2', 3, '2021-12-16 19:51:56', 0, 'false', 'false'),
(78, 'hello', 17, '2021-12-14 13:06:51', 0, 'false', 'false'),
(79, 'this is post', 17, '2021-12-27 07:48:10', 0, 'false', 'false'),
(80, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 17, '2021-12-27 13:03:28', 0, 'false', 'false'),
(81, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 17, '2021-12-27 13:03:38', 0, 'false', 'false'),
(82, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 17, '2021-12-27 13:03:43', 0, 'false', 'false'),
(83, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 17, '2021-12-27 13:03:48', 0, 'false', 'false'),
(84, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 17, '2021-12-27 13:03:52', 1, 'false', 'false'),
(85, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 18, '2021-12-27 13:04:36', 0, 'false', 'false'),
(86, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 18, '2021-12-27 13:04:40', 0, 'false', 'false'),
(87, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 18, '2021-12-27 13:04:43', 1, 'false', 'false'),
(88, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 18, '2021-12-27 13:04:47', 1, 'false', 'false'),
(89, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 18, '2021-12-27 13:04:54', 1, 'false', 'false'),
(99, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 11, '2022-01-29 10:38:07', 0, 'false', 'false'),
(103, 'HTML is the standard markup language for Web pages.\r\nWith HTML you can create your own Website.\r\nHTML is easy to learn - You will enjoy it!', 17, '2022-01-29 11:00:41', 1, 'false', 'false'),
(104, 'this is a post', 11, '2022-01-30 02:49:09', 0, 'false', 'false'),
(105, 'The class is at the core of Java. It is the logical construct upon which the entire Java language is \r\nbuilt because it defines the shape and nature of an object.', 11, '2022-03-22 02:38:21', 1, 'false', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `profile_id`, `rating`) VALUES
(1, 11, 29, 1),
(8, 11, 37, 2),
(9, 25, 31, 4),
(10, 26, 35, 4),
(16, 34, 39, 1),
(19, 27, 18, 2),
(20, 31, 33, 4),
(21, 39, 18, 1),
(22, 30, 35, 3),
(26, 18, 33, 5),
(27, 35, 32, 2),
(31, 38, 35, 1),
(36, 17, 36, 2),
(38, 35, 27, 1),
(39, 17, 36, 3),
(40, 26, 37, 2),
(42, 39, 36, 3),
(43, 33, 27, 1),
(47, 27, 30, 1),
(51, 38, 29, 1),
(53, 12, 36, 1),
(55, 28, 27, 5),
(64, 29, 17, 1),
(66, 39, 17, 4),
(68, 11, 28, 1),
(74, 38, 40, 1),
(77, 25, 36, 3),
(81, 34, 36, 2),
(82, 35, 40, 4),
(84, 27, 26, 5),
(89, 30, 34, 1),
(91, 27, 32, 4),
(92, 35, 26, 4),
(93, 38, 36, 3),
(94, 30, 37, 5),
(95, 36, 17, 3),
(100, 11, 18, 3),
(104, 40, 39, 2),
(110, 18, 28, 2),
(111, 32, 37, 1),
(112, 18, 26, 2),
(114, 37, 17, 4),
(118, 18, 31, 4),
(121, 38, 38, 5),
(122, 30, 36, 3),
(127, 11, 25, 5),
(128, 30, 27, 5),
(136, 29, 18, 1),
(137, 25, 18, 2),
(139, 25, 40, 2),
(141, 35, 30, 5),
(142, 30, 17, 5),
(144, 39, 38, 4),
(145, 31, 30, 4),
(147, 39, 11, 1),
(149, 29, 27, 3),
(150, 31, 31, 2),
(152, 39, 31, 4),
(155, 26, 12, 1),
(159, 39, 12, 1),
(160, 32, 17, 5),
(161, 11, 12, 5),
(162, 38, 25, 5),
(163, 40, 34, 3),
(166, 31, 29, 3),
(167, 38, 38, 4),
(168, 11, 36, 2),
(172, 29, 32, 2),
(174, 33, 39, 1),
(175, 31, 31, 1),
(176, 26, 27, 1),
(177, 18, 37, 2),
(181, 26, 12, 5),
(182, 39, 40, 4),
(184, 34, 25, 1),
(187, 32, 29, 1),
(188, 34, 26, 1),
(189, 40, 39, 3),
(191, 29, 35, 3),
(192, 30, 17, 5),
(193, 30, 37, 2),
(195, 37, 29, 1),
(196, 12, 40, 4),
(198, 31, 38, 3),
(199, 32, 29, 5),
(200, 40, 32, 2),
(201, 33, 39, 4),
(203, 33, 32, 2),
(207, 25, 36, 4),
(209, 33, 25, 2),
(210, 17, 27, 2),
(212, 35, 11, 4),
(213, 34, 27, 1),
(217, 27, 12, 5),
(220, 26, 26, 5),
(223, 31, 27, 4),
(224, 33, 40, 5),
(225, 33, 38, 2),
(227, 40, 40, 3),
(230, 26, 39, 4),
(233, 29, 39, 4),
(234, 36, 25, 3),
(235, 31, 26, 1),
(236, 29, 40, 4),
(238, 36, 40, 5),
(241, 29, 28, 2),
(242, 32, 26, 1),
(243, 27, 18, 1),
(245, 33, 33, 1),
(246, 12, 35, 3),
(249, 28, 33, 2),
(250, 33, 18, 4),
(251, 12, 11, 4),
(255, 31, 33, 4),
(256, 35, 39, 3),
(257, 26, 35, 5),
(261, 40, 39, 3),
(263, 11, 28, 5),
(264, 34, 27, 4),
(265, 11, 32, 2),
(266, 17, 30, 2),
(270, 27, 37, 1),
(271, 27, 17, 2),
(273, 35, 12, 2),
(277, 18, 36, 3),
(279, 28, 33, 1),
(285, 31, 38, 2),
(286, 27, 18, 4),
(287, 12, 27, 4),
(292, 18, 35, 4),
(294, 12, 40, 5),
(298, 30, 29, 1),
(300, 28, 39, 4),
(301, 32, 33, 2),
(304, 32, 29, 4),
(310, 39, 38, 1),
(311, 33, 11, 3),
(312, 30, 17, 4),
(316, 31, 33, 3),
(318, 38, 39, 1),
(321, 11, 30, 1),
(322, 31, 30, 3),
(327, 39, 29, 5),
(328, 37, 38, 3),
(331, 36, 26, 3),
(332, 36, 11, 4),
(333, 26, 17, 2),
(335, 30, 35, 1),
(336, 35, 11, 3),
(343, 25, 40, 2),
(346, 27, 36, 4),
(348, 30, 17, 2),
(349, 39, 18, 3),
(350, 35, 18, 4),
(351, 27, 11, 4),
(352, 11, 12, 3),
(355, 29, 31, 2),
(357, 33, 27, 5),
(358, 38, 31, 4),
(360, 39, 35, 4),
(363, 40, 12, 3),
(364, 36, 26, 2),
(365, 27, 36, 5),
(368, 36, 32, 3),
(371, 18, 11, 5),
(376, 32, 33, 4),
(378, 27, 35, 2),
(381, 28, 11, 2),
(388, 32, 17, 5),
(392, 26, 25, 3),
(398, 33, 31, 5),
(403, 11, 39, 4),
(405, 37, 27, 1),
(406, 12, 39, 5),
(414, 29, 25, 5),
(416, 39, 26, 5),
(417, 28, 40, 5),
(419, 33, 18, 5),
(421, 12, 38, 3),
(422, 35, 30, 2),
(426, 39, 11, 5),
(427, 37, 36, 5),
(428, 30, 35, 1),
(429, 38, 27, 5),
(434, 31, 30, 3),
(435, 27, 36, 1),
(437, 35, 29, 1),
(438, 25, 18, 3),
(440, 25, 29, 4),
(444, 17, 27, 4),
(446, 29, 38, 1),
(447, 29, 12, 4),
(454, 35, 17, 5),
(456, 29, 27, 3),
(458, 25, 11, 4),
(460, 27, 38, 5),
(463, 30, 27, 3),
(467, 40, 27, 5),
(468, 26, 31, 2),
(472, 35, 17, 1),
(476, 37, 12, 3),
(477, 18, 35, 4),
(478, 28, 27, 1),
(479, 36, 26, 3),
(480, 36, 31, 4),
(482, 36, 38, 1),
(484, 35, 11, 5),
(485, 30, 38, 2),
(492, 25, 37, 2),
(498, 11, 12, 4),
(499, 27, 26, 1),
(500, 27, 2, 3),
(501, 3, 2, 3),
(502, 17, 3, 4),
(504, 17, 3, 4),
(506, 37, 2, 3),
(507, 2, 18, 5),
(508, 2, 18, 5),
(509, 44, 11, 3),
(510, 45, 3, 4),
(511, 46, 27, 3),
(512, 47, 27, 3),
(513, 17, 47, 5);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `reported_by` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `post_of` int(11) NOT NULL,
  `report_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `reported_by`, `post_id`, `post_of`, `report_category`) VALUES
(4, 47, 105, 11, 'Inappropriate');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(2, 'Puja', 'Pradhan', 'puja_pradhan', 'Puja@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-10-12', 'assets/images/profile_pics/puja_pradhan1e8ba85f5071b94383c91292d63c3052n.jpeg', 1, 0, 'no', ',asmita_banstola,'),
(3, 'Ruja', 'Pradhan', 'ruja_pradhan_1', 'Ruja@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-10-12', 'assets/images/profile_pics/defaults/a.jpg', 3, 0, 'no', ',asmita_banstola,'),
(11, 'Monica', 'Green', 'monica_green', 'Monica@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-10-30', 'assets/images/profile_pics/defaults/b.png', 3, 1, 'no', ',asmita_banstola,suja_amatya,ram_bahadur,'),
(12, 'Suja', 'Amatya', 'suja_amatya', 'Suja@gmail.com', 'e86fdc2283aff4717103f2d44d0610f7', '2021-11-02', 'assets/images/profile_pics/suja_amatya6c2544878d1e0071b6faca80074caf1cn.jpeg', 0, 0, 'no', ',asmita_banstola,monica_green,'),
(17, 'Asmita', 'Banstola', 'asmita_banstola', 'Asmi@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-11-23', 'assets/images/profile_pics/asmita_banstola4303054b312a931d70b8787590e8890dn.jpeg', 9, 4, 'no', ',anjana_poudel,ruja_pradhan_1,puja_pradhan,suja_amatya,monica_green,'),
(18, 'Anjanaa', 'Poudel', 'anjana_poudel', 'Anjana@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-11-23', 'assets/images/profile_pics/anjana_poudel8e4e0d8b85ba11409b45041f502faf11n.jpeg', 4, 3, 'no', ',asmita_banstola,'),
(25, 'Sandhya', 'Rai', 'sandhya_rai_1', 'Sandy@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-06', 'assets/images/profile_pics/defaults/a.jpg', 1, 0, 'no', ','),
(26, 'Riya', 'Aryal', 'riya_aryal', 'Riya@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-22', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(27, 'Jose ', 'Gross', 'jose_gross', 'Jose@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(28, 'America ', 'Valencia', 'america_valencia', 'America@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(29, 'Keegan', ' cabrera', 'keegan_cabrera', 'Keegan@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(30, 'Rogan ', 'Bell', 'rogan_bell', 'Rogan@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(31, 'Jonah', ' tillman', 'jonah_tillman', 'Jonah@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(32, 'Sophia ', 'Valenzuela', 'sophia_valenzuela', 'Sophia@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(33, 'Pascale ', 'Peters', 'pascale_peters', 'Peter@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(34, 'Kuame ', 'Cleveland', 'kuame_cleveland', 'Kuame@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(35, 'Emery ', 'Bennett', 'emery_bennett', 'Emery@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(36, 'Nora ', 'Palmer', 'nora_palmer', 'Nora@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(37, 'Aristotle', ' armstrong', 'aristotle_armstrong', 'Aristotle@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(38, 'Bryar', ' dunn', 'bryar_dunn', 'Bryar@hmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(39, 'Owen', ' fulton', 'owen_fulton', 'Owen@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(40, 'Sebastian ', 'Warner', 'sebastian_warner', 'Sebastian@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(41, 'Sacha', ' lawson', 'sacha_ lawson', 'Sacha@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(42, 'Sade', ' chen', 'sade_ chen', 'Sade@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(43, 'Alex', 'Rai', 'alex_rai', 'Alex@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2022-01-03', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(44, 'Suhana', 'Kc', 'suhana_kc', 'Suhana@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2022-01-26', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(45, 'Arohi', 'Adhikari', 'arohi_adhikari', 'Arohi@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2022-01-28', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(46, 'Sanjay', 'Singh', 'sanjay_singh', 'Sanjay@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2022-01-29', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(47, 'Ram', 'Bahadur', 'ram_bahadur', 'Ram@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2022-01-30', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ',monica_green,');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `posted_by` (`posted_by`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_from` (`user_from`),
  ADD KEY `friend_requests_ibfk_2` (`user_to`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_ibfk_1` (`user_to`),
  ADD KEY `messages_ibfk_2` (`user_from`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_to` (`user_to`),
  ADD KEY `user_from` (`user_from`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_id` (`profile_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_ibfk_1` (`post_id`),
  ADD KEY `reported_by` (`reported_by`),
  ADD KEY `post_of` (`post_of`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=514;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`posted_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`user_from`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`user_to`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`user_from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `added_by` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`reported_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `reports_ibfk_3` FOREIGN KEY (`post_of`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
