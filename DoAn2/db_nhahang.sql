-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 22, 2021 lúc 12:04 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_nhahang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chucvu`
--

CREATE TABLE `chucvu` (
  `id_chucvu` char(10) NOT NULL,
  `tenchucvu` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chucvu`
--

INSERT INTO `chucvu` (`id_chucvu`, `tenchucvu`) VALUES
('CV00000001', 'Nhân viên'),
('CV00000002', 'Quản trị'),
('CV00000003', 'Quản nhà kho');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id_taikhoan` char(10) NOT NULL,
  `id_chucvu` char(10) DEFAULT NULL,
  `user_name` char(25) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `hovaten` varchar(100) DEFAULT NULL,
  `sdt` char(10) NOT NULL,
  `email` char(100) DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `trangthai` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id_taikhoan`, `id_chucvu`, `user_name`, `password`, `hovaten`, `sdt`, `email`, `ngaysinh`, `trangthai`) VALUES
('TK00000001', 'CV00000002', 'antlt1', '1E38E87E4C0BD515C2176EAED3B2D6FB', 'An Handsome', '', '', '2001-01-04', 0),
('TK00000002', 'CV00000002', 'admin', '21232F297A57A5A743894A0E4A801FC3', 'Nguyên Lỏ', '1111111111', 'gadndn@gmail.com', '2021-11-18', 0),
('TK00000003', 'CV00000001', 'luan2k4', '741BA8934D6F4971783E333EBE828EEF', 'Quách Hoàng Luân', '0798053330', 'LuanFanSky@gmail.com', '2000-12-22', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chucvu`
--
ALTER TABLE `chucvu`
  ADD PRIMARY KEY (`id_chucvu`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id_taikhoan`),
  ADD KEY `fk_chuc_vu_taikhoan` (`id_chucvu`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `fk_chuc_vu_taikhoan` FOREIGN KEY (`id_chucvu`) REFERENCES `chucvu` (`id_chucvu`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
