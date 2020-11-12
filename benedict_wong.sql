-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2020 at 03:06 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

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
CREATE TABLE `cart` (
  `cartID` int(10) NOT NULL,
  `productID` int(10) NOT NULL,
  `customerID` int(10) NOT NULL,
  `quantity` int(3) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartID`, `productID`, `customerID`, `quantity`, `status`) VALUES
(4, 161, 2, 2, 'unpaid'),
(8, 51, 2, 2, 'unpaid'),
(9, 209, 2, 5, 'unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customerID` int(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `birthDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `firstName`, `lastName`, `gender`, `email`, `password`, `birthDate`) VALUES
(2, 'Bert', 'Cheung', 'Male', '65d81a4c961d11bb6d1cd06ef441c3b6', '098f6bcd4621d373cade4e832627b4f6', '2002-12-29'),
(3, 'bob', 'jones', 'Male', 'b642b4217b34b1e8d3bd915fc65c4452', '098f6bcd4621d373cade4e832627b4f6', '2002-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `orderhistory`
--

DROP TABLE IF EXISTS `orderhistory`;
CREATE TABLE `orderhistory` (
  `orderID` int(10) NOT NULL,
  `customerID` int(10) NOT NULL,
  `orderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productID` int(6) NOT NULL,
  `productName` text NOT NULL,
  `price` int(7) NOT NULL,
  `features` text DEFAULT NULL,
  `discount` decimal(6,0) DEFAULT NULL,
  `genre` varchar(20) NOT NULL,
  `console` varchar(100) NOT NULL,
  `releaseDate` date NOT NULL,
  `finalPrice` double GENERATED ALWAYS AS (`price` * (100.0 - `discount`) / 100.0) STORED,
  `productDesc` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `price`, `features`, `discount`, `genre`, `console`, `releaseDate`, `productDesc`) VALUES
(1, '3-Demon', 59, 'Controller Support', '45', 'Singleplayer', 'Xbox', '2004-04-25', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(2, 'Aces of the Pacific', 25, 'Controller Support', '50', 'Multiplayer', 'Xbox', '2007-12-14', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(3, 'Aces Over Europe', 31, 'Online Multiplayer', '69', 'Puzzle', 'PS5', '2010-03-30', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(4, 'After Burner', 48, 'Cross-Platform', '26', 'Shooting', 'Xbox', '2012-02-15', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(5, 'Air Hockey', 100, 'Split-screen', '0', 'Sports', 'PS4', '2018-04-14', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(6, 'Alien Trilogy', 70, 'Story-based', '0', 'Rhythm', 'PC', '2015-09-08', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(7, 'Aliens Versus Predator', 91, 'Controller Support', '39', 'Rhythm', 'PS4', '2016-01-20', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(8, 'Aliens Versus Predator: Gold Edition', 61, 'Online Multiplayer', '0', 'Strategy', 'Xbox', '2019-05-06', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(9, 'Alone in the Dark', 42, 'Controller Support', '23', 'RPG', 'Xbox', '2017-07-12', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(10, 'American McGee\'s Alice', 75, 'Story-based', '79', 'Casual', 'PC', '2019-12-09', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(11, 'Ancients 1: Death Watch', 68, 'Controller Support', '61', 'Fighting', 'PS5', '2014-09-17', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(12, 'Arcade Volleyball', 74, 'Online Multiplayer', '0', 'Strategy', 'PC', '2017-02-27', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(13, 'The Arrival', 98, 'Online Multiplayer', '20', 'Shooting', 'PC', '2013-06-20', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(14, 'Ballyhoo', 29, 'Story-based', '0', 'Puzzle', 'Nintendo Switch', '2005-05-05', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(15, 'Barbarian', 67, 'Cross-Platform', '54', 'Action', 'PC', '2013-10-01', 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(16, 'The Bard\'s Tale III: Thief of Fate', 90, 'Story-based', '0', 'Rhythm', 'PS5', '2003-07-25', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(17, 'BBC Mastermind', 54, 'Online Multiplayer', '30', 'Adventure', 'PS4', '2003-05-01', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(18, 'Beneath a Steel Sky', 72, 'Story-based', '63', 'Casual', 'Xbox', '2018-05-05', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(19, 'Bioscopia: Where Science Conquers Evil', 63, 'Controller Support', '63', 'Fighting', 'Xbox', '2018-12-04', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(20, 'BipBop II', 16, 'Cross-Platform', '0', 'Casual', 'Xbox', '2013-08-22', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(21, 'Birthright: The Gorgon\'s Alliance', 13, 'Story-based', '26', 'Rhythm', 'Xbox', '2014-06-02', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(22, 'The Black Cauldron', 76, 'Story-based', '89', 'Puzzle', 'Xbox', '2012-04-20', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(23, 'The Black Mirror', 13, 'Split-screen', '11', 'Action', 'Nintendo Switch', '2015-05-05', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(24, 'Blood', 24, 'Cross-Platform', '40', 'Sports', 'Xbox', '2020-02-07', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(25, 'Blue Force', 59, 'Story-based', '0', 'Fighting', 'PS4', '2020-03-28', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.'),
(26, 'Bob Morane: Jungle 1', 78, 'Story-based', '0', 'Singleplayer', 'Nintendo Switch', '2003-02-02', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(27, 'Border Zone', 26, 'Story-based', '28', 'Multiplayer', 'PC', '2013-10-20', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(28, 'Brian Jacks Superstar Challenge', 20, 'Cross-Platform', '10', 'Shooting', 'PS4', '2000-05-14', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(29, 'Bubble Bobble', 26, 'Controller Support', '81', 'Puzzle', 'PC', '2018-10-27', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(30, 'Bureaucracy', 66, 'Online Multiplayer', '38', 'RPG', 'PS4', '2009-06-03', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.'),
(31, 'Cabal', 60, 'Online Multiplayer', '0', 'Casual', 'PS5', '2001-12-18', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(32, 'Call of Cthulhu: Shadow of the Comet', 20, 'Split-screen', '78', 'Casual', 'PS5', '2013-10-30', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(33, 'The Cameron Files: Pharaoh\'s Curse', 13, 'Online Multiplayer', '0', 'Casual', 'Xbox', '2012-02-04', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(34, 'The Cameron Files: Secret at Loch Ness', 66, 'Online Multiplayer', '77', 'Multiplayer', 'Xbox', '2014-07-19', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(35, 'Carrier Command', 17, 'Controller Support', '17', 'RPG', 'Nintendo Switch', '2018-05-04', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),
(36, 'Castle Infinity', 42, 'Cross-Platform', '69', 'Multiplayer', 'Nintendo Switch', '2006-06-03', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(37, 'Castle of Illusion starring Mickey Mouse', 50, 'Story-based', '35', 'Strategy', 'PS5', '2010-05-05', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(38, 'The Catacomb Abyss', 17, 'Cross-Platform', '0', 'Multiplayer', 'Xbox', '2012-12-17', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(39, 'The Cave', 82, 'Controller Support', '0', 'Adventure', 'PS4', '2001-09-02', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(40, 'Caverns of Xaskazien', 70, 'Cross-Platform', '43', 'Strategy', 'PS4', '2012-02-16', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(41, 'The Chaos Engine 2', 85, 'Split-screen', '68', 'Strategy', 'Nintendo Switch', '2013-03-31', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(42, 'Chewy: Esc from F5', 70, 'Story-based', '0', 'Casual', 'PS5', '2009-04-05', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.'),
(43, 'Chocobo no Fushigi na Dungeon', 78, 'Story-based', '0', 'Sports', 'PC', '2006-01-20', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(44, 'Chocobo\'s Dungeon 2', 24, 'Controller Support', '0', 'Sports', 'Xbox', '2009-04-08', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(45, 'Chuck Rock', 31, 'Controller Support', '0', 'Casual', 'Nintendo Switch', '2016-12-02', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(46, 'Classic Text Adventure Masterpieces', 51, 'Controller Support', '0', 'Strategy', 'PC', '2006-06-12', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(47, 'Code-Name: Iceman', 14, 'Online Multiplayer', '48', 'Sports', 'Nintendo Switch', '2002-10-25', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(48, 'The Colonel\'s Bequest', 96, 'Split-screen', '76', 'Multiplayer', 'PC', '2015-04-16', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(49, 'Command & Conquer', 7, 'Story-based', '48', 'Casual', 'Nintendo Switch', '2006-07-16', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(50, 'Commandos: Behind Enemy Lines', 35, 'Story-based', '0', 'Casual', 'PS5', '2003-09-13', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(51, 'Contra', 75, 'Story-based', '65', 'Shooting', 'Nintendo Switch', '2020-08-19', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(52, 'Cutthroats', 2, 'Split-screen', '0', 'Singleplayer', 'Nintendo Switch', '2005-12-31', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(53, 'Cutthroats: Terror on the High Seas', 41, 'Split-screen', '74', 'Action', 'Xbox', '2010-10-23', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(54, 'The Dagger of Amon Ra', 47, 'Split-screen', '88', 'Puzzle', 'PC', '2013-11-01', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(55, 'Dark Fall: The Journal', 61, 'Story-based', '0', 'Fighting', 'PS5', '2013-04-25', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(56, 'Dark Seed', 2, 'Story-based', '0', 'Casual', 'PC', '2005-07-02', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(57, 'Decision in the Desert', 14, 'Cross-Platform', '19', 'Multiplayer', 'PS4', '2017-01-24', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(58, 'Descent', 49, 'Cross-Platform', '43', 'Fighting', 'Xbox', '2013-01-15', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(59, 'Desert Strike: Return to the Gulf', 19, 'Story-based', '41', 'Action', 'Xbox', '2017-09-03', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(60, 'Deus Ex', 62, 'Story-based', '80', 'Rhythm', 'Nintendo Switch', '2011-12-20', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(61, 'Dig Dug', 6, 'Online Multiplayer', '0', 'Rhythm', 'Xbox', '2019-06-26', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(62, 'Disney\'s Hercules', 28, 'Story-based', '68', 'Fighting', 'PS5', '2005-03-26', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.'),
(63, 'Donkey Kong', 84, 'Cross-Platform', '48', 'RPG', 'PC', '2008-08-30', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(64, 'Donkey Kong Country 3: Dixie Kong\'s Double Trou...', 20, 'Story-based', '63', 'Multiplayer', 'Nintendo Switch', '2020-05-29', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(65, 'Dr. Dumont\'s Wild P.A.R.T.I.', 77, 'Cross-Platform', '45', 'Action', 'PS5', '2007-02-23', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(66, 'Dr. Dumont\'s Wild P.A.R.T.I.', 11, 'Split-screen', '45', 'Puzzle', 'PS5', '2002-07-23', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(67, 'Dracula: The Last Sanctuary', 22, 'Story-based', '48', 'Rhythm', 'Nintendo Switch', '2012-09-10', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(68, 'Dragon Wars', 75, 'Online Multiplayer', '54', 'Rhythm', 'Xbox', '2007-10-31', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(69, 'Drakan: Order of the Flame', 15, 'Split-screen', '61', 'Adventure', 'Nintendo Switch', '2000-09-23', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(70, 'The Duel: Test Drive II', 89, 'Online Multiplayer', '38', 'Puzzle', 'PS5', '2001-12-10', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(71, 'Dungeon Keeper', 37, 'Online Multiplayer', '75', 'Adventure', 'Xbox', '2016-02-14', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(72, 'Dungeon Master', 60, 'Cross-Platform', '0', 'Action', 'PS4', '2002-01-11', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(73, 'Dungeon Siege', 29, 'Split-screen', '68', 'Adventure', 'PC', '1999-11-02', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(74, 'Egypt II: The Heliopolis Prophecy', 95, 'Controller Support', '52', 'Fighting', 'PC', '2005-06-20', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.'),
(75, 'The Elder Scrolls Adventures: Redguard', 34, 'Story-based', '43', 'RPG', 'Nintendo Switch', '2000-03-29', 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(76, 'The Elder Scrolls: Arena', 2, 'Split-screen', '21', 'Strategy', 'Nintendo Switch', '2010-11-23', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(77, 'Essex', 38, 'Story-based', '0', 'Fighting', 'Nintendo Switch', '2014-12-22', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.'),
(78, 'Eye of the Beholder', 12, 'Cross-Platform', '67', 'Multiplayer', 'Nintendo Switch', '2015-11-01', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(79, 'FIFA International Soccer', 22, 'Story-based', '0', 'Singleplayer', 'PS4', '2005-01-04', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.'),
(80, 'Flashback: The Quest for Identity', 41, 'Story-based', '0', 'Adventure', 'PC', '2005-02-10', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(81, 'The Fool\'s Errand', 31, 'Cross-Platform', '26', 'RPG', 'Xbox', '2003-07-19', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(82, 'Game & Watch Gallery', 35, 'Online Multiplayer', '0', 'Rhythm', 'Nintendo Switch', '2011-07-28', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(83, 'Ghostbusters', 71, 'Story-based', '0', 'Singleplayer', 'Xbox', '2009-10-26', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(84, 'Ghosts \'N Goblins', 55, 'Story-based', '73', 'Adventure', 'PS4', '2010-08-29', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(85, 'Giants: Citizen Kabuto', 20, 'Online Multiplayer', '0', 'Rhythm', 'Nintendo Switch', '2005-11-18', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(86, 'Gold Rush!', 62, 'Controller Support', '0', 'Adventure', 'PS4', '2004-01-29', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(87, 'GoldenEye 007', 66, 'Split-screen', '0', 'RPG', 'PC', '2005-07-25', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(88, 'Guilty', 7, 'Split-screen', '79', 'Rhythm', 'PS5', '2011-01-21', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(89, 'Gunship 2000', 22, 'Cross-Platform', '0', 'Action', 'Nintendo Switch', '2016-01-16', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(90, 'Hamtaro: Ham-Hams Unite!', 9, 'Split-screen', '46', 'Action', 'PS4', '2012-02-19', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(91, 'Harlan Ellison: I Have No Mouth', 83, 'Cross-Platform', '24', 'Strategy', 'PC', '2009-10-21', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(92, 'and I Must Scream', 27, 'Split-screen', '47', 'Rhythm', 'PS5', '2006-11-13', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(93, 'Heart of the Alien: Out of this World Parts I a...', 50, 'Online Multiplayer', '0', 'Puzzle', 'Xbox', '2019-11-11', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(94, 'Heretic: Shadow of the Serpent Riders', 86, 'Online Multiplayer', '56', 'Shooting', 'Xbox', '2010-09-29', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(95, 'Hodj \'n\' Podj', 15, 'Online Multiplayer', '0', 'Action', 'Nintendo Switch', '2004-07-10', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(96, 'Hollywood Hijinx', 48, 'Online Multiplayer', '0', 'Multiplayer', 'PC', '2005-08-18', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(97, 'Hudson Hawk', 73, 'Online Multiplayer', '0', 'Adventure', 'Xbox', '2016-05-03', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(98, 'Hulk', 67, 'Controller Support', '0', 'RPG', 'PS4', '2013-12-29', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.'),
(99, 'ICO', 49, 'Online Multiplayer', '0', 'Casual', 'PC', '2000-11-18', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(100, 'Indiana Jones and the Fate of Atlantis', 7, 'Story-based', '40', 'Singleplayer', 'Nintendo Switch', '2001-05-10', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(101, 'Indiana Jones and the Last Crusade: The Graphic...', 62, 'Online Multiplayer', '0', 'Rhythm', 'Nintendo Switch', '2003-06-07', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(102, 'Infidel', 16, 'Online Multiplayer', '0', 'Rhythm', 'Xbox', '2012-07-05', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.'),
(103, 'Inherit the Earth: Quest for the Orb', 37, 'Story-based', '68', 'Fighting', 'PS5', '2007-02-12', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(104, 'Innocent Until Caught', 92, 'Controller Support', '72', 'Casual', 'PS4', '2008-05-24', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(105, 'Interstate \'76', 33, 'Controller Support', '0', 'Sports', 'Xbox', '2003-04-15', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(106, 'Isis', 38, 'Online Multiplayer', '0', 'Fighting', 'PS5', '2007-04-25', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(107, 'James Clavell\'s Shogun', 72, 'Cross-Platform', '0', 'RPG', 'PS5', '2005-10-15', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(108, 'Jazz Jackrabbit', 90, 'Split-screen', '0', 'Rhythm', 'PC', '1999-02-17', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(109, 'Journey: The Quest Begins', 94, 'Online Multiplayer', '0', 'Casual', 'Xbox', '2015-11-18', 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(110, 'Jungle Strike', 79, 'Cross-Platform', '84', 'RPG', 'PS5', '1999-03-23', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(111, 'King\'s Quest V: Absence Makes the Heart Go Yonder!', 96, 'Cross-Platform', '48', 'Multiplayer', 'PS4', '2013-09-02', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(112, 'Kingdom of Kroz II', 30, 'Controller Support', '0', 'RPG', 'PC', '2002-05-08', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(113, 'Klonoa: Empire of Dreams', 67, 'Story-based', '0', 'Adventure', 'PS4', '2007-08-10', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(114, 'Knight Orc', 48, 'Split-screen', '54', 'Casual', 'PC', '2017-10-27', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(115, 'Krypton Egg', 49, 'Cross-Platform', '0', 'Casual', 'PS5', '2009-02-04', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(116, 'Lands of Lore: Guardians of Destiny', 63, 'Cross-Platform', '66', 'Singleplayer', 'Nintendo Switch', '2017-01-20', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(117, 'Leather Goddesses of Phobos! 2: Gas Pump Girls ...', 35, 'Cross-Platform', '0', 'Shooting', 'PS4', '2002-03-11', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(118, 'The Legend of Zelda: Majora\'s Mask', 81, 'Online Multiplayer', '28', 'Strategy', 'PS4', '2013-06-28', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(119, 'The Legend of Zelda: Ocarina of Time', 89, 'Controller Support', '78', 'Sports', 'PS5', '2008-04-02', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(120, 'Leisure Suit Larry 1: In the Land of the Loung...', 75, 'Split-screen', '0', 'RPG', 'Xbox', '2008-02-05', 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(121, 'Leisure Suit Larry 5: Passionate Patti Does a L...', 59, 'Online Multiplayer', '87', 'Puzzle', 'Nintendo Switch', '2000-02-23', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(122, 'Leisure Suit Larry 6: Shape Up or Slip Out!', 33, 'Story-based', '19', 'Strategy', 'PC', '2012-07-11', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(123, 'Leisure Suit Larry III: Passionate Patti in Pur...', 92, 'Split-screen', '20', 'Casual', 'Nintendo Switch', '2020-04-28', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),
(124, 'LHX: Attack Chopper', 53, 'Split-screen', '15', 'RPG', 'Nintendo Switch', '2003-05-29', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(125, 'Liath: WorldSpiral', 66, 'Split-screen', '52', 'Fighting', 'Nintendo Switch', '2009-05-01', 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(126, 'The Longest Journey', 63, 'Split-screen', '90', 'Strategy', 'PC', '2007-07-04', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(127, 'Loom', 51, 'Online Multiplayer', '0', 'Singleplayer', 'PS5', '2008-09-15', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(128, 'The Lost Treasures of Infocom II', 9, 'Cross-Platform', '82', 'Shooting', 'Xbox', '1999-05-23', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(129, 'The Lost Treasures of Infocom', 10, 'Online Multiplayer', '0', 'Singleplayer', 'Xbox', '2005-03-09', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.'),
(130, 'Lure of the Temptress', 86, 'Online Multiplayer', '0', 'Fighting', 'PS4', '2011-03-30', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(131, 'Magic Dimension', 11, 'Split-screen', '0', 'Strategy', 'Xbox', '2007-08-06', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(132, 'Magic School Bus Discovers Flight', 22, 'Split-screen', '63', 'Sports', 'Xbox', '2003-09-24', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(133, 'Magic Worlds', 93, 'Online Multiplayer', '24', 'Adventure', 'Nintendo Switch', '2012-08-06', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.'),
(134, 'Manhunter: New York', 44, 'Online Multiplayer', '33', 'Casual', 'Xbox', '2018-05-17', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(135, 'Maniac Mansion', 45, 'Online Multiplayer', '0', 'RPG', 'PS5', '2010-12-21', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(136, 'Master of Orion', 41, 'Story-based', '0', 'Casual', 'PS4', '2017-12-15', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(137, 'Mean Streets', 44, 'Online Multiplayer', '59', 'Singleplayer', 'Xbox', '2013-03-23', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(138, 'Metal Gear Solid', 61, 'Controller Support', '13', 'Singleplayer', 'PC', '2018-02-04', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(139, 'Moon Bugs', 47, 'Online Multiplayer', '11', 'Shooting', 'PS5', '2017-03-04', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(140, 'Mortal Kombat', 25, 'Cross-Platform', '43', 'Sports', 'PC', '2007-06-24', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),
(141, 'Myth: The Fallen Lords', 54, 'Story-based', '0', 'Strategy', 'Xbox', '2003-11-22', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(142, 'Nancy Drew: Message in a Haunted Mansion', 84, 'Online Multiplayer', '0', 'RPG', 'Nintendo Switch', '2013-06-19', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(143, 'Narsillion: Leithian Another Story', 29, 'Controller Support', '75', 'Action', 'Nintendo Switch', '2017-03-31', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(144, 'Normality', 85, 'Cross-Platform', '69', 'Sports', 'PS4', '2020-05-07', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(145, 'North & South: The Game', 17, 'Cross-Platform', '67', 'Rhythm', 'Xbox', '2016-08-19', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(146, 'Novastorm', 13, 'Split-screen', '0', 'Puzzle', 'PC', '2012-12-18', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(147, 'Nyet', 4, 'Cross-Platform', '0', 'Multiplayer', 'PS4', '2001-07-08', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(148, 'Oddworld: Abe\'s Oddysee', 65, 'Cross-Platform', '0', 'Action', 'Nintendo Switch', '2020-02-05', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(149, 'Of Orcs and Men', 19, 'Cross-Platform', '78', 'Rhythm', 'Xbox', '2015-07-09', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(150, 'Olympic Decathlon', 57, 'Controller Support', '22', 'Rhythm', 'PS5', '2002-07-27', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.');
INSERT INTO `product` (`productID`, `productName`, `price`, `features`, `discount`, `genre`, `console`, `releaseDate`, `productDesc`) VALUES
(151, 'The Oregon Trail', 29, 'Online Multiplayer', '0', 'Rhythm', 'PS4', '2017-07-03', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'),
(152, 'Out of This World', 93, 'Online Multiplayer', '13', 'Strategy', 'Xbox', '2004-04-16', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(153, 'Overlord', 19, 'Controller Support', '0', 'Adventure', 'PC', '2008-11-11', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(154, 'Pac-Man', 46, 'Online Multiplayer', '49', 'Casual', 'PS4', '2006-06-15', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(155, 'Pac-Man Collection', 12, 'Online Multiplayer', '41', 'Singleplayer', 'PS4', '2008-03-11', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(156, 'The Pandora Directive', 48, 'Cross-Platform', '0', 'Strategy', 'PS5', '2008-09-30', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'),
(157, 'Payday 2', 7, 'Controller Support', '71', 'Strategy', 'Xbox', '2012-01-26', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(158, 'Pengo', 73, 'Cross-Platform', '0', 'RPG', 'PS5', '2002-01-17', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(159, 'Perry Mason: The Case of the Mandarin Murder', 85, 'Story-based', '0', 'Singleplayer', 'PC', '2006-08-30', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(160, 'Petka 3: Vozvraschenie Alaski', 45, 'Cross-Platform', '0', 'Singleplayer', 'PS4', '2001-08-17', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(161, 'Pinball Arcade Table Pack 8: Twilight Zone', 71, 'Online Multiplayer', '73', 'Fighting', 'PS5', '2020-10-19', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(162, 'Pinball Arcade: Season Two Pass', 50, 'Cross-Platform', '0', 'Rhythm', 'PS4', '2011-03-02', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),
(163, 'Pirates! Gold', 7, 'Story-based', '0', 'Sports', 'PC', '2005-08-26', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(164, 'Planescape: Torment', 71, 'Online Multiplayer', '0', 'Action', 'PS5', '2018-09-18', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(165, 'Planetfall', 4, 'Split-screen', '0', 'Sports', 'PS5', '2008-10-01', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(166, 'Poko Memorial: 18 Hole Miniature Golf', 95, 'Cross-Platform', '0', 'Action', 'Nintendo Switch', '2001-09-15', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(167, 'Populous: The Beginning', 79, 'Story-based', '22', 'Casual', 'Xbox', '2020-07-28', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.'),
(168, 'Prince of Persia', 22, 'Story-based', '0', 'RPG', 'PC', '2015-03-09', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(169, 'Privateer 2: The Darkening', 62, 'Story-based', '0', 'Strategy', 'PS5', '2012-04-26', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(170, 'Psychic Detective', 43, 'Cross-Platform', '0', 'Adventure', 'PS4', '2010-06-15', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(171, 'Puyo Pop', 32, 'Cross-Platform', '0', 'Sports', 'PS4', '2018-10-19', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(172, 'Quake', 18, 'Controller Support', '23', 'Shooting', 'Nintendo Switch', '2008-05-20', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(173, 'Rayman', 42, 'Story-based', '35', 'Shooting', 'Nintendo Switch', '2008-10-01', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(174, 'Rayman 2: The Great Escape', 24, 'Cross-Platform', '0', 'RPG', 'PC', '2017-12-14', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(175, 'Red Baron', 48, 'Story-based', '0', 'Rhythm', 'Nintendo Switch', '2001-10-14', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(176, 'Riddle of the Sphinx: An Egyptian Adventure', 71, 'Story-based', '0', 'Adventure', 'Xbox', '2018-05-17', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(177, 'Rise of the Triad: Dark War', 62, 'Story-based', '0', 'Action', 'PC', '2004-11-06', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(178, 'Rogue', 93, 'Online Multiplayer', '0', 'Rhythm', 'PS4', '2005-07-21', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(179, 'RollerCoaster Tycoon', 52, 'Split-screen', '80', 'Strategy', 'Nintendo Switch', '2016-12-21', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(180, 'Saints Row Double Pack', 94, 'Split-screen', '42', 'Shooting', 'PS5', '2006-08-15', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),
(181, 'Santa Fe Mysteries: The Elk Moon Murder', 68, 'Split-screen', '47', 'Adventure', 'PC', '2001-07-31', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),
(182, 'Science Girls!', 44, 'Story-based', '51', 'Singleplayer', 'Xbox', '2012-06-06', 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(183, 'Secret Agent', 70, 'Online Multiplayer', '14', 'Singleplayer', 'Xbox', '2010-10-01', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),
(184, 'The Secret of Monkey Island', 18, 'Split-screen', '73', 'Action', 'Xbox', '2008-07-27', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(185, 'The Seven Cities of Gold', 65, 'Online Multiplayer', '0', 'Fighting', 'Nintendo Switch', '2016-02-19', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(186, 'Shadow Tower: Abyss', 17, 'Controller Support', '0', 'Action', 'Nintendo Switch', '2016-01-06', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'),
(187, 'Sherlock: The Riddle of the Crown Jewels', 58, 'Split-screen', '0', 'Rhythm', 'Xbox', '2007-04-04', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(188, 'Shrek', 98, 'Online Multiplayer', '21', 'Action', 'Nintendo Switch', '2003-12-20', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(189, 'Sid Meier\'s CivNet', 25, 'Split-screen', '0', 'RPG', 'Nintendo Switch', '2001-08-29', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(190, 'Sid Meier\'s Pirates!', 45, 'Cross-Platform', '39', 'Sports', 'Xbox', '2015-08-24', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(191, 'SimAnt', 76, 'Controller Support', '28', 'Puzzle', 'Xbox', '2003-01-28', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(192, 'SimCity', 55, 'Online Multiplayer', '71', 'RPG', 'Nintendo Switch', '2007-12-30', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),
(193, 'Soko-Ban', 28, 'Controller Support', '10', 'Puzzle', 'PS4', '2018-09-27', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.'),
(194, 'Solar Winds: The Escape', 70, 'Online Multiplayer', '34', 'RPG', 'PS5', '2018-03-01', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(195, 'Space Quest 6: Roger Wilco in the Spinal Frontier', 8, 'Controller Support', '0', 'Adventure', 'PC', '2016-10-23', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(196, 'Space Quest I: Roger Wilco in the Sarien Encounter', 53, 'Cross-Platform', '12', 'Singleplayer', 'Nintendo Switch', '2004-12-20', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'),
(197, 'Space Quest II: Chapter II - Vohaul\'s Revenge', 31, 'Story-based', '0', 'Casual', 'PS5', '2004-12-02', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(198, 'Space Quest III: The Pirates of Pestulon', 72, 'Online Multiplayer', '0', 'Casual', 'Xbox', '2011-01-12', 'In congue. Etiam justo. Etiam pretium iaculis justo.'),
(199, 'Space Quest IV: Roger Wilco and the Time Rippers', 100, 'Split-screen', '20', 'Sports', 'PS5', '2015-06-01', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(200, 'Space Quest V: The Next Mutation', 37, 'Split-screen', '89', 'Sports', 'PS4', '2017-05-18', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(201, 'Spear of Destiny', 69, 'Split-screen', '81', 'Multiplayer', 'Xbox', '2016-02-15', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(202, 'Speed Ace', 92, 'Story-based', '0', 'Multiplayer', 'PS4', '2014-07-19', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'),
(203, 'Spycraft: The Great Game', 34, 'Cross-Platform', '0', 'Rhythm', 'PS5', '2005-09-16', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(204, 'Starcross', 42, 'Split-screen', '0', 'Singleplayer', 'PC', '2007-10-04', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.'),
(205, 'Starflight', 29, 'Controller Support', '0', 'Shooting', 'Nintendo Switch', '2014-07-21', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(206, 'Stationfall', 37, 'Story-based', '82', 'Rhythm', 'PS4', '2015-03-07', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(207, 'Stonekeep', 56, 'Online Multiplayer', '0', 'Action', 'PC', '2015-02-16', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'),
(208, 'Strife', 43, 'Story-based', '66', 'RPG', 'PC', '2005-05-04', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.'),
(209, 'Suchie-Pai Adventure: Doki Doki Nightmare', 57, 'Online Multiplayer', '21', 'Strategy', 'Nintendo Switch', '2020-08-02', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.'),
(210, 'Suspect', 86, 'Story-based', '0', 'Casual', 'PS4', '2002-06-01', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'),
(211, 'Swords of Glass', 62, 'Story-based', '47', 'RPG', 'PC', '2002-02-15', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(212, 'Syberia', 98, 'Story-based', '0', 'Sports', 'PC', '1999-09-24', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(213, 'System Shock', 34, 'Story-based', '0', 'Fighting', 'PS4', '2013-06-21', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(214, 'Teenage Mutant Ninja Turtles: Out of the Shadows', 70, 'Online Multiplayer', '57', 'Shooting', 'PS4', '2009-10-25', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),
(215, 'Tex Murphy: Overseer', 31, 'Split-screen', '32', 'Rhythm', 'Xbox', '2000-12-05', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'),
(216, 'The Legend of Zelda: A Link to the Past', 28, 'Online Multiplayer', '0', 'Action', 'PC', '2006-06-21', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'),
(217, 'Thief: The Dark Project', 81, 'Story-based', '48', 'Adventure', 'Xbox', '2005-09-13', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(218, 'Tom Clancy\'s Splinter Cell', 68, 'Split-screen', '41', 'Casual', 'PS5', '2017-06-24', 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(219, 'Tomb Raider', 41, 'Controller Support', '80', 'Fighting', 'PS4', '2009-08-07', 'Fusce consequat. Nulla nisl. Nunc nisl.'),
(220, 'Tweety and the Magic Gems', 43, 'Controller Support', '66', 'Singleplayer', 'Nintendo Switch', '2004-05-26', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'),
(221, 'The Ultimate Adventure Games Pack Vol.1', 25, 'Story-based', '83', 'Strategy', 'PC', '2004-04-05', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),
(222, 'Under a Killing Moon', 85, 'Controller Support', '86', 'Fighting', 'Nintendo Switch', '1999-07-13', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(223, 'Urban Chaos', 85, 'Online Multiplayer', '0', 'Action', 'PS4', '2006-04-07', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(224, 'Vampire: The Masquerade - Redemption', 61, 'Story-based', '38', 'Multiplayer', 'PS4', '2001-07-09', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(225, 'Versailles II: Le Testament (Édition Limitée)', 9, 'Split-screen', '0', 'Casual', 'Xbox', '2014-06-14', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),
(226, 'WarCraft: Orcs & Humans', 73, 'Cross-Platform', '0', 'Puzzle', 'Xbox', '2015-07-11', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),
(227, 'Wasteland', 68, 'Split-screen', '43', 'RPG', 'PS5', '2019-04-17', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(228, 'Where in the World Is Carmen Sandiego?', 83, 'Online Multiplayer', '0', 'Singleplayer', 'Nintendo Switch', '2015-11-15', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'),
(229, 'Wing Commander: Privateer', 42, 'Split-screen', '0', 'Action', 'PS5', '2000-10-20', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'),
(230, 'Wolfenstein 3D', 40, 'Split-screen', '0', 'Multiplayer', 'Xbox', '2010-07-19', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(231, 'Worms: Armageddon', 52, 'Cross-Platform', '0', 'Fighting', 'Nintendo Switch', '2007-02-15', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(232, 'X-COM: UFO Defense', 64, 'Cross-Platform', '89', 'Casual', 'PS4', '2004-06-10', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(233, 'Zelda II: The Adventure of Link', 88, 'Story-based', '0', 'Sports', 'PC', '2005-05-24', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `reviewID` int(10) NOT NULL,
  `productID` int(10) NOT NULL,
  `customerID` int(10) NOT NULL,
  `rating` decimal(5,0) NOT NULL,
  `comment` text NOT NULL,
  `reviewDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`reviewID`, `productID`, `customerID`, `rating`, `comment`, `reviewDate`) VALUES
(8, 51, 2, '1', 'This game sucks', '2020-11-12'),
(10, 51, 2, '5', 'this game rocks', '2020-11-12'),
(11, 51, 2, '3', 'this game is okay', '2020-11-12'),
(12, 161, 2, '5', 'cool game', '2020-11-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartID`),
  ADD UNIQUE KEY `cartID` (`cartID`) USING BTREE,
  ADD UNIQUE KEY `uniqueProductCustomerID` (`productID`,`customerID`) USING BTREE,
  ADD KEY `productID` (`productID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewID`),
  ADD KEY `productID` (`productID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `rating` (`rating`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderhistory`
--
ALTER TABLE `orderhistory`
  MODIFY `orderID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
