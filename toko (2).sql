-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2018 at 08:03 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id_bank` int(4) NOT NULL,
  `date` datetime NOT NULL,
  `bank` varchar(32) NOT NULL,
  `account_name` varchar(32) NOT NULL,
  `account_number` varchar(24) NOT NULL,
  `moota_bank_id` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id_inv` bigint(20) NOT NULL,
  `date_inv` datetime NOT NULL,
  `date_paid` datetime NOT NULL,
  `inv_num` bigint(20) NOT NULL,
  `inv_amount` bigint(20) NOT NULL,
  `inv_unique_num` bigint(20) NOT NULL,
  `inv_total` bigint(20) NOT NULL,
  `inv_status` enum('paid','unpaid','refunds') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `parent` int(30) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `name`, `parent`) VALUES
(1, 'fasion', 0),
(2, 'fasion pria', 1),
(3, 'eletronik', 0);

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id_konf` int(11) NOT NULL,
  `date_konf` datetime NOT NULL,
  `inv_num` varchar(16) NOT NULL,
  `name` varchar(32) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `transfer_to` varchar(2) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_order` int(6) NOT NULL,
  `date` date NOT NULL,
  `userid` varchar(30) NOT NULL,
  `produkid` int(20) NOT NULL,
  `total_produk` int(11) NOT NULL,
  `biaya` int(11) NOT NULL,
  `status` varchar(11) NOT NULL,
  `inv_num` varchar(30) NOT NULL,
  `pembayaran` enum('unpaid','paid','refunds') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(8) NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(32) NOT NULL,
  `deskripsi` text NOT NULL,
  `kategori` varchar(16) NOT NULL,
  `sku` varchar(16) NOT NULL,
  `gambar_produk` varchar(255) NOT NULL,
  `berat` double NOT NULL,
  `stok` int(16) NOT NULL,
  `url_drop` text NOT NULL,
  `harga_drop` double NOT NULL,
  `harga` double NOT NULL,
  `harga2` double NOT NULL,
  `asal_pengiriman` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `date`, `name`, `deskripsi`, `kategori`, `sku`, `gambar_produk`, `berat`, `stok`, `url_drop`, `harga_drop`, `harga`, `harga2`, `asal_pengiriman`) VALUES
(2, '2018-08-23 11:27:14', 'ajga', 'tes_des', 'kat1', 'sku0001', 'https://bajumurahonline.biz/wp-content/uploads/2017/09/Baju-Wanita-murah-berkualitas-online-model-keren-ELLA09-2.jpg', 1200, 12, 'https://bajumurahonline.biz/', 10000, 20000, 15000, '1'),
(3, '0000-00-00 00:00:00', 'sepatu', 'deskripsi sepatu', 'fashion pria', 'sku002', 'https://ecs7.tokopedia.net/img/cache/700/product-1/2016/2/22/7600472/7600472_56df2361-f3f9-4b82-92d0-a02039dcd0fe.jpg', 1111, 11, 'tokopedia.com', 200000, 400000, 350000, 'banyuwan'),
(4, '0000-00-00 00:00:00', 'sepatu', 'deskripsi sepatu', 'fashion pria', 'sku002', 'https://ecs7.tokopedia.net/img/cache/700/product-1/2016/2/22/7600472/7600472_56df2361-f3f9-4b82-92d0-a02039dcd0fe.jpg', 1111, 11, 'tokopedia.com', 200000, 400000, 350000, 'banyuwan'),
(9, '0000-00-00 00:00:00', '', '', '', '', '', 0, 0, '', 0, 0, 0, ''),
(10, '0000-00-00 00:00:00', '', '', '', '', '', 0, 0, '', 0, 0, 0, ''),
(11, '0000-00-00 00:00:00', 'd2', 'd2', '1', 'sku003', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw0NDg8NDQ0PDQ0NDRUNDQ0OEA8NDQ8PFREWFhURFhUYHCggGCYlGxMVITEhJSkrLi4uFx8zODMsNzQtLisBCgoKDg0OGhAQGCsdHR0rKy0rKy0tLS0tKy0tLS0tKy0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLTctLS0rLf/AABEIAOEA4QMBEQACEQEDEQH/', 12000, 21, 'tokopedia.com', 20000000, 40000, 30000, 'bwi'),
(12, '0000-00-00 00:00:00', '', '', '', '', '', 0, 0, '', 0, 0, 0, ''),
(13, '0000-00-00 00:00:00', '', '', '', '', '', 0, 0, '', 0, 0, 0, ''),
(14, '0000-00-00 00:00:00', '', '', '', '', '', 0, 0, '', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_trx` bigint(20) NOT NULL,
  `date_trx` datetime NOT NULL,
  `inv_num` varchar(16) NOT NULL,
  `trx_method` varchar(16) NOT NULL,
  `trx_amount` double NOT NULL,
  `trx_status` enum('success','pending','failed') NOT NULL,
  `trx_type` enum('in','out') NOT NULL,
  `trx_for` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(6) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(20) NOT NULL,
  `groups` enum('0','1','2','3','4','5','6') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `userid`, `password`, `email`, `groups`) VALUES
(1, 'admin', '0bbdce817daee91e3d6a6604a5ec700f', 'admin@gmail.com', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users_detail`
--

CREATE TABLE `users_detail` (
  `id_user` int(6) NOT NULL,
  `userid` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id_inv`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id_konf`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_trx`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `users_detail`
--
ALTER TABLE `users_detail`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id_bank` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id_inv` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `id_konf` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_trx` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_detail`
--
ALTER TABLE `users_detail`
  MODIFY `id_user` int(6) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
