-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2020 at 04:05 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `benedict_wong`
--
CREATE DATABASE IF NOT EXISTS `benedict_wong` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `benedict_wong`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cartID` int(10) NOT NULL AUTO_INCREMENT,
  `productID` int(10) NOT NULL,
  `customerID` int(10) NOT NULL,
  `quantity` int(3) NOT NULL,
  PRIMARY KEY (`cartID`),
  KEY `productID` (`productID`),
  KEY `customerID` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customerID` int(10) NOT NULL AUTO_INCREMENT,
  `gender` varchar(6) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `birthDate` date NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderhistory`
--

DROP TABLE IF EXISTS `orderhistory`;
CREATE TABLE IF NOT EXISTS `orderhistory` (
  `orderID` int(10) NOT NULL AUTO_INCREMENT,
  `customerID` int(10) NOT NULL,
  `orderDate` date NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `customerID` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `productID` int(6) NOT NULL AUTO_INCREMENT,
  `productName` text NOT NULL,
  `price` int(7) NOT NULL,
  `rating` int(5) NOT NULL,
  `features` text DEFAULT NULL,
  `deals` int(6) DEFAULT NULL,
  `genre` varchar(20) NOT NULL,
  `releaseDate` date NOT NULL,
  PRIMARY KEY (`productID`),
  KEY `rating` (`rating`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `reviewID` int(10) NOT NULL AUTO_INCREMENT,
  `productID` int(10) NOT NULL,
  `customerID` int(10) NOT NULL,
  `rating` int(5) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`reviewID`),
  KEY `productID` (`productID`),
  KEY `customerID` (`customerID`),
  KEY `rating` (`rating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
