-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2024 at 03:22 PM
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
-- Database: `poli`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`) VALUES
(1, 1, 3, 'Sakit Hati', 1),
(2, 3, 4, 'Sakit perut', 2),
(5, 9, 9, 'Bau Bawang', 3),
(6, 16, 9, 'Bau bawang akut', 4),
(7, 14, 3, 'flu', 5),
(8, 9, 7, 'Anak sakit', 6),
(9, 9, 9, 'Sakit Hati', 7),
(50, 19, 3, 'jchchc', 8),
(51, 20, 9, 'Ingin Pulang', 9),
(52, 9, 6, 'Sakit Ginjal', 10),
(53, 9, 6, 'Apalah', 11),
(81, 10, 3, 'Saya Sakit Pinggang', 12),
(82, 9, 3, 'Sakit Perut', 13),
(83, 26, 15, 'Jantung terasa sesak', 14),
(84, 27, 15, 'Sakit batuk nyeri', 15),
(85, 28, 15, 'Sakit tenggorokan batuk', 16);

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(1, 2, 1),
(3, 11, 2),
(8, 16, 2),
(9, 17, 4),
(11, 37, 2),
(12, 38, 2),
(13, 39, 4),
(14, 40, 2),
(15, 41, 4),
(17, 43, 1),
(23, 49, 7),
(24, 50, 7),
(25, 51, 8),
(26, 52, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `nip`, `password`, `alamat`, `no_hp`, `id_poli`) VALUES
(4, 'iqbal hasanu doktor', 'iqbal123', '$2y$10$IA1AFeVv/zOGDBCNf58Tcel8ChYzYE7Fbh42MdWvBiB/4kVQyaF16', 'Semarang', '20318301922', 6),
(5, 'Putri', '301239901391', '$2y$10$1iZODJ9Ct1AA3gI25rAl5OgLpJ7QZd1IhSjtrOiwFiireUflbD8ye', 'Timoho', '032013901293', 7),
(56, 'Barok', '0390219301', '$2y$10$fHCGRl4E51yNDYW5vltDo.2XcL7wgamEoOMeGdnPD0gXay.Fs6aBS', 'Jakulo 02', '03203024241', 10),
(59, 'Hafidz', '0231309123', '$2y$10$H8WRuF5kdDveXvMG6oHe3uPr7nDpqYszhgYEI.ncGStccEHChy8La', 'Mawar Selatan', '321329i13219i31', 9),
(60, 'Ridwan', '092931923921', '$2y$10$CJvaRxq0l1DVmXdtRqJCh.v3a7u0aJfM1UiB9p7.SUCoXuv5Q4.u2', 'Tembalang', '08002380128031', 12);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `aktif` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`, `aktif`) VALUES
(3, 4, 'Sabtu', '07:00:00', '10:00:00', 'N'),
(4, 5, 'Kamis', '15:00:00', '18:00:00', 'Y'),
(6, 59, 'Senin', '07:00:00', '10:00:00', 'Y'),
(7, 56, 'Selasa', '00:00:00', '22:00:00', 'Y'),
(9, 60, 'Rabu', '07:00:00', '18:00:00', 'Y'),
(10, 4, 'Rabu', '09:00:00', '12:00:00', 'N'),
(12, 60, 'Senin', '20:00:00', '22:00:00', 'Y'),
(14, 4, 'Senin', '08:00:00', '18:00:00', 'N'),
(15, 4, 'Jumat', '12:07:00', '18:07:00', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(1, 'Paracetamoll', 'Tablet', 10000),
(2, 'Fluoride Toothpaste', 'Botol', 30000),
(4, 'Tetes Mata Lubricant', 'Botol', 50000),
(7, 'Amoxicillin', 'Botol', 75000),
(8, 'Aspirin', 'Tablet', 10000),
(9, 'Ultraflu', 'Tablet', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(1, 'iqbal', 'semarang', '3329081102021300', '08213912930100', '202312-001'),
(3, 'Hasan', 'Lengkong', '3329081102021300', '023810201201', '202312-002'),
(8, 'ilo', 'Tembalng', '3329081102021300', '3213231', '202312-005'),
(9, 'koloo', 'Desa Aneh', '12313213', '999990321312', '202312-006'),
(10, 'Kiara', 'Desa Uruk', '99998', '09999', '202312-007'),
(12, 'Indah', 'Krasak', '77866', '132902131', '202312-008'),
(14, 'Lindiy', 'Brebes', '23213102931', '0210930192312', '202312-010'),
(16, 'Nanang', 'Desa Banjar', '1239120391290', '01923819031', '202312-012'),
(17, 'Beko', 'Desa Konohamaru', '8787878675755', '979787868686', '202312-013'),
(19, 'Julion', 'Sukirro', '23145646', '902813012803', '202312-015'),
(20, 'Sandro', 'Desa Ca', '675555523234343', '097848364836483643', '202401-016'),
(23, 'Linoy', 'Juwweyo', '213921389012893', '09231890381', '202401-017'),
(26, 'Anandapasien', 'Semarang Timoho', '3302909213311', '082193002130', '202401-018'),
(27, 'Iqbaludinus', 'Semarang Tembalang', '223124256789', '098778421412', '202401-014'),
(28, 'putri', 'semarang', '931283908109231', '90238102380', '202401-015');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `id_daftar_poli` int(11) NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(2, 2, '2023-12-28 16:00:00', 'Jangan Makan gorengan', 155000),
(11, 1, '2023-12-30 16:57:00', 'Makan Tahu yang banyak', 153000),
(16, 5, '2023-12-31 15:54:00', 'Mandi', 153000),
(17, 6, '2023-12-27 15:55:42', 'Mandi 10 Kali perhari', 160000),
(37, 7, '2023-12-31 20:32:00', 'Sa', 153000),
(38, 9, '2024-01-04 13:43:00', 'Makan Hati', 153000),
(39, 51, '2024-01-04 13:50:00', 'Ngimpi dek', 160000),
(40, 52, '2024-01-12 09:35:00', 'Makan Ginjalnya', 153000),
(41, 53, '2024-01-04 09:40:00', 'Asljdkajvc', 160000),
(43, 50, '2024-01-05 18:32:00', 'Makan Ginjalnya', 155000),
(49, 81, '2024-01-05 19:51:00', 'Pijat', 157000),
(50, 82, '2024-01-06 13:47:00', 'Makan apel', 157000),
(51, 83, '2024-01-08 12:15:00', 'Jgan Begadang', 160000),
(52, 84, '2024-01-08 16:19:00', 'Jangan Minum dingin setiap malam', 160000);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(6, 'Poli Umum', 'mengatasi demam dan nyeri ringan,'),
(7, 'Poli Gigi', 'pasta gigi dengan kandungan fluoride untuk kesehatan gigi'),
(9, 'Poli Mata', 'Mengatasi Mata kering'),
(10, 'Poli Anak', 'infeksi pada anak anak'),
(12, 'Poli Jantung', 'Pembekuan darah resiko penyakit jantung');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`) VALUES
(8, 'iqbal', 'iqbalhh', '$2y$10$a9P.PK/XA8PVPKZAlOtrFOJjoUz6wv17AYoGl6tVaj5UbdFhiyCL.'),
(9, 'Iqbal Hasanu H', 'admin', '$2y$10$PpmmfNaB5gx/KMF/pTI6uedtyIyQwd1bJlaxm7P4HqWKZAyNJVmPm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_daftar_poli_pasien` (`id_pasien`),
  ADD KEY `fk_daftar_poli_jadwal_periksa` (`id_jadwal`);

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detail_periksa_obat` (`id_obat`),
  ADD KEY `fk_detail_periksa_periksa` (`id_periksa`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwal_periksa_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_periksa_daftar_poli` (`id_daftar_poli`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `fk_daftar_poli_jadwal_periksa` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`),
  ADD CONSTRAINT `fk_daftar_poli_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`);

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `fk_detail_periksa_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `fk_detail_periksa_periksa` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `fk_jadwal_periksa_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `fk_periksa_daftar_poli` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
