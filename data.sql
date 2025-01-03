-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.44-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for cakestore
CREATE DATABASE IF NOT EXISTS `cakestore` /*!40100 DEFAULT CHARACTER SET armscii8 COLLATE armscii8_bin */;
USE `cakestore`;

-- Dumping structure for table cakestore.carts
CREATE TABLE IF NOT EXISTS `carts` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FK_carts_users` (`user_id`),
  KEY `FK_carts_products` (`product_id`),
  CONSTRAINT `FK_carts_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_carts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table cakestore.carts: ~0 rows (approximately)

-- Dumping structure for table cakestore.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `create_at` date DEFAULT NULL,
  `update_at` date DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table cakestore.categories: ~0 rows (approximately)

-- Dumping structure for table cakestore.orderdetails
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `orderdetail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  PRIMARY KEY (`orderdetail_id`),
  KEY `FK_orderdetails_orders` (`order_id`),
  KEY `FK_orderdetails_products` (`product_id`),
  CONSTRAINT `FK_orderdetails_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orderdetails_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table cakestore.orderdetails: ~0 rows (approximately)

-- Dumping structure for table cakestore.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `status` enum('pending','completed','cancelled') COLLATE armscii8_bin DEFAULT NULL,
  `create_at` date DEFAULT NULL,
  `update_at` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_orders_users` (`user_id`),
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table cakestore.orders: ~0 rows (approximately)

-- Dumping structure for table cakestore.products
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `price` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `create_at` date DEFAULT NULL,
  `update_at` date DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK_products_categories` (`category_id`),
  CONSTRAINT `FK_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table cakestore.products: ~0 rows (approximately)

-- Dumping structure for table cakestore.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `password` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `full_name` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `role` enum('USER','ADMIN') COLLATE armscii8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `create_at` date DEFAULT NULL,
  `update_at` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table cakestore.users: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
