-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2019 at 04:24 PM
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
-- Table structure for table `tabel_menu`
--

CREATE TABLE `tabel_menu` (
  `id` int(11) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `is_main_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_menu`
--

INSERT INTO `tabel_menu` (`id`, `nama_menu`, `link`, `icon`, `is_main_menu`) VALUES
(1, 'SEKRETARIAT', '#', 'fa fa-university', 0),
(2, 'Nota Dinas', 'nota_dinas', 'fa fa-circle-o text-red', 1),
(3, 'Surat Perintah Tugas', 'spt_pegawai', 'fa fa-circle-o text-red', 1),
(4, 'SPPD', 'sppd_pegawai', 'fa fa-circle-o text-red', 1),
(5, 'SPTJM', 'sptjm_pegawai', 'fa fa-circle-o text-red', 1),
(6, 'Uang Muka', 'uang_muka_pegawai', 'fa fa-circle-o text-red', 1),
(7, 'Rampung', 'rampung_pegawai', 'fa fa-circle-o text-red', 1),
(8, 'DPRD PROVINSI', '#', 'fa fa-university text-yellow', 0),
(9, 'Nota Dinas', 'nota_dinas_dprd', 'fa fa-sun-o text-yellow', 8),
(11, 'Surat Perintah Tugas', 'spt_dprd', 'fa fa-sun-o text-yellow', 8),
(12, 'SPPD', 'sppd_dprd', 'fa fa-sun-o text-yellow', 8),
(13, 'SPTJM', 'sptjm_dprd', 'fa fa-sun-o text-yellow', 8),
(14, 'Uang Muka', 'uang_muka_dprd', 'fa fa-sun-o text-yellow', 8),
(15, 'Rampung', 'rampung_dprd', 'fa fa-sun-o text-yellow', 8),
(16, 'APBD', '#', 'fa fa-calculator', 0),
(17, 'Program', 'program', 'fa fa-bullseye', 16),
(18, 'Kegiatan', 'kegiatan', 'fa fa-bullseye', 16),
(19, 'Rekening Belanja', 'rekening_belanja', 'fa fa-bullseye', 16),
(20, 'Anggaran', 'anggaran', 'fa fa-bullseye', 16),
(22, 'PELAKSANA', '#', 'fa fa-user', 0),
(23, 'LOKASI', '#', 'fa fa-map', 0),
(24, 'ADMINISTRATOR', '#', 'fa fa-lock', 0),
(25, 'Kelola Menu', 'kelola_menu', 'fa fa-lock', 24),
(10000001, 'Provinsi / Kabupaten', 'Tujuan', 'fa fa-users', 23),
(10000003, 'Standar Biaya', 'standar_biaya', 'fa fa-users', 16),
(10000004, 'Pegawai', 'pegawai', 'fa fa-users', 22),
(10000005, 'Anggota DPRD', 'Anggota_dprd', 'fa fa-users', 22),
(10000006, 'Nomenklatur Pelaksanaan', 'nomenklatur', 'fa fa-user', 16),
(10000007, 'Biaya Transportasi', 'biaya_transportasi', 'fa fa-user', 16),
(10000008, 'Jenis Transportasi', 'jenis_transportasi', 'fa fa-user', 16),
(10000009, 'Dasar Anggaran', 'dasar_anggaran', 'fa fa-user', 16),
(10000010, 'Penandatangan', 'penandatangan', 'fa fa-user', 16);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_anggaran`
--

CREATE TABLE `tbl_anggaran` (
  `id_anggaran` int(11) NOT NULL,
  `tahun` text NOT NULL,
  `id_program` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `id_rek_belanja` int(11) NOT NULL,
  `jumlah_anggaran` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_anggaran`
--

INSERT INTO `tbl_anggaran` (`id_anggaran`, `tahun`, `id_program`, `id_kegiatan`, `id_rek_belanja`, `jumlah_anggaran`) VALUES
(1, '2019', 1, 2, 1, 100000000),
(2, '2019', 1, 3, 1, 150000000),
(3, '2019', 1, 3, 2, 200000000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_arrivals_darat`
--

CREATE TABLE `tbl_arrivals_darat` (
  `id_arrivals_darat` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_arrivals_darat`
--

INSERT INTO `tbl_arrivals_darat` (`id_arrivals_darat`, `id_tujuan`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 37),
(37, 38),
(38, 39),
(39, 40),
(40, 41),
(41, 42),
(42, 43),
(43, 44),
(44, 45),
(45, 46),
(46, 47),
(47, 48);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_arrivals_laut`
--

CREATE TABLE `tbl_arrivals_laut` (
  `id_arrivals_laut` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_arrivals_laut`
--

INSERT INTO `tbl_arrivals_laut` (`id_arrivals_laut`, `id_tujuan`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 37),
(37, 38),
(38, 39),
(39, 40),
(40, 41),
(41, 42),
(42, 43),
(43, 44),
(44, 45),
(45, 46),
(46, 47),
(47, 48);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_arrivals_udara`
--

CREATE TABLE `tbl_arrivals_udara` (
  `id_arrivals_udara` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_arrivals_udara`
--

INSERT INTO `tbl_arrivals_udara` (`id_arrivals_udara`, `id_tujuan`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 37),
(37, 38),
(38, 39),
(39, 40),
(40, 41),
(41, 42),
(42, 43),
(43, 44),
(44, 45),
(45, 46),
(46, 47),
(47, 48);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bendahara`
--

CREATE TABLE `tbl_bendahara` (
  `id_bendahara` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bendahara`
--

INSERT INTO `tbl_bendahara` (`id_bendahara`, `id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_biaya_taksi`
--

CREATE TABLE `tbl_biaya_taksi` (
  `id_taksi` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL,
  `tarif_taksi` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_biaya_taksi`
--

INSERT INTO `tbl_biaya_taksi` (`id_taksi`, `id_tujuan`, `tarif_taksi`) VALUES
(1, 1, 120000),
(2, 2, 232000),
(3, 3, 190000),
(4, 4, 75000),
(5, 5, 120000),
(6, 6, 120000),
(7, 7, 95000),
(8, 8, 125000),
(9, 9, 90000),
(10, 10, 145000),
(11, 11, 306000),
(12, 12, 140000),
(13, 13, 170000),
(14, 14, 75000),
(15, 15, 94000),
(16, 16, 148000),
(17, 18, 150000),
(18, 19, 213000),
(19, 20, 80000),
(20, 21, 100000),
(21, 22, 107000),
(22, 23, 90000),
(23, 24, 100000),
(24, 25, 100000),
(25, 26, 200000),
(26, 27, 110000),
(27, 28, 217000),
(28, 30, 145000),
(29, 29, 75000),
(30, 31, 131000),
(31, 33, 210000),
(32, 32, 174000),
(33, 35, 355000),
(34, 34, 145000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_biaya_transportasi`
--

CREATE TABLE `tbl_biaya_transportasi` (
  `id_biaya_transportasi` int(11) NOT NULL,
  `id_transportasi` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL,
  `tarif_bisnis` double DEFAULT NULL,
  `tarif_ekonomi` double DEFAULT NULL,
  `transport_darat` double DEFAULT NULL,
  `id_rek_belanja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_biaya_transportasi`
--

INSERT INTO `tbl_biaya_transportasi` (`id_biaya_transportasi`, `id_transportasi`, `id_tujuan`, `tarif_bisnis`, `tarif_ekonomi`, `transport_darat`, `id_rek_belanja`) VALUES
(1, 1, 36, 5583000, 301600, 0, 1),
(2, 2, 2, 13102000, 7508000, 0, 1),
(3, 2, 12, 6525000, 3701000, 0, 1),
(4, 2, 37, 0, 0, 500000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dasar_anggaran`
--

CREATE TABLE `tbl_dasar_anggaran` (
  `id_dasar_anggaran` int(11) NOT NULL,
  `nick_dasar_anggaran` varchar(30) NOT NULL,
  `dasar_anggaran` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_dasar_anggaran`
--

INSERT INTO `tbl_dasar_anggaran` (`id_dasar_anggaran`, `nick_dasar_anggaran`, `dasar_anggaran`) VALUES
(1, 'DPA-OPD 2019', 'Dokumen Pelaksanaan Anggaran Organisasi Perangkat Daerah (DPA-OPD) Sekretariat DPRD Provinsi ................'),
(2, 'DPPA-OPD 2019', 'Dokumen Pelaksanaan Perubahan Anggaran Organisasi Perangkat Daerah (DPAA-OPD) Sekretariat DPRD Provinsi ................');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departures_darat`
--

CREATE TABLE `tbl_departures_darat` (
  `id_departures_darat` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_departures_darat`
--

INSERT INTO `tbl_departures_darat` (`id_departures_darat`, `id_tujuan`) VALUES
(255, 1),
(256, 2),
(257, 3),
(258, 4),
(259, 5),
(260, 6),
(261, 7),
(262, 8),
(263, 9),
(264, 10),
(265, 11),
(266, 12),
(267, 13),
(268, 14),
(269, 15),
(270, 16),
(271, 17),
(272, 18),
(273, 19),
(274, 20),
(275, 21),
(276, 22),
(277, 23),
(278, 24),
(279, 25),
(280, 26),
(281, 27),
(282, 28),
(283, 29),
(284, 30),
(285, 31),
(286, 32),
(287, 33),
(288, 34),
(289, 35),
(290, 37),
(291, 38),
(292, 39),
(293, 40),
(294, 41),
(295, 42),
(296, 43),
(297, 44),
(298, 45),
(299, 46),
(300, 47),
(301, 48);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departures_laut`
--

CREATE TABLE `tbl_departures_laut` (
  `id_departures_laut` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_departures_laut`
--

INSERT INTO `tbl_departures_laut` (`id_departures_laut`, `id_tujuan`) VALUES
(255, 1),
(256, 2),
(257, 3),
(258, 4),
(259, 5),
(260, 6),
(261, 7),
(262, 8),
(263, 9),
(264, 10),
(265, 11),
(266, 12),
(267, 13),
(268, 14),
(269, 15),
(270, 16),
(271, 17),
(272, 18),
(273, 19),
(274, 20),
(275, 21),
(276, 22),
(277, 23),
(278, 24),
(279, 25),
(280, 26),
(281, 27),
(282, 28),
(283, 29),
(284, 30),
(285, 31),
(286, 32),
(287, 33),
(288, 34),
(289, 35),
(290, 37),
(291, 38),
(292, 39),
(293, 40),
(294, 41),
(295, 42),
(296, 43),
(297, 44),
(298, 45),
(299, 46),
(300, 47),
(301, 48);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departures_udara`
--

CREATE TABLE `tbl_departures_udara` (
  `id_departures_udara` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_departures_udara`
--

INSERT INTO `tbl_departures_udara` (`id_departures_udara`, `id_tujuan`) VALUES
(255, 1),
(256, 2),
(257, 3),
(258, 4),
(259, 5),
(260, 6),
(261, 7),
(262, 8),
(263, 9),
(264, 10),
(265, 11),
(266, 12),
(267, 13),
(268, 14),
(269, 15),
(270, 16),
(271, 17),
(272, 18),
(273, 19),
(274, 20),
(275, 21),
(276, 22),
(277, 23),
(278, 24),
(279, 25),
(280, 26),
(281, 27),
(282, 28),
(283, 29),
(284, 30),
(285, 31),
(286, 32),
(287, 33),
(288, 34),
(289, 35),
(290, 37),
(291, 38),
(292, 39),
(293, 40),
(294, 41),
(295, 42),
(296, 43),
(297, 44),
(298, 45),
(299, 46),
(300, 47),
(301, 48);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detail_nota_dinas`
--

CREATE TABLE `tbl_detail_nota_dinas` (
  `id_detail_nd` int(11) NOT NULL,
  `id_nota_dinas` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_detail_nota_dinas`
--

INSERT INTO `tbl_detail_nota_dinas` (`id_detail_nd`, `id_nota_dinas`, `id`) VALUES
(1161, 2, 2),
(1167, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dprd`
--

CREATE TABLE `tbl_dprd` (
  `id` int(11) NOT NULL,
  `id_kategori_pelaksana` int(11) NOT NULL,
  `nama_dprd` varchar(40) NOT NULL,
  `periode_dprd` text NOT NULL,
  `id_eselon` int(11) NOT NULL,
  `id_jabatan_akd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_dprd`
--

INSERT INTO `tbl_dprd` (`id`, `id_kategori_pelaksana`, `nama_dprd`, `periode_dprd`, `id_eselon`, `id_jabatan_akd`) VALUES
(1, 1, 'Firdaus, S.Sos', '2014/2019', 4, 1),
(2, 1, 'Jony', '2014/2019', 6, 2),
(3, 1, 'sulaiman', '2014/2019', 5, 1),
(4, 1, 'nurhidayati', '2014/2019', 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_eselon`
--

CREATE TABLE `tbl_eselon` (
  `id_eselon` int(11) NOT NULL,
  `eselon` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_eselon`
--

INSERT INTO `tbl_eselon` (`id_eselon`, `eselon`) VALUES
(1, 'Gubernur'),
(2, 'Wakil Gubernur'),
(3, 'Eselon I'),
(4, 'Ketua DPRD'),
(5, 'Wakil Ketua DPRD'),
(6, 'Anggota DPRD'),
(7, 'Eselon II'),
(8, 'Eselon III'),
(9, 'Eselon IV'),
(10, 'Non Eselon Golongan IV'),
(11, 'Non Eselon Golongan III'),
(12, 'Non Eselon Golongan II'),
(13, 'Non Eselon Golongan I');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jabatan`
--

CREATE TABLE `tbl_jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(250) NOT NULL,
  `tipe_jabatan` enum('asn','akd') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jabatan`
--

INSERT INTO `tbl_jabatan` (`id_jabatan`, `nama_jabatan`, `tipe_jabatan`, `created_at`, `updated_at`) VALUES
(34, 'Ketua Komisi I', 'akd', '2019-02-12 23:07:21', '2019-02-12 23:07:21'),
(35, 'Wakil Ketua Komisi I', 'akd', '2019-02-12 23:07:21', '2019-02-12 23:07:21'),
(36, 'Sekretaris Komisi I', 'akd', '2019-02-12 23:07:21', '2019-02-12 23:07:21'),
(37, 'Anggota Komisi I', 'akd', '2019-02-12 23:07:21', '2019-02-12 23:07:21'),
(38, 'Ketua Komisi II', 'akd', '2019-02-12 23:07:21', '2019-02-12 23:07:21'),
(39, 'Wakil Ketua Komisi II', 'akd', '2019-02-12 23:07:21', '2019-02-12 23:07:21'),
(40, 'Sekretaris Komisi II', 'akd', '2019-02-12 23:07:21', '2019-02-12 23:07:21'),
(41, 'Anggota Komisi II', 'akd', '2019-02-12 23:07:21', '2019-02-12 23:07:21'),
(42, 'Sekretaris DPRD Provinsi Riau', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:21'),
(43, 'Kepala Bagian Umum', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:21'),
(44, 'Kepala Bagian Persidangan dan Produk Hukum', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:21'),
(45, 'Kepala Bagian Keuangan dan Perencanaan', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:21'),
(46, 'Kepala Sub Bagian Perencanaan', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:21'),
(47, 'Kepala Sub Bagian Keuangan dan Perjalanan Dinas', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:21'),
(48, 'Kepala Sub Bagian Verifikasi dan Pelaporan', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(49, 'Kepala Sub Bagian Umum dan Protokol', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(50, 'Kepala Sub Bagian RT, Perlengkapan dan PBMD', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(51, 'Kepala Sub Bagian Humas dan Perpustakaan', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(52, 'Kepala Sub Bagian Rapat dan Risalah', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(53, 'Kepala Sub Bagian Produk Hukum', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(54, 'Kepala Sub Bagian Komisi, Fraksi dan Hubungan Anta', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(55, 'Jabatan Fungsional', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(56, 'Staf Sub Bagian Perencanaan', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(57, 'Staf Sub Bagian Keuangan dan Perjalanan Dinas', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(58, 'Staf Sub Bagian Verifikasi dan Pelaporan', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(59, 'Staf Sub Bagian Umum dan Protokol', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(60, 'Staf Sub Bagian RT, Perlengkapan dan PBMD', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(61, 'Staf Sub Bagian Humas dan Perpustakaan', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(62, 'Staf Sub Bagian Rapat dan Risalah', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(63, 'Staf Sub Bagian Produk Hukum', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22'),
(64, 'Staf Sub Bagian Komisi, Fraksi dan Hubungan Anta', 'asn', '0000-00-00 00:00:00', '2019-02-13 05:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jabatan_akd`
--

CREATE TABLE `tbl_jabatan_akd` (
  `id_jabatan_akd` int(11) NOT NULL,
  `jabatan_akd` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jabatan_akd`
--

INSERT INTO `tbl_jabatan_akd` (`id_jabatan_akd`, `jabatan_akd`) VALUES
(1, '-'),
(2, 'Ketua Komisi I'),
(3, 'Wakil Ketua Komisi I'),
(4, 'Sekretaris Komisi I'),
(5, 'Anggota Komisi I'),
(6, 'Ketua Komisi II'),
(7, 'Wakil Ketua Komisi II'),
(8, 'Sekretaris Komisi II'),
(10, 'Anggota Komisi II');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jabatan_asn`
--

CREATE TABLE `tbl_jabatan_asn` (
  `id_jabatan_asn` int(11) NOT NULL,
  `jabatan_asn` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jabatan_asn`
--

INSERT INTO `tbl_jabatan_asn` (`id_jabatan_asn`, `jabatan_asn`) VALUES
(1, 'Sekretaris DPRD Provinsi Riau'),
(2, 'Kepala Bagian Umum'),
(3, 'Kepala Bagian Persidangan dan Produk Hukum'),
(4, 'Kepala Bagian Keuangan dan Perencanaan'),
(5, 'Kepala Sub Bagian Perencanaan'),
(6, 'Kepala Sub Bagian Keuangan dan Perjalanan Dinas'),
(7, 'Kepala Sub Bagian Verifikasi dan Pelaporan'),
(8, 'Kepala Sub Bagian Umum dan Protokol'),
(9, 'Kepala Sub Bagian RT, Perlengkapan dan PBMD'),
(10, 'Kepala Sub Bagian Humas dan Perpustakaan'),
(11, 'Kepala Sub Bagian Rapat dan Risalah'),
(12, 'Kepala Sub Bagian Produk Hukum'),
(13, 'Kepala Sub Bagian Komisi, Fraksi dan Hubungan Anta'),
(14, 'Jabatan Fungsional'),
(15, 'Staf Sub Bagian Perencanaan'),
(16, 'Staf Sub Bagian Keuangan dan Perjalanan Dinas'),
(17, 'Staf Sub Bagian Verifikasi dan Pelaporan'),
(18, 'Staf Sub Bagian Umum dan Protokol'),
(19, 'Staf Sub Bagian RT, Perlengkapan dan PBMD'),
(20, 'Staf Sub Bagian Humas dan Perpustakaan'),
(21, 'Staf Sub Bagian Rapat dan Risalah'),
(22, 'Staf Sub Bagian Produk Hukum'),
(23, 'Staf Sub Bagian Komisi, Fraksi dan Hubungan Anta');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori_pelaksana`
--

CREATE TABLE `tbl_kategori_pelaksana` (
  `id_kategori_pelaksana` int(11) NOT NULL,
  `kategori_pelaksana` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kategori_pelaksana`
--

INSERT INTO `tbl_kategori_pelaksana` (`id_kategori_pelaksana`, `kategori_pelaksana`) VALUES
(1, 'DPRD'),
(2, 'Pegawai'),
(3, 'Tenaga Ahli'),
(4, 'Pegawai Tidak Tetap');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kedudukan`
--

CREATE TABLE `tbl_kedudukan` (
  `id_kedudukan` int(11) NOT NULL,
  `id_tujuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kedudukan`
--

INSERT INTO `tbl_kedudukan` (`id_kedudukan`, `id_tujuan`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 37),
(37, 38),
(38, 39),
(39, 40),
(40, 41),
(41, 42),
(42, 43),
(43, 44),
(44, 45),
(45, 46),
(46, 47),
(47, 48);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kegiatan`
--

CREATE TABLE `tbl_kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `id_program` int(11) NOT NULL,
  `kode_kegiatan` text NOT NULL,
  `kegiatan` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kegiatan`
--

INSERT INTO `tbl_kegiatan` (`id_kegiatan`, `id_program`, `kode_kegiatan`, `kegiatan`) VALUES
(2, 1, '4.00.4.00.02.02.01.018.', 'Rapat-Rapat Koordinasi Dan Konsultasi Ke Luar Daerah'),
(3, 1, '4.00.4.00.02.02.01.022.', 'Penyediaan jasa sosialisasi, informasi, publikasi dan kehumasan SKPD'),
(4, 5, '4.00.02.4.00.02.02.26.001.', 'Pembahasan Rancangan Peraturan Daerah'),
(5, 5, '4.00.02.4.00.02.02.26.002.', 'Hearing/Dialog Dan Koordinasi Dengan Pejabat Pemerintah Daerah Dan Tokoh Masyarakat Tokoh Agama'),
(6, 5, '4.00.02.4.00.02.02.26.004.', 'Rapat-Rapat Paripurna'),
(7, 1, '4.00.02.4.00.02.02.26.005.', 'Kegiatan Reses'),
(8, 5, '4.00.02.4.00.02.02.26.007.', 'Peningkatan Kapasitas Pimpinan Dan Anggota DPRD'),
(9, 5, '4.00.02.4.00.02.02.26.009.', 'Pembahasan LKPJ, Pembahasan Pertanggungjawaban APBD, Pembahasan APBD-P Dan Pembahasan APBD'),
(10, 5, '4.00.02.4.00.02.02.26.011.', 'Penyusunan Ranperda Yang Berasal Dari DPRD Provinsi Riau'),
(11, 5, '4.00.02.4.00.02.02.26.013.', 'Kunjungan Kerja Alat Kelengkapan Dewan'),
(12, 5, '4.00.02.4.00.02.02.26.014.', 'Penyediaan Penggantian Antar Waktu (PAW) Anggota DPRD Provinsi Riau'),
(13, 5, '4.00.02.4.00.02.02.26.015.', 'Kunjungan Luar Negeri Pimpinan Dan Anggota DPRD Prov. Riau'),
(14, 5, '4.00.02.4.00.02.02.26.016.', 'Rapat Koordinasi Dan Komunikasi Pimpinan Dan Sekretaris DPRD Riau'),
(15, 5, '4.00.02.4.00.02.02.26.017.', 'Program Legislasi Daerah Provinsi Riau'),
(16, 5, '4.00.02.4.00.02.02.26.018.', 'Kunjungan Kerja Pimpinan dan Anggota DPRD'),
(18, 5, '4.00.02.4.00.02.02.26.028.', 'Penyelenggaraan Keprotokolan Pimpinan DPRD dan Alat Kelengkapan Dewan'),
(19, 5, '4.00.02.4.00.02.02.26.029.', 'Konsolidasi Hubungan Antar Lembaga');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kuasa_pa`
--

CREATE TABLE `tbl_kuasa_pa` (
  `id_kpa` int(11) NOT NULL,
  `id` int(11) NOT NULL COMMENT 'employee id',
  `id_program` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kuasa_pa`
--

INSERT INTO `tbl_kuasa_pa` (`id_kpa`, `id`, `id_program`, `id_kegiatan`) VALUES
(1, 1, 2, 19),
(2, 2, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nomenklatur`
--

CREATE TABLE `tbl_nomenklatur` (
  `id_nomenklatur` int(11) NOT NULL,
  `nomenklatur` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_nomenklatur`
--

INSERT INTO `tbl_nomenklatur` (`id_nomenklatur`, `nomenklatur`) VALUES
(1, 'Konsultasi Instansi Pusat'),
(2, 'Pimpinan DPRD Ke Luar Daerah'),
(3, 'Pimpinan DPRD ke Dalam Daerah'),
(4, 'Penugasan Sekretaris DPRD');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nota_dinas`
--

CREATE TABLE `tbl_nota_dinas` (
  `id_nota_dinas` int(11) NOT NULL,
  `id_kategori_pelaksana` int(11) NOT NULL,
  `id_dasar_anggaran` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `id_rek_belanja` int(11) NOT NULL,
  `id_nomenklatur` int(11) NOT NULL,
  `no_nota_dinas` varchar(30) NOT NULL,
  `tgl_nota_dinas` date NOT NULL,
  `dari` varchar(100) NOT NULL,
  `kepada` varchar(100) NOT NULL,
  `tembusan` varchar(250) NOT NULL,
  `perihal` text NOT NULL,
  `narasi` text NOT NULL,
  `instansi_tujuan` varchar(100) NOT NULL,
  `id_tujuan` int(11) NOT NULL,
  `tgl_pergi` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `id_ttd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_nota_dinas`
--

INSERT INTO `tbl_nota_dinas` (`id_nota_dinas`, `id_kategori_pelaksana`, `id_dasar_anggaran`, `id_kegiatan`, `id_rek_belanja`, `id_nomenklatur`, `no_nota_dinas`, `tgl_nota_dinas`, `dari`, `kepada`, `tembusan`, `perihal`, `narasi`, `instansi_tujuan`, `id_tujuan`, `tgl_pergi`, `tgl_kembali`, `id_ttd`) VALUES
(2, 2, 1, 19, 1, 1, 'XX/2018/0111', '2019-02-12', 'Wakil Ketua Komisi I', 'Sekretaris Komisi I', 'Sekretaris DPRD Provinsi Riau', 'Perihal dinas', 'Berkenaan dengan hal tersebut diatas, dengan ini kami usulkan Pejabat/Staf dibawah ini untuk melaksanakan perjalanan dinas dalam rangka Orientasi guna menyempurnakan Penyusunan Rencana Strategis (Renstra) Tahun 2019 - 2024 ke Sekretariat DPRD Provinsi DKI Jakarta tanggal 6 s/d 8 September 2018 sebagai  berikut :', 'Dinas Pesawahan', 18, '2019-02-13', '2019-02-14', 1),
(3, 1, 2, 18, 1, 1, 'XX/2018/0113', '2019-02-13', 'Sekretaris Komisi I', 'Sekretaris Komisi I', 'Sekretaris Komisi I', 'perihal', 'narasi', 'INSTANSI TUJUAN II', 18, '2019-02-13', '2019-02-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pangkat_golongan`
--

CREATE TABLE `tbl_pangkat_golongan` (
  `id_pangkat_golongan` int(11) NOT NULL,
  `pangkat_golongan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pangkat_golongan`
--

INSERT INTO `tbl_pangkat_golongan` (`id_pangkat_golongan`, `pangkat_golongan`) VALUES
(1, 'Pembina Utama/ IVe'),
(2, 'Pembina Utama Madya/ IVd'),
(3, 'Pembina Utama Muda/ IVc'),
(4, 'Pembina Tingkat I/ IVb'),
(5, 'Pembina/ IVa'),
(6, 'Penata Tingkat I/ IIId'),
(7, 'Penata/ IIIc'),
(8, 'Penata Muda Tingkat I/ IIIb'),
(9, 'Penata Muda/ IIIa'),
(10, 'Pengatur Tingkat I/ IId'),
(11, 'Pengatur/ IIc'),
(12, 'Pengatur Muda Tingkat I/ IIb'),
(13, 'Pengatur Muda Tingkat I/ IIa'),
(14, 'Juru Tingkat I/ Id'),
(15, 'Juru/ Ic'),
(16, 'Juru Muda Tingkat I/ Ib'),
(17, 'Juru Muda/ Ia');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pegawai`
--

CREATE TABLE `tbl_pegawai` (
  `id` int(11) NOT NULL,
  `id_kategori_pelaksana` int(11) NOT NULL,
  `nip` text NOT NULL,
  `nama` varchar(40) NOT NULL,
  `id_pangkat_golongan` int(11) NOT NULL,
  `id_eselon` int(11) NOT NULL,
  `id_jabatan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pegawai`
--

INSERT INTO `tbl_pegawai` (`id`, `id_kategori_pelaksana`, `nip`, `nama`, `id_pangkat_golongan`, `id_eselon`, `id_jabatan`) VALUES
(1, 1, '1234567890', 'Tasya', 9, 11, 41),
(2, 2, '12345678901', 'Boby', 6, 9, 48),
(3, 2, '122112211221', 'rian', 8, 11, 46),
(4, 2, '323232323232', 'Santi', 5, 10, 43);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penandatangan`
--

CREATE TABLE `tbl_penandatangan` (
  `id_ttd` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `jabatan_kegiatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penandatangan`
--

INSERT INTO `tbl_penandatangan` (`id_ttd`, `id`, `jabatan_kegiatan`) VALUES
(1, 1, 'Bendahara'),
(2, 2, 'Pengguna Anggaran'),
(3, 3, 'Kuasa Pengguna Anggaran');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penganggaran`
--

CREATE TABLE `tbl_penganggaran` (
  `id_pa` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `id_program` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penganggaran`
--

INSERT INTO `tbl_penganggaran` (`id_pa`, `id`, `id_program`, `id_kegiatan`) VALUES
(1, 1, 4, 19);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pptk`
--

CREATE TABLE `tbl_pptk` (
  `id_pptk` int(11) NOT NULL,
  `id` int(11) NOT NULL COMMENT 'employee id',
  `id_program` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pptk`
--

INSERT INTO `tbl_pptk` (`id_pptk`, `id`, `id_program`, `id_kegiatan`) VALUES
(1, 1, 2, 19),
(2, 2, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_program`
--

CREATE TABLE `tbl_program` (
  `id_program` int(11) NOT NULL,
  `kode_program` text NOT NULL,
  `program` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_program`
--

INSERT INTO `tbl_program` (`id_program`, `kode_program`, `program`) VALUES
(1, '4.00.4.00.02.02.01.', 'Program Pelayanan Administrasi Perkantoran'),
(2, '4.00.4.00.02.02.01.', 'Program Pelayanan Administrasi Perkantoran'),
(3, '4.00.4.00.02.02.05.', 'Program Peningkatan Kapasitas Sumber Daya Aparatur'),
(4, '3.00.01.4.00.02.02.15.', 'Program Pengembangan Data/Informasi'),
(5, '4.00.02.4.00.02.02.26.', 'Program Peningkatan Kapasitas Lembaga Perwakilan Rakyat Daerah');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rek_belanja`
--

CREATE TABLE `tbl_rek_belanja` (
  `id_rek_belanja` int(11) NOT NULL,
  `kode_rek_belanja` text NOT NULL,
  `rek_belanja` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rek_belanja`
--

INSERT INTO `tbl_rek_belanja` (`id_rek_belanja`, `kode_rek_belanja`, `rek_belanja`) VALUES
(1, '5.2.2.15.01.', 'Belanja Perjalanan Dinas Dalam Daerah'),
(2, '5.2.2.15.02.', 'Belanja Perjalanan Dinas Luar Daerah'),
(3, '5.2.2.15.03.', 'Belanja Perjalanan Dinas Luar Negeri');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sppd`
--

CREATE TABLE `tbl_sppd` (
  `id_sppd` int(11) NOT NULL,
  `id_spt` int(11) NOT NULL,
  `no_sppd` text NOT NULL,
  `tgl_sppd` date NOT NULL,
  `perihal_sppd` text NOT NULL,
  `id_transportasi` int(11) NOT NULL,
  `id_tempat_pergi` int(11) NOT NULL,
  `id_tujuan` int(11) NOT NULL,
  `tgl_pergi` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `lama_pelaksanaan` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `id_rek_belanja` int(11) NOT NULL,
  `id_nomenklatur` int(11) NOT NULL,
  `id_ttd` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sppd`
--

INSERT INTO `tbl_sppd` (`id_sppd`, `id_spt`, `no_sppd`, `tgl_sppd`, `perihal_sppd`, `id_transportasi`, `id_tempat_pergi`, `id_tujuan`, `tgl_pergi`, `tgl_kembali`, `lama_pelaksanaan`, `id_kegiatan`, `id_rek_belanja`, `id_nomenklatur`, `id_ttd`, `id`) VALUES
(4, 5, '123456', '2019-02-18', 'ini adalah deskripsi tentan perihal', 2, 19, 18, '2019-02-13', '2019-02-14', 0, 19, 2, 1, 1, 2),
(5, 5, '3124578965', '2019-02-23', 'Perihal dinas', 1, 38, 18, '2019-02-13', '2019-02-14', 0, 19, 1, 1, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_spt`
--

CREATE TABLE `tbl_spt` (
  `id_spt` int(11) NOT NULL,
  `id_nota_dinas` int(11) NOT NULL,
  `no_spt` varchar(250) NOT NULL,
  `tgl_spt` date NOT NULL,
  `id_ttd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_spt`
--

INSERT INTO `tbl_spt` (`id_spt`, `id_nota_dinas`, `no_spt`, `tgl_spt`, `id_ttd`) VALUES
(5, 2, '12345678', '2019-02-18', 1),
(7, 3, '56898989898', '2019-02-19', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_standar_biaya`
--

CREATE TABLE `tbl_standar_biaya` (
  `id_standar_biaya` int(11) NOT NULL,
  `id_rek_belanja` int(11) NOT NULL,
  `id_eselon` int(11) NOT NULL,
  `uang_harian` int(11) NOT NULL,
  `uang_penginapan` int(11) NOT NULL,
  `uang_representasi` int(11) NOT NULL,
  `sewa_kendaraan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_standar_biaya`
--

INSERT INTO `tbl_standar_biaya` (`id_standar_biaya`, `id_rek_belanja`, `id_eselon`, `uang_harian`, `uang_penginapan`, `uang_representasi`, `sewa_kendaraan`) VALUES
(1, 1, 11, 1920000, 800000, 500000, 0),
(2, 1, 9, 1920000, 800000, 500000, 0),
(3, 1, 10, 1810000, 750000, 450000, 0),
(4, 2, 11, 1920000, 800000, 500000, 0),
(5, 2, 9, 1920000, 800000, 500000, 0),
(6, 2, 10, 1810000, 750000, 450000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_taksi_kedudukan`
--

CREATE TABLE `tbl_taksi_kedudukan` (
  `id_taksi_kedudukan` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_taksi_kedudukan`
--

INSERT INTO `tbl_taksi_kedudukan` (`id_taksi_kedudukan`, `id_tujuan`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 37),
(37, 38),
(38, 39),
(39, 40),
(40, 41),
(41, 42),
(42, 43),
(43, 44),
(44, 45),
(45, 46),
(46, 47),
(47, 48);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_taksi_lokasi`
--

CREATE TABLE `tbl_taksi_lokasi` (
  `id_taksi_lokasi` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_taksi_lokasi`
--

INSERT INTO `tbl_taksi_lokasi` (`id_taksi_lokasi`, `id_tujuan`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 37),
(37, 38),
(38, 39),
(39, 40),
(40, 41),
(41, 42),
(42, 43),
(43, 44),
(44, 45),
(45, 46),
(46, 47),
(47, 48);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transportasi`
--

CREATE TABLE `tbl_transportasi` (
  `id_transportasi` int(11) NOT NULL,
  `transportasi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transportasi`
--

INSERT INTO `tbl_transportasi` (`id_transportasi`, `transportasi`) VALUES
(1, 'Udara'),
(2, 'Darat'),
(3, 'Laut / Sungai');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tujuan`
--

CREATE TABLE `tbl_tujuan` (
  `id_tujuan` int(11) NOT NULL,
  `id_rek_belanja` int(11) NOT NULL,
  `provinsi_kabupaten` varchar(30) NOT NULL,
  `ibukota` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tujuan`
--

INSERT INTO `tbl_tujuan` (`id_tujuan`, `id_rek_belanja`, `provinsi_kabupaten`, `ibukota`) VALUES
(1, 2, 'Aceh I', 'Banda Aceh'),
(2, 2, 'Sumatera Utara', 'Medan'),
(3, 2, 'Sumatera Barat	', 'Padang'),
(4, 2, 'Riau', 'Pekanbaru'),
(5, 2, '	Kepulauan Riau', 'Tanjung Pinang'),
(6, 2, 'Jambi', 'Jambi'),
(7, 2, 'Bengkulu', 'Bengkulu'),
(8, 2, '	Sumatera Selatan', 'Palembang'),
(9, 2, 'Kepulauan Bangka Belitung', 'Pangkalpinang'),
(10, 2, 'Lampung', '	Banda Lampung'),
(11, 2, 'Banten', 'Serang'),
(12, 2, 'Jawa Barat	', 'Bandung'),
(13, 2, 'DKI Jakarta', 'Jakarta'),
(14, 2, 'Jawa Tengah', 'Semarang'),
(15, 2, 'DI Yogyakarta', 'Yogyakarta'),
(16, 2, '	Jawa Timur', '	Surabaya'),
(17, 2, 'Jawa Timur', 'Surabaya'),
(18, 2, 'Bali', 'Denpasar'),
(19, 2, 'Nusa Tenggara Barat', 'Mataram'),
(20, 2, 'Nusa Tenggara Timur', 'Kupang'),
(21, 2, 'Kalimantan Utara', 'Tanjungselor'),
(22, 2, 'Kalimantan Barat', 'Pontianak'),
(23, 2, 'Kalimantan Tengah', 'Palangkaraya'),
(24, 2, 'Kalimantan Selatan', 'Banjarmasin'),
(25, 2, 'Kalimantan Timur', 'Samarinda	'),
(26, 2, 'Gorontalo', 'Gorontalo'),
(27, 2, 'Sulawesi Utara', 'Manado'),
(28, 2, 'Sulawesi Barat', 'Mamuju'),
(29, 2, 'Sulawesi Tengah', 'Palu'),
(30, 2, 'Sulawesi Selatan', 'Makassar	'),
(31, 2, 'Sulawesi Tenggara', 'Kendari'),
(32, 2, 'Maluku Utara	', 'Sofifi'),
(33, 2, 'Maluku', 'Ambon'),
(34, 2, 'Papua Barat', 'Manokwari'),
(35, 2, 'Papua', 'Jayapura'),
(37, 1, 'Kabupaten Bengkalis', '	Bengkalis'),
(38, 1, 'Kabupaten Indragiri Hilir', 'Tembilahan'),
(39, 1, 'Kabupaten Indragiri Hulu', 'Rengat'),
(40, 1, 'Kabupaten Kampar', 'Bangkinang'),
(41, 1, 'Kabupaten Kepulauan Meranti', 'Selatpanjang'),
(42, 1, '	Kabupaten Kuantan Singingi', 'Teluk Kuantan'),
(43, 1, 'Kabupaten Pelalawan', 'Pangkalan Kerinci'),
(44, 1, 'Kabupaten Rokan Hilir', 'Bagansiapiapi'),
(45, 1, 'Kabupaten Rokan Hulu', 'Pasir Pengaraian'),
(46, 1, 'Kabupaten Siak', 'Siak Sri Indrapura'),
(47, 1, 'Kota Dumai', 'Dumai'),
(48, 1, 'Kota Pekanbaru', 'Pekanbaru');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_uang_muka`
--

CREATE TABLE `tbl_uang_muka` (
  `id_uang_muka` int(11) NOT NULL,
  `tgl_uang_muka` date DEFAULT NULL,
  `id_sppd` int(11) DEFAULT NULL,
  `id_spt` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `id_eselon` int(11) DEFAULT NULL,
  `id_kegiatan` int(11) DEFAULT NULL,
  `id_rek_belanja` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL,
  `tgl_pergi` date DEFAULT NULL,
  `tgl_kembali` int(11) DEFAULT NULL,
  `id_transportasi` int(11) DEFAULT NULL,
  `lama_pelaksanaan` int(11) DEFAULT NULL,
  `uang_harian` double DEFAULT NULL,
  `jumlah_uang_harian` double DEFAULT NULL,
  `penginapan_hari` int(11) DEFAULT NULL,
  `uang_penginapan` double DEFAULT NULL,
  `jumlah_uang_penginapan` double DEFAULT NULL,
  `representasi_hari` int(11) DEFAULT NULL,
  `uang_representasi` double DEFAULT NULL,
  `jumlah_uang_representasi` double DEFAULT NULL,
  `id_departure_udara` int(11) DEFAULT NULL,
  `id_arrivals_udara` int(11) DEFAULT NULL,
  `transportasi_udara` double DEFAULT NULL,
  `id_departure_darat` int(11) DEFAULT NULL,
  `id_arrivals_darat` int(11) DEFAULT NULL,
  `transportasi_darat` double DEFAULT NULL,
  `id_departure_laut` int(11) DEFAULT NULL,
  `id_arrivals_laut` int(11) DEFAULT NULL,
  `transportasi_laut` double DEFAULT NULL,
  `sewa_kendaraan` double DEFAULT NULL,
  `id_taksi_kedudukan` int(11) DEFAULT NULL,
  `tarif_dasar_taksi_kedudukan` double NOT NULL DEFAULT '0',
  `kali_taksi_kedudukan` int(11) DEFAULT NULL,
  `taksi_kedudukan` int(11) DEFAULT NULL,
  `id_taksi_lokasi` int(11) DEFAULT NULL,
  `kali_taksi_lokasi` int(11) DEFAULT NULL,
  `tarif_dasar_taksi_lokasi` double NOT NULL DEFAULT '0',
  `taksi_lokasi` int(11) DEFAULT NULL,
  `total_uang_muka` double DEFAULT NULL,
  `id_pa` int(11) DEFAULT NULL,
  `id_kpa` int(11) DEFAULT NULL,
  `id_pptk` int(11) DEFAULT NULL,
  `id_bendahara` int(11) DEFAULT NULL,
  `status` enum('panjer','lunas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_uang_muka`
--

INSERT INTO `tbl_uang_muka` (`id_uang_muka`, `tgl_uang_muka`, `id_sppd`, `id_spt`, `id`, `id_eselon`, `id_kegiatan`, `id_rek_belanja`, `id_tujuan`, `tgl_pergi`, `tgl_kembali`, `id_transportasi`, `lama_pelaksanaan`, `uang_harian`, `jumlah_uang_harian`, `penginapan_hari`, `uang_penginapan`, `jumlah_uang_penginapan`, `representasi_hari`, `uang_representasi`, `jumlah_uang_representasi`, `id_departure_udara`, `id_arrivals_udara`, `transportasi_udara`, `id_departure_darat`, `id_arrivals_darat`, `transportasi_darat`, `id_departure_laut`, `id_arrivals_laut`, `transportasi_laut`, `sewa_kendaraan`, `id_taksi_kedudukan`, `tarif_dasar_taksi_kedudukan`, `kali_taksi_kedudukan`, `taksi_kedudukan`, `id_taksi_lokasi`, `kali_taksi_lokasi`, `tarif_dasar_taksi_lokasi`, `taksi_lokasi`, `total_uang_muka`, `id_pa`, `id_kpa`, `id_pptk`, `id_bendahara`, `status`) VALUES
(2, '2019-02-25', 5, 5, 3, 11, 19, 1, 18, '2019-02-13', 2019, 1, 1, 1000000, 1000000, 1, 800000, 800000, 1, 500000, 500000, 290, 37, 350000, 292, 36, 620000, 298, 39, 300000, 0, 37, 50000, 1, 50000, 37, 1, 25000, 25000, 3645000, 1, 1, 1, 1, 'lunas'),
(5, '2019-02-25', 4, 5, 2, 9, 19, 1, 18, '2019-02-13', 2019, 2, 1, 1920000, 1920000, 1, 800000, 800000, 1, 500000, 500000, 0, 0, 0, 290, 37, 780000, 0, 0, 0, 150000, 38, 4500, 1, 4500, 48, 1, 5000, 5000, 4159500, 1, 1, 1, 1, 'panjer');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_uang_rampung`
--

CREATE TABLE `tbl_uang_rampung` (
  `id_uang_rampung` int(11) NOT NULL,
  `id_uang_muka` int(11) DEFAULT NULL,
  `tgl_uang_rampung` date DEFAULT NULL,
  `id_sppd` int(11) DEFAULT NULL,
  `id_spt` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `id_eselon` int(11) DEFAULT NULL,
  `id_kegiatan` int(11) DEFAULT NULL,
  `id_rek_belanja` int(11) DEFAULT NULL,
  `id_tujuan` int(11) DEFAULT NULL,
  `tgl_pergi` date DEFAULT NULL,
  `tgl_kembali` int(11) DEFAULT NULL,
  `id_transportasi` int(11) DEFAULT NULL,
  `lama_pelaksanaan` int(11) DEFAULT NULL,
  `uang_harian` double DEFAULT NULL,
  `jumlah_uang_harian` double DEFAULT NULL,
  `penginapan_hari` int(11) DEFAULT NULL,
  `uang_penginapan` double DEFAULT NULL,
  `jumlah_uang_penginapan` double DEFAULT NULL,
  `representasi_hari` int(11) DEFAULT NULL,
  `uang_representasi` double DEFAULT NULL,
  `jumlah_uang_representasi` double DEFAULT NULL,
  `id_departure_udara` int(11) DEFAULT NULL,
  `id_arrivals_udara` int(11) DEFAULT NULL,
  `transportasi_udara` double DEFAULT NULL,
  `id_departure_darat` int(11) DEFAULT NULL,
  `id_arrivals_darat` int(11) DEFAULT NULL,
  `transportasi_darat` double DEFAULT NULL,
  `id_departure_laut` int(11) DEFAULT NULL,
  `id_arrivals_laut` int(11) DEFAULT NULL,
  `transportasi_laut` double DEFAULT NULL,
  `sewa_kendaraan` double DEFAULT NULL,
  `id_taksi_kedudukan` int(11) DEFAULT NULL,
  `tarif_dasar_taksi_kedudukan` double DEFAULT NULL,
  `kali_taksi_kedudukan` int(11) DEFAULT NULL,
  `taksi_kedudukan` int(11) DEFAULT NULL,
  `id_taksi_lokasi` int(11) DEFAULT NULL,
  `tarif_dasar_taksi_lokasi` double DEFAULT NULL,
  `kali_taksi_lokasi` int(11) DEFAULT NULL,
  `taksi_lokasi` int(11) DEFAULT NULL,
  `total_uang_muka` double DEFAULT NULL,
  `total_uang_rampung` double DEFAULT NULL,
  `kurang_lebih` double DEFAULT NULL,
  `id_pa` int(11) DEFAULT NULL,
  `id_kpa` int(11) DEFAULT NULL,
  `id_pptk` int(11) DEFAULT NULL,
  `id_bendahara` int(11) DEFAULT NULL,
  `status` char(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_uang_rampung`
--

INSERT INTO `tbl_uang_rampung` (`id_uang_rampung`, `id_uang_muka`, `tgl_uang_rampung`, `id_sppd`, `id_spt`, `id`, `id_eselon`, `id_kegiatan`, `id_rek_belanja`, `id_tujuan`, `tgl_pergi`, `tgl_kembali`, `id_transportasi`, `lama_pelaksanaan`, `uang_harian`, `jumlah_uang_harian`, `penginapan_hari`, `uang_penginapan`, `jumlah_uang_penginapan`, `representasi_hari`, `uang_representasi`, `jumlah_uang_representasi`, `id_departure_udara`, `id_arrivals_udara`, `transportasi_udara`, `id_departure_darat`, `id_arrivals_darat`, `transportasi_darat`, `id_departure_laut`, `id_arrivals_laut`, `transportasi_laut`, `sewa_kendaraan`, `id_taksi_kedudukan`, `tarif_dasar_taksi_kedudukan`, `kali_taksi_kedudukan`, `taksi_kedudukan`, `id_taksi_lokasi`, `tarif_dasar_taksi_lokasi`, `kali_taksi_lokasi`, `taksi_lokasi`, `total_uang_muka`, `total_uang_rampung`, `kurang_lebih`, `id_pa`, `id_kpa`, `id_pptk`, `id_bendahara`, `status`) VALUES
(12, 2, '2019-02-27', 5, 5, 3, 11, 19, 1, 18, '2019-02-13', 2019, 1, 1, 1000000, 1000000, 1, 800000, 800000, 1, 500000, 500000, 290, 37, 350000, 292, 36, 620000, 298, 39, 300000, 0, 37, 50000, 1, 50000, 37, 50000, 2, 100000, 3645000, 3720000, 75000, 1, 1, 1, 1, NULL);

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
('5c72fb6e1d1e3', 'operator', '$2y$10$slvkNCqSZTkRj0vr9vCWnOS3a/wm.aD8WSUEWP.5w0d5oGzXlpxiy', 'KHAL Operator', 'operator1@operator.com', '08989898989', '', NULL, 'operator', 'active', 19, '', NULL, NULL, '2019-02-24 21:15:42', '2019-02-25 04:58:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_menu`
--
ALTER TABLE `tabel_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_anggaran`
--
ALTER TABLE `tbl_anggaran`
  ADD PRIMARY KEY (`id_anggaran`),
  ADD KEY `id_program` (`id_program`),
  ADD KEY `id_kegiatan` (`id_kegiatan`),
  ADD KEY `id_rek_belanja` (`id_rek_belanja`);

--
-- Indexes for table `tbl_bendahara`
--
ALTER TABLE `tbl_bendahara`
  ADD PRIMARY KEY (`id_bendahara`),
  ADD KEY `pk_bendahara_pegawai` (`id`);

--
-- Indexes for table `tbl_biaya_transportasi`
--
ALTER TABLE `tbl_biaya_transportasi`
  ADD PRIMARY KEY (`id_biaya_transportasi`);

--
-- Indexes for table `tbl_dasar_anggaran`
--
ALTER TABLE `tbl_dasar_anggaran`
  ADD PRIMARY KEY (`id_dasar_anggaran`);

--
-- Indexes for table `tbl_detail_nota_dinas`
--
ALTER TABLE `tbl_detail_nota_dinas`
  ADD PRIMARY KEY (`id_detail_nd`),
  ADD KEY `id_nota_dinas` (`id_nota_dinas`);

--
-- Indexes for table `tbl_dprd`
--
ALTER TABLE `tbl_dprd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori_pelaksana` (`id_kategori_pelaksana`),
  ADD KEY `id_eselon` (`id_eselon`),
  ADD KEY `id_jabatan_akd` (`id_jabatan_akd`);

--
-- Indexes for table `tbl_eselon`
--
ALTER TABLE `tbl_eselon`
  ADD PRIMARY KEY (`id_eselon`);

--
-- Indexes for table `tbl_jabatan`
--
ALTER TABLE `tbl_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `tbl_jabatan_akd`
--
ALTER TABLE `tbl_jabatan_akd`
  ADD PRIMARY KEY (`id_jabatan_akd`);

--
-- Indexes for table `tbl_jabatan_asn`
--
ALTER TABLE `tbl_jabatan_asn`
  ADD PRIMARY KEY (`id_jabatan_asn`);

--
-- Indexes for table `tbl_kategori_pelaksana`
--
ALTER TABLE `tbl_kategori_pelaksana`
  ADD PRIMARY KEY (`id_kategori_pelaksana`);

--
-- Indexes for table `tbl_kedudukan`
--
ALTER TABLE `tbl_kedudukan`
  ADD PRIMARY KEY (`id_kedudukan`);

--
-- Indexes for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`);

--
-- Indexes for table `tbl_kuasa_pa`
--
ALTER TABLE `tbl_kuasa_pa`
  ADD PRIMARY KEY (`id_kpa`),
  ADD KEY `pk_kp_pegawai` (`id`),
  ADD KEY `pk_kpa_program` (`id_program`),
  ADD KEY `pk_kpa_kegiatan` (`id_kegiatan`);

--
-- Indexes for table `tbl_nomenklatur`
--
ALTER TABLE `tbl_nomenklatur`
  ADD PRIMARY KEY (`id_nomenklatur`);

--
-- Indexes for table `tbl_nota_dinas`
--
ALTER TABLE `tbl_nota_dinas`
  ADD PRIMARY KEY (`id_nota_dinas`),
  ADD KEY `id_kategori_pelaksana` (`id_kategori_pelaksana`),
  ADD KEY `id_dasar_anggaran` (`id_dasar_anggaran`),
  ADD KEY `id_kegiatan` (`id_kegiatan`),
  ADD KEY `id_rek_belanja` (`id_rek_belanja`),
  ADD KEY `id_nomenklatur` (`id_nomenklatur`),
  ADD KEY `id_tujuan` (`id_tujuan`),
  ADD KEY `id_ttd` (`id_ttd`);

--
-- Indexes for table `tbl_pangkat_golongan`
--
ALTER TABLE `tbl_pangkat_golongan`
  ADD PRIMARY KEY (`id_pangkat_golongan`);

--
-- Indexes for table `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori_pelaksana` (`id_kategori_pelaksana`),
  ADD KEY `id_pangkat_golongan` (`id_pangkat_golongan`),
  ADD KEY `id_eselon` (`id_eselon`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- Indexes for table `tbl_penandatangan`
--
ALTER TABLE `tbl_penandatangan`
  ADD PRIMARY KEY (`id_ttd`);

--
-- Indexes for table `tbl_penganggaran`
--
ALTER TABLE `tbl_penganggaran`
  ADD PRIMARY KEY (`id_pa`),
  ADD KEY `pk_pa_pegawai` (`id`),
  ADD KEY `pk_pa_program` (`id_program`),
  ADD KEY `pk_pa_kegiatan` (`id_kegiatan`);

--
-- Indexes for table `tbl_pptk`
--
ALTER TABLE `tbl_pptk`
  ADD PRIMARY KEY (`id_pptk`),
  ADD KEY `pk_pptk_pegawai` (`id`),
  ADD KEY `pk_pptk_program` (`id_program`),
  ADD KEY `pk_pptk_kegiatan` (`id_kegiatan`);

--
-- Indexes for table `tbl_program`
--
ALTER TABLE `tbl_program`
  ADD PRIMARY KEY (`id_program`);

--
-- Indexes for table `tbl_rek_belanja`
--
ALTER TABLE `tbl_rek_belanja`
  ADD PRIMARY KEY (`id_rek_belanja`);

--
-- Indexes for table `tbl_sppd`
--
ALTER TABLE `tbl_sppd`
  ADD PRIMARY KEY (`id_sppd`),
  ADD KEY `id_spt` (`id_spt`),
  ADD KEY `id_transportasi` (`id_transportasi`),
  ADD KEY `id_tempat_pergi` (`id_tempat_pergi`),
  ADD KEY `id_tujuan` (`id_tujuan`),
  ADD KEY `id_kegiatan` (`id_kegiatan`),
  ADD KEY `id_rek_belanja` (`id_rek_belanja`),
  ADD KEY `id_nomenklatur` (`id_nomenklatur`),
  ADD KEY `id_ttd` (`id_ttd`);

--
-- Indexes for table `tbl_spt`
--
ALTER TABLE `tbl_spt`
  ADD PRIMARY KEY (`id_spt`),
  ADD KEY `id_detail_nd` (`id_nota_dinas`),
  ADD KEY `id_ttd` (`id_ttd`);

--
-- Indexes for table `tbl_standar_biaya`
--
ALTER TABLE `tbl_standar_biaya`
  ADD PRIMARY KEY (`id_standar_biaya`),
  ADD KEY `id_eselon` (`id_eselon`);

--
-- Indexes for table `tbl_transportasi`
--
ALTER TABLE `tbl_transportasi`
  ADD PRIMARY KEY (`id_transportasi`);

--
-- Indexes for table `tbl_tujuan`
--
ALTER TABLE `tbl_tujuan`
  ADD PRIMARY KEY (`id_tujuan`);

--
-- Indexes for table `tbl_uang_muka`
--
ALTER TABLE `tbl_uang_muka`
  ADD PRIMARY KEY (`id_uang_muka`);

--
-- Indexes for table `tbl_uang_rampung`
--
ALTER TABLE `tbl_uang_rampung`
  ADD PRIMARY KEY (`id_uang_rampung`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabel_menu`
--
ALTER TABLE `tabel_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000011;

--
-- AUTO_INCREMENT for table `tbl_anggaran`
--
ALTER TABLE `tbl_anggaran`
  MODIFY `id_anggaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_bendahara`
--
ALTER TABLE `tbl_bendahara`
  MODIFY `id_bendahara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_biaya_transportasi`
--
ALTER TABLE `tbl_biaya_transportasi`
  MODIFY `id_biaya_transportasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_dasar_anggaran`
--
ALTER TABLE `tbl_dasar_anggaran`
  MODIFY `id_dasar_anggaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_detail_nota_dinas`
--
ALTER TABLE `tbl_detail_nota_dinas`
  MODIFY `id_detail_nd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1168;

--
-- AUTO_INCREMENT for table `tbl_dprd`
--
ALTER TABLE `tbl_dprd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_eselon`
--
ALTER TABLE `tbl_eselon`
  MODIFY `id_eselon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_jabatan`
--
ALTER TABLE `tbl_jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `tbl_jabatan_akd`
--
ALTER TABLE `tbl_jabatan_akd`
  MODIFY `id_jabatan_akd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_jabatan_asn`
--
ALTER TABLE `tbl_jabatan_asn`
  MODIFY `id_jabatan_asn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_kategori_pelaksana`
--
ALTER TABLE `tbl_kategori_pelaksana`
  MODIFY `id_kategori_pelaksana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_kedudukan`
--
ALTER TABLE `tbl_kedudukan`
  MODIFY `id_kedudukan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tbl_kegiatan`
--
ALTER TABLE `tbl_kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_kuasa_pa`
--
ALTER TABLE `tbl_kuasa_pa`
  MODIFY `id_kpa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_nomenklatur`
--
ALTER TABLE `tbl_nomenklatur`
  MODIFY `id_nomenklatur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_nota_dinas`
--
ALTER TABLE `tbl_nota_dinas`
  MODIFY `id_nota_dinas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_pangkat_golongan`
--
ALTER TABLE `tbl_pangkat_golongan`
  MODIFY `id_pangkat_golongan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_penandatangan`
--
ALTER TABLE `tbl_penandatangan`
  MODIFY `id_ttd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_penganggaran`
--
ALTER TABLE `tbl_penganggaran`
  MODIFY `id_pa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_pptk`
--
ALTER TABLE `tbl_pptk`
  MODIFY `id_pptk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_program`
--
ALTER TABLE `tbl_program`
  MODIFY `id_program` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_rek_belanja`
--
ALTER TABLE `tbl_rek_belanja`
  MODIFY `id_rek_belanja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_sppd`
--
ALTER TABLE `tbl_sppd`
  MODIFY `id_sppd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_spt`
--
ALTER TABLE `tbl_spt`
  MODIFY `id_spt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_standar_biaya`
--
ALTER TABLE `tbl_standar_biaya`
  MODIFY `id_standar_biaya` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_transportasi`
--
ALTER TABLE `tbl_transportasi`
  MODIFY `id_transportasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_tujuan`
--
ALTER TABLE `tbl_tujuan`
  MODIFY `id_tujuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tbl_uang_muka`
--
ALTER TABLE `tbl_uang_muka`
  MODIFY `id_uang_muka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_uang_rampung`
--
ALTER TABLE `tbl_uang_rampung`
  MODIFY `id_uang_rampung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_anggaran`
--
ALTER TABLE `tbl_anggaran`
  ADD CONSTRAINT `tbl_anggaran_ibfk_1` FOREIGN KEY (`id_program`) REFERENCES `tbl_program` (`id_program`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_anggaran_ibfk_2` FOREIGN KEY (`id_kegiatan`) REFERENCES `tbl_kegiatan` (`id_kegiatan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_anggaran_ibfk_3` FOREIGN KEY (`id_rek_belanja`) REFERENCES `tbl_rek_belanja` (`id_rek_belanja`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_bendahara`
--
ALTER TABLE `tbl_bendahara`
  ADD CONSTRAINT `pk_bendahara_pegawai` FOREIGN KEY (`id`) REFERENCES `tbl_pegawai` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_detail_nota_dinas`
--
ALTER TABLE `tbl_detail_nota_dinas`
  ADD CONSTRAINT `tbl_detail_nota_dinas_ibfk_1` FOREIGN KEY (`id_nota_dinas`) REFERENCES `tbl_nota_dinas` (`id_nota_dinas`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_dprd`
--
ALTER TABLE `tbl_dprd`
  ADD CONSTRAINT `tbl_dprd_ibfk_1` FOREIGN KEY (`id_kategori_pelaksana`) REFERENCES `tbl_kategori_pelaksana` (`id_kategori_pelaksana`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_dprd_ibfk_2` FOREIGN KEY (`id_eselon`) REFERENCES `tbl_eselon` (`id_eselon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_dprd_ibfk_3` FOREIGN KEY (`id_jabatan_akd`) REFERENCES `tbl_jabatan_akd` (`id_jabatan_akd`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_kuasa_pa`
--
ALTER TABLE `tbl_kuasa_pa`
  ADD CONSTRAINT `pk_kp_pegawai` FOREIGN KEY (`id`) REFERENCES `tbl_pegawai` (`id`),
  ADD CONSTRAINT `pk_kpa_kegiatan` FOREIGN KEY (`id_kegiatan`) REFERENCES `tbl_kegiatan` (`id_kegiatan`),
  ADD CONSTRAINT `pk_kpa_program` FOREIGN KEY (`id_program`) REFERENCES `tbl_program` (`id_program`);

--
-- Constraints for table `tbl_nota_dinas`
--
ALTER TABLE `tbl_nota_dinas`
  ADD CONSTRAINT `tbl_nota_dinas_ibfk_1` FOREIGN KEY (`id_kategori_pelaksana`) REFERENCES `tbl_kategori_pelaksana` (`id_kategori_pelaksana`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_nota_dinas_ibfk_2` FOREIGN KEY (`id_dasar_anggaran`) REFERENCES `tbl_dasar_anggaran` (`id_dasar_anggaran`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_nota_dinas_ibfk_3` FOREIGN KEY (`id_kegiatan`) REFERENCES `tbl_kegiatan` (`id_kegiatan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_nota_dinas_ibfk_4` FOREIGN KEY (`id_rek_belanja`) REFERENCES `tbl_rek_belanja` (`id_rek_belanja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_nota_dinas_ibfk_5` FOREIGN KEY (`id_nomenklatur`) REFERENCES `tbl_nomenklatur` (`id_nomenklatur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_nota_dinas_ibfk_6` FOREIGN KEY (`id_tujuan`) REFERENCES `tbl_tujuan` (`id_tujuan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_nota_dinas_ibfk_7` FOREIGN KEY (`id_ttd`) REFERENCES `tbl_penandatangan` (`id_ttd`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  ADD CONSTRAINT `tbl_pegawai_ibfk_1` FOREIGN KEY (`id_kategori_pelaksana`) REFERENCES `tbl_kategori_pelaksana` (`id_kategori_pelaksana`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_pegawai_ibfk_2` FOREIGN KEY (`id_pangkat_golongan`) REFERENCES `tbl_pangkat_golongan` (`id_pangkat_golongan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_pegawai_ibfk_3` FOREIGN KEY (`id_eselon`) REFERENCES `tbl_eselon` (`id_eselon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_pegawai_ibfk_4` FOREIGN KEY (`id_jabatan`) REFERENCES `tbl_jabatan` (`id_jabatan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_penganggaran`
--
ALTER TABLE `tbl_penganggaran`
  ADD CONSTRAINT `pk_pa_kegiatan` FOREIGN KEY (`id_kegiatan`) REFERENCES `tbl_kegiatan` (`id_kegiatan`),
  ADD CONSTRAINT `pk_pa_pegawai` FOREIGN KEY (`id`) REFERENCES `tbl_pegawai` (`id`),
  ADD CONSTRAINT `pk_pa_program` FOREIGN KEY (`id_program`) REFERENCES `tbl_program` (`id_program`);

--
-- Constraints for table `tbl_pptk`
--
ALTER TABLE `tbl_pptk`
  ADD CONSTRAINT `pk_pptk_kegiatan` FOREIGN KEY (`id_kegiatan`) REFERENCES `tbl_kegiatan` (`id_kegiatan`),
  ADD CONSTRAINT `pk_pptk_pegawai` FOREIGN KEY (`id`) REFERENCES `tbl_pegawai` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `pk_pptk_program` FOREIGN KEY (`id_program`) REFERENCES `tbl_program` (`id_program`);

--
-- Constraints for table `tbl_sppd`
--
ALTER TABLE `tbl_sppd`
  ADD CONSTRAINT `tbl_sppd_ibfk_1` FOREIGN KEY (`id_spt`) REFERENCES `tbl_spt` (`id_spt`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_sppd_ibfk_2` FOREIGN KEY (`id_transportasi`) REFERENCES `tbl_transportasi` (`id_transportasi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_sppd_ibfk_3` FOREIGN KEY (`id_tempat_pergi`) REFERENCES `tbl_kedudukan` (`id_kedudukan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_sppd_ibfk_4` FOREIGN KEY (`id_tujuan`) REFERENCES `tbl_tujuan` (`id_tujuan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_sppd_ibfk_5` FOREIGN KEY (`id_kegiatan`) REFERENCES `tbl_tujuan` (`id_tujuan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_sppd_ibfk_6` FOREIGN KEY (`id_rek_belanja`) REFERENCES `tbl_rek_belanja` (`id_rek_belanja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_sppd_ibfk_7` FOREIGN KEY (`id_nomenklatur`) REFERENCES `tbl_nomenklatur` (`id_nomenklatur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_sppd_ibfk_8` FOREIGN KEY (`id_ttd`) REFERENCES `tbl_penandatangan` (`id_ttd`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_spt`
--
ALTER TABLE `tbl_spt`
  ADD CONSTRAINT `tbl_spt_ibfk_1` FOREIGN KEY (`id_nota_dinas`) REFERENCES `tbl_nota_dinas` (`id_nota_dinas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_spt_ibfk_3` FOREIGN KEY (`id_ttd`) REFERENCES `tbl_penandatangan` (`id_ttd`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_standar_biaya`
--
ALTER TABLE `tbl_standar_biaya`
  ADD CONSTRAINT `tbl_standar_biaya_ibfk_1` FOREIGN KEY (`id_eselon`) REFERENCES `tbl_eselon` (`id_eselon`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
