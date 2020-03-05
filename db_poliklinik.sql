-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05 Mar 2020 pada 16.06
-- Versi Server: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_poliklinik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mahasiswa`
--

CREATE TABLE `tbl_mahasiswa` (
  `NIM` char(12) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `prodi` varchar(3) NOT NULL,
  `jurusan` varchar(20) NOT NULL,
  `no_hp` char(15) NOT NULL,
  `no_hp_ortu` char(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `alamat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_mahasiswa`
--

INSERT INTO `tbl_mahasiswa` (`NIM`, `nama_lengkap`, `kelas`, `prodi`, `jurusan`, `no_hp`, `no_hp_ortu`, `email`, `alamat`) VALUES
('1641160016', 'Yeremia Tito Pratama', '4E', 'JTD', 'Teknik Elektro', '081327118041', '081327118041', 'yeremiatito1@gmail.com', 12213);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_riwayat`
--

CREATE TABLE `tbl_riwayat` (
  `id_riwayat` int(11) NOT NULL,
  `NIM` varchar(20) NOT NULL,
  `gejala` varchar(255) NOT NULL,
  `obat` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `kondisi` varchar(255) NOT NULL,
  `jam` varchar(10) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_riwayat`
--

INSERT INTO `tbl_riwayat` (`id_riwayat`, `NIM`, `gejala`, `obat`, `note`, `kondisi`, `jam`, `tanggal`) VALUES
(1, '1641160016', 'tes', 'tes', 'tes', 'teghjk', '1-4', '2020-03-17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('admin_poliklinik','admin_prodi') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`) VALUES
(1, 'poliklinik', '21232f297a57a5a743894a0e4a801fc3', 'admin_poliklinik'),
(2, 'prodi', '21232f297a57a5a743894a0e4a801fc3', 'admin_prodi');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_riwayat`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_riwayat` (
`nama_lengkap` varchar(100)
,`gejala` varchar(255)
,`obat` varchar(255)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_riwayat`
--
DROP TABLE IF EXISTS `v_riwayat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_riwayat`  AS  select `m`.`nama_lengkap` AS `nama_lengkap`,`r`.`gejala` AS `gejala`,`r`.`obat` AS `obat` from (`tbl_mahasiswa` `m` join `tbl_riwayat` `r` on((`m`.`NIM` = `r`.`NIM`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `tbl_riwayat`
--
ALTER TABLE `tbl_riwayat`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `fk_nim_mhs` (`NIM`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_riwayat`
--
ALTER TABLE `tbl_riwayat`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_riwayat`
--
ALTER TABLE `tbl_riwayat`
  ADD CONSTRAINT `fk_nim_mhs` FOREIGN KEY (`NIM`) REFERENCES `tbl_mahasiswa` (`NIM`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
