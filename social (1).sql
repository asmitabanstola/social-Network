-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2021 at 06:13 AM
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
(3, 'hello', 17, '', '2021-12-22 08:58:16', 'no', 78);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `user_from` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(17, 'asmita_banstola', 34),
(21, 'asmita_banstola', 41),
(22, 'asmita_banstola', 47),
(23, 'sandhya_rai', 49);

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
(12, 3, 17, 'Hello', '2021-12-15 13:02:12', 'no', 'no', 'no'),
(13, 3, 17, 'Hi', '2021-12-15 13:09:21', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` int(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `date_added`, `user_closed`, `deleted`, `likes`) VALUES
(52, 'It is a far, far better thing that I do, than I have ever done; it is a far, far better rest I go to than I have ever known. - a tale of two cities', 2, '2021-12-14 19:28:39', 'no', 'no', 5),
(53, 'SELECT * FROM posts p left join users added on added.id=p.added_by left join users posted on posted.id=p.user_to left join interest i on i.id=p.interest_id having p.added_by=2', 3, '2021-12-16 19:51:56', 'no', 'no', 5),
(54, 'SELECT * FROM posts p left join users added on added.id=p.added_by left join users posted on posted.id=p.user_to left join interest i on i.id=p.interest_id having p.added_by=2', 3, '2021-12-16 19:51:56', 'no', 'no', 5),
(78, 'hello', 17, '2021-12-14 13:06:51', 'no', 'no', 0);

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
(2, 'Puja', 'Pradhan', 'puja_pradhan', 'Puja@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-10-12', 'assets/images/profile_pics/puja_pradhan1e8ba85f5071b94383c91292d63c3052n.jpeg', 0, 0, 'no', ',,asmita_banstola,'),
(3, 'Ruja', 'Pradhan', 'ruja_pradhan_1', 'R@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-10-12', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ',asmita_banstola,'),
(6, 'Mickey', 'Mouse', 'mickey_mouse_1', 'Pu@gmail.com', '098f6bcd4621d373cade4e832627b4f6', '2021-10-12', 'assets/images/profile_pics/mickey_mouse_1d2e711d4eb9fce6c1194033b8c4e2890n.jpeg', 0, 0, 'no', ','),
(10, 'Ruja', 'Pradhan', 'ruja_pradhan_1_2_3', 'Ruja.prd@gamil.com', '7adfca2f2aba4cd301a02b9f33ca9037', '2021-10-30', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(11, 'Monica', 'Green', 'monica_green', 'Monica@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '2021-10-30', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(12, 'Suja', 'Amatya', 'suja_amatya', 'Suja@gmail.com', 'e86fdc2283aff4717103f2d44d0610f7', '2021-11-02', 'assets/images/profile_pics/suja_amatya6c2544878d1e0071b6faca80074caf1cn.jpeg', 0, 0, 'no', ',asmita_banstola,'),
(17, 'Asmita', 'Banstola', 'asmita_banstola', 'Asmi@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-11-23', 'assets/images/profile_pics/asmita_banstola4303054b312a931d70b8787590e8890dn.jpeg', 24, 2, 'no', ',anjana_poudel,monica_green,ruja_pradhan_1,puja_pradhan,suja_amatya,'),
(18, 'Anjana', 'Poudel', 'anjana_poudel', 'Anjana@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-11-23', 'assets/images/profile_pics/defaults/b.png', 1, 1, 'no', ',asmita_banstola,monica_green,'),
(24, 'Sandhya', 'Rai', 'sandhya_rai', 'Sandhya12@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-02', 'assets/images/profile_pics/defaults/b.png', 1, 1, 'no', ','),
(25, 'Sandhya', 'Rai', 'sandhya_rai_1', 'Sandy@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-06', 'assets/images/profile_pics/defaults/a.jpg', 1, 0, 'no', ','),
(26, 'Riya', 'Aryal', 'riya_aryal', 'Riya@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-22', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(27, 'Jose ', 'Gross', 'jose _gross', 'Jose@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(28, 'America ', 'Valencia', 'america _valencia', 'America@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(29, 'Keegan', ' cabrera', 'keegan_ cabrera', 'Keegan@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(30, 'Rogan ', 'Bell', 'rogan _bell', 'Rogan@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(31, 'Jonah', ' tillman', 'jonah_ tillman', 'Jonah@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(32, 'Sophia ', 'Valenzuela', 'sophia _valenzuela', 'Sophia@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(33, 'Pascale ', 'Peters', 'pascale _peters', 'Peter@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(34, 'Kuame ', 'Cleveland', 'kuame _cleveland', 'Kuame@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(35, 'Emery ', 'Bennett', 'emery _bennett', 'Emery@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(36, 'Nora ', 'Palmer', 'nora _palmer', 'Nora@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(37, 'Aristotle', ' armstrong', 'aristotle_ armstrong', 'Aristotle@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(38, 'Bryar', ' dunn', 'bryar_ dunn', 'Bryar@hmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(39, 'Owen', ' fulton', 'owen_ fulton', 'Owen@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ','),
(40, 'Sebastian ', 'Warner', 'sebastian _warner', 'Sebastian@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(41, 'Sacha', ' lawson', 'sacha_ lawson', 'Sacha@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/a.jpg', 0, 0, 'no', ','),
(42, 'Sade', ' chen', 'sade_ chen', 'Sade@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '2021-12-24', 'assets/images/profile_pics/defaults/b.png', 0, 0, 'no', ',');

--
-- Indexes for dumped tables
--

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
  ADD KEY `user_to` (`user_to`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_ibfk_1` (`user_to`),
  ADD KEY `messages_ibfk_2` (`user_from`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_by` (`added_by`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
  ADD CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`user_to`) REFERENCES `users` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`user_from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `added_by` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
