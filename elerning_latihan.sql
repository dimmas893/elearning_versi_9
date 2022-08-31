-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Agu 2022 pada 11.36
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elerning_latihan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absens`
--

CREATE TABLE `absens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `jadwal_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `absens`
--

INSERT INTO `absens` (`id`, `siswa_id`, `jadwal_id`, `status`, `tanggal`, `created_at`, `updated_at`) VALUES
(82, 3, 8, 'hadir', '2022-08-31', '2022-08-31 06:57:45', '2022-08-31 06:57:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `name`, `email`, `password`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Guru Ananda Dmmas Budiarto', 'anandadimmas@gmail.com', '$2y$10$M8zdbS.eeIcHnpnXuJfh8.DtenkcDX5VnXrN4jPN0GTGPP/.m1Lni', '1661330484.jpg', '2022-08-24 08:30:15', '2022-08-25 07:47:50'),
(7, 'halo', 'halo@gmail.com', '$2y$10$om/OIRbvkMG8uEE5UAX.w.X.V3aaywL0jgPR6qUdH/0verwna0AMu', '1661747166.jpg', '2022-08-29 04:26:06', '2022-08-29 04:26:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_kelas`
--

CREATE TABLE `guru_kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guru_id` int(11) NOT NULL,
  `ruangan_id` int(11) NOT NULL,
  `mata_pelajaran_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `guru_kelas`
--

INSERT INTO `guru_kelas` (`id`, `guru_id`, `ruangan_id`, `mata_pelajaran_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 3, '2022-08-25 04:50:36', '2022-08-25 04:55:51'),
(2, 2, 1, 3, '2022-08-25 04:57:49', '2022-08-25 04:57:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hari`
--

CREATE TABLE `hari` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `hari`
--

INSERT INTO `hari` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Senin', NULL, NULL),
(2, 'Selasa', NULL, NULL),
(3, 'Rabu', NULL, NULL),
(4, 'Kamis', NULL, NULL),
(5, 'Jumat', NULL, NULL),
(6, 'Saptu', NULL, NULL),
(7, 'Minggu', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwals`
--

CREATE TABLE `jadwals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ruangan_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `mata_pelajaran_id` int(11) NOT NULL,
  `hari_id` int(20) NOT NULL,
  `jam_masuk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_keluar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jadwals`
--

INSERT INTO `jadwals` (`id`, `ruangan_id`, `guru_id`, `mata_pelajaran_id`, `hari_id`, `jam_masuk`, `jam_keluar`, `created_at`, `updated_at`) VALUES
(9, 7, 7, 3, 3, '00:00', '22:22', '2022-08-31 08:40:49', '2022-08-31 08:40:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'IPS', '2022-08-24 07:27:56', '2022-08-24 07:30:58'),
(2, 'IPA', '2022-08-24 07:30:45', '2022-08-24 07:30:52'),
(4, 'BAHASA', '2022-08-24 07:31:16', '2022-08-24 07:31:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kelas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `kelas`, `created_at`, `updated_at`) VALUES
(3, '12', '2022-08-24 06:43:29', '2022-08-24 07:29:45'),
(4, '11', '2022-08-24 06:44:01', '2022-08-24 07:29:37'),
(7, '10', '2022-08-24 07:07:18', '2022-08-24 07:29:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'PPKN', '2022-08-24 07:46:42', '2022-08-24 07:51:02'),
(3, 'MATEMATIKA', '2022-08-24 07:46:54', '2022-08-24 07:46:54'),
(4, 'BAHASA INDONESIA', '2022-08-24 07:47:06', '2022-08-24 07:47:06'),
(5, 'BAHASA INGGRIS', '2022-08-24 07:47:20', '2022-08-24 07:47:20'),
(6, 'AGAMA', '2022-08-24 07:49:05', '2022-08-24 07:49:05'),
(7, 'ELECTRO', '2022-08-24 07:49:36', '2022-08-24 07:49:36'),
(8, 'BAHASA ARAB', '2022-08-24 07:49:44', '2022-08-24 07:49:44'),
(9, 'KIMIA', '2022-08-24 07:49:50', '2022-08-24 07:49:50'),
(10, 'FISIKA', '2022-08-24 07:49:56', '2022-08-24 07:49:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
--

CREATE TABLE `materi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jadwal_id` int(11) NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_or_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pengumpulan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `materi`
--

INSERT INTO `materi` (`id`, `jadwal_id`, `judul`, `type`, `file_or_link`, `description`, `pengumpulan`, `tanggal`, `created_at`, `updated_at`) VALUES
(1, 4, 'asasa', 'link', 'images/FlV75OfGJGZHpVv3dSVe0fBHlhpmlttCZaSlCrbN.pdf', 'dsdds', '2022-08-24', '2022-08-30', '2022-08-30 08:39:38', '2022-08-30 08:39:38'),
(2, 3, 'halo', 'link', 'images/2kRPL3tY94ha44l1hAu879VaxO2CRrpNzI35HDr0.pdf', 'dsd', '2022-08-31', '2022-08-31', '2022-08-31 04:24:25', '2022-08-31 04:24:25'),
(3, 8, 'dsdd', 'link', 'images/aue4fcRf9TGsuXpWcNhSW5sRT9t9S1Bv3Dh4tds7.jpg', 'dsd', '2022-09-01', '2022-08-31', '2022-08-31 06:42:11', '2022-08-31 06:42:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_08_24_020101_create_jurusan_table', 1),
(5, '2022_08_24_020128_create_kelas_table', 1),
(6, '2022_08_24_020216_create_guru_table', 1),
(7, '2022_08_24_020558_create_mata_pelajaran_table', 2),
(8, '2022_08_24_020614_create_sekolah_table', 2),
(9, '2022_08_24_020853_create_penjaga_perpus_table', 2),
(10, '2022_08_24_021040_create_siswa_table', 2),
(11, '2022_08_24_095817_create_sekolah_table', 3),
(12, '2022_08_22_084211_create_products_table', 4),
(13, '2022_08_22_090114_create_employees_table', 4),
(14, '2022_08_24_145403_create_guru_table', 5),
(15, '2022_08_24_154409_create_tu_table', 6),
(16, '2022_08_24_155746_create_siswa_table', 7),
(17, '2022_08_24_163235_create_ruangan_table', 8),
(18, '2022_08_24_172457_create_penjaga_perpus_table', 9),
(19, '2022_08_25_090442_create_admins_table', 10),
(24, '2022_08_25_102044_create_jadwals_table', 11),
(25, '2022_08_25_102546_create_guru_kelas_table', 11),
(26, '2022_08_25_111142_create_hari_table', 11),
(27, '2022_08_25_120155_create_tugas_table', 12),
(29, '2022_08_26_104103_create_materi_table', 13),
(30, '2022_08_26_110714_create_absen_table', 13),
(32, '2022_08_29_134559_create_pertemuan_table', 14),
(33, '2022_08_29_135311_create_absens_table', 14),
(37, '2022_08_30_103018_create_tugas_table', 15),
(38, '2022_08_30_153328_create_materi_table', 16),
(39, '2022_08_30_194649_create_nilai_tugas_table', 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_tugas`
--

CREATE TABLE `nilai_tugas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `nilai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `komentar_guru` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `semua_id` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guru_kelas_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `siswa_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurusan_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ruangan`
--

INSERT INTO `ruangan` (`id`, `semua_id`, `name`, `guru_kelas_id`, `siswa_id`, `jurusan_id`, `kelas_id`, `created_at`, `updated_at`) VALUES
(7, NULL, '9', NULL, '8', '2', '7', '2022-08-31 08:35:56', '2022-08-31 08:36:25'),
(18, NULL, '9', NULL, '9', '1', '7', '2022-08-31 08:41:10', '2022-08-31 09:22:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sekolah`
--

CREATE TABLE `sekolah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sekolah`
--

INSERT INTO `sekolah` (`id`, `name`, `alamat`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'SMA NEMGERI 2 JEPON', 'KECAMATAN JEPON', 'BERDIRI TAHUN 8988', '1661323089.jpg', NULL, '2022-08-24 06:38:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ruangan_id` int(11) DEFAULT NULL,
  `jurusan_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nisn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `ruangan_id`, `jurusan_id`, `name`, `email`, `password`, `gender`, `alamat`, `image`, `nisn`, `created_at`, `updated_at`) VALUES
(7, NULL, NULL, 'Ananda Dmmas Budiarto', 'ananda@gmail.com', '$2y$10$rQKqMtOvDWvhspg2cLclxeTweJc2ybuEfssYJccFMI/QqcO/vG296', 'laki laki', 'blora', '1661929224.jpg', '8989988', '2022-08-31 07:00:24', '2022-08-31 07:00:24'),
(8, NULL, NULL, 'ananda dimmas', 'dimmas@gmail.com', '$2y$10$bVfzXE5ZtrK5GB.DvcgC5uQZFeVFA7YFadSNU7fTBk79bzB9BOlLi', 'laki laki', 'blora', '1661929249.jpg', '989898', '2022-08-31 07:00:49', '2022-08-31 07:00:49'),
(9, NULL, NULL, 'budiarto', 'budiarto@gmail.com', '$2y$10$02sxSCLdhopNcccoQK5PL.hoyYn9HHw/HyGzRaVyBtfOFLXSmsjxm', 'jkjkj', 'jkkj', '1661929412.jpg', '909009', '2022-08-31 07:03:32', '2022-08-31 07:03:32'),
(10, NULL, NULL, 'dimmas budiarto', 'dimmasbudiarto@gmail.com', '$2y$10$uQlMT4CA.zTBSFQR8Ev5C.WFfA2IlOuRkzRsfu3mE7DNEYthWY2vi', 'sd', 'dsd', '1661929443.jpg', '90909', '2022-08-31 07:04:03', '2022-08-31 07:04:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tu`
--

CREATE TABLE `tu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tu`
--

INSERT INTO `tu` (`id`, `name`, `email`, `password`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Ananda petugas TU', 'nanda@gmail.com', '$2y$10$UGJ9nUYKed.RjHjGcjh.vOS251JXjp/o47VLIVxAd9uTONiY7YTRW', '1661331084.jpg', '2022-08-24 08:50:40', '2022-08-24 08:51:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugas`
--

CREATE TABLE `tugas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jadwal_id` int(11) NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_or_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pengumpulan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tugas`
--

INSERT INTO `tugas` (`id`, `jadwal_id`, `judul`, `type`, `file_or_link`, `description`, `pengumpulan`, `tanggal`, `created_at`, `updated_at`) VALUES
(5, 4, 'dssd', 'link', 'dsd', 'dsdsd', '2022-08-23', '2022-08-22', '2022-08-30 06:56:26', '2022-08-30 06:56:26'),
(6, 4, 'pdf', 'link', 'images/ESI7euTxmUh8fukCBbfH08RRTHG2PG6y1U4zlbOb.pdf', 'halo', '2022-08-30', '2022-08-30', '2022-08-30 07:05:59', '2022-08-30 07:05:59'),
(7, 4, 'dsdsd', 'pdf', 'dsdsd', 'sds', '2022-08-17', '2022-08-30', '2022-08-30 07:09:03', '2022-08-30 07:09:03'),
(8, 4, 'dad', 'pdf', 'images/XC2eBWKPFueFR6LxlT7QY4REKRtrsdemMgpKdTug.pdf', 'daad', '2022-08-24', '2022-08-30', '2022-08-30 07:09:42', '2022-08-30 07:09:42'),
(9, 4, 'ewewew', 'pdf', 'images/QbIZo8P3jMP1PRJuctYxiUUtbipjiTPowYQJWyRg.pdf', 'ds', '2022-08-18', '2022-08-30', '2022-08-30 07:38:42', '2022-08-30 07:38:42'),
(10, 4, 'testing', 'pdf', 'images/XAcqkxIcplSuTVhMt0ke24xNTSE0USBmLfPPHlSv.pdf', 'adad', '2022-08-30', '2022-08-30', '2022-08-30 08:25:10', '2022-08-30 08:25:10'),
(11, 4, 'link', 'pdf', 'sdsdsd', 'ada', '2022-08-30', '2022-08-30', '2022-08-30 08:25:24', '2022-08-30 08:25:24'),
(12, 4, 'jhjhj', 'link', 'hjhjhjh', 'sdsd', '2022-08-25', '2022-08-30', '2022-08-30 08:26:18', '2022-08-30 08:26:18'),
(13, 8, 'nanda', 'link', 'images/AvPTmYYwQxKdL0Pmg656DuYhCMIZsxhsytlR8ocW.jpg', 'dad', '2022-09-01', '2022-08-31', '2022-08-31 06:41:51', '2022-08-31 06:41:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'cinta', 'cinta@gmail.com', NULL, '$2y$10$X7EBGITGHRsHa3nuJVuf7ev0potRk2CkJh58cz0TE1ETbNzn.uEvy', NULL, '2022-08-23 19:19:16', '2022-08-23 19:19:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absens`
--
ALTER TABLE `absens`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guru_email_unique` (`email`);

--
-- Indeks untuk tabel `guru_kelas`
--
ALTER TABLE `guru_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `nilai_tugas`
--
ALTER TABLE `nilai_tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `siswa_email_unique` (`email`),
  ADD UNIQUE KEY `siswa_nisn_unique` (`nisn`);

--
-- Indeks untuk tabel `tu`
--
ALTER TABLE `tu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tu_email_unique` (`email`);

--
-- Indeks untuk tabel `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absens`
--
ALTER TABLE `absens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `guru_kelas`
--
ALTER TABLE `guru_kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `hari`
--
ALTER TABLE `hari`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `materi`
--
ALTER TABLE `materi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `nilai_tugas`
--
ALTER TABLE `nilai_tugas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tu`
--
ALTER TABLE `tu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
