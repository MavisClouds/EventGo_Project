-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jun 2020 pada 03.23
-- Versi server: 10.1.32-MariaDB
-- Versi PHP: 7.2.5

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
-- Struktur dari tabel `account`
--

CREATE TABLE `account` (
  `idacc` int(100) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `account`
--

INSERT INTO `account` (`idacc`, `email`, `username`, `password`) VALUES
(1, 'admin@administration', 'admin', 'admin'),
(5, 'snowbirds@account.co', 'snowbirds', 'unlocked'),
(6, 'snow@snowbirds.com', 'snow', 'unlocked'),
(9, 'eko@gmail.com', 'eko', 'eko123'),
(10, 'halo@halo.com', 'halo', 'halo'),
(11, 'hola@gmail.com', 'hola', 'hola'),
(12, 'tes@gmail.com', 'tes', 'tes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `event`
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
-- Dumping data untuk tabel `event`
--

INSERT INTO `event` (`idevent`, `idacc`, `nama_event`, `deskripsi_event`, `tanggal_mulai`, `tanggal_selesai`, `kategori`, `lokasi`) VALUES
(2, 6, 'Lomba Mobdev', 'ini adalah lomba mobdev', '2020-04-30', '2020-04-30', '', 'Malang'),
(3, 1, 'Lomba', 'lomba', '2020-04-30', '2020-04-28', 'Academic', 'dirumahaja'),
(4, 1, 'Lomba FIK', 'lomba fasilkom', '2020-09-18', '2020-10-18', 'Culture', 'Upn Veteran Jatim'),
(12, 1, 'Lomba menari', 'ini adalah lomba menari', '2020-05-17', '2020-05-19', 'Computer', 'Surabaya'),
(14, 1, 'aa', 'a', '2020-05-27', '2020-05-28', 'Sport', 'a');

-- --------------------------------------------------------

--
-- Struktur dari tabel `participant`
--

CREATE TABLE `participant` (
  `idacc` int(11) NOT NULL,
  `idevent` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `participant`
--

INSERT INTO `participant` (`idacc`, `idevent`) VALUES
(1, 4),
(1, 12),
(6, 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`idacc`);

--
-- Indeks untuk tabel `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`idevent`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `account`
--
ALTER TABLE `account`
  MODIFY `idacc` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `event`
--
ALTER TABLE `event`
  MODIFY `idevent` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
