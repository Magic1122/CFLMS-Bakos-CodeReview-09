-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 11:09 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_balint_bakos_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_balint_bakos_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_balint_bakos_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `customer_contact`
--

DROP TABLE IF EXISTS `customer_contact`;
CREATE TABLE `customer_contact` (
  `customer_contact_id` int(11) NOT NULL,
  `customer_address` varchar(85) NOT NULL,
  `customer_zip` int(11) NOT NULL,
  `customer_city` varchar(55) NOT NULL,
  `customer_phone` bigint(20) NOT NULL,
  `customer_email` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_contact`
--

INSERT INTO `customer_contact` (`customer_contact_id`, `customer_address`, `customer_zip`, `customer_city`, `customer_phone`, `customer_email`) VALUES
(1, 'Baker Str. 1', 12540, 'Vienna', 6643542257, 'customer1@gmail.com'),
(2, 'Some Str. 14', 12140, 'Vienna', 6643765757, 'customer2@gmail.com'),
(3, 'Schonbrunn Str. 18', 18540, 'Vienna', 6642142257, 'customer3@gmail.com'),
(4, 'Ottakringer Str. 17/54', 12510, 'Vienna', 6643543217, 'customer4@gmail.com'),
(5, 'Wiener Str. 155/74', 12500, 'Vienna', 6643542123, 'customer5@gmail.com'),
(6, 'Wienerberg Str. 55/82', 12501, 'Vienna', 6643542120, 'customer6@gmail.com'),
(7, 'Prater Str. 12/1', 10500, 'Vienna', 6640542123, 'customer7@gmail.com'),
(8, 'Walter Str. 155/74', 11500, 'Vienna', 6643042123, 'customer8@gmail.com'),
(9, 'Mariahilfer Str. 5/74', 18500, 'Vienna', 6643542023, 'customer9@gmail.com'),
(10, 'Wiener Str. 155/74', 12502, 'Vienna', 6641542123, 'customer10@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `fk_employee_id` int(11) NOT NULL,
  `fk_package_id` int(11) NOT NULL,
  `delivery_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `fk_employee_id`, `fk_package_id`, `delivery_time`) VALUES
(3, 5, 1, '2020-04-16 12:00:00'),
(4, 6, 2, '2020-05-13 12:00:00'),
(5, 5, 3, '2020-06-26 14:30:50'),
(6, 6, 4, '2020-05-13 14:30:50');

--
-- Triggers `delivery`
--
DROP TRIGGER IF EXISTS `set_delivered`;
DELIMITER $$
CREATE TRIGGER `set_delivered` AFTER INSERT ON `delivery` FOR EACH ROW BEGIN
   UPDATE package
   INNER JOIN delivery ON delivery.fk_package_id = package.package_id
   SET package.received = TRUE
   WHERE delivery.fk_package_id = package.package_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `fk_location_id` int(11) NOT NULL,
  `fk_employee_contact_id` int(11) NOT NULL,
  `fk_employee_type_id` int(11) NOT NULL,
  `employee_fname` varchar(55) NOT NULL,
  `employee_lname` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `fk_location_id`, `fk_employee_contact_id`, `fk_employee_type_id`, `employee_fname`, `employee_lname`) VALUES
(1, 1, 1, 1, 'Kethrin', 'Postal'),
(2, 3, 2, 1, 'Johnny', 'Postal'),
(3, 1, 3, 2, 'Manu', 'Sorter'),
(4, 3, 4, 2, 'Jack', 'Sorter'),
(5, 1, 5, 3, 'Thomas', 'Delivery'),
(6, 3, 6, 3, 'Matthias', 'Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `employee_contact`
--

DROP TABLE IF EXISTS `employee_contact`;
CREATE TABLE `employee_contact` (
  `employee_contact_id` int(11) NOT NULL,
  `employee_address` varchar(85) NOT NULL,
  `employee_zip` int(11) NOT NULL,
  `employee_city` varchar(55) NOT NULL,
  `employee_phone` bigint(20) NOT NULL,
  `employee_email` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_contact`
--

INSERT INTO `employee_contact` (`employee_contact_id`, `employee_address`, `employee_zip`, `employee_city`, `employee_phone`, `employee_email`) VALUES
(1, 'Employee Str 25/45', 12541, 'Vienna', 6642105587, 'employee1@post.com'),
(2, 'Employee Str 15/45', 12541, 'Vienna', 6642107587, 'employee2@post.com'),
(3, 'Employee Str 85/45', 12541, 'Vienna', 6642102587, 'employee3@post.com'),
(4, 'Employee Str 75/45', 12541, 'Vienna', 6642100587, 'employee4@post.com'),
(5, 'Employee Str 35/45', 12541, 'Vienna', 6642109587, 'employee5@post.com'),
(6, 'Employee Str 55/45', 12541, 'Vienna', 6642102287, 'employee6@post.com');

-- --------------------------------------------------------

--
-- Table structure for table `employee_type`
--

DROP TABLE IF EXISTS `employee_type`;
CREATE TABLE `employee_type` (
  `employee_type_id` int(11) NOT NULL,
  `employee_type` enum('office-worker','sorter','delivery') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_type`
--

INSERT INTO `employee_type` (`employee_type_id`, `employee_type`) VALUES
(1, 'office-worker'),
(2, 'sorter'),
(3, 'delivery');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `fk_location_address_id` int(11) NOT NULL,
  `fk_location_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `fk_location_address_id`, `fk_location_type_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `location_address`
--

DROP TABLE IF EXISTS `location_address`;
CREATE TABLE `location_address` (
  `location_address_id` int(11) NOT NULL,
  `location_address` varchar(85) NOT NULL,
  `location_zip` int(11) NOT NULL,
  `location_city` varchar(85) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location_address`
--

INSERT INTO `location_address` (`location_address_id`, `location_address`, `location_zip`, `location_city`) VALUES
(1, 'Post Str. 1', 11000, 'Vienna'),
(2, 'Post Str. 20', 11000, 'Vienna'),
(3, 'Pick-up Str. 12', 11000, 'Vienna'),
(4, 'Pick-up Str. 55', 11000, 'Vienna');

-- --------------------------------------------------------

--
-- Table structure for table `location_type`
--

DROP TABLE IF EXISTS `location_type`;
CREATE TABLE `location_type` (
  `location_type_id` int(11) NOT NULL,
  `location_type` enum('office','pick-up') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location_type`
--

INSERT INTO `location_type` (`location_type_id`, `location_type`) VALUES
(1, 'office'),
(2, 'pick-up');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `fk_sender_id` int(11) NOT NULL,
  `fk_receiver_id` int(11) NOT NULL,
  `fk_employee_id` int(11) NOT NULL,
  `fk_location_id` int(11) NOT NULL,
  `fk_package_type_id` int(11) NOT NULL,
  `package_weight` int(11) NOT NULL,
  `send_date` datetime NOT NULL,
  `received` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `fk_sender_id`, `fk_receiver_id`, `fk_employee_id`, `fk_location_id`, `fk_package_type_id`, `package_weight`, `send_date`, `received`) VALUES
(1, 1, 1, 1, 1, 1, 180, '2020-04-14 12:00:00', 1),
(2, 2, 2, 2, 3, 2, 1400, '2020-05-11 12:00:00', 1),
(3, 3, 3, 1, 1, 3, 2500, '2020-06-24 14:30:50', 1),
(4, 4, 4, 2, 3, 4, 5000, '2020-05-11 14:30:50', 1),
(5, 1, 1, 1, 1, 1, 180, '2020-07-10 12:00:00', 0),
(6, 2, 2, 2, 3, 2, 1400, '2020-07-10 12:00:00', 0),
(7, 3, 3, 1, 1, 3, 2500, '2020-07-10 12:00:00', 0),
(8, 4, 4, 2, 3, 4, 5000, '2020-07-10 12:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
CREATE TABLE `package_type` (
  `package_type_id` int(11) NOT NULL,
  `package_type` enum('letter','small-pkg','medium-pkg','big-pkg') NOT NULL,
  `max_weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package_type`
--

INSERT INTO `package_type` (`package_type_id`, `package_type`, `max_weight`) VALUES
(1, 'letter', 200),
(2, 'small-pkg', 1500),
(3, 'medium-pkg', 3000),
(4, 'big-pkg', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `receiver`
--

DROP TABLE IF EXISTS `receiver`;
CREATE TABLE `receiver` (
  `receiver_id` int(11) NOT NULL,
  `fk_customer_contact_id` int(11) NOT NULL,
  `receiver_fname` varchar(55) NOT NULL,
  `receiver_lname` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receiver`
--

INSERT INTO `receiver` (`receiver_id`, `fk_customer_contact_id`, `receiver_fname`, `receiver_lname`) VALUES
(1, 6, 'Jenny', 'Brenner'),
(2, 7, 'Collie', 'Madison'),
(3, 8, 'Thomas', 'Muller'),
(4, 9, 'Timi', 'Berg'),
(5, 10, 'Lola', 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

DROP TABLE IF EXISTS `sender`;
CREATE TABLE `sender` (
  `sender_id` int(11) NOT NULL,
  `fk_customer_contact_id` int(11) NOT NULL,
  `sender_fname` varchar(55) NOT NULL,
  `sender_lname` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`sender_id`, `fk_customer_contact_id`, `sender_fname`, `sender_lname`) VALUES
(1, 1, 'Paul', 'Brenner'),
(2, 2, 'Vivien', 'Madison'),
(3, 3, 'Gerhard', 'Muller'),
(4, 4, 'Tamara', 'Berg'),
(5, 5, 'Johnny', 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `sort`
--

DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `sort_id` int(11) NOT NULL,
  `fk_employee_id` int(11) NOT NULL,
  `fk_package_id` int(11) NOT NULL,
  `sort_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sort`
--

INSERT INTO `sort` (`sort_id`, `fk_employee_id`, `fk_package_id`, `sort_date`) VALUES
(1, 3, 1, '2020-04-15 12:00:00'),
(2, 4, 2, '2020-05-12 12:00:00'),
(3, 3, 3, '2020-06-25 14:30:50'),
(4, 4, 4, '2020-05-12 14:30:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_contact`
--
ALTER TABLE `customer_contact`
  ADD PRIMARY KEY (`customer_contact_id`),
  ADD UNIQUE KEY `customer_phone` (`customer_phone`),
  ADD UNIQUE KEY `customer_email` (`customer_email`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD UNIQUE KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_employee_contact_id` (`fk_employee_contact_id`),
  ADD KEY `fk_employee_type_id` (`fk_employee_type_id`);

--
-- Indexes for table `employee_contact`
--
ALTER TABLE `employee_contact`
  ADD PRIMARY KEY (`employee_contact_id`),
  ADD UNIQUE KEY `employee_phone` (`employee_phone`),
  ADD UNIQUE KEY `employee_email` (`employee_email`);

--
-- Indexes for table `employee_type`
--
ALTER TABLE `employee_type`
  ADD PRIMARY KEY (`employee_type_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_location_address_id` (`fk_location_address_id`),
  ADD KEY `fk_location_type_id` (`fk_location_type_id`);

--
-- Indexes for table `location_address`
--
ALTER TABLE `location_address`
  ADD PRIMARY KEY (`location_address_id`);

--
-- Indexes for table `location_type`
--
ALTER TABLE `location_type`
  ADD PRIMARY KEY (`location_type_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`),
  ADD KEY `fk_receiver_id` (`fk_receiver_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_package_type_id` (`fk_package_type_id`);

--
-- Indexes for table `package_type`
--
ALTER TABLE `package_type`
  ADD PRIMARY KEY (`package_type_id`);

--
-- Indexes for table `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`receiver_id`),
  ADD KEY `fk_customer_contact_id` (`fk_customer_contact_id`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`sender_id`),
  ADD KEY `fk_customer_contact_id` (`fk_customer_contact_id`);

--
-- Indexes for table `sort`
--
ALTER TABLE `sort`
  ADD PRIMARY KEY (`sort_id`),
  ADD UNIQUE KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_contact`
--
ALTER TABLE `customer_contact`
  MODIFY `customer_contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_contact`
--
ALTER TABLE `employee_contact`
  MODIFY `employee_contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_type`
--
ALTER TABLE `employee_type`
  MODIFY `employee_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `location_address`
--
ALTER TABLE `location_address`
  MODIFY `location_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `location_type`
--
ALTER TABLE `location_type`
  MODIFY `location_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `package_type`
--
ALTER TABLE `package_type`
  MODIFY `package_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `receiver`
--
ALTER TABLE `receiver`
  MODIFY `receiver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sender`
--
ALTER TABLE `sender`
  MODIFY `sender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sort`
--
ALTER TABLE `sort`
  MODIFY `sort_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`fk_employee_contact_id`) REFERENCES `employee_contact` (`employee_contact_id`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`fk_employee_type_id`) REFERENCES `employee_type` (`employee_type_id`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`fk_location_address_id`) REFERENCES `location_address` (`location_address_id`),
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`fk_location_type_id`) REFERENCES `location_type` (`location_type_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_receiver_id`) REFERENCES `receiver` (`receiver_id`),
  ADD CONSTRAINT `package_ibfk_3` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `package_ibfk_4` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `package_ibfk_5` FOREIGN KEY (`fk_package_type_id`) REFERENCES `package_type` (`package_type_id`);

--
-- Constraints for table `receiver`
--
ALTER TABLE `receiver`
  ADD CONSTRAINT `receiver_ibfk_1` FOREIGN KEY (`fk_customer_contact_id`) REFERENCES `customer_contact` (`customer_contact_id`);

--
-- Constraints for table `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`fk_customer_contact_id`) REFERENCES `customer_contact` (`customer_contact_id`);

--
-- Constraints for table `sort`
--
ALTER TABLE `sort`
  ADD CONSTRAINT `sort_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `sort_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
