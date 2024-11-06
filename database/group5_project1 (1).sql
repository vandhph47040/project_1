-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 31, 2024 lúc 07:52 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `group5_project1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'avatar-default.png',
  `user` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `status` enum('Active','Inactive','') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`account_id`, `avatar`, `user`, `password`, `phone_number`, `email`, `address`, `role_id`, `status`) VALUES
(2, 'assets/images/avatar-default.png', 'admin', '123456', '0327427463', 'traubudz@gmail.com', 'Lạng Sơn', 1, 'Active'),
(3, 'avatar-default.png', 'manhduc', '123', '0327427463', 'manhduc020325@gmail.com', 'Lạng Sơn', 2, 'Active'),
(11, 'manhldph', '123', '0327427463', 'manhldph47042@f', 'Phúc Diễn', 'Inactive', 2, 'Active'),
(12, 'avatar-default.png', 'vandh12', '123456', '0989721167', 'vandhph47040@fpt.edu.vn', 'Hà Nội', 2, 'Active'),
(13, 'avatar-default.png', 'vandh1111', '123456', '0989721167', 'vandhph47040@fpt.edu.vn', 'Hà Nội', 2, 'Active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`) VALUES
(1, 'Asus'),
(2, 'LG'),
(3, 'Viewsonic'),
(4, 'Edifier'),
(5, 'SoundMax'),
(6, 'Razer Leviathan');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `status` enum('Active','Inactive','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `status`) VALUES
(1, 'Màn Hình', 'Active'),
(2, 'Loa', 'Active'),
(3, 'PC', 'Inactive'),
(4, 'Chuột', 'Active'),
(5, 'Case', 'Inactive'),
(7, 'Bàn Phím', 'Active');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`color_id`, `color_name`) VALUES
(1, 'Đen'),
(2, 'Trắng'),
(3, 'Hồng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `time` varchar(20) NOT NULL,
  `account_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`comment_id`, `content`, `time`, `account_id`, `product_id`) VALUES
(2, 'abc', '   04/08/2024', 2, 156),
(3, 'abcd', '09/08/2024', 3, 161),
(4, 'abcd', '09/08/2024', 3, 162),
(5, 'abcE', '09/08/2024', 3, 160),
(6, 'abcd', '09/08/2024', 2, 162),
(7, 'abcd', '09/08/2024', 2, 161),
(8, 'advada', '05/09/2024', 2, 161),
(9, 'vadada', '05/09/2024', 2, 158);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `images` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `gallery`
--

INSERT INTO `gallery` (`gallery_id`, `product_id`, `images`) VALUES
(418, 153, 'Loa Edifier Hecate Gaming 2.1 G1500 Max (2).jpg'),
(419, 153, 'Loa Edifier Hecate Gaming 2.1 G1500 Max (3).jpg'),
(420, 153, 'Loa Edifier Hecate Gaming 2.1 G1500 Max (4).jpg'),
(421, 154, 'Razer Leviathan V2 X (2).jpg'),
(422, 154, 'Razer Leviathan V2 X (3).jpg'),
(423, 154, 'Razer Leviathan V2 X (4).jpg'),
(436, 155, 'Loa SoundMax SB201 Grey (2).jpg'),
(437, 155, 'Loa SoundMax SB201 Grey (3).jpg'),
(438, 155, 'Loa SoundMax SB201 Grey (4).jpg'),
(520, 157, 'ASUS VA24EHF (2).jpg'),
(521, 157, 'ASUS VA24EHF (3).jpg'),
(522, 157, 'ASUS VA24EHF (4).jpg'),
(523, 158, 'ASUS VZ27EHF (2).jpg'),
(524, 158, 'ASUS VZ27EHF (3).jpg'),
(525, 158, 'ASUS VZ27EHF (4).jpg'),
(529, 160, 'Chuột công thái học Logitech Lift Vertical White (1)~1.jpg'),
(530, 160, 'Chuột công thái học Logitech Lift Vertical White (2).jpg'),
(531, 160, 'Chuột công thái học Logitech Lift Vertical White (2)~1.jpg'),
(532, 160, 'Chuột công thái học Logitech Lift Vertical White (3).jpg'),
(535, 162, 'lt2.2.jpg'),
(536, 162, 'lt2.3.jpg'),
(537, 156, 'ASUS ROG Strix XG249CM  (2).jpg'),
(538, 156, 'ASUS ROG Strix XG249CM  (3).jpg'),
(539, 156, 'ASUS ROG Strix XG249CM  (4).jpg'),
(540, 152, 'Loa Bluetooth Edifier QD35 White (2).jpg'),
(541, 152, 'Loa Bluetooth Edifier QD35 White (3).jpg'),
(542, 152, 'Loa Bluetooth Edifier QD35 White (4).jpg'),
(551, 159, 'Viewsonic VA2732-H 27 (2).jpg'),
(552, 159, 'Viewsonic VA2732-H 27 (3).jpg'),
(553, 159, 'Viewsonic VA2732-H 27 (4).jpg'),
(568, 161, 'Bàn phím cơ DareU EK810 Queen (3).jpg'),
(569, 161, 'Bàn phím cơ DareU EK810 Queen (2).jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `product_id`, `quantity`) VALUES
(2, 152, 6),
(4, 156, 15),
(5, 157, 22),
(6, 158, 14),
(7, 159, 23),
(8, 160, 0),
(9, 161, 0),
(10, 162, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `order_status` tinyint(4) NOT NULL DEFAULT 0,
  `customer_phone` int(11) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`order_id`, `customer_name`, `customer_address`, `order_status`, `customer_phone`, `customer_email`, `user_id`) VALUES
(77, 'Đặng Văn', 'Hà nội', 0, 382681168, 'vandh47040@fpt.edu.vn', NULL),
(94, 'admin', 'Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(110, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(222, 'admin', 'Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(231, 'manhduc', 'Lạng Sơn', 0, 327427463, 'manhduc020325@gmail.com', NULL),
(232, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(233, 'manhduc', 'Lạng Sơn', 0, 327427463, 'manhduc020325@gmail.com', NULL),
(234, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(257, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(336, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(358, 'admin', 'Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(363, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(464, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(469, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(498, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(526, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(539, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(645, 'Đặng Văn', 'Hà nội', 0, 382681168, 'vandh47040@fpt.edu.vn', NULL),
(682, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(694, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(762, 'admin', 'Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(768, 'Đặng Văn', 'Hà nội', 0, 382681168, 'vandh47040@fpt.edu.vn', NULL),
(777, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(835, 'Đặng Văn', 'Hà nội', 0, 382681168, 'superman.98vn@gmail', NULL),
(849, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(895, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(912, 'admin', 'Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(926, 'Đặng Văn', 'Hà nội', 0, 382681168, 'vandh47040@fpt.edu.vn', NULL),
(928, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(937, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(955, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(987, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(988, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(989, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(990, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(991, 'Lương Đức Mạnh', 'Bắc Sơn, Lạng Sơn', 0, 327427463, 'traubudz@gmail.com', NULL),
(992, 'Đặng Văn', 'Hà nội', 0, 382681168, 'vandh47040@fpt.edu.vn', NULL),
(993, 'Đặng Văn', 'Hà nội', 0, 382681168, 'vandh47040@fpt.edu.vn', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `color_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_money` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_detail_id`, `product_id`, `order_id`, `product_price`, `voucher_id`, `color_id`, `quantity`, `total_money`) VALUES
(145, 160, 231, 10000000, NULL, 3, 1, 9930000),
(146, 162, 231, 25000000, NULL, 3, 1, 24930000),
(147, 158, 232, 2000000, NULL, 3, 1, 2000000),
(148, 158, 233, 2000000, NULL, 2, 1, 1930000),
(149, 160, 233, 10000000, NULL, 2, 1, 9930000),
(150, 160, 234, 10000000, NULL, 2, 1, 10000000),
(151, 160, 955, 10000000, NULL, 2, 1, 9900000),
(152, 162, 526, 25000000, NULL, 3, 1, 24970000),
(153, 160, 682, 10000000, NULL, 3, 1, 9970000),
(154, 160, 469, 10000000, NULL, 3, 1, 9970000),
(155, 160, 464, 10000000, NULL, 3, 1, 9900000),
(156, 158, 928, 2000000, NULL, 3, 1, 1900000),
(157, 158, 987, 2000000, NULL, 3, 1, 1900000),
(158, 158, 498, 2000000, NULL, 3, 1, 1930000),
(159, 158, 694, 2000000, NULL, 3, 1, 1900000),
(160, 158, 988, 2000000, NULL, 3, 1, 2000000),
(161, 158, 989, 2000000, NULL, 3, 1, 2000000),
(162, 158, 363, 2000000, NULL, 3, 1, 1900000),
(163, 158, 937, 2000000, NULL, 3, 1, 1930000),
(164, 157, 895, 12000000, NULL, 3, 1, 11930000),
(165, 157, 990, 12000000, NULL, 3, 1, 12000000),
(166, 162, 991, 25000000, NULL, 3, 1, 25000000),
(167, 162, 849, 25000000, NULL, 3, 1, 24930000),
(168, 158, 110, 2000000, NULL, 3, 1, 2000000),
(169, 162, 110, 25000000, NULL, 2, 1, 25000000),
(170, 159, 992, 2, NULL, 3, 1, 2),
(171, 162, 993, 25000000, NULL, 3, 1, 25000000),
(172, 162, 926, 25000000, NULL, 3, 1, 25030000),
(173, 162, 768, 25000000, NULL, 3, 1, 25030000),
(174, 162, 77, 25000000, NULL, 3, 1, 25030000),
(175, 162, 645, 25000000, NULL, 3, 2, 50030000),
(176, 159, 94, 2, NULL, 3, 1, 30002),
(177, 162, 762, 25000000, NULL, 3, 1, 25030000),
(178, 157, 762, 12000000, NULL, 3, 1, 12030000),
(179, 162, 358, 25000000, NULL, 3, 1, 25030000),
(180, 158, 358, 2000000, NULL, 3, 1, 2030000),
(181, 162, 222, 25000000, NULL, 3, 1, 25030000),
(182, 158, 222, 2000000, NULL, 3, 1, 2030000),
(183, 157, 835, 12000000, NULL, 3, 1, 12030000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(11) NOT NULL,
  `price_sale` int(30) DEFAULT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_describe` text NOT NULL,
  `status` enum('Active','Inactive','','') NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `price_sale`, `product_image`, `product_describe`, `status`, `category_id`, `brand_id`, `color_id`) VALUES
(152, 'Loa Bluetooth Edifier QD35 White', 3000000, NULL, 'Loa Bluetooth Edifier QD35 White (1).jpg', 'Loa oke', 'Active', 2, 4, 2),
(156, 'ASUS ROG Strix XG249CM', 20000000, NULL, 'ASUS ROG Strix XG249CM    (1).jpg', 'oke', 'Active', 1, 1, 1),
(157, 'ASUS VA24EHF', 12000000, NULL, 'ASUS VA24EHF (1).jpg', 'Man xin', 'Active', 1, 1, 1),
(158, 'ASUS VZ27EHF', 2000000, NULL, 'ASUS VZ27EHF (1).jpg', 'oke', 'Active', 1, 1, 1),
(159, 'Viewsonic VA2732-H 27', 2, NULL, 'Viewsonic VA2732-H 27 (1).jpg', '', 'Active', 1, 3, 1),
(160, 'Chuột công thái học Logitech Lift Vertical White', 10000000, NULL, 'Chuột công thái học Logitech Lift Vertical White (1).jpg', 'Chuột công thái học', 'Active', 4, 1, 2),
(161, 'Bàn phím cơ DareU EK810 Queen', 2, NULL, 'Bàn phím cơ DareU EK810 Queen (1).jpg', '', 'Inactive', 7, 2, 3),
(162, 'Laptop Asus tuf F15 gaming', 25000000, NULL, 'lt2.1.jpg', 'Laptop xịn', 'Active', 3, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'admin'),
(2, 'Khách hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

CREATE TABLE `voucher` (
  `voucher_id` int(11) NOT NULL,
  `voucher_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `voucher`
--

INSERT INTO `voucher` (`voucher_id`, `voucher_title`) VALUES
(1, 'Giảm 30.000đ đối với đơn hàng giá trị từ 300.000đ'),
(2, 'Giảm 100.000đ đối với đơn hàng giá trị từ 2.000.000đ');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `lk_account_role` (`role_id`);

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `lk_comment_product` (`product_id`),
  ADD KEY `lk_comment_account` (`account_id`);

--
-- Chỉ mục cho bảng `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Chỉ mục cho bảng `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `lk_inventory_product` (`product_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `lk_order_account` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `lk_orderDetails_product` (`product_id`),
  ADD KEY `lk_orderDetails_order` (`order_id`),
  ADD KEY `lk_orderDetails_color` (`color_id`),
  ADD KEY `lk_orderDetails_voucher` (`voucher_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `lk_product_category` (`category_id`),
  ADD KEY `lk_product_color` (`color_id`),
  ADD KEY `lk_product_brand` (`brand_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=570;

--
-- AUTO_INCREMENT cho bảng `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=994;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `lk_account_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Các ràng buộc cho bảng `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `lk_inventory_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `lk_order_account` FOREIGN KEY (`user_id`) REFERENCES `account` (`account_id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `lk_orderDetails_color` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`),
  ADD CONSTRAINT `lk_orderDetails_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `lk_orderDetails_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `lk_orderDetails_voucher` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`voucher_id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `lk_product_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  ADD CONSTRAINT `lk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `lk_product_color` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
