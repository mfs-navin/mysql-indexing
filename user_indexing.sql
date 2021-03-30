-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 30, 2021 at 11:24 AM
-- Server version: 8.0.23
-- PHP Version: 7.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_indexing`
--

-- --------------------------------------------------------

--
-- Table structure for table `ordered_items`
--

CREATE TABLE `ordered_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ordered_items`
--

INSERT INTO `ordered_items` (`id`, `order_id`, `product_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 3),
(4, 3, 4),
(5, 3, 5),
(6, 4, 2),
(7, 5, 5),
(8, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `order_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`) VALUES
(1, 'OD101'),
(2, 'OD102'),
(3, 'OD103'),
(4, 'OD104'),
(5, 'OD105');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_code` varchar(10) NOT NULL,
  `product_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `product_code`, `product_description`) VALUES
(1, 'smartphone', 'MOB121', 'A smartphone is a mobile phone that includes advanced functionality beyond making phone calls and sending text messages. Most smartphones have the capability to display photos, play videos, check and send e-mail, and surf the Web. Users also have a much wider range of smartphones to choose from than before.'),
(2, 'microwave oven', 'KIT231', 'Microwave ovens heat food using microwaves, a form of electromagnetic radiation similar to radio waves. A device called a magnetron inside the oven produces microwaves. The microwaves reflect off the metal interior of the oven and cause the water molecules in food to vibrate.'),
(3, 'Refrigerator', 'ELE232', 'A refrigerator (colloquially fridge) is a home appliance consisting of a thermally insulated compartment and a heat pump (mechanical, electronic or chemical) that transfers heat from its inside to its external environment so that its inside is cooled to a temperature below the room temperature.'),
(4, 'Sofa', 'FUR324', 'A couch, also known as a sofa, settee, futon, or chesterfield, is a piece of furniture for seating two or three people. It is commonly found in the form of a bench, with upholstered armrests, and often fitted with springs and tailored cushions'),
(5, 'Television', 'ELE767', 'Television (TV), sometimes shortened to tele or telly, is a telecommunication medium used for transmitting moving images in monochrome (black and white), or in color, and in two or three dimensions and sound. The term can refer to a television set, a television show, or the medium of television transmission.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ordered_items`
--
ALTER TABLE `ordered_items`
  ADD PRIMARY KEY (`id`,`product_id`,`order_id`),
  ADD KEY `ordered_items_order_id` (`order_id`),
  ADD KEY `ordered_items_product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`product_code`);
ALTER TABLE `product` ADD FULLTEXT KEY `product_description` (`product_description`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ordered_items`
--
ALTER TABLE `ordered_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ordered_items`
--
ALTER TABLE `ordered_items`
  ADD CONSTRAINT `ordered_items_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordered_items_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
