-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 25 فبراير 2023 الساعة 16:35
-- إصدار الخادم: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_gate`
--

-- --------------------------------------------------------

--
-- بنية الجدول `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `password`) VALUES
(1, 'Asayel', 'Asayel@hotel-gate.com', '0561065417', '$2y$10$Km5WfiQZBYlfcD3A0rCOUueyfuqk/CCkJtcgbS4vkmHRiemyvjGSC');

-- --------------------------------------------------------

--
-- بنية الجدول `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `card_number` int DEFAULT NULL,
  `expiration_day` date DEFAULT NULL,
  `cvc_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- إرجاع أو استيراد بيانات الجدول `customers`
--

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `email`, `phone`, `password`, `gender`, `address`, `card_number`, `expiration_day`, `cvc_code`) VALUES
(1, 'customer', 'one', 'customer1@hotel-gate.com', '2215646', '$2y$10$jWk2tG7DiASXqLA5CTLAgehUaf30UOHY4zCvaGabUxsqErJ7rDOI2', 'male', 'customer one location', 103, '2023-01-17', 'qwe'),
(11, 'asayel', 'almaghrabi', 'asayel1410@gmail.com', '0561065417', '$2y$10$UpL4n.TGW5UNDgS5FjrRmesET5uIHc2quCoSPKpssoTg4O8xCB/rK', NULL, NULL, NULL, NULL, NULL),
(19, 'MAHA', 'ALMZROAI', 'Maha11123800@gmail.com', '0538628247', '$2y$10$IFboUCWpxPmhgwi6u5LNo.kSjcvBxGg18hViezkDUYm2wwHTcOyxW', 'female', 'Jeddah', 2147483647, '2023-01-29', '777');

-- --------------------------------------------------------

--
-- بنية الجدول `favorite_list`
--

DROP TABLE IF EXISTS `favorite_list`;
CREATE TABLE IF NOT EXISTS `favorite_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `offer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favorite_list_ibfk_1` (`customer_id`),
  KEY `offer_id` (`offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- إرجاع أو استيراد بيانات الجدول `favorite_list`
--

INSERT INTO `favorite_list` (`id`, `customer_id`, `offer_id`) VALUES
(1, 1, 4),
(15, 1, 28),
(16, 1, 6);

-- --------------------------------------------------------

--
-- بنية الجدول `hotels`
--

DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `stars` int NOT NULL,
  `location` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int NOT NULL,
  `discount` int DEFAULT NULL,
  `discount_code` int DEFAULT NULL,
  `rooms_number` int NOT NULL,
  `photo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- إرجاع أو استيراد بيانات الجدول `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `stars`, `location`, `email`, `phone`, `discount`, `discount_code`, `rooms_number`, `photo`) VALUES
(1, 'Centro Hotel', 4, 'Jeddah, Sharafiya District 23218', 'centroHotel@gmail.com', 126188888, 15, 0, 25, '1675937166-hotel.jpg'),
(2, 'Radisson Blu Hotel', 5, 'Jeddah, Al Shati District, Corniche Road', 'RadissonBluHotel@gmail.com', 125110000, 15, 0, 6, '1675936866-hotel.jpg'),
(3, 'Ozone Hotel', 3, 'Jeddah, Al-Hamra district 23212', 'ozone@gmail.com', 126778888, 12, 0, 20, '1675937440-hotel.jpg'),
(4, 'Ramada Hotel', 5, 'Riyadh, King Fahd Road 12734', 'hotel4@hotel-gate.com', 126549999, 100, 0, 20, '1675944257-hotel.jpg'),
(6, 'Sheraton Hotel ', 5, 'Dammam', 'Sheraton@hotel-gate.com', 126547766, 25, 0, 40, '1675945521-hotel.jpg'),
(7, 'Ayan furnished units and Suites', 3, 'Riyadh, Olaya Street', 'Ayan@hotel-gate.com', 542328769, 0, 0, 15, '1675944808-hotel.jpg'),
(8, 'Marriott Executive Apartments', 4, 'Medina', 'Marriott@hotel-gate.com', 587639812, 10, 0, 23, '1675945289-hotel.jpg'),
(27, 'Alaqiq', 5, 'Madinah', 'Alaqiqi@hotel-gate.com', 999000111, 199, 111, 3400, '1676382083-hotel.jpg');

-- --------------------------------------------------------

--
-- بنية الجدول `managers`
--

DROP TABLE IF EXISTS `managers`;
CREATE TABLE IF NOT EXISTS `managers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- إرجاع أو استيراد بيانات الجدول `managers`
--

INSERT INTO `managers` (`id`, `hotel_id`, `name`, `email`, `password`, `phone`) VALUES
(1, 1, 'manager1', 'manager1@hotel-gate.com', '$2y$10$BP1zMDszHqXp4iDP.H3FGO3QT1VGaNLELp2IJWjWgCtKOho0w.PmK', 123123),
(2, 2, 'manager2', 'manager2@hotel-gate.com', '$2y$10$dcEF1O67qj4KFQ.eWlqO6.sAqaq1C7FXdixMGV4IQXgqS3.l/u2Nm', 123123123),
(3, 3, 'manager3', 'manager3@hotel-gate.com', '$2y$10$UCJx0uox2JMZ3uTUCLyiQ.CK8CEYSrobtUIukvK4TkdBojeOsBz.e', 123123),
(4, 4, 'manager4', 'manager4@hotel-gate.com', '$2y$10$gvDQLhJQwLcBgaGrokThe.bDV653LAAwuzhnmySQNOvIVbA6dv2ma', 22335566),
(6, 1, 'MohammadCentroHotel', 'MohammadCentroHotel@gmail.com', '$2y$10$CEAzINKbkgUCEFcIG.6i9uTcLYpF9NjQy/f5iFx4q/D6848tpkVqC', 576431784),
(7, 2, 'Sarah RadissonHotel', 'SarahRadissonHotel@hotel-gate.com', '$2y$10$uAB5f1MwGOrqqd7sphqh5.ZSnX9.wvmQwRmoNQQ6E4e406T.0uGli', 561065417),
(8, 3, 'AsayelOzoneHotel', 'AsayelOzoneHotel@hotel-gate.com', '$2y$10$pRKNAmir1kHwcoaU2lQYuOdhOxHcZv0FFR5chrCt/n4gfTxlbRXV.', 548731928),
(10, 8, 'FaisalMariottHotel', 'FaisalMariott@hotel-gate.com', '$2y$10$30j4qc8LIpqeFXRYsaT.luTvIp4yGXdliEg1Jox0aHqzLfElHnCm6', 568742391),
(11, 7, 'SamiAyanHotel', 'SamiAyanHotel@gmail.com', '$2y$10$WTXiMQVmX.VsGlZe/InFiuVsc1Ft6.hR0AKU0JRpaAoT56AtMSNdi', 568794321),
(12, 6, 'LanaSheratonHotel', 'LanaSheratonHotel@gmail.com', '$2y$10$7byBwnUm1JLiGhTRvmIsgenRHiswlpD7tiqcxaUDcfF.Fo4t0paFO', 543217896),
(13, 4, 'AtheerRamadaHotel', 'AtheerRamadaHotel@gmail.com', '$2y$10$uL.63OTfP9RCNJWtef6GO.bh65AH5rzOfDoPCuEWFE837w.5VNL6u', 547636789),
(25, 27, 'MohammedAlaqiqHotel', 'Alaqiqi@hotel-gate.com', '$2y$10$OiWT1KW/U4TvmOGdyvdCIOitF1umPz23a4H./FphslYOhXyq8ldwG', 999000111);

-- --------------------------------------------------------

--
-- بنية الجدول `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int NOT NULL,
  `number_of_rooms` int NOT NULL,
  `type_of_rooms` varchar(255) NOT NULL,
  `price_per_room` float NOT NULL,
  `features` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `popular` int NOT NULL,
  `rated_guest` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- إرجاع أو استيراد بيانات الجدول `offers`
--

INSERT INTO `offers` (`id`, `hotel_id`, `number_of_rooms`, `type_of_rooms`, `price_per_room`, `features`, `photo`, `popular`, `rated_guest`) VALUES
(3, 4, 2, 'Queen Room', 500, 'city view;shower;coffee & tea;free wifi;1 queen bed;free breakfast', '1672963071-4.jpg', 7, 7),
(4, 4, 3, 'King Room', 500, 'city view;coffee & tea;free wifi;1 king bed;free breakfast', '1672963143-4.jpg', 1, 5),
(5, 6, 3, 'Single', 175, 'shower;coffee & tea;free wifi', '1676359063-114-6.jpg|1676359063-786-6.jpg|1676359063-698-6.jpg', 5, 7),
(6, 4, 1, 'Small room', 150, 'free wifi', '1673117627-4.jpg', 5, 6),
(7, 4, 1, 'Small room with free breakfast', 150, 'free breakfast', '1673117667-4.jpg', 1, 6),
(13, 4, 123, 'Queen Room', 123, 'shower;1 queen bed', '1675112441-325-4.jpg|1675112441-690-4.jpg|1675112441-168-4.jpg', 5, 10),
(14, 4, 12, 'Queen Room', 201, 'free wifi;free breakfast;free parking', '1675112416-546-4.jpg|1675112416-418-4.jpg', 5, 3),
(15, 1, 10, 'Studio room', 600, 'city view;shower;free wifi;1 king bed;free breakfast;free parking', '1675947362-695-1.jpg', 10, 3),
(16, 1, 15, 'twin room', 500, 'city view;shower;coffee & tea;free wifi', '1675978968-156-1.jpg|1675978968-537-1.jpg|1675978968-563-1.jpg', 5, 3),
(17, 1, 10, 'Queen room', 300, 'city view;free wifi;1 queen bed', '1675978832-971-1.jpg|1675978832-353-1.jpg|1675978832-480-1.jpg', 10, 8),
(18, 3, 12, 'Standard room', 559, 'city view;shower;coffee & tea;free wifi;1 queen bed;free parking', '1675946620-954-3.jpg', 9, 6),
(19, 3, 15, 'King suite room', 450, 'city view;shower;coffee & tea;free wifi;1 king bed;free breakfast', '1675946939-268-3.jpg', 9, 4),
(20, 2, 20, 'Standard room', 900, 'city view;shower;coffee & tea;free wifi', '1675947525-55-2.jpg', 3, 1),
(21, 2, 39, 'Superior room', 990, 'city view;coffee & tea;free wifi;1 king bed;free parking', '1675979157-169-2.jpg|1675979157-752-2.jpg|1675979157-614-2.jpg', 3, 10),
(22, 2, 19, 'Jonior suite room', 1100, 'city view;shower;coffee & tea;free wifi;free breakfast;free parking', '1675979112-60-2.jpg|1675979112-579-2.jpg|1675979112-741-2.jpg', 2, 7),
(23, 7, 34, 'Standard room', 232, 'city view;shower;free wifi;free breakfast', '1675947994-540-7.jpg', 4, 8),
(24, 7, 15, 'delux king room', 1500, 'city view', '1675948165-291-7.jpg', 2, 7),
(25, 7, 34, 'delux twin room', 543, 'city view;shower;free wifi;1 queen bed;free breakfast', '1675970459-905-7.jpg', 7, 10),
(26, 8, 6, 'Studio apartment with a view', 560, 'city view;coffee & tea;free wifi;1 king bed;free parking', '1675971021-490-8.jpg', 6, 4),
(27, 8, 8, 'One bedroom apartment', 500, 'shower;free wifi;1 king bed;free parking', '1675971087-625-8.jpg', 7, 5),
(28, 8, 5, 'One bedroom apartment with breakfast', 550, 'shower;coffee & tea;free wifi;free breakfast', '1675979656-366-8.jpg|1675979656-507-8.jpg|1675979656-501-8.jpg', 3, 5),
(29, 6, 20, 'Classic room', 450, 'coffee & tea;free wifi;1 king bed', '1675971400-460-6.jpg', 10, 8),
(30, 6, 15, 'Classic room with twin bed', 440, 'coffee & tea;free wifi;free parking', '1675979435-97-6.jpg|1675979435-43-6.jpg', 2, 9),
(31, 6, 6, 'Single', 600, 'city view;free wifi;1 king bed;free breakfast', '1676359034-517-6.jpg|1676359034-844-6.jpg|1676359034-202-6.jpg', 9, 2),
(32, 6, 10, 'delux room', 400, 'coffee & tea;free wifi;free breakfast', '1675979356-460-6.jpg|1675979356-918-6.jpg|1675979356-361-6.jpg', 2, 7),
(40, 27, 30, 'King', 450, 'city view;shower;coffee & tea;free wifi;1 king bed', '1676382179-7-27.jfif|1676382179-711-27.jpg', 8, 7);

-- --------------------------------------------------------

--
-- بنية الجدول `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `auth_code` varchar(255) DEFAULT NULL,
  `customer_id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int NOT NULL,
  `card_number` int NOT NULL,
  `expiration_day` date NOT NULL,
  `cvc_code` varchar(255) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `offers` varchar(255) NOT NULL,
  `rooms_number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- إرجاع أو استيراد بيانات الجدول `reservations`
--

INSERT INTO `reservations` (`id`, `price`, `auth_code`, `customer_id`, `hotel_id`, `first_name`, `last_name`, `email`, `phone`, `card_number`, `expiration_day`, `cvc_code`, `check_in`, `check_out`, `offers`, `rooms_number`) VALUES
(15, 1000, '4b30f261', 7, 4, 'asayel', 'almaghrabi', 'asayel1410@gmail.com', 561065417, 56356363, '2023-02-06', '543', '2023-02-05', '2023-02-08', '3-4', '1-1'),
(16, 80, 'da28ceac', 7, 1, 'asayel', 'almaghrabi', 'asayel1410@gmail.com', 561065417, 224556677, '2023-02-07', '234', '2023-02-09', '2023-02-10', '15', '1'),
(17, 80, NULL, 7, 1, 'asayel', 'almaghrabi', 'asayel1410@gmail.com', 561065417, 2147483647, '2023-02-07', '432', '2023-02-09', '2023-02-10', '15', '1'),
(18, 580, 'f5f10090', 1, 1, 'customer', 'one', 'customer1@hotel-gate.com', 2215646, 103, '2023-01-17', 'qwe', '2023-02-09', '2023-02-11', '15-16', '1-1'),
(19, 1185, 'd94b830e', 11, 1, 'asayel', 'almaghrabi', 'asayel1410@gmail.com', 561065417, 436364, '2023-02-23', '321', '2023-02-10', '2023-02-12', '15', '2'),
(20, 800, NULL, 1, 1, 'customer', 'one', 'customer1@hotel-gate.com', 2215646, 103, '2023-01-17', 'qwe', '2023-01-01', '2023-01-09', '16-17', '1-1'),
(21, 800, NULL, 1, 1, 'customer', 'one', 'customer1@hotel-gate.com', 2215646, 103, '2023-01-17', 'qwe', '2023-01-01', '2023-01-09', '16-17', '1-1'),
(22, 7480, '22-customer-one.png', 1, 2, 'customer', 'one', 'customer1@hotel-gate.com', 2215646, 103, '2023-01-17', 'qwe', '2023-02-10', '2023-02-13', '21-22', '2-5'),
(23, 300, '23-customer-one.png', 1, 1, 'customer', 'one', 'customer1@hotel-gate.com', 2215646, 103, '2023-01-17', 'qwe', '2023-01-30', '2023-02-01', '17', '1'),
(24, 300, '24-customer-one.png', 1, 1, 'customer', 'one', 'customer1@hotel-gate.com', 2215646, 103, '2023-01-17', 'qwe', '2023-02-06', '2023-02-15', '17', '1'),
(25, 711, '25-customer-one.png', 1, 16, 'customer', 'one', 'customer1@hotel-gate.com', 2215646, 103, '2023-01-17', 'qwe', '2023-01-30', '2023-01-31', '33', '2'),
(26, 300, NULL, 1, 1, 'customer', 'one', 'customer1@hotel-gate.com', 2215646, 103, '2023-01-17', 'qwe', '2023-01-29', '2023-02-14', '17', '1'),
(28, 599, '28-MAHA-ALMZROAI.png', 14, 21, 'MAHA', 'ALMZROAI', 'Maha11123800@gmail.com', 538628247, 2147483647, '2023-03-06', '322', '2023-02-07', '2023-02-09', '35', '2'),
(29, 601, '29-MAHA-ALMZROAI.png', 17, 25, 'MAHA', 'ALMZROAI', 'Maha11123800@gmail.com', 538628247, 2147483647, '2023-03-09', '666', '2023-01-01', '2023-01-04', '38', '2'),
(30, 701, '30-MAHA-ALMZROAI.png', 19, 27, 'MAHA', 'ALMZROAI', 'Maha11123800@gmail.com', 538628247, 2147483647, '2023-01-29', '777', '2023-02-05', '2023-02-09', '40', '2');

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `favorite_list`
--
ALTER TABLE `favorite_list`
  ADD CONSTRAINT `favorite_list_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_list_ibfk_2` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `managers`
--
ALTER TABLE `managers`
  ADD CONSTRAINT `managers_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
