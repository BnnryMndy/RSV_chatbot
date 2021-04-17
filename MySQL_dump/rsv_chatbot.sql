-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 17, 2021 at 03:32 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rsv_chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities_dictionary`
--

CREATE TABLE `activities_dictionary` (
  `Activity_id` int(11) NOT NULL,
  `Activity_type` varchar(40) NOT NULL,
  `Activity_place` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `awnsers`
--

CREATE TABLE `awnsers` (
  `awnser_id` int(11) NOT NULL,
  `reaction_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `awnser` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `awnsers`
--

INSERT INTO `awnsers` (`awnser_id`, `reaction_id`, `question_id`, `awnser`) VALUES
(1, 1, 1, 'чёрный'),
(2, 6, 1, 'Красный'),
(3, 2, 2, 'красный круг'),
(4, 3, 2, 'красный квадрат'),
(5, 4, 3, 'Чёрный круг'),
(6, 5, 3, 'Чёрный квадрат');

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `reaction_id` int(11) NOT NULL,
  `reaction_type` varchar(255) NOT NULL,
  `reaction_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reactions`
--

INSERT INTO `reactions` (`reaction_id`, `reaction_type`, `reaction_link`) VALUES
(1, 'next_task', '2'),
(2, 'link', 'https://www.google.com/search?source=lnms&tbm=isch&sa=X&q=красный+круг'),
(3, 'link', 'https://www.google.com/search?source=lnms&tbm=isch&sa=X&q=красный+квадрат'),
(4, 'link', 'https://www.google.com/search?source=lnms&tbm=isch&sa=X&q=чёрный+круг'),
(5, 'link', 'https://www.google.com/search?source=lnms&tbm=isch&sa=X&q=чёрный+квадрат'),
(6, 'next_task', '3');

-- --------------------------------------------------------

--
-- Table structure for table `scripts`
--

CREATE TABLE `scripts` (
  `script_id` int(11) NOT NULL,
  `Activity_id` int(11) DEFAULT NULL,
  `Script_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scripts`
--

INSERT INTO `scripts` (`script_id`, `Activity_id`, `Script_name`) VALUES
(4, NULL, 'test_script');

-- --------------------------------------------------------

--
-- Table structure for table `scripts_tasks`
--

CREATE TABLE `scripts_tasks` (
  `question_id` int(11) NOT NULL,
  `script_id` int(11) NOT NULL,
  `question` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scripts_tasks`
--

INSERT INTO `scripts_tasks` (`question_id`, `script_id`, `question`) VALUES
(1, 4, 'Твой любимый цвет '),
(2, 4, 'Твоя любимая фигура?'),
(3, 4, 'Твоя любимая фигура?');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(16) NOT NULL,
  `cookie_info` varchar(255) DEFAULT NULL,
  `Login` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities_dictionary`
--
ALTER TABLE `activities_dictionary`
  ADD PRIMARY KEY (`Activity_id`);

--
-- Indexes for table `awnsers`
--
ALTER TABLE `awnsers`
  ADD PRIMARY KEY (`awnser_id`,`question_id`),
  ADD KEY `awnsers_reactions_FK` (`reaction_id`),
  ADD KEY `awnsers_tasks_FK` (`question_id`);

--
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`reaction_id`);

--
-- Indexes for table `scripts`
--
ALTER TABLE `scripts`
  ADD PRIMARY KEY (`script_id`),
  ADD KEY `Activities_scripts_FK` (`Activity_id`);

--
-- Indexes for table `scripts_tasks`
--
ALTER TABLE `scripts_tasks`
  ADD PRIMARY KEY (`question_id`,`script_id`),
  ADD KEY `tasks_scripts_FK` (`script_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `reaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `scripts`
--
ALTER TABLE `scripts`
  MODIFY `script_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `scripts`
--
ALTER TABLE `scripts`
  ADD CONSTRAINT `Activities_scripts_FK` FOREIGN KEY (`Activity_id`) REFERENCES `activities_dictionary` (`Activity_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
