-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2019 at 09:19 PM
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
-- Database: `db_perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_anggota`
--

CREATE TABLE `tbl_anggota` (
  `nim` int(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` varchar(15) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `prodi` varchar(50) NOT NULL,
  `thn_masuk` varchar(4) NOT NULL,
  `creation_time` datetime NOT NULL,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_anggota`
--

INSERT INTO `tbl_anggota` (`nim`, `nama`, `tempat_lahir`, `tgl_lahir`, `jk`, `prodi`, `thn_masuk`, `creation_time`, `modification_time`) VALUES
(123, 'test', 'sukabumi', '2019-03-05', 'L', 'Matematika', '2019', '0000-00-00 00:00:00', '2019-03-17 03:26:38'),
(2015804045, 'Wewen I', 'Indramayu II', '2015-11-03', 'L', 'Komputer Akuntansi', '2014', '0000-00-00 00:00:00', '2019-03-17 02:59:58'),
(2015804065, 'Iqbal Rizqi Purnama', 'Ciamis', '1996-05-03', 'L', 'Sistem Informasi', '2015', '0000-00-00 00:00:00', '2019-03-09 10:33:35');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_buku`
--

CREATE TABLE `tbl_buku` (
  `id` int(5) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(150) NOT NULL,
  `thn_terbit` varchar(4) NOT NULL,
  `isbn` varchar(25) NOT NULL,
  `jumlah_buku` int(3) NOT NULL,
  `lokasi` enum('rak1','rak2','rak3') NOT NULL,
  `creation_time` datetime NOT NULL,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_buku`
--

INSERT INTO `tbl_buku` (`id`, `judul`, `pengarang`, `penerbit`, `thn_terbit`, `isbn`, `jumlah_buku`, `lokasi`, `creation_time`, `modification_time`) VALUES
(7, 'matematika', 'kokom', 'Airlangga', '2002', '7502983457a2', 4, 'rak2', '2015-11-28 08:46:15', '2019-03-09 11:13:31'),
(8, 'PHP Dasar', 'Arfandi', 'Lokomedia', '2002', '813957108531', 2, 'rak3', '2015-12-02 02:41:35', '2019-03-09 11:13:31'),
(9, 'Samudra PHP', 'Solihin', 'Hamzah', '2010', 'ajfdklajs98345', 2, 'rak3', '2015-12-02 04:55:13', '2019-03-09 11:13:31'),
(10, 'JQuery Mudah', 'Habib Nas', 'Aerlangga', '2008', '12365480B', 2, 'rak1', '2016-10-24 05:36:43', '2019-03-09 11:13:31'),
(11, 'Buku Baru', 'Atang II', 'Percetaka Atang', '2019', 'isbn=-012121212', 1, 'rak2', '2019-03-17 13:04:19', '2019-03-17 06:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id` int(5) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `nim` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgl_pinjam` varchar(15) NOT NULL,
  `tgl_kembali` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  `ket` varchar(250) NOT NULL,
  `creation_time` datetime NOT NULL,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id`, `judul`, `nim`, `nama`, `tgl_pinjam`, `tgl_kembali`, `status`, `ket`, `creation_time`, `modification_time`) VALUES
(6, 'matematika', 2015804045, 'Wewen Nurwendi', '01-12-2015', '08-12-2015', 'Kembali', '', '0000-00-00 00:00:00', '2019-03-09 11:23:48'),
(7, 'matematika', 2015804045, 'Wewen Nurwendi', '01-11-2015', '08-11-2015', 'Pinjam', '', '0000-00-00 00:00:00', '2019-03-09 11:23:48'),
(8, 'matematika', 2015804045, 'Wewen Nurwendi', '01-12-2015', '15-12-2015', 'Kembali', '', '0000-00-00 00:00:00', '2019-03-09 11:23:48'),
(9, 'PHP Dasar', 2015804065, 'Iqbal Rizqi Purnama', '24-10-2016', '31-10-2016', 'Pinjam', '', '0000-00-00 00:00:00', '2019-03-09 11:23:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(3) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(260) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile_phone` varchar(100) DEFAULT NULL,
  `foto` varchar(50) NOT NULL,
  `level` enum('admin','user') NOT NULL,
  `creation_time` datetime NOT NULL,
  `modification_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `nama`, `username`, `password`, `email`, `mobile_phone`, `foto`, `level`, `creation_time`, `modification_time`) VALUES
(1, 'Iqbal Rizqi Purnama', 'admin', '$2y$10$ePhNZJhNHceen8xMlSTo2OG3fqvZ5xzESyKIk2d3EylYu7P6CV54e', 'iqbalrizqipurnama@gmail.com', '08989898989', 'avatar5.png', '', '2019-03-03 00:00:00', '2019-03-17 06:53:22'),
(2, 'Wewen Nurwendi I', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'wewen.nurwendi@gmail.com', '08989898989', 'avatar5.png', 'user', '2019-03-03 00:00:00', '2019-03-03 18:33:52'),
(5, 'Hai User I', 'hai', '$2y$10$YI3/wsAGgfOn1VUVApjpIOfA6z1DFs3DigDXGbI/BFgBnG6AUkSYK', 'haiuser@gmail.com', '089898978', '', 'user', '0000-00-00 00:00:00', '2019-03-09 10:31:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_anggota`
--
ALTER TABLE `tbl_anggota`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tbl_buku`
--
ALTER TABLE `tbl_buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_buku`
--
ALTER TABLE `tbl_buku`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
