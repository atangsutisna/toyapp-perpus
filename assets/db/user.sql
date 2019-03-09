-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2019 at 02:31 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sppd_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `mobile_phone` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `profile_picture_id` int(11) DEFAULT NULL,
  `role` enum('administrator','operator') NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `activation_code` varchar(255) NOT NULL,
  `password_token` varchar(255) DEFAULT NULL,
  `password_token_expirytime` datetime DEFAULT NULL,
  `creation_time` datetime NOT NULL,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `username`, `password`, `fullname`, `email`, `mobile_phone`, `phone`, `profile_picture_id`, `role`, `status`, `id_kegiatan`, `activation_code`, `password_token`, `password_token_expirytime`, `creation_time`, `modification_time`) VALUES
('5c72e577db686', 'admin', '$2y$10$.5E1lF.faoG330p0aQ6iy.vvV0ZSElpQMBTAshzIoz.J793wnsJ.C', 'Administrator II', 'admin@admin.com', '08989898989', '', NULL, 'administrator', 'active', -1, '', NULL, NULL, '2019-02-24 19:41:59', '2019-02-24 20:04:56'),
('5c72fb6e1d1e3', 'operator', '$2y$10$T3oNfqFS0OUWYARBChoxce0XxKHZo62mIHorzuoNbGQXLSWWItVxK', 'Operator', 'operator1@operator.com', '08989898989', '', NULL, 'operator', 'active', 6, '', NULL, NULL, '2019-02-24 21:15:42', '2019-02-25 01:30:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
