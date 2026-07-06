-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2026 at 01:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_brg` varchar(6) NOT NULL,
  `nm_brg` varchar(25) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `hargabeli` int(12) NOT NULL,
  `hargajual` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_brg`, `nm_brg`, `jenis`, `hargabeli`, `hargajual`) VALUES
('11', 'vit', 'Minuman', 500, 1000),
('1212', 'chitato', 'Makanan', 1000, 2000),
('123', 'susu', 'Minuman', 3000, 15000),
('1455', 'alpukat', 'Makanan', 1000, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `isi`
--

CREATE TABLE `isi` (
  `id_nota` varchar(20) NOT NULL,
  `kd_brg` varchar(20) NOT NULL,
  `hb` double DEFAULT NULL,
  `hj` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `isi`
--

INSERT INTO `isi` (`id_nota`, `kd_brg`, `hb`, `hj`, `qty`) VALUES
('NTA-20260503-001', '1212', 1000, 2000, 22),
('NTA-20260510-001', '123', 3000, 15000, 113),
('NTA-20260514-001', '1212', 1000, 2000, 1),
('NTA-20260514-001', '123', 3000, 15000, 1),
('NTA-20260611-001', '11', 500, 1000, 1),
('NTA-20260611-002', '11', 500, 1000, 1),
('NTA-20260611-003', '11', 500, 1000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` varchar(6) NOT NULL,
  `nm_kasir` varchar(25) NOT NULL,
  `jenis` varchar(15) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nm_kasir`, `jenis`, `no_telp`, `agama`, `alamat`, `password`) VALUES
('1122', 'hendry', 'laki', '123324324', 'Islam', 'gedong', 'admin'),
('123', 'hasan', 'Laki-Laki', '0812', 'Islam', 'bogor', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `nota`
--

CREATE TABLE `nota` (
  `id_nota` varchar(20) NOT NULL,
  `tgl_nota` date DEFAULT NULL,
  `id` varchar(6) DEFAULT NULL,
  `id_kasir` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nota`
--

INSERT INTO `nota` (`id_nota`, `tgl_nota`, `id`, `id_kasir`) VALUES
('NTA-20260503-001', '2026-05-03', '0001', '1122'),
('NTA-20260510-001', '2026-05-10', '0001', '1122'),
('NTA-20260514-001', '2026-05-14', '0001', '1122'),
('NTA-20260611-001', '2026-06-11', '0001', '123'),
('NTA-20260611-002', '2026-06-11', '0001', '123'),
('NTA-20260611-003', '2026-06-11', '0001', '123');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` varchar(6) NOT NULL,
  `nmplgn` varchar(25) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `alamat` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nmplgn`, `jenis`, `telepon`, `alamat`) VALUES
('0001', 'saputra', 'Laki-Laki', '083194293719', ' Bogor'),
('A1', 'hendrysaputra', 'Laki - Laki', '08768272863831', 'jl jambudipa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_brg`);

--
-- Indexes for table `isi`
--
ALTER TABLE `isi`
  ADD PRIMARY KEY (`id_nota`,`kd_brg`),
  ADD KEY `kd_brg` (`kd_brg`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id` (`id`),
  ADD KEY `id_kasir` (`id_kasir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `isi`
--
ALTER TABLE `isi`
  ADD CONSTRAINT `isi_ibfk_1` FOREIGN KEY (`id_nota`) REFERENCES `nota` (`id_nota`),
  ADD CONSTRAINT `isi_ibfk_2` FOREIGN KEY (`kd_brg`) REFERENCES `barang` (`kd_brg`);

--
-- Constraints for table `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pelanggan` (`id`),
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
