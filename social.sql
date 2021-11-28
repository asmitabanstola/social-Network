-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2021 at 10:12 AM
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
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(1, 'hi', 'asmita_banstola', 'anjana_poudel', '2021-11-24 15:27:32', 'no', 0),
(4, 'I am fine', 'asmita_banstola', 'anjana_poudel', '2021-11-25 13:00:44', 'no', 34),
(5, 'This is post 5', 'asmita_banstola', 'asmita_banstola', '2021-11-25 13:04:00', 'no', 33),
(7, 'comment 1', 'asmita_banstola', 'asmita_banstola', '2021-11-27 12:56:17', 'no', 39);

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `add_friend` tinyint(1) NOT NULL,
  `decline_friend` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `user_to`, `user_from`) VALUES
(1, 'mickey_mouse', 'asmita_banstola'),
(4, 'asmita_banstola', 'puja_pradhan');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `username`, `post_id`) VALUES
(16, 'asmita_banstola', 39),
(17, 'asmita_banstola', 34);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` varchar(60) NOT NULL,
  `user_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`) VALUES
(29, 'post1', 'asmita_banstola', 'none', '2021-11-23 09:09:00', 'no', 'no', 0),
(30, 'post2', 'asmita_banstola', 'none', '2021-11-23 09:09:18', 'no', 'no', 0),
(31, 'post3', 'asmita_banstola', 'none', '2021-11-23 09:12:08', 'no', 'no', 0),
(32, 'post4', 'asmita_banstola', 'none', '2021-11-23 09:12:19', 'no', 'no', 0),
(33, 'post5', 'asmita_banstola', 'none', '2021-11-23 09:12:24', 'no', 'no', 0),
(34, 'Hello !How are you?', 'anjana_poudel', 'none', '2021-11-23 09:44:57', 'no', 'no', 1),
(35, 'post6', 'asmita_banstola', 'none', '2021-11-24 11:47:02', 'no', 'no', 0),
(36, 'post7', 'asmita_banstola', 'none', '2021-11-24 11:48:01', 'no', 'no', 0),
(39, 'post8', 'asmita_banstola', 'none', '2021-11-24 12:01:50', 'no', 'no', 1);

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
(1, 'ruja', 'pradhan', 'ruja_pradhan', 'ruja@gmail.com', 'ruja1', '2021-10-05', 'qwer', 0, 0, 'no', ''),
(2, 'Puja', 'Pradhan', 'puja_pradhan', 'Puja@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-10-12', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ',,'),
(3, 'Ruja', 'Pradhan', 'ruja_pradhan_1', 'R@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-10-12', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ',asmita_banstola,'),
(4, 'Ruja', 'Pradhan', 'ruja_pradhan_1_2', 'P@gmail.com', 'qwerty', '2021-10-12', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(5, 'Mickey', 'Mouse', 'mickey_mouse', 'M@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-10-12', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(6, 'Mickey', 'Mouse', 'mickey_mouse_1', 'Pu@gmail.com', 'a384b6463fc216a5f8ecb6670f86456a', '2021-10-12', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(10, 'Ruja', 'Pradhan', 'ruja_pradhan_1_2_3', 'Ruja.prd@gamil.com', '7adfca2f2aba4cd301a02b9f33ca9037', '2021-10-30', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(11, 'Monica', 'Green', 'monica_green', 'Monica@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-10-30', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(12, 'Suja', 'Amatya', 'suja_amatya', 'Suja@gmail.com', 'e86fdc2283aff4717103f2d44d0610f7', '2021-11-02', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(13, 'Mickey', 'Mouse', 'mickey_mouse_1_2', 'Mickey@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-11-10', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(17, 'Asmita', 'Banstola', 'asmita_banstola', 'Asmi@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-11-23', 'assets/images/profile_pics/defaults/a.jpg', 8, 1, 'no', ',anjana_poudel,monica_green,ruja_pradhan_1,'),
(18, 'Anjana', 'Poudel', 'anjana_poudel', 'Anjana@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-11-23', 'assets/images/profile_pics/defaults/b.png', 1, 1, 'no', ',asmita_banstola,monica_green,');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
