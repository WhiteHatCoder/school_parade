-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2014 at 11:15 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `school_parade`
--

-- --------------------------------------------------------

--
-- Table structure for table `career`
--

CREATE TABLE IF NOT EXISTS `career` (
  `id` int(11) NOT NULL,
  `profession` varchar(255) NOT NULL,
  `cluster_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cluster_group_id` (`cluster_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE IF NOT EXISTS `cars` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stream` varchar(40) NOT NULL,
  `sch_id` int(11) NOT NULL,
  `form` varchar(20) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sch_id` (`sch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `stream`, `sch_id`, `form`, `year`) VALUES
(1, 'North', 1, 'Form 3', 2013),
(2, 'North', 1, 'Form 4', 2013);

-- --------------------------------------------------------

--
-- Table structure for table `cluster_group`
--

CREATE TABLE IF NOT EXISTS `cluster_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cluster_group`
--

INSERT INTO `cluster_group` (`id`, `name`) VALUES
(1, 'Group I'),
(2, 'Group II'),
(3, 'Group III'),
(4, 'Group IV'),
(5, 'Group V');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE IF NOT EXISTS `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `term` varchar(11) NOT NULL,
  `is_examinable` tinyint(1) NOT NULL,
  `sch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sch_id` (`sch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `title`, `term`, `is_examinable`, `sch_id`) VALUES
(1, 'End of ', 'Term 3', 1, 1),
(2, 'Cat 2', 'Term 3', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_taken`
--

CREATE TABLE IF NOT EXISTS `exam_taken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `date_taken` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_id` (`exam_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `exam_taken`
--

INSERT INTO `exam_taken` (`id`, `exam_id`, `date_taken`) VALUES
(1, 1, '2013-12-25'),
(6, 2, '0000-00-00'),
(7, 2, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE IF NOT EXISTS `parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`id`, `name`, `email`, `phone`) VALUES
(1, 'Judy', '', ''),
(2, 'Catherine ', '', ''),
(3, 'Wallace', '', ''),
(4, 'Blundon', '', ''),
(5, 'Cindy ', '', ''),
(6, 'Barker', '', ''),
(7, 'Michael', '', ''),
(8, ' Murrin', '', ''),
(9, 'Gerald ', '', ''),
(10, 'Morgan', '', ''),
(11, 'Jeff ', '', ''),
(12, 'Fred ', '', ''),
(13, 'Robertson', '', ''),
(14, 'Lana ', '', ''),
(15, 'Durnford', '', ''),
(16, 'Michelle ', '', ''),
(17, 'Patey', '', ''),
(18, 'Terry ', '', ''),
(19, 'LaVallee', '', ''),
(20, 'Jamie ', '', ''),
(21, 'Park', '', ''),
(22, 'Buffett', '', ''),
(23, 'Marsha ', '', ''),
(24, 'Alexander', '', ''),
(25, 'Steve ', '', ''),
(26, 'Aurele ', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE IF NOT EXISTS `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `Mat` int(11) NOT NULL,
  `Eng` int(11) NOT NULL,
  `Kis` int(11) NOT NULL,
  `Che` int(11) DEFAULT NULL,
  `Bio` int(11) DEFAULT NULL,
  `Phy` int(11) DEFAULT NULL,
  `Geg` int(11) DEFAULT NULL,
  `Hag` int(11) DEFAULT NULL,
  `Cre` int(11) DEFAULT NULL,
  `Bst` int(11) DEFAULT NULL,
  `fre` int(11) DEFAULT NULL,
  `Hsc` int(11) DEFAULT NULL,
  `Ger` int(11) DEFAULT NULL,
  `Arb` int(11) DEFAULT NULL,
  `Ksl` int(11) DEFAULT NULL,
  `Mus` int(11) DEFAULT NULL,
  `Avt` int(11) DEFAULT NULL,
  `Cmp` int(11) DEFAULT NULL,
  `Drd` int(11) DEFAULT NULL,
  `Elec` int(11) DEFAULT NULL,
  `pmc` int(11) DEFAULT NULL,
  `Blg` int(11) DEFAULT NULL,
  `Mwk` int(11) DEFAULT NULL,
  `Wwk` int(11) DEFAULT NULL,
  `Ard` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `exam_id` (`exam_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=225 ;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `exam_id`, `student_id`, `Mat`, `Eng`, `Kis`, `Che`, `Bio`, `Phy`, `Geg`, `Hag`, `Cre`, `Bst`, `fre`, `Hsc`, `Ger`, `Arb`, `Ksl`, `Mus`, `Avt`, `Cmp`, `Drd`, `Elec`, `pmc`, `Blg`, `Mwk`, `Wwk`, `Ard`) VALUES
(1, 1, 3, 35, 53, 57, 58, 71, NULL, 88, NULL, 70, NULL, NULL, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 1, 4, 64, 58, 58, 61, 57, NULL, NULL, 58, 70, 83, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 5, 54, 60, 55, 54, NULL, 44, 89, NULL, 61, 71, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 1, 6, 39, 65, 44, 60, 66, NULL, NULL, 56, 62, NULL, NULL, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 1, 7, 45, 62, 53, 50, NULL, 49, 85, NULL, 60, NULL, NULL, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, 8, 47, 64, 61, 50, 50, 37, NULL, NULL, 76, 85, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 1, 9, 40, 67, 59, 52, 63, 49, 69, NULL, 66, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 1, 10, 54, 50, 48, 55, NULL, 58, 83, NULL, 39, 70, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 1, 11, 40, 58, 52, 45, 63, NULL, NULL, 57, 57, NULL, NULL, 82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 1, 12, 60, 46, 47, 52, 55, NULL, NULL, 56, 60, NULL, NULL, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 1, 13, 53, 37, 49, 64, 69, NULL, NULL, 55, 60, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 1, 14, 44, 53, 58, 34, NULL, 47, 72, NULL, 63, 68, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 1, 15, 37, 51, 50, 43, NULL, 38, 88, NULL, 72, 58, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 1, 16, 26, 59, 52, 46, 56, NULL, NULL, 65, 66, 66, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 1, 17, 40, 63, 54, 40, 51, NULL, 76, NULL, 55, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 1, 18, 28, 41, 48, 44, 48, NULL, 86, NULL, 63, NULL, 58, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 1, 19, 18, 57, 54, 44, 44, NULL, NULL, 60, 65, 71, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 1, 20, 34, 50, 61, 38, 48, NULL, NULL, 42, 61, NULL, NULL, 67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 1, 21, 28, 48, 40, 44, 55, NULL, NULL, 45, 70, 69, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 1, 22, 32, 57, 46, 53, 53, NULL, NULL, 50, 58, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 1, 23, 32, 44, 53, 41, 49, NULL, NULL, 48, 64, 67, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 1, 24, 43, 55, 45, 49, 62, NULL, NULL, 40, 53, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 1, 25, 31, 53, 53, 42, NULL, 43, 70, NULL, 58, NULL, 41, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 1, 26, 45, 42, 45, 39, 48, NULL, NULL, NULL, 60, 62, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 1, 27, 41, 47, 46, 49, 38, NULL, NULL, 38, 53, NULL, NULL, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 1, 28, 46, 33, 21, 37, NULL, 49, NULL, 55, 56, 63, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 1, 29, 22, 48, 46, 26, 32, NULL, NULL, 43, 53, NULL, NULL, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 1, 30, 18, 52, 46, 41, 38, NULL, NULL, 45, 49, NULL, 48, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 1, 31, 25, 44, 49, 36, NULL, 38, NULL, 41, 60, NULL, 51, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 1, 32, 21, 52, 50, 35, NULL, 43, NULL, 41, 58, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(161, 2, 3, 351, 78, 35, 38, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(162, 2, 4, 64, 56, 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(163, 2, 5, 87, 89, 0, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(164, 2, 6, 78, 78, 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(165, 2, 8, 9, 90, 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(166, 2, 9, 89, 56, 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(167, 2, 10, 90, 35, 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(168, 2, 11, 98, 98, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(169, 2, 12, 87, 78, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(170, 2, 13, 98, 12, 4912, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(171, 2, 14, 76, 45, 58132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(172, 2, 15, 9, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(173, 2, 16, 35, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(174, 2, 17, 34, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(175, 2, 18, 89, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(176, 2, 19, 45, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(177, 2, 20, 87, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(178, 2, 21, 45, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(179, 2, 22, 98, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(180, 2, 23, 34, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(181, 2, 24, 78, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(182, 2, 24, 78, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(183, 2, 25, 34, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(184, 2, 26, 89, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(185, 2, 27, 34, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(186, 2, 28, 98, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(187, 2, 29, 45, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(188, 2, 30, 45, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(189, 2, 31, 45, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(190, 2, 32, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(191, 2, 8, 9, 90, 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(192, 2, 7, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(193, 2, 3, 351, 78, 35, 38, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(194, 2, 4, 64, 56, 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(195, 2, 5, 87, 89, 0, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(196, 2, 6, 78, 78, 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(197, 2, 8, 9, 90, 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(198, 2, 9, 89, 56, 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(199, 2, 10, 90, 35, 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200, 2, 11, 98, 98, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(201, 2, 12, 87, 78, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(202, 2, 13, 98, 12, 4912, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203, 2, 14, 76, 45, 58132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204, 2, 15, 9, 0, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(205, 2, 16, 35, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(206, 2, 17, 34, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(207, 2, 18, 89, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(208, 2, 19, 45, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(209, 2, 20, 87, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(210, 2, 21, 45, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(211, 2, 22, 98, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(212, 2, 23, 34, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(213, 2, 24, 78, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(214, 2, 24, 78, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(215, 2, 25, 34, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(216, 2, 26, 89, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(217, 2, 27, 34, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(218, 2, 28, 98, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(219, 2, 29, 45, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(220, 2, 30, 45, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(221, 2, 31, 45, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(222, 2, 32, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(223, 2, 8, 9, 90, 0, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(224, 2, 7, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sch_knec_id` int(11) NOT NULL,
  `county` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `name`, `sch_knec_id`, `county`, `district`, `address`, `phone`) VALUES
(1, 'Bristar Girls High School', 0, '', '', '', ''),
(2, 'St. Peter''s School', 0, '', '', '', ''),
(3, 'Henry Gordon Academy', 0, '', '', '', ''),
(4, 'Peacock Primary School', 0, '', '', '', ''),
(5, 'Amos Comenius Memorial School', 0, '', '', '', ''),
(6, 'Menihek High School', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sch_event`
--

CREATE TABLE IF NOT EXISTS `sch_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sch_id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `venue` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sch_id` (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `std_class_hst`
--

CREATE TABLE IF NOT EXISTS `std_class_hst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `std_hst_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `std_hst_id` (`std_hst_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `std_class_hst`
--

INSERT INTO `std_class_hst` (`id`, `class_id`, `std_hst_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 1, 8),
(6, 1, 9),
(7, 1, 10),
(8, 1, 11),
(9, 1, 12),
(10, 1, 13),
(11, 1, 14),
(12, 1, 15),
(13, 1, 16),
(14, 1, 17),
(15, 1, 18),
(16, 1, 19),
(17, 1, 20),
(18, 1, 21),
(19, 1, 22),
(20, 1, 23),
(21, 1, 24),
(22, 1, 24),
(23, 1, 25),
(24, 1, 26),
(25, 1, 27),
(26, 1, 28),
(27, 1, 29),
(28, 1, 30),
(29, 1, 31),
(30, 1, 32),
(31, 1, 8),
(32, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sur_name` varchar(40) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `second_name` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `date_enrolled` date NOT NULL,
  `parent_id` int(11) NOT NULL,
  `sch_index_no` varchar(255) NOT NULL,
  `knec_index_no` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `sur_name`, `first_name`, `second_name`, `dob`, `date_enrolled`, `parent_id`, `sch_index_no`, `knec_index_no`) VALUES
(3, '', 'Judy', 'Wambui', '0000-00-00', '0000-00-00', 1, '', ''),
(4, '', 'Eunice', 'Kwamboka', '0000-00-00', '0000-00-00', 2, '', ''),
(5, '', 'Rosemary', 'Waititu', '0000-00-00', '0000-00-00', 3, '', ''),
(6, 'Maina', '', 'Wambui', '0000-00-00', '0000-00-00', 3, '', ''),
(7, '', 'Magdaline', 'Esther', '0000-00-00', '0000-00-00', 4, '', ''),
(8, '', 'Jessica', 'Kuria', '0000-00-00', '0000-00-00', 5, '', ''),
(9, '', 'Maureen', 'Muikira', '0000-00-00', '0000-00-00', 6, '', ''),
(10, '', 'Terrylee', 'Hamida', '0000-00-00', '0000-00-00', 7, '', ''),
(11, '', 'Lucy', 'Wanjiku', '0000-00-00', '0000-00-00', 8, '', ''),
(12, 'Njoroge', 'Irene', 'W', '0000-00-00', '0000-00-00', 9, '', ''),
(13, 'Adul', 'Alexis', 'Obua', '0000-00-00', '0000-00-00', 10, '', ''),
(14, 'Githara', 'Georgina', '', '0000-00-00', '0000-00-00', 10, '', ''),
(15, 'Kamau', 'Joy', 'Wahiga', '0000-00-00', '0000-00-00', 12, '', ''),
(16, 'Maina', 'Mareen', '', '0000-00-00', '0000-00-00', 13, '', ''),
(17, '', 'Catherine', 'Wathiha', '0000-00-00', '0000-00-00', 14, '', ''),
(18, '', 'Gachecha', 'Njambi', '0000-00-00', '0000-00-00', 15, '', ''),
(19, 'Muchiri', 'Gladys', '', '0000-00-00', '0000-00-00', 14, '', ''),
(20, '', 'Clara', 'Wangui', '0000-00-00', '0000-00-00', 18, '', ''),
(21, 'M', 'SHelmisth', 'Njeri', '0000-00-00', '0000-00-00', 21, '', ''),
(22, '', 'Grace', 'Kivuti', '0000-00-00', '0000-00-00', 25, '', ''),
(23, '', 'Lorraine', 'Gichuhi', '0000-00-00', '0000-00-00', 22, '', ''),
(24, '', 'Mary', 'Mukiri', '0000-00-00', '0000-00-00', 24, '', ''),
(25, '', 'Cecilia', 'Kuria', '0000-00-00', '0000-00-00', 24, '', ''),
(26, 'Kariuki', 'N', 'Ivy', '0000-00-00', '0000-00-00', 21, '', ''),
(27, 'Baya', 'Elvin', 'Chedaya', '0000-00-00', '0000-00-00', 25, '', ''),
(28, 'Mungai', 'Lauryn', 'Njeri', '0000-00-00', '0000-00-00', 21, '', ''),
(29, '', 'Santana', 'Githaiga', '0000-00-00', '0000-00-00', 26, '', ''),
(30, 'Ngige', 'Jerusha', 'M', '0000-00-00', '0000-00-00', 26, '', ''),
(31, '', 'Christine', 'Kararu', '0000-00-00', '0000-00-00', 18, '', ''),
(32, '', 'Faith', 'Fukho', '0000-00-00', '0000-00-00', 23, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_career`
--

CREATE TABLE IF NOT EXISTS `student_career` (
  `id` int(11) NOT NULL,
  `career_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `career_id` (`career_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_history`
--

CREATE TABLE IF NOT EXISTS `student_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sch_id` int(11) NOT NULL,
  `sch_admin_no` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `sch_id` (`sch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `student_history`
--

INSERT INTO `student_history` (`id`, `sch_id`, `sch_admin_no`, `student_id`) VALUES
(3, 1, 101, 3),
(4, 1, 102, 4),
(5, 1, 103, 5),
(6, 1, 104, 6),
(7, 1, 105, 7),
(8, 1, 106, 8),
(9, 1, 107, 9),
(10, 1, 108, 10),
(11, 1, 109, 11),
(12, 1, 110, 12),
(13, 1, 111, 13),
(14, 1, 112, 14),
(15, 1, 113, 15),
(16, 1, 114, 16),
(17, 1, 115, 17),
(18, 1, 116, 18),
(19, 1, 117, 19),
(20, 1, 118, 20),
(21, 1, 119, 21),
(22, 1, 120, 22),
(23, 1, 121, 23),
(24, 1, 122, 24),
(25, 1, 123, 25),
(26, 1, 124, 26),
(27, 1, 125, 27),
(28, 1, 126, 28),
(29, 1, 127, 29),
(30, 1, 128, 30),
(31, 1, 129, 31),
(32, 1, 130, 32);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sub_abbr` varchar(10) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `sub_abbr`, `group_id`) VALUES
(1, 'English', 'ENG', 1),
(2, 'Kiswahili', 'KIS', 1),
(3, 'Mathematics', 'MAT', 1),
(4, 'Biology', 'BIO', 1),
(5, 'Physics', 'PHY', 1),
(6, 'Geography', 'GEG', 1),
(7, 'Christian Religious ', 'CRE', 1),
(8, 'Islamic Religious Ed', 'IRE', 1),
(9, 'History and Governme', 'HAG', 1),
(10, 'Chemistry', 'CHEM', 1),
(11, 'Hindu Religious Educ', 'HRE', 1),
(12, 'Home Science', 'HSE', 1),
(13, 'Art and Design', 'ARD', 1),
(14, 'Agriculture', 'AGR', 1),
(15, 'Woodwork', 'WWK', 1),
(16, 'Metal work', 'MWK', 1),
(17, 'Building Constructio', 'BLG', 1),
(18, 'Power Mechanics', 'PMC', 1),
(19, 'Electricity', 'ELE', 1),
(20, 'Drawing and Design', 'DRD', 1),
(21, 'Aviation Technology', 'AVT', 1),
(22, 'Computer Studies', 'CMP', 1),
(23, 'French', 'FRE', 1),
(24, 'German', 'GER', 1),
(25, 'Arabic', 'ARB', 1),
(26, 'Kenya Sign Language', 'KSL', 1),
(27, 'Music', 'MUS', 1),
(28, 'Business Studies', 'BST', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sys_user`
--

CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `object_type` varchar(20) NOT NULL,
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_user`
--

INSERT INTO `sys_user` (`id`, `username`, `password`, `object_type`, `object_id`) VALUES
(0, 'Madeline', 'made', 'Teacher', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tch_cls_hist`
--

CREATE TABLE IF NOT EXISTS `tch_cls_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tch_hst_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `tch_hst_id` (`tch_hst_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tch_cls_hist`
--

INSERT INTO `tch_cls_hist` (`id`, `tch_hst_id`, `class_id`, `role`, `year`) VALUES
(1, 1, 1, 'teacher', 2013),
(2, 1, 2, 'teacher', 2013);

-- --------------------------------------------------------

--
-- Table structure for table `tch_sub_hst`
--

CREATE TABLE IF NOT EXISTS `tch_sub_hst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tch_cls_hst_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tch_cls_hst_id` (`tch_cls_hst_id`),
  KEY `subject_id` (`subject_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tch_sub_hst`
--

INSERT INTO `tch_sub_hst` (`id`, `tch_cls_hst_id`, `subject_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sur_name` varchar(40) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `second_name` varchar(40) NOT NULL,
  `phone` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `sur_name`, `first_name`, `second_name`, `phone`) VALUES
(1, '', 'Madeline ', '0', 0),
(2, '', 'Harry ', '0', 0),
(3, '', 'Morris', '0', 0),
(4, '', 'Jacobs', '0', 0),
(5, '', 'Marsha', '0', 0),
(6, '', 'Alison ', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_history`
--

CREATE TABLE IF NOT EXISTS `teacher_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `sch_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `start_date` int(11) NOT NULL,
  `end_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `sch_id` (`sch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `teacher_history`
--

INSERT INTO `teacher_history` (`id`, `teacher_id`, `sch_id`, `role`, `start_date`, `end_date`) VALUES
(1, 1, 1, 1, 1991, NULL),
(2, 1, 2, 2, 1992, 1995),
(3, 2, 1, 3, 1992, 2009),
(4, 3, 3, 3, 1992, 2009),
(5, 4, 4, 2, 1992, 2009);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_exam_result`
--
CREATE TABLE IF NOT EXISTS `vw_exam_result` (
`exam_title` varchar(40)
,`term` varchar(11)
,`date_taken` date
,`class_id` int(11)
,`class_form` varchar(20)
,`stream` varchar(40)
,`year` year(4)
,`student_name` varchar(122)
,`id` int(11)
,`exam_id` int(11)
,`student_id` int(11)
,`Mat` int(11)
,`Eng` int(11)
,`Kis` int(11)
,`Che` int(11)
,`Bio` int(11)
,`Phy` int(11)
,`Geo` int(11)
,`Hag` int(11)
,`Cre` int(11)
,`Bst` int(11)
,`Fre` int(11)
,`Hsc` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_student_hist`
--
CREATE TABLE IF NOT EXISTS `vw_student_hist` (
`pr_std_id` int(11)
,`student_name` varchar(122)
,`sch_id` int(11)
,`class` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_tch_roles`
--
CREATE TABLE IF NOT EXISTS `vw_tch_roles` (
`id` int(11)
,`teacher_name` varchar(122)
,`sch_id` int(11)
,`role` int(11)
,`start_date` int(11)
,`end_date` int(11)
,`class_id` int(11)
,`class_role` varchar(20)
,`year` year(4)
,`subject_id` int(11)
,`name` varchar(20)
);
-- --------------------------------------------------------

--
-- Structure for view `vw_exam_result`
--
DROP TABLE IF EXISTS `vw_exam_result`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_exam_result` AS select `exam`.`title` AS `exam_title`,`exam`.`term` AS `term`,`exam_taken`.`date_taken` AS `date_taken`,`class`.`id` AS `class_id`,`class`.`form` AS `class_form`,`class`.`stream` AS `stream`,`class`.`year` AS `year`,concat(`student`.`sur_name`,' ',`student`.`first_name`,' ',`student`.`second_name`) AS `student_name`,`result`.`id` AS `id`,`result`.`exam_id` AS `exam_id`,`result`.`student_id` AS `student_id`,`result`.`Mat` AS `Mat`,`result`.`Eng` AS `Eng`,`result`.`Kis` AS `Kis`,`result`.`Che` AS `Che`,`result`.`Bio` AS `Bio`,`result`.`Phy` AS `Phy`,`result`.`Geg` AS `Geo`,`result`.`Hag` AS `Hag`,`result`.`Cre` AS `Cre`,`result`.`Bst` AS `Bst`,`result`.`fre` AS `Fre`,`result`.`Hsc` AS `Hsc` from ((((((`exam` left join `exam_taken` on((`exam`.`id` = `exam_taken`.`exam_id`))) left join `result` on((`exam_taken`.`exam_id` = `result`.`exam_id`))) left join `student` on((`result`.`student_id` = `student`.`id`))) left join `student_history` on((`student`.`id` = `student_history`.`student_id`))) left join `std_class_hst` on((`student_history`.`id` = `std_class_hst`.`std_hst_id`))) left join `class` on((`std_class_hst`.`class_id` = `class`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_student_hist`
--
DROP TABLE IF EXISTS `vw_student_hist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_student_hist` AS select `student`.`id` AS `pr_std_id`,concat(`student`.`sur_name`,' ',`student`.`first_name`,' ',`student`.`second_name`) AS `student_name`,`student_history`.`sch_id` AS `sch_id`,`std_class_hst`.`class_id` AS `class` from ((`student` join `student_history` on((`student`.`id` = `student_history`.`student_id`))) join `std_class_hst` on((`std_class_hst`.`std_hst_id` = `student_history`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_tch_roles`
--
DROP TABLE IF EXISTS `vw_tch_roles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_tch_roles` AS select `teacher`.`id` AS `id`,concat(`teacher`.`sur_name`,' ',`teacher`.`first_name`,' ',`teacher`.`second_name`) AS `teacher_name`,`teacher_history`.`sch_id` AS `sch_id`,`teacher_history`.`role` AS `role`,`teacher_history`.`start_date` AS `start_date`,`teacher_history`.`end_date` AS `end_date`,`tch_cls_hist`.`class_id` AS `class_id`,`tch_cls_hist`.`role` AS `class_role`,`tch_cls_hist`.`year` AS `year`,`tch_sub_hst`.`subject_id` AS `subject_id`,`subject`.`name` AS `name` from ((((`teacher` left join `teacher_history` on((`teacher`.`id` = `teacher_history`.`teacher_id`))) left join `tch_cls_hist` on((`tch_cls_hist`.`tch_hst_id` = `teacher_history`.`id`))) left join `tch_sub_hst` on((`tch_sub_hst`.`tch_cls_hst_id` = `tch_cls_hist`.`id`))) left join `subject` on((`subject`.`id` = `tch_sub_hst`.`subject_id`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `career`
--
ALTER TABLE `career`
  ADD CONSTRAINT `career_ibfk_1` FOREIGN KEY (`cluster_group_id`) REFERENCES `cluster_group` (`id`);

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`sch_id`) REFERENCES `school` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`sch_id`) REFERENCES `school` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_taken`
--
ALTER TABLE `exam_taken`
  ADD CONSTRAINT `exam_taken_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `result_ibfk_3` FOREIGN KEY (`exam_id`) REFERENCES `exam_taken` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sch_event`
--
ALTER TABLE `sch_event`
  ADD CONSTRAINT `sch_event_ibfk_1` FOREIGN KEY (`sch_id`) REFERENCES `school` (`id`);

--
-- Constraints for table `std_class_hst`
--
ALTER TABLE `std_class_hst`
  ADD CONSTRAINT `std_class_hst_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `std_class_hst_ibfk_4` FOREIGN KEY (`std_hst_id`) REFERENCES `student_history` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `student_career`
--
ALTER TABLE `student_career`
  ADD CONSTRAINT `student_career_ibfk_1` FOREIGN KEY (`career_id`) REFERENCES `career` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_career_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `student_history`
--
ALTER TABLE `student_history`
  ADD CONSTRAINT `student_history_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `student_history_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `student_history_ibfk_4` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `student_history_ibfk_6` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `student_history_ibfk_7` FOREIGN KEY (`sch_id`) REFERENCES `school` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_history_ibfk_8` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `cluster_group` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tch_cls_hist`
--
ALTER TABLE `tch_cls_hist`
  ADD CONSTRAINT `tch_cls_hist_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `tch_cls_hist_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `tch_cls_hist_ibfk_3` FOREIGN KEY (`tch_hst_id`) REFERENCES `teacher_history` (`id`);

--
-- Constraints for table `tch_sub_hst`
--
ALTER TABLE `tch_sub_hst`
  ADD CONSTRAINT `tch_sub_hst_ibfk_3` FOREIGN KEY (`tch_cls_hst_id`) REFERENCES `tch_cls_hist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tch_sub_hst_ibfk_4` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `teacher_history`
--
ALTER TABLE `teacher_history`
  ADD CONSTRAINT `teacher_history_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  ADD CONSTRAINT `teacher_history_ibfk_2` FOREIGN KEY (`sch_id`) REFERENCES `school` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
