-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2020 at 04:00 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productID` int(6) NOT NULL,
  `productName` text NOT NULL,
  `price` int(7) NOT NULL,
  `rating` int(5) NOT NULL,
  `features` text DEFAULT NULL,
  `discount` decimal(6,0) DEFAULT NULL,
  `genre` varchar(20) NOT NULL,
  `releaseDate` date NOT NULL,
  `finalPrice` double GENERATED ALWAYS AS (`price` * (100.0 - `discount`) / 100.0) STORED
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `price`, `rating`, `features`, `discount`, `genre`, `releaseDate`) VALUES
(2, '3-Demon', 19, 3, 'Story-based', '0', 'Puzzle', '2012-02-12'),
(3, 'Aces of the Pacific', 81, 4, 'Story-based', '0', 'Fighting', '2020-10-25'),
(4, 'Aces Over Europe', 45, 3, 'Split-screen', '79', 'Singleplayer', '2020-07-09'),
(5, 'After Burner', 90, 5, 'Story-based', '0', 'Sports', '2020-06-02'),
(6, 'Air Hockey', 33, 3, 'Online Multiplayer', '20', 'Strategy', '2011-10-15'),
(7, 'Alien Trilogy', 6, 4, 'Cross-Platform', '0', 'Adventure', '1999-06-18'),
(8, 'Aliens Versus Predator', 11, 1, 'Story-based', '0', 'Multiplayer', '2012-11-16'),
(9, 'Aliens Versus Predator: Gold Edition', 29, 5, 'Controller Support', '60', 'Puzzle', '2012-01-26'),
(10, 'Alone in the Dark', 70, 2, 'Controller Support', '26', 'Sports', '2008-09-05'),
(11, 'American McGee\'s Alice', 35, 3, 'Story-based', '44', 'RPG', '2016-12-25'),
(12, 'Ancients 1: Death Watch', 72, 2, 'Cross-Platform', '0', 'Multiplayer', '2006-07-31'),
(13, 'Arcade Volleyball', 58, 5, 'Split-screen', '0', 'Rhythm', '2012-11-28'),
(14, 'The Arrival', 42, 4, 'Controller Support', '0', 'Multiplayer', '2000-01-15'),
(15, 'Ballyhoo', 75, 2, 'Controller Support', '0', 'Multiplayer', '2014-08-23'),
(16, 'Barbarian', 68, 4, 'Online Multiplayer', '0', 'Strategy', '2004-03-08'),
(17, 'The Bard\'s Tale III: Thief of Fate', 87, 1, 'Controller Support', '35', 'Casual', '2002-01-13'),
(18, 'BBC Mastermind', 93, 3, 'Story-based', '22', 'Singleplayer', '2012-12-17'),
(19, 'Beneath a Steel Sky', 64, 2, 'Online Multiplayer', '0', 'Action', '2019-10-23'),
(20, 'Bioscopia: Where Science Conquers Evil', 6, 4, 'Story-based', '0', 'Fighting', '2009-01-09'),
(21, 'BipBop II', 28, 2, 'Controller Support', '0', 'RPG', '2003-06-04'),
(22, 'Birthright: The Gorgon\'s Alliance', 59, 2, 'Story-based', '0', 'Action', '1999-10-17'),
(23, 'The Black Cauldron', 38, 5, 'Cross-Platform', '30', 'RPG', '2020-08-28'),
(24, 'The Black Mirror', 85, 3, 'Story-based', '0', 'Multiplayer', '2018-04-02'),
(25, 'Blood', 46, 5, 'Story-based', '87', 'Action', '2012-10-29'),
(26, 'Blue Force', 45, 4, 'Cross-Platform', '81', 'Rhythm', '2011-07-21'),
(27, 'Bob Morane: Jungle 1', 82, 3, 'Split-screen', '83', 'RPG', '2007-12-23'),
(28, 'Border Zone', 34, 2, 'Online Multiplayer', '0', 'Strategy', '2002-02-20'),
(29, 'Brian Jacks Superstar Challenge', 54, 4, 'Online Multiplayer', '28', 'Multiplayer', '1999-10-19'),
(30, 'Bubble Bobble', 83, 4, 'Online Multiplayer', '0', 'Shooting', '2018-09-27'),
(31, 'Bureaucracy', 72, 5, 'Split-screen', '0', 'Fighting', '2020-07-15'),
(32, 'Cabal', 73, 3, 'Controller Support', '40', 'Casual', '2009-01-26'),
(33, 'Call of Cthulhu: Shadow of the Comet', 86, 2, 'Cross-Platform', '0', 'Puzzle', '2004-11-15'),
(34, 'The Cameron Files: Pharaoh\'s Curse', 23, 3, 'Online Multiplayer', '90', 'Multiplayer', '2017-08-11'),
(35, 'The Cameron Files: Secret at Loch Ness', 69, 2, 'Cross-Platform', '0', 'Action', '2011-04-06'),
(36, 'Carrier Command', 57, 2, 'Split-screen', '0', 'Action', '2019-10-03'),
(37, 'Castle Infinity', 15, 2, 'Split-screen', '0', 'Fighting', '2010-12-23'),
(38, 'Castle of Illusion starring Mickey Mouse', 42, 4, 'Cross-Platform', '0', 'Fighting', '2007-08-26'),
(39, 'The Catacomb Abyss', 54, 3, 'Story-based', '90', 'Shooting', '2001-08-14'),
(40, 'The Cave', 55, 3, 'Cross-Platform', '0', 'Fighting', '2010-09-05'),
(41, 'Caverns of Xaskazien', 49, 2, 'Story-based', '43', 'Puzzle', '2011-09-12'),
(42, 'The Chaos Engine 2', 4, 5, 'Controller Support', '0', 'Singleplayer', '2012-12-10'),
(43, 'Chewy: Esc from F5', 71, 4, 'Split-screen', '0', 'Sports', '2008-03-26'),
(44, 'Chocobo no Fushigi na Dungeon', 47, 1, 'Split-screen', '0', 'Rhythm', '2002-11-14'),
(45, 'Chocobo\'s Dungeon 2', 62, 3, 'Story-based', '60', 'Singleplayer', '2016-09-05'),
(46, 'Chuck Rock', 82, 4, 'Controller Support', '0', 'Singleplayer', '1999-09-16'),
(47, 'Classic Text Adventure Masterpieces', 15, 5, 'Controller Support', '0', 'Action', '2010-08-04'),
(48, 'Code-Name: Iceman', 71, 5, 'Controller Support', '0', 'Shooting', '2002-07-07'),
(49, 'The Colonel\'s Bequest', 77, 4, 'Online Multiplayer', '0', 'Rhythm', '2013-07-25'),
(50, 'Command & Conquer', 65, 2, 'Controller Support', '0', 'Fighting', '2003-09-09'),
(51, 'Commandos: Behind Enemy Lines', 54, 4, 'Cross-Platform', '0', 'Adventure', '1999-02-18'),
(52, 'Contra', 93, 2, 'Controller Support', '0', 'Singleplayer', '2003-01-04'),
(53, 'Cutthroats', 76, 4, 'Story-based', '0', 'Action', '2018-07-08'),
(54, 'Cutthroats: Terror on the High Seas', 21, 2, 'Online Multiplayer', '0', 'Adventure', '2015-03-25'),
(55, 'The Dagger of Amon Ra', 74, 5, 'Story-based', '0', 'Casual', '2011-04-03'),
(56, 'Dark Fall: The Journal', 35, 1, 'Controller Support', '0', 'Casual', '1999-01-29'),
(57, 'Dark Seed', 13, 3, 'Controller Support', '0', 'Strategy', '2005-08-13'),
(58, 'Decision in the Desert', 2, 2, 'Story-based', '0', 'RPG', '2011-02-24'),
(59, 'Descent', 95, 4, 'Split-screen', '0', 'Singleplayer', '2014-06-27'),
(60, 'Desert Strike: Return to the Gulf', 16, 2, 'Story-based', '0', 'RPG', '2016-10-16'),
(61, 'Deus Ex', 7, 3, 'Split-screen', '0', 'Sports', '2009-10-09'),
(62, 'Dig Dug', 16, 3, 'Online Multiplayer', '0', 'Adventure', '2020-08-11'),
(63, 'Disney\'s Hercules', 85, 4, 'Cross-Platform', '52', 'Fighting', '2017-06-13'),
(64, 'Donkey Kong', 52, 3, 'Online Multiplayer', '0', 'Puzzle', '2007-07-31'),
(65, 'Donkey Kong Country 3: Dixie Kong\'s Double Trou...', 20, 4, 'Story-based', '0', 'Adventure', '2011-10-15'),
(66, 'Dr. Dumont\'s Wild P.A.R.T.I.', 81, 1, 'Story-based', '89', 'Rhythm', '2003-10-14'),
(67, 'Dr. Dumont\'s Wild P.A.R.T.I.', 46, 3, 'Online Multiplayer', '0', 'Action', '2004-10-07'),
(68, 'Dracula: The Last Sanctuary', 94, 3, 'Online Multiplayer', '0', 'Shooting', '2011-01-29'),
(69, 'Dragon Wars', 17, 4, 'Online Multiplayer', '11', 'Adventure', '2019-05-09'),
(70, 'Drakan: Order of the Flame', 55, 4, 'Controller Support', '0', 'Sports', '2003-08-27'),
(71, 'The Duel: Test Drive II', 40, 3, 'Cross-Platform', '0', 'Action', '2007-07-13'),
(72, 'Dungeon Keeper', 9, 3, 'Controller Support', '35', 'Action', '2013-12-10'),
(73, 'Dungeon Master', 92, 3, 'Controller Support', '0', 'Action', '2000-09-27'),
(74, 'Dungeon Siege', 58, 5, 'Online Multiplayer', '25', 'Sports', '2013-07-07'),
(75, 'Egypt II: The Heliopolis Prophecy', 6, 5, 'Split-screen', '0', 'Multiplayer', '2008-02-26'),
(77, 'The Elder Scrolls Adventures: Redguard', 68, 5, 'Story-based', '0', 'Strategy', '2006-04-28'),
(78, 'Essex', 20, 2, 'Controller Support', '0', 'Rhythm', '2006-03-21'),
(79, 'Eye of the Beholder', 79, 3, 'Split-screen', '0', 'Adventure', '2002-02-26'),
(80, 'FIFA International Soccer', 55, 3, 'Controller Support', '0', 'Casual', '1999-02-09'),
(81, 'Flashback: The Quest for Identity', 57, 5, 'Controller Support', '0', 'Fighting', '1999-04-03'),
(82, 'The Fool\'s Errand', 79, 4, 'Story-based', '42', 'Sports', '2002-05-03'),
(83, 'Game & Watch Gallery', 94, 3, 'Split-screen', '0', 'Fighting', '2009-08-20'),
(84, 'Ghostbusters', 72, 5, 'Controller Support', '0', 'Fighting', '2000-07-01'),
(85, 'Ghosts \'N Goblins', 81, 4, 'Online Multiplayer', '0', 'Singleplayer', '2001-10-04'),
(86, 'Giants: Citizen Kabuto', 98, 3, 'Controller Support', '0', 'RPG', '2003-07-04'),
(87, 'Gold Rush!', 12, 2, 'Split-screen', '10', 'Rhythm', '2009-09-11'),
(88, 'GoldenEye 007', 97, 2, 'Split-screen', '48', 'Casual', '2006-05-23'),
(89, 'Guilty', 7, 2, 'Cross-Platform', '29', 'Adventure', '2009-09-20'),
(90, 'Gunship 2000', 52, 4, 'Cross-Platform', '72', 'Rhythm', '2010-02-25'),
(91, 'Hamtaro: Ham-Hams Unite!', 40, 3, 'Online Multiplayer', '0', 'Multiplayer', '2002-06-15'),
(92, 'Harlan Ellison: I Have No Mouth', 73, 1, 'Controller Support', '0', 'Adventure', '2018-11-09'),
(93, 'and I Must Scream', 71, 3, 'Controller Support', '0', 'Fighting', '2007-03-27'),
(94, 'Heart of the Alien: Out of this World Parts I a...', 49, 1, 'Split-screen', '0', 'Fighting', '2012-09-26'),
(95, 'Heretic: Shadow of the Serpent Riders', 34, 2, 'Controller Support', '0', 'Sports', '2013-08-01'),
(96, 'Hodj \'n\' Podj', 13, 3, 'Story-based', '0', 'Action', '2010-11-21'),
(97, 'Hollywood Hijinx', 79, 2, 'Split-screen', '0', 'Fighting', '2012-12-23'),
(98, 'Hudson Hawk', 27, 3, 'Online Multiplayer', '0', 'Puzzle', '2015-12-30'),
(99, 'Hulk', 95, 5, 'Online Multiplayer', '0', 'Shooting', '2007-02-15'),
(100, 'ICO', 74, 2, 'Online Multiplayer', '73', 'Singleplayer', '2002-05-18'),
(101, 'Indiana Jones and the Fate of Atlantis', 81, 5, 'Online Multiplayer', '0', 'Fighting', '2003-06-05'),
(102, 'Indiana Jones and the Last Crusade: The Graphic...', 54, 5, 'Split-screen', '0', 'Action', '2011-08-31'),
(103, 'Infidel', 29, 1, 'Split-screen', '0', 'Action', '2020-12-04'),
(104, 'Inherit the Earth: Quest for the Orb', 87, 3, 'Split-screen', '0', 'Singleplayer', '2000-05-14'),
(105, 'Innocent Until Caught', 98, 3, 'Cross-Platform', '0', 'Puzzle', '1999-03-06'),
(106, 'Interstate \'76', 13, 3, 'Split-screen', '44', 'Strategy', '2008-08-29'),
(107, 'Isis', 32, 5, 'Controller Support', '0', 'Action', '2007-11-11'),
(108, 'James Clavell\'s Shogun', 98, 1, 'Split-screen', '0', 'Casual', '2001-11-30'),
(109, 'Jazz Jackrabbit', 15, 2, 'Cross-Platform', '0', 'Shooting', '2018-11-08'),
(110, 'Journey: The Quest Begins', 9, 5, 'Controller Support', '0', 'Puzzle', '2011-04-03'),
(111, 'Jungle Strike', 41, 4, 'Online Multiplayer', '0', 'Shooting', '2020-03-04'),
(112, 'King\'s Quest V: Absence Makes the Heart Go Yonder!', 28, 3, 'Split-screen', '0', 'Puzzle', '2009-04-04'),
(113, 'Kingdom of Kroz II', 15, 5, 'Story-based', '0', 'Puzzle', '2005-04-10'),
(114, 'Klonoa: Empire of Dreams', 62, 4, 'Split-screen', '50', 'Action', '2018-05-02'),
(115, 'Knight Orc', 7, 4, 'Cross-Platform', '0', 'Action', '2019-01-05'),
(116, 'Krypton Egg', 69, 2, 'Cross-Platform', '0', 'Casual', '2016-11-24'),
(117, 'Lands of Lore: Guardians of Destiny', 46, 2, 'Split-screen', '0', 'Fighting', '2015-01-13'),
(118, 'Leather Goddesses of Phobos! 2: Gas Pump Girls ...', 27, 1, 'Split-screen', '0', 'Casual', '2010-10-26'),
(119, 'The Legend of Zelda: Majora\'s Mask', 20, 3, 'Online Multiplayer', '58', 'RPG', '2003-04-01'),
(120, 'The Legend of Zelda: Ocarina of Time', 41, 2, 'Story-based', '36', 'Rhythm', '1999-08-05'),
(121, 'Leisure Suit Larry 1: In the Land of the Loung...', 93, 4, 'Story-based', '0', 'Singleplayer', '2014-12-21'),
(122, 'Leisure Suit Larry 5: Passionate Patti Does a L...', 26, 2, 'Split-screen', '25', 'Fighting', '2006-03-23'),
(123, 'Leisure Suit Larry 6: Shape Up or Slip Out!', 13, 2, 'Story-based', '0', 'Action', '2009-07-01'),
(124, 'Leisure Suit Larry III: Passionate Patti in Pur...', 33, 1, 'Story-based', '0', 'Puzzle', '2001-10-09'),
(125, 'LHX: Attack Chopper', 24, 4, 'Story-based', '0', 'Rhythm', '2014-09-15'),
(126, 'Liath: WorldSpiral', 72, 4, 'Story-based', '0', 'Singleplayer', '2020-05-05'),
(127, 'The Longest Journey', 71, 3, 'Story-based', '0', 'Shooting', '2012-11-18'),
(128, 'Loom', 55, 1, 'Cross-Platform', '0', 'Fighting', '2019-01-16'),
(129, 'The Lost Treasures of Infocom II', 96, 2, 'Cross-Platform', '0', 'Singleplayer', '2011-08-02'),
(130, 'The Lost Treasures of Infocom', 8, 1, 'Controller Support', '20', 'Action', '2017-07-14'),
(131, 'Lure of the Temptress', 4, 4, 'Controller Support', '0', 'Casual', '2005-05-26'),
(132, 'Magic Dimension', 12, 5, 'Controller Support', '0', 'Rhythm', '2001-05-06'),
(133, 'Magic School Bus Discovers Flight', 91, 2, 'Story-based', '43', 'Shooting', '2018-03-31'),
(134, 'Magic Worlds', 62, 3, 'Online Multiplayer', '0', 'Puzzle', '2017-01-15'),
(135, 'Manhunter: New York', 35, 1, 'Controller Support', '0', 'Rhythm', '2017-10-22'),
(136, 'Maniac Mansion', 59, 2, 'Online Multiplayer', '0', 'RPG', '2013-03-23'),
(137, 'Master of Orion', 30, 2, 'Online Multiplayer', '0', 'Rhythm', '2012-12-18'),
(138, 'Mean Streets', 3, 2, 'Story-based', '0', 'Fighting', '2016-01-02'),
(139, 'Metal Gear Solid', 33, 1, 'Split-screen', '0', 'Multiplayer', '2018-04-19'),
(140, 'Moon Bugs', 27, 4, 'Controller Support', '0', 'Singleplayer', '2004-04-17'),
(141, 'Mortal Kombat', 46, 3, 'Split-screen', '0', 'Puzzle', '2016-03-18'),
(142, 'Myth: The Fallen Lords', 38, 2, 'Controller Support', '73', 'RPG', '2011-02-21'),
(143, 'Nancy Drew: Message in a Haunted Mansion', 8, 4, 'Controller Support', '0', 'Fighting', '2016-10-06'),
(144, 'Narsillion: Leithian Another Story', 69, 2, 'Controller Support', '0', 'Sports', '2003-10-12'),
(145, 'Normality', 44, 4, 'Story-based', '88', 'Multiplayer', '2006-07-17'),
(146, 'North & South: The Game', 51, 3, 'Controller Support', '0', 'Puzzle', '2008-02-20'),
(147, 'Novastorm', 78, 2, 'Controller Support', '72', 'Casual', '2015-09-12'),
(148, 'Nyet', 69, 2, 'Split-screen', '54', 'Strategy', '2018-05-29'),
(149, 'Oddworld: Abe\'s Oddysee', 19, 5, 'Split-screen', '0', 'Adventure', '2015-06-24'),
(150, 'Of Orcs and Men', 30, 5, 'Controller Support', '0', 'Adventure', '2009-09-02'),
(151, 'Olympic Decathlon', 64, 2, 'Cross-Platform', '0', 'Sports', '2004-09-28'),
(152, 'The Oregon Trail', 8, 3, 'Split-screen', '0', 'Casual', '2004-10-29'),
(153, 'Out of This World', 27, 2, 'Cross-Platform', '0', 'Sports', '2005-03-17'),
(154, 'Overlord', 14, 3, 'Story-based', '0', 'Strategy', '2014-12-19'),
(155, 'Pac-Man', 60, 4, 'Cross-Platform', '0', 'Casual', '2020-04-04'),
(157, 'Pac-Man Collection', 59, 3, 'Story-based', '68', 'Rhythm', '2009-06-08'),
(158, 'Payday 2', 20, 2, 'Story-based', '0', 'Adventure', '2010-09-02'),
(159, 'Pengo', 56, 4, 'Cross-Platform', '0', 'Fighting', '2006-03-31'),
(160, 'Perry Mason: The Case of the Mandarin Murder', 72, 2, 'Cross-Platform', '0', 'Shooting', '2004-10-30'),
(161, 'Petka 3: Vozvraschenie Alaski', 96, 3, 'Story-based', '0', 'Action', '2016-08-31'),
(162, 'Pinball Arcade Table Pack 8: Twilight Zone', 21, 2, 'Story-based', '51', 'Puzzle', '2002-07-30'),
(163, 'Pinball Arcade: Season Two Pass', 59, 3, 'Split-screen', '0', 'Rhythm', '2016-02-05'),
(164, 'Pirates! Gold', 81, 2, 'Story-based', '0', 'Fighting', '2004-05-04'),
(165, 'Planescape: Torment', 21, 4, 'Online Multiplayer', '0', 'RPG', '2004-06-24'),
(166, 'Planetfall', 78, 4, 'Online Multiplayer', '0', 'Singleplayer', '2012-09-27'),
(167, 'Poko Memorial: 18 Hole Miniature Golf', 59, 4, 'Online Multiplayer', '58', 'Adventure', '2001-12-24'),
(168, 'Populous: The Beginning', 80, 3, 'Controller Support', '0', 'Rhythm', '2011-05-13'),
(169, 'Prince of Persia', 97, 2, 'Split-screen', '0', 'Casual', '2003-10-12'),
(170, 'Privateer 2: The Darkening', 63, 5, 'Controller Support', '0', 'Multiplayer', '2009-11-29'),
(171, 'Psychic Detective', 76, 3, 'Online Multiplayer', '0', 'Puzzle', '2009-10-30'),
(172, 'Puyo Pop', 2, 3, 'Controller Support', '52', 'Rhythm', '2002-02-11'),
(173, 'Quake', 39, 2, 'Split-screen', '34', 'Puzzle', '2014-04-11'),
(174, 'Rayman', 18, 2, 'Story-based', '0', 'Action', '2015-04-25'),
(175, 'Rayman 2: The Great Escape', 73, 2, 'Story-based', '0', 'Action', '2012-07-01'),
(176, 'Red Baron', 4, 3, 'Controller Support', '0', 'Multiplayer', '2017-04-29'),
(177, 'Riddle of the Sphinx: An Egyptian Adventure', 71, 5, 'Cross-Platform', '11', 'Singleplayer', '2005-02-05'),
(178, 'Rise of the Triad: Dark War', 86, 3, 'Split-screen', '0', 'Casual', '2017-05-31'),
(179, 'Rogue', 98, 5, 'Online Multiplayer', '60', 'Rhythm', '2003-10-04'),
(180, 'RollerCoaster Tycoon', 17, 4, 'Cross-Platform', '0', 'Puzzle', '2010-01-22'),
(181, 'Saints Row Double Pack', 78, 2, 'Split-screen', '0', 'Rhythm', '2003-06-21'),
(182, 'Santa Fe Mysteries: The Elk Moon Murder', 43, 2, 'Online Multiplayer', '0', 'Shooting', '2016-02-21'),
(183, 'Science Girls!', 87, 4, 'Online Multiplayer', '0', 'Adventure', '2003-03-07'),
(184, 'Secret Agent', 75, 1, 'Split-screen', '52', 'Action', '2013-08-24'),
(185, 'The Secret of Monkey Island', 44, 4, 'Cross-Platform', '0', 'RPG', '2002-04-29'),
(186, 'The Seven Cities of Gold', 75, 2, 'Cross-Platform', '0', 'Adventure', '2007-08-02'),
(187, 'Shadow Tower: Abyss', 75, 5, 'Controller Support', '0', 'Singleplayer', '2003-07-30'),
(188, 'Sherlock: The Riddle of the Crown Jewels', 38, 1, 'Split-screen', '60', 'Casual', '2019-11-15'),
(189, 'Shrek', 32, 2, 'Online Multiplayer', '0', 'Puzzle', '2004-09-22'),
(190, 'Sid Meier\'s CivNet', 11, 4, 'Cross-Platform', '0', 'Rhythm', '2007-03-05'),
(191, 'Sid Meier\'s Pirates!', 34, 5, 'Online Multiplayer', '0', 'Puzzle', '2015-03-09'),
(192, 'SimAnt', 22, 4, 'Cross-Platform', '66', 'Sports', '2020-01-18'),
(193, 'SimCity', 3, 2, 'Online Multiplayer', '0', 'Strategy', '2014-03-20'),
(194, 'Soko-Ban', 81, 3, 'Online Multiplayer', '39', 'Action', '2006-11-12'),
(195, 'Solar Winds: The Escape', 85, 5, 'Online Multiplayer', '0', 'Shooting', '2008-02-15'),
(196, 'Space Quest 6: Roger Wilco in the Spinal Frontier', 82, 4, 'Online Multiplayer', '0', 'Sports', '2008-06-09'),
(197, 'Space Quest I: Roger Wilco in the Sarien Encounter', 14, 2, 'Story-based', '19', 'Multiplayer', '2013-04-10'),
(198, 'Space Quest II: Chapter II - Vohaul\'s Revenge', 86, 5, 'Cross-Platform', '0', 'Casual', '2003-02-07'),
(199, 'Space Quest III: The Pirates of Pestulon', 59, 3, 'Story-based', '0', 'Rhythm', '1999-08-30'),
(200, 'Space Quest IV: Roger Wilco and the Time Rippers', 81, 3, 'Split-screen', '34', 'Adventure', '2020-08-26'),
(201, 'Space Quest V: The Next Mutation', 33, 2, 'Controller Support', '13', 'Adventure', '2012-07-15'),
(202, 'Spear of Destiny', 37, 4, 'Split-screen', '0', 'Sports', '2007-08-25'),
(203, 'Speed Ace', 22, 5, 'Controller Support', '0', 'Singleplayer', '2006-01-04'),
(204, 'Spycraft: The Great Game', 15, 2, 'Split-screen', '62', 'Strategy', '2002-12-25'),
(205, 'Star Trek Pinball', 92, 2, 'Split-screen', '0', 'Adventure', '2001-03-25'),
(206, 'Starcross', 4, 2, 'Controller Support', '0', 'Casual', '2015-09-08'),
(207, 'Starflight', 73, 3, 'Online Multiplayer', '17', 'Strategy', '2005-05-25'),
(208, 'Stationfall', 38, 4, 'Cross-Platform', '0', 'Casual', '2006-12-29'),
(209, 'Stonekeep', 79, 4, 'Controller Support', '74', 'Strategy', '2008-12-26'),
(210, 'Strife', 45, 1, 'Split-screen', '25', 'Action', '2012-05-23'),
(211, 'Suchie-Pai Adventure: Doki Doki Nightmare', 74, 5, 'Split-screen', '0', 'Puzzle', '2002-07-02'),
(212, 'Suspect', 24, 1, 'Controller Support', '27', 'Sports', '2017-01-06'),
(213, 'Swords of Glass', 54, 3, 'Split-screen', '0', 'Adventure', '2017-02-07'),
(214, 'Syberia', 29, 2, 'Split-screen', '0', 'Shooting', '2010-07-22'),
(215, 'System Shock', 40, 4, 'Controller Support', '0', 'Fighting', '2007-05-29'),
(216, 'Teenage Mutant Ninja Turtles: Out of the Shadows', 14, 3, 'Controller Support', '61', 'Singleplayer', '2017-03-05'),
(217, 'Tex Murphy: Overseer', 40, 4, 'Cross-Platform', '0', 'Adventure', '2000-08-30'),
(218, 'The Legend of Zelda: A Link to the Past', 13, 4, 'Online Multiplayer', '14', 'Action', '2000-04-17'),
(219, 'Thief: The Dark Project', 23, 4, 'Story-based', '0', 'Strategy', '2000-11-12'),
(220, 'Tom Clancy\'s Splinter Cell', 13, 1, 'Online Multiplayer', '0', 'Strategy', '2010-06-10'),
(221, 'Tomb Raider', 58, 3, 'Split-screen', '0', 'RPG', '2018-03-01'),
(222, 'Tweety and the Magic Gems', 99, 5, 'Story-based', '0', 'Strategy', '2018-11-08'),
(223, 'The Ultimate Adventure Games Pack Vol.1', 67, 2, 'Online Multiplayer', '0', 'Puzzle', '2009-03-05'),
(224, 'Under a Killing Moon', 88, 2, 'Controller Support', '60', 'Singleplayer', '2015-03-03'),
(225, 'Urban Chaos', 16, 1, 'Story-based', '0', 'Rhythm', '2017-06-27'),
(226, 'Vampire: The Masquerade - Redemption', 6, 4, 'Controller Support', '0', 'RPG', '2004-12-30'),
(227, 'Versailles II: Le Testament (Édition Limitée)', 61, 4, 'Split-screen', '45', 'Rhythm', '2006-08-14'),
(228, 'WarCraft: Orcs & Humans', 12, 5, 'Split-screen', '0', 'Shooting', '2012-05-03'),
(229, 'Wasteland', 28, 4, 'Online Multiplayer', '15', 'Shooting', '2016-08-19'),
(230, 'Where in the World Is Carmen Sandiego?', 50, 3, 'Controller Support', '0', 'Fighting', '2000-03-02'),
(231, 'Wing Commander: Privateer', 74, 5, 'Story-based', '0', 'Puzzle', '2014-02-20'),
(232, 'Wolfenstein 3D', 98, 2, 'Story-based', '30', 'Adventure', '2017-07-02'),
(233, 'Worms: Armageddon', 17, 4, 'Controller Support', '0', 'Strategy', '1999-11-30'),
(234, 'X-COM: UFO Defense', 27, 1, 'Controller Support', '0', 'Sports', '2009-02-14'),
(235, 'Zelda II: The Adventure of Link', 93, 4, 'Split-screen', '0', 'Puzzle', '2000-05-04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `rating` (`rating`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
