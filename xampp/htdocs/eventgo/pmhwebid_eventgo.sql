-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 28, 2020 at 04:53 AM
-- Server version: 10.3.22-MariaDB-log-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pmhwebid_eventgo`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `idacc` int(100) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`idacc`, `email`, `username`, `password`) VALUES
(1, 'admin@administration', 'admin', 'admin'),
(5, 'snowbirds@account.co', 'snowbirds', 'unlocked'),
(6, 'snow@snowbirds.com', 'snow', 'unlocked'),
(9, 'eko@gmail.com', 'eko', 'eko123');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `idevent` int(255) NOT NULL,
  `idacc` int(11) NOT NULL,
  `nama_event` varchar(100) NOT NULL,
  `deskripsi_event` text NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `lokasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`idevent`, `idacc`, `nama_event`, `deskripsi_event`, `tanggal_mulai`, `tanggal_selesai`, `kategori`, `lokasi`) VALUES
(2, 6, 'Lomba Mobdev', 'ini adalah lomba mobdev', '2020-04-30', '2020-04-30', '', 'Malang'),
(3, 1, 'Lomba', 'lomba', '2020-04-30', '2020-04-28', 'Academic', 'dirumahaja'),
(4, 1, 'Lomba FIK', 'lomba fasilkom', '2020-09-18', '2020-10-18', 'Culture', 'Upn Veteran Jatim'),
(12, 1, 'Lomba menari', 'ini adalah lomba menari', '2020-05-17', '2020-05-19', 'Computer', 'Surabaya'),
(14, 1, 'aa', 'a', '2020-05-27', '2020-05-28', 'Sport', 'a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`idacc`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`idevent`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `idacc` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `idevent` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
