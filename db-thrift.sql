-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2022 at 12:15 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-thrift`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_pemesanan`
--

CREATE TABLE `data_pemesanan` (
  `id_pemesanan` int(11) NOT NULL,
  `nama_produk` varchar(30) NOT NULL,
  `ukuran_produk` enum('S','M','L','XL') NOT NULL,
  `harga_produk` int(30) NOT NULL,
  `jumlah_beli` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_pemesanan`
--

INSERT INTO `data_pemesanan` (`id_pemesanan`, `nama_produk`, `ukuran_produk`, `harga_produk`, `jumlah_beli`) VALUES
(1, 'Black T Shirt', 'XL', 80000, 5),
(2, 'Black T Shirt', 'L', 80000, 2),
(3, 'Flannel Shirt', 'M', 120000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `data_produk`
--

CREATE TABLE `data_produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(30) NOT NULL,
  `merek_produk` varchar(30) NOT NULL,
  `ukuran_produk` enum('S','M','L','XL') NOT NULL,
  `harga_produk` int(30) NOT NULL,
  `stok_produk` int(30) NOT NULL,
  `foto` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_produk`
--

INSERT INTO `data_produk` (`id_produk`, `nama_produk`, `merek_produk`, `ukuran_produk`, `harga_produk`, `stok_produk`, `foto`) VALUES
(1, 'Black T Shirt', 'H&M', 'L', 80000, 4, 'black tshirt.jpg'),
(2, 'Flannel Shirt', 'H&M', 'M', 120000, 2, 'flanel h&m.jpg'),
(3, 'Crewneck', 'uniqlo', 'M', 125000, 2, 'crewneck uniqlo.png'),
(4, 'Chino Pants', 'fichino', 'L', 75000, 5, 'Chino FICHINO.png'),
(5, 'Beanie Hat', 'UNKL', 'L', 50000, 2, 'beanie unkl.png'),
(6, 'Kulot Denim', 'Zahra', 'XL', 120000, 2, 'kulot denim zahra.jpg'),
(7, 'Coach Jacket', 'Erigo', 'M', 200000, 1, 'coach jaket erigo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `id_profil` int(11) NOT NULL,
  `nama_profil` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `bidang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profil`
--

INSERT INTO `profil` (`id_profil`, `nama_profil`, `alamat`, `bidang`) VALUES
(1, 'THRIFT ID', 'MAKASSAR', 'THRIFT STORE');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(30) CHARACTER SET latin1 NOT NULL,
  `username` varchar(30) CHARACTER SET latin1 NOT NULL,
  `password` varchar(20) CHARACTER SET latin1 NOT NULL,
  `level` enum('Administrator','Guest') CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `level`) VALUES
(1, 'Benaya Wira', 'admin', '1', 'Administrator'),
(2, 'Guest', 'guest', '1', 'Guest');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_pemesanan`
--
ALTER TABLE `data_pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `nama_produk` (`nama_produk`);

--
-- Indexes for table `data_produk`
--
ALTER TABLE `data_produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD UNIQUE KEY `nama_produk` (`nama_produk`);

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id_profil`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_pemesanan`
--
ALTER TABLE `data_pemesanan`
  ADD CONSTRAINT `data_pemesanan_ibfk_2` FOREIGN KEY (`nama_produk`) REFERENCES `data_produk` (`nama_produk`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
