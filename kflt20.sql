-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 27, 2019 at 06:54 PM
-- Server version: 5.6.39-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kflt20`
--

-- --------------------------------------------------------

--
-- Table structure for table `AUCTION_MESSAGES_INFO`
--

CREATE TABLE `AUCTION_MESSAGES_INFO` (
  `MESSAGE_ID` int(11) NOT NULL,
  `USER_NAME` varchar(40) NOT NULL,
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `MESSAGE` varchar(40) NOT NULL,
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AUCTION_PLAYER_INFO`
--

CREATE TABLE `AUCTION_PLAYER_INFO` (
  `AUCTION_ID` int(11) NOT NULL DEFAULT '1',
  `PLAYER_ID` int(11) NOT NULL,
  `PLAYER_NAME` varchar(100) NOT NULL,
  `IPL_TEAM` varchar(10) NOT NULL,
  `LEAGUE_ID` int(11) NOT NULL,
  `TEAM_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `PRICE` float NOT NULL DEFAULT '0',
  `IS_SOLD` tinyint(1) DEFAULT '0',
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AUCTION_PLAYER_INFO`
--

INSERT INTO `AUCTION_PLAYER_INFO` (`AUCTION_ID`, `PLAYER_ID`, `PLAYER_NAME`, `IPL_TEAM`, `LEAGUE_ID`, `TEAM_ID`, `USER_ID`, `PRICE`, `IS_SOLD`, `UPDATE_DTM`) VALUES
(1, 3852, 'Rohit Sharma', 'MI', 1015, 14, 72, 12, 1, '2019-03-23 17:16:08');

-- --------------------------------------------------------

--
-- Stand-in structure for view `AUCTION_STAT`
-- (See below for the actual view)
--
CREATE TABLE `AUCTION_STAT` (
`TEAM_ID` int(11)
,`LEAGUE_ID` int(11)
,`totalAmount` double
,`totalPlayers` bigint(21)
,`preferenceCode` bigint(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `CLOSED_BIDDING`
--

CREATE TABLE `CLOSED_BIDDING` (
  `PLAYER_ID` int(11) NOT NULL,
  `TEAM_ID` int(11) NOT NULL,
  `PRICE` float NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `LEAGUE_ID` int(11) NOT NULL DEFAULT '0',
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CLOSED_BIDDING`
--

INSERT INTO `CLOSED_BIDDING` (`PLAYER_ID`, `TEAM_ID`, `PRICE`, `USER_ID`, `LEAGUE_ID`, `UPDATE_DTM`) VALUES
(28035, 12, 30, 3, 1001, '2017-03-23 05:41:18');

-- --------------------------------------------------------

--
-- Table structure for table `COMBO_PLAYERS_INFO`
--

CREATE TABLE `COMBO_PLAYERS_INFO` (
  `COMBO_ID` int(11) NOT NULL,
  `PLAYER_ID` varchar(40) NOT NULL,
  `BASE_PRICE` float NOT NULL DEFAULT '0',
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CRIC_API_MAPPING`
--

CREATE TABLE `CRIC_API_MAPPING` (
  `CRIC_PLAYER_ID` int(11) NOT NULL,
  `PLAYER_ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `LEAGUE_AUCTION_INFO`
--

CREATE TABLE `LEAGUE_AUCTION_INFO` (
  `LEAGUE_ID` int(11) NOT NULL DEFAULT '0',
  `AUCTION_TYPE` varchar(6) NOT NULL DEFAULT 'OPEN',
  `AMOUNT_IN_TREASURY` float NOT NULL DEFAULT '0',
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LEAGUE_AUCTION_INFO`
--

INSERT INTO `LEAGUE_AUCTION_INFO` (`LEAGUE_ID`, `AUCTION_TYPE`, `AMOUNT_IN_TREASURY`, `UPDATE_DTM`) VALUES
(1015, 'OPEN', 100, '2017-03-15 06:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `LEAGUE_INFO`
--

CREATE TABLE `LEAGUE_INFO` (
  `LEAGUE_ID` int(11) NOT NULL,
  `LEAGUE_NAME` varchar(40) NOT NULL,
  `ADMIN_ID` int(11) NOT NULL,
  `IS_ACTIVE` tinyint(1) NOT NULL DEFAULT '1',
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LEAGUE_INFO`
--

INSERT INTO `LEAGUE_INFO` (`LEAGUE_ID`, `LEAGUE_NAME`, `ADMIN_ID`, `IS_ACTIVE`, `UPDATE_DTM`) VALUES
(1015, 'CSE Guys', 47, 1, '2017-03-26 16:08:09'),
(1016, 'V2019Leaue', 70, 1, '2018-12-28 07:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `LEAGUE_PRICE_TABLE`
--

CREATE TABLE `LEAGUE_PRICE_TABLE` (
  `LEAGUE_ID` int(11) NOT NULL,
  `PLAYER_ID` int(40) NOT NULL,
  `BASE_PRICE` float NOT NULL DEFAULT '0',
  `AUCTION_TYPE` varchar(20) NOT NULL DEFAULT 'OPEN',
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LEAGUE_PRICE_TABLE`
--

INSERT INTO `LEAGUE_PRICE_TABLE` (`LEAGUE_ID`, `PLAYER_ID`, `BASE_PRICE`, `AUCTION_TYPE`, `UPDATE_DTM`) VALUES
(1015, 1, 2, 'OPEN', '2019-03-23 11:12:14'),
(1015, 2, 2, 'OPEN', '2019-03-23 11:12:14'),
(1015, 3, 2, 'OPEN', '2019-03-23 11:12:14'),
(1015, 4, 2, 'OPEN', '2019-03-23 11:12:14'),
(1015, 1201, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 3355, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 3632, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 3675, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 3676, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 3700, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 3722, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 3723, 2, 'OPEN', '2019-03-23 06:54:53'),
(1015, 3850, 2, 'OPEN', '2019-03-23 06:54:53'),
(1015, 3852, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 3991, 2, 'OPEN', '2019-03-23 06:54:53'),
(1015, 3993, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 4176, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 4308, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 4311, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 4330, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 4338, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 4532, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 4555, 2, 'OPEN', '2019-03-23 06:54:53'),
(1015, 5132, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 5380, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 9782, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 9844, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 10062, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 10115, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 10130, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 11229, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 12047, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 28891, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 48816, 2, 'OPEN', '2019-03-23 06:54:53'),
(1015, 59314, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 60122, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 63187, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 63611, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 63751, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 63755, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 63788, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 63961, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 64254, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 65748, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 65756, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 66812, 2, 'OPEN', '2019-03-23 06:54:52'),
(1015, 66818, 2, 'OPEN', '2019-03-23 06:54:53'),
(1015, 67540, 2, 'OPEN', '2019-03-23 06:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `MATCH_DETAILS`
--

CREATE TABLE `MATCH_DETAILS` (
  `MATCH_ID` varchar(10) NOT NULL,
  `UPDATE_DTM` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TEAM_1` varchar(100) NOT NULL,
  `TEAM_2` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MATCH_DETAILS`
--

INSERT INTO `MATCH_DETAILS` (`MATCH_ID`, `UPDATE_DTM`, `TEAM_1`, `TEAM_2`, `DESCRIPTION`) VALUES
('1136582', '2018-04-24 20:44:14', 'Delhi Daredevils', 'Kings XI Punjab', 'Delhi Daredevils 139/8 * v Kings XI Punjab 143/8'),
('1136561', '2018-04-24 20:40:53', 'Mumbai Indians', 'Chennai Super Kings', 'Mumbai Indians 165/4  v Chennai Super Kings 169/9 *'),
('1136562', '2018-04-24 20:42:22', 'Kings XI Punjab', 'Delhi Daredevils', 'Kings XI Punjab 167/4 * v Delhi Daredevils 166/7'),
('1136563', '2018-04-24 20:42:40', 'Kolkata Knight Riders', 'Royal Challengers Bangalore', 'Kolkata Knight Riders 177/6 * v Royal Challengers Bangalore 176/7'),
('1136564', '2018-04-24 20:42:45', 'Sunrisers Hyderabad', 'Rajasthan Royals', 'Sunrisers Hyderabad 127/1 * v Rajasthan Royals 125/9'),
('1136565', '2018-04-24 20:42:49', 'Chennai Super Kings', 'Kolkata Knight Riders', 'Chennai Super Kings 205/5 * v Kolkata Knight Riders 202/6'),
('1136566', '2018-04-24 20:42:54', 'Rajasthan Royals', 'Delhi Daredevils', 'Rajasthan Royals 153/5  v Delhi Daredevils 60/4 *'),
('1136567', '2018-04-24 20:43:01', 'Sunrisers Hyderabad', 'Mumbai Indians', 'Sunrisers Hyderabad 151/9 * v Mumbai Indians 147/8'),
('1136568', '2018-04-24 20:43:04', 'Royal Challengers Bangalore', 'Kings XI Punjab', 'Royal Challengers Bangalore 159/6  v Kings XI Punjab 155/10'),
('1136569', '2018-04-24 20:43:15', 'Mumbai Indians', 'Delhi Daredevils', 'Mumbai Indians 194/7  v Delhi Daredevils 195/3 *'),
('1136570', '2018-04-24 20:43:20', 'Kolkata Knight Riders', 'Sunrisers Hyderabad', 'Kolkata Knight Riders 138/8  v Sunrisers Hyderabad 32 *'),
('1136571', '2018-04-24 20:43:24', 'Royal Challengers Bangalore', 'Rajasthan Royals', 'Royal Challengers Bangalore 198/6 * v Rajasthan Royals 217/4'),
('1136572', '2018-04-24 20:43:28', 'Kings XI Punjab', 'Chennai Super Kings', 'Kings XI Punjab 197/7  v Chennai Super Kings 193/5 *'),
('1136573', '2018-04-24 20:43:32', 'Kolkata Knight Riders', 'Delhi Daredevils', 'Kolkata Knight Riders 200/9  v Delhi Daredevils 129/10 *'),
('1136574', '2018-04-24 20:43:36', 'Mumbai Indians', 'Royal Challengers Bangalore', 'Mumbai Indians 213/6  v Royal Challengers Bangalore 167/8'),
('1136575', '2018-04-24 20:43:39', 'Rajasthan Royals', 'Kolkata Knight Riders', 'Rajasthan Royals 160/8  v Kolkata Knight Riders 163/3 *'),
('1136576', '2018-04-24 20:43:43', 'Kings XI Punjab', 'Sunrisers Hyderabad', 'Kings XI Punjab 193/3  v Sunrisers Hyderabad 178/4 *'),
('1136577', '2018-04-24 20:43:46', 'Chennai Super Kings', 'Rajasthan Royals', 'Chennai Super Kings 204/5  v Rajasthan Royals 140/10 *'),
('1136578', '2018-04-24 20:43:49', 'Kolkata Knight Riders', 'Kings XI Punjab', 'Kolkata Knight Riders 191/7  v Kings XI Punjab 126/1 *'),
('1136579', '2018-04-24 20:43:55', 'Royal Challengers Bangalore', 'Delhi Daredevils', 'Royal Challengers Bangalore 176/4 * v Delhi Daredevils 174/5'),
('1136580', '2018-04-24 20:43:58', 'Sunrisers Hyderabad', 'Chennai Super Kings', 'Sunrisers Hyderabad 178/6 * v Chennai Super Kings 182/3'),
('1136581', '2018-04-24 20:44:05', 'Rajasthan Royals', 'Mumbai Indians', 'Rajasthan Royals 168/7 * v Mumbai Indians 167/7'),
('1136583', '2018-05-08 09:36:10', 'Mumbai Indians', 'Sunrisers Hyderabad', 'Mumbai Indians 87/10 * v Sunrisers Hyderabad 118/10'),
('1136584', '2018-05-08 10:46:57', 'Royal Challengers Bangalore', 'Chennai Super Kings', 'Royal Challengers Bangalore 205/8  v Chennai Super Kings 207/5 *'),
('1136585', '2018-05-08 10:47:40', 'Sunrisers Hyderabad', 'Kings XI Punjab', 'Sunrisers Hyderabad 132/6  v Kings XI Punjab 119/10 *'),
('1136586', '2018-05-08 10:49:11', 'Delhi Daredevils', 'Kolkata Knight Riders', 'Delhi Daredevils 219/4  v Kolkata Knight Riders 164/9 *'),
('1136587', '2018-05-08 10:49:48', 'Chennai Super Kings', 'Mumbai Indians', 'Chennai Super Kings 169/5  v Mumbai Indians 170/2 *'),
('1136588', '2018-05-08 22:45:09', 'Rajasthan Royals', 'Sunrisers Hyderabad', 'Rajasthan Royals v Sunrisers Hyderabad'),
('1136589', '2018-05-08 23:24:45', 'Royal Challengers Bangalore', 'Kolkata Knight Riders', 'Royal Challengers Bangalore 175/4  v Kolkata Knight Riders 176/4 *'),
('1136590', '2018-05-08 23:33:12', 'Chennai Super Kings', 'Delhi Daredevils', 'Chennai Super Kings 211/4  v Delhi Daredevils 198/5 *'),
('1136591', '2018-05-08 23:34:54', 'Royal Challengers Bangalore', 'Mumbai Indians', 'Royal Challengers Bangalore 167/7  v Mumbai Indians 153/7 *'),
('1136592', '2018-05-08 23:35:50', 'Delhi Daredevils', 'Rajasthan Royals', 'Delhi Daredevils 196/6  v Rajasthan Royals 146/5 *'),
('1136593', '2018-05-08 23:36:18', 'Kolkata Knight Riders', 'Chennai Super Kings', 'Kolkata Knight Riders 180/4 * v Chennai Super Kings 177/5'),
('1136594', '2018-05-08 23:37:13', 'Kings XI Punjab', 'Mumbai Indians', 'Kings XI Punjab 174/6  v Mumbai Indians 176/4 *'),
('1136595', '2018-05-08 23:37:55', 'Chennai Super Kings', 'Royal Challengers Bangalore', 'Chennai Super Kings 128/4 * v Royal Challengers Bangalore 127/9'),
('1136596', '2018-05-08 23:39:07', 'Sunrisers Hyderabad', 'Delhi Daredevils', 'Sunrisers Hyderabad 164/3 * v Delhi Daredevils 163/5'),
('1136597', '2018-05-08 23:40:00', 'Mumbai Indians', 'Kolkata Knight Riders', 'Mumbai Indians 181/4  v Kolkata Knight Riders 168/6 *'),
('1136598', '2018-05-08 23:40:46', 'Kings XI Punjab', 'Rajasthan Royals', 'Kings XI Punjab 155/4 * v Rajasthan Royals 152/9'),
('1136599', '2018-05-08 23:41:35', 'Sunrisers Hyderabad', 'Royal Challengers Bangalore', 'Sunrisers Hyderabad 146/10  v Royal Challengers Bangalore 141/6 *'),
('1136600', '2018-05-08 23:42:21', 'Rajasthan Royals', 'Kings XI Punjab', 'Rajasthan Royals 158/8  v Kings XI Punjab 143/7 *'),
('1136601', '2018-05-09 13:59:43', 'Kolkata Knight Riders', 'Mumbai Indians', 'Kolkata Knight Riders 108/10 * v Mumbai Indians 210/6'),
('1136602', '2018-05-10 18:45:30', 'Delhi Daredevils', 'Sunrisers Hyderabad', 'Delhi Daredevils 187/5  v Sunrisers Hyderabad 191/1 *'),
('1136603', '2018-05-11 17:35:48', 'Rajasthan Royals', 'Chennai Super Kings', 'Rajasthan Royals 177/6 * v Chennai Super Kings 176/4'),
('1136604', '2018-05-13 02:34:32', 'Kings XI Punjab', 'Kolkata Knight Riders', 'Kings XI Punjab 214/8 * v Kolkata Knight Riders 245/6'),
('1136605', '2018-05-13 02:36:06', 'Delhi Daredevils', 'Royal Challengers Bangalore', 'Delhi Daredevils 181/4  v Royal Challengers Bangalore 187/5 *'),
('1136606', '2018-05-13 11:56:17', 'Chennai Super Kings', 'Sunrisers Hyderabad', 'Chennai Super Kings 180/2 * v Sunrisers Hyderabad 179/4'),
('1136607', '2018-05-13 11:57:00', 'Mumbai Indians', 'Rajasthan Royals', 'Mumbai Indians 168/6  v Rajasthan Royals 171/3 *'),
('1136608', '2018-05-14 11:08:15', 'Kings XI Punjab', 'Royal Challengers Bangalore', 'Kings XI Punjab 88/10  v Royal Challengers Bangalore 92 *'),
('1136609', '2018-05-15 12:12:57', 'Kolkata Knight Riders', 'Rajasthan Royals', 'Kolkata Knight Riders 145/4 * v Rajasthan Royals 142/10'),
('1136610', '2018-05-16 19:47:56', 'Mumbai Indians', 'Kings XI Punjab', 'Mumbai Indians 186/8  v Kings XI Punjab 183/5 *'),
('1136611', '2018-05-17 20:13:25', 'Royal Challengers Bangalore', 'Sunrisers Hyderabad', 'Royal Challengers Bangalore 218/6  v Sunrisers Hyderabad 204/3 *'),
('1136612', '2018-05-19 03:11:27', 'Delhi Daredevils', 'Chennai Super Kings', 'Delhi Daredevils 162/5  v Chennai Super Kings 128/6 *'),
('1136613', '2018-05-19 09:38:40', 'Rajasthan Royals', 'Royal Challengers Bangalore', 'Rajasthan Royals 164/5  v Royal Challengers Bangalore 134/10 *'),
('1136614', '2018-05-19 20:23:10', 'Sunrisers Hyderabad', 'Kolkata Knight Riders', 'Sunrisers Hyderabad 172/9  v Kolkata Knight Riders 173/5 *'),
('1136615', '2018-05-20 09:44:59', 'Delhi Daredevils', 'Mumbai Indians', 'Delhi Daredevils 174/4  v Mumbai Indians 163/10 *'),
('1136616', '2018-05-20 20:25:32', 'Chennai Super Kings', 'Kings XI Punjab', 'Chennai Super Kings 159/5 * v Kings XI Punjab 153/10'),
('1136617', '2018-05-22 19:23:19', 'Sunrisers Hyderabad', 'Chennai Super Kings', 'Sunrisers Hyderabad 139/7  v Chennai Super Kings 140/8 *'),
('1136618', '2018-05-24 08:29:50', 'Kolkata Knight Riders', 'Rajasthan Royals', 'Kolkata Knight Riders 169/7  v Rajasthan Royals 144/4 *'),
('1136619', '2018-05-25 10:53:54', 'Kolkata Knight Riders', 'Sunrisers Hyderabad', 'Kolkata Knight Riders 160/9 * v Sunrisers Hyderabad 174/7'),
('1136620', '2018-05-27 10:59:32', 'Chennai Super Kings', 'Sunrisers Hyderabad', 'Chennai Super Kings 181/2 * v Sunrisers Hyderabad 178/6');

-- --------------------------------------------------------

--
-- Table structure for table `MATCH_INFO`
--

CREATE TABLE `MATCH_INFO` (
  `MATCH_ID` int(11) NOT NULL,
  `PLAYED_DATE` varchar(100) NOT NULL,
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MATCH_INFO`
--

INSERT INTO `MATCH_INFO` (`MATCH_ID`, `PLAYED_DATE`, `UPDATE_DTM`) VALUES
(196220, '2017-04-09 14:30:00', '2017-04-09 23:50:27'),
(196221, '2017-04-10 14:30:00', '2017-04-10 20:30:28'),
(196222, '2017-04-11 14:30:00', '2017-04-11 18:04:41'),
(196223, '2017-04-12 14:30:00', '2017-04-12 18:35:49'),
(196224, '2017-04-13 14:30:00', '2017-04-13 18:09:00'),
(196225, '2017-04-14 10:30:00', '2017-04-14 17:09:38'),
(196226, '2017-04-14 14:30:00', '2017-04-15 06:35:18'),
(196227, '2017-04-15 10:30:00', '2017-04-15 15:36:05'),
(196228, '2017-04-15 14:30:00', '2017-04-16 04:57:50'),
(196229, '2017-04-16 10:30:00', '2017-04-16 15:17:38'),
(196230, '2017-04-16 14:30:00', '2017-04-16 18:32:38'),
(196231, '2017-04-17 10:30:00', '2017-04-17 14:52:13'),
(196232, '2017-04-17 14:30:00', '2017-04-17 18:40:59'),
(196233, '2017-04-18 14:30:00', '2017-04-18 18:32:07'),
(196234, '2017-04-19 14:30:00', '2017-04-19 19:11:27'),
(196235, '2017-04-20 14:30:00', '2017-04-20 18:08:52'),
(196236, '2017-04-21 14:30:00', '2017-04-21 23:15:47'),
(196237, '2017-04-22 10:30:00', '2017-04-22 15:05:08'),
(196238, '2017-04-22 14:30:00', '2017-04-22 18:43:45'),
(196239, '2017-04-23 10:30:00', '2017-04-23 14:32:20'),
(196240, '2017-04-23 14:30:00', '2017-04-23 20:24:42'),
(196241, '2017-04-24 14:30:00', '2017-04-24 20:18:04'),
(196242, '2017-04-25 12:12:47', '2017-04-25 19:12:47'),
(196243, '2017-04-26 14:30:00', '2017-04-26 18:36:32'),
(196244, '2017-04-27 14:30:00', '2017-04-27 18:57:03'),
(196245, '2017-04-28 10:30:00', '2017-04-28 14:47:24'),
(196246, '2017-04-28 14:30:00', '2017-04-28 19:37:25'),
(196247, '2017-04-29 10:30:00', '2017-04-29 15:16:05'),
(196248, '2017-04-29 14:30:00', '2017-04-30 01:36:19'),
(196249, '2017-04-30 10:30:00', '2017-04-30 15:05:26'),
(196250, '2017-04-30 14:30:00', '2017-04-30 21:05:03'),
(196251, '2017-05-01 10:30:00', '2017-05-01 15:25:45'),
(196252, '2017-05-01 14:30:00', '2017-05-02 04:35:34'),
(196253, '2017-05-02 14:30:00', '2017-05-14 07:02:35'),
(196254, '2017-05-03 14:30:00', '2017-05-14 04:34:58'),
(196255, '2017-05-04 14:30:00', '2017-05-07 07:58:50'),
(196256, '2017-05-05 14:30:00', '2017-05-06 06:21:53'),
(196257, '2017-05-06 10:30:00', '2017-05-06 15:16:38'),
(196258, '2017-05-06 14:30:00', '2017-05-07 05:50:51'),
(196259, '2017-05-07 10:30:00', '2017-05-07 15:09:15'),
(196260, '2017-05-07 14:30:00', '2017-05-14 04:41:37'),
(196261, '2017-05-08 14:30:00', '2017-05-14 04:41:42'),
(196262, '2017-05-09 14:30:00', '2017-05-14 04:41:47'),
(196263, '2017-05-10 14:30:00', '2017-05-14 04:41:53'),
(196264, '2017-05-11 14:30:00', '2017-05-14 04:41:57'),
(196265, '2017-05-12 14:30:00', '2017-05-14 04:42:02'),
(196266, '2017-05-13 10:30:00', '2017-05-14 04:42:06'),
(196267, '2017-05-13 14:30:00', '2017-05-14 04:42:12'),
(196268, '2017-05-14 10:30:00', '2017-05-14 13:22:47'),
(196269, '2017-05-14 14:30:00', '2017-05-14 20:10:52'),
(196270, '2017-05-16 14:30:00', '2017-05-17 01:41:25'),
(196271, '2017-05-17 14:30:00', '2017-05-19 06:34:25'),
(196272, '2017-05-19 14:30:00', '2017-05-19 18:34:04'),
(1136561, '2018-04-07 7:30:00', '2018-04-15 07:41:47'),
(1136562, '2018-04-08 3:30:00', '2018-04-15 07:41:50'),
(1136563, '2018-04-08 7:30:00', '2018-04-15 07:41:52'),
(1136564, '2018-04-09 7:30:00', '2018-04-15 07:41:55'),
(1136565, '2018-04-10 7:30:00', '2018-04-15 07:42:11'),
(1136566, '2018-04-11 7:30:00', '2018-04-15 07:42:13'),
(1136567, '2018-04-12 7:30:00', '2018-04-15 07:42:16'),
(1136568, '2018-04-13 7:30:00', '2018-04-15 07:42:18'),
(1136569, '2018-04-14 3:30:00', '2018-04-15 07:42:20'),
(1136570, '2018-04-14 7:30:00', '2018-04-15 07:42:23'),
(1136571, '2018-04-15 3:30:00', '2018-04-15 19:00:54'),
(1136572, '2018-04-15 7:30:00', '2018-04-15 19:01:14'),
(1136573, '2018-04-16 7:30:00', '2018-04-17 05:33:04'),
(1136574, '2018-04-17 7:30:00', '2018-04-19 17:09:12'),
(1136575, '2018-04-18 7:30:00', '2018-04-19 17:10:33'),
(1136576, '2018-04-19 7:30:00', '2018-04-19 18:23:18'),
(1136577, '2018-04-20 7:30:00', '2018-04-21 01:47:12'),
(1136578, '2018-04-21 3:30:00', '2018-04-22 16:51:51'),
(1136579, '2018-04-21 7:30:00', '2018-04-22 16:52:16'),
(1136580, '2018-04-22 3:30:00', '2018-04-22 16:52:34'),
(1136581, '2018-04-22 7:30:00', '2018-04-23 05:44:20'),
(1136582, '2018-04-23 7:30:00', '2018-04-24 06:01:53'),
(1136583, '2018-04-24 20:00:00', '2018-05-08 16:36:10'),
(1136584, '2018-04-25 20:00:00', '2018-05-08 17:46:57'),
(1136585, '2018-04-26 20:00:00', '2018-05-08 17:47:39'),
(1136586, '2018-04-27 20:00:00', '2018-05-08 17:49:10'),
(1136587, '2018-04-28 20:00:00', '2018-05-08 17:49:47'),
(1136588, '2018-04-29 16:00:00', '2018-05-09 05:45:07'),
(1136589, '2018-04-29 20:00:00', '2018-05-09 06:24:44'),
(1136590, '2018-04-30 20:00:00', '2018-05-09 06:33:11'),
(1136591, '2018-05-01 20:00:00', '2018-05-09 06:34:53'),
(1136592, '2018-05-02 20:00:00', '2018-05-09 06:35:50'),
(1136593, '2018-05-03 20:00:00', '2018-05-09 06:36:17'),
(1136594, '2018-05-04 20:00:00', '2018-05-09 06:37:12'),
(1136595, '2018-05-05 16:00:00', '2018-05-09 06:37:55'),
(1136596, '2018-05-05 20:00:00', '2018-05-09 06:39:07'),
(1136597, '2018-05-06 16:00:00', '2018-05-09 06:39:59'),
(1136598, '2018-05-06 20:00:00', '2018-05-09 06:40:45'),
(1136599, '2018-05-07 20:00:00', '2018-05-09 06:41:35'),
(1136600, '2018-05-08 20:00:00', '2018-05-09 06:42:20'),
(1136601, '2018-05-09 20:00:00', '2018-05-09 20:59:43'),
(1136602, '2018-05-10 20:00:00', '2018-05-11 01:45:29'),
(1136603, '2018-05-11 20:00:00', '2018-05-12 00:35:48'),
(1136604, '2018-05-12 16:00:00', '2018-05-13 09:34:31'),
(1136605, '2018-05-12 20:00:00', '2018-05-13 09:36:04'),
(1136606, '2018-05-13 16:00:00', '2018-05-13 18:56:16'),
(1136607, '2018-05-13 20:00:00', '2018-05-13 18:57:00'),
(1136608, '2018-05-14 20:00:00', '2018-05-14 18:08:14'),
(1136609, '2018-05-15 20:00:00', '2018-05-15 19:12:56'),
(1136610, '2018-05-16 20:00:00', '2018-05-17 02:47:55'),
(1136611, '2018-05-17 20:00:00', '2018-05-18 03:13:24'),
(1136612, '2018-05-18 20:00:00', '2018-05-19 10:11:26'),
(1136613, '2018-05-19 16:00:00', '2018-05-19 16:38:39'),
(1136614, '2018-05-19 20:00:00', '2018-05-20 03:23:10'),
(1136615, '2018-05-20 16:00:00', '2018-05-20 16:44:59'),
(1136616, '2018-05-20 20:00:00', '2018-05-21 03:25:31'),
(1136617, '2018-05-22 19:00:00', '2018-05-23 02:23:18'),
(1136618, '2018-05-23 19:00:00', '2018-05-24 15:29:49'),
(1136619, '2018-05-25 19:00:00', '2018-05-25 17:53:53'),
(1136620, '2018-05-27 19:00:00', '2018-05-27 17:59:29');

-- --------------------------------------------------------

--
-- Stand-in structure for view `PLAYERS_STAT`
-- (See below for the actual view)
--
CREATE TABLE `PLAYERS_STAT` (
`playerName` varchar(40)
,`iplTeam` varchar(5)
,`teamId` int(11)
,`leagueCode` int(11)
,`soldPrice` float
,`playerId` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `PLAYER_INFO`
--

CREATE TABLE `PLAYER_INFO` (
  `PLAYER_ID` int(11) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `CATEGORY` varchar(100) NOT NULL DEFAULT 'BAT',
  `RUNSFACTOR` int(11) NOT NULL DEFAULT '1',
  `IPL_TEAM` varchar(5) NOT NULL,
  `PLAYER_IMAGE` varchar(40) NOT NULL DEFAULT ' ',
  `ISCOMBO` tinyint(1) NOT NULL DEFAULT '1',
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CRIC_PLAYER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PLAYER_INFO`
--

INSERT INTO `PLAYER_INFO` (`PLAYER_ID`, `NAME`, `CATEGORY`, `RUNSFACTOR`, `IPL_TEAM`, `PLAYER_IMAGE`, `ISCOMBO`, `UPDATE_DTM`, `CRIC_PLAYER_ID`) VALUES
(1, 'Mersal Combos', 'CMB', 1, 'CMB', 'NA', 0, '2019-03-23 10:56:33', 1),
(2, 'Okkali Combos', 'CMB', 1, 'CMB', 'NA', 0, '2019-03-23 10:56:33', 2),
(3, 'Thaaru Maaru Combos', 'CMB', 1, 'CMB', 'NA', 0, '2019-03-23 10:56:33', 3),
(4, 'Theri Combos', 'CMB', 1, 'CMB', 'NA', 0, '2019-03-23 10:56:33', 4),
(1201, 'Chris Gayle', 'BAT', 1, 'KXIP', 'NA', 0, '2019-03-22 14:51:57', 51880),
(3355, 'Shane Watson', 'ALL', 1, 'CSK', 'NA', 0, '2019-03-22 14:51:57', 8180),
(3632, 'Dinesh Karthik', 'CAP', 1, 'KKR', 'NA', 0, '2019-03-22 14:51:57', 30045),
(3675, 'AB de Villiers', 'BAT', 1, 'RCB', 'NA', 0, '2019-03-22 14:51:57', 44936),
(3676, 'MS Dhoni', 'CAP', 1, 'CSK', 'NA', 0, '2019-03-22 14:44:36', 28081),
(3700, 'Suresh Raina', 'BAT', 1, 'CSK', 'NA', 0, '2019-03-22 14:51:57', 33335),
(3722, 'Shikhar Dhawan', 'BAT', 1, 'DD', 'NA', 0, '2019-03-22 14:51:57', 28235),
(3723, 'Robin Uthappa', 'WIC', 1, 'KKR', 'NA', 0, '2019-03-22 14:51:57', 35582),
(3850, 'Ravindra Jadeja', 'ALL', 1, 'CSK', 'NA', 0, '2019-03-22 14:51:57', 234675),
(3852, 'Rohit Sharma', 'CAP', 1, 'MI', 'NA', 0, '2019-03-22 14:51:57', 34102),
(3991, 'Ajinkya Rahane', 'CAP', 1, 'RR', 'NA', 0, '2019-03-22 14:51:57', 277916),
(3993, 'Virat Kohli', 'CAP', 1, 'RCB', 'NA', 0, '2019-03-22 14:51:57', 253802),
(4176, 'AmBati Rayudu', 'WIC', 1, 'CSK', 'NA', 0, '2019-03-22 14:51:57', 33141),
(4308, 'Steven Smith', 'BAT', 1, 'RR', 'NA', 0, '2019-03-22 14:51:57', 436757),
(4311, 'Marcus Stoinis', 'ALL', 1, 'RCB', 'NA', 0, '2019-03-22 14:51:57', 325012),
(4330, 'Kane Williamson', 'CAP', 1, 'SRH', 'NA', 0, '2019-03-22 14:51:57', 277906),
(4338, 'Trent Boult', 'BOW', 1, 'DD', 'NA', 0, '2019-03-22 14:51:57', 277912),
(4532, 'Kedar Jadhav', 'ALL', 1, 'CSK', 'NA', 0, '2019-03-22 14:51:57', 290716),
(4555, 'Ravichandran Ashwin', 'CAP', 1, 'KXIP', 'NA', 0, '2019-03-22 14:51:57', 26421),
(5132, 'Bhuvneshwar Kumar', 'BOW', 1, 'SRH', 'NA', 0, '2019-03-22 14:51:57', 326016),
(5380, 'David Warner', 'BAT', 1, 'SRH', 'NA', 0, '2019-03-22 14:51:57', 249866),
(9782, 'Jos Buttler', 'WIC', 1, 'RR', 'NA', 0, '2019-03-22 14:51:57', 308967),
(9844, 'Yuzvendra Chahal', 'BOW', 1, 'RCB', 'NA', 0, '2019-03-22 14:51:57', 430246),
(10062, 'Chris Lynn', 'BAT', 1, 'KKR', 'NA', 0, '2019-03-22 14:51:57', 326637),
(10115, 'Mayank Agarwal', 'BAT', 1, 'KXIP', 'NA', 0, '2019-03-22 14:51:57', 398438),
(10130, 'Ben Stokes', 'ALL', 1, 'RR', 'NA', 0, '2019-03-22 14:51:57', 311158),
(11229, 'Sunil Narine', 'BOW', 1, 'KKR', 'NA', 0, '2019-03-22 14:51:57', 230558),
(12047, 'Andre Russell', 'ALL', 1, 'KKR', 'NA', 0, '2019-03-22 14:51:57', 276298),
(28891, 'Faf du Plessis', 'BAT', 1, 'CSK', 'NA', 0, '2019-03-22 14:51:57', 44828),
(48816, 'Chris Morris', 'ALL', 1, 'DD', 'NA', 0, '2019-03-22 14:51:57', 439952),
(59314, 'Evin Lewis', 'BAT', 1, 'MI', 'NA', 0, '2019-03-22 14:51:57', 431901),
(60122, 'Lokesh Rahul', 'WIC', 1, 'KXIP', 'NA', 0, '2019-03-22 14:51:57', 422108),
(63187, 'Kuldeep Yadav', 'BOW', 1, 'KKR', 'NA', 0, '2019-03-22 14:51:57', 559235),
(63611, 'Kagiso Rabada', 'BOW', 1, 'DD', 'NA', 0, '2019-03-22 14:51:57', 19264),
(63751, 'Hardik Pandya', 'ALL', 1, 'MI', 'NA', 0, '2019-03-22 14:51:57', 625371),
(63755, 'Jasprit Bumrah', 'BOW', 1, 'MI', 'NA', 0, '2019-03-22 14:51:57', 625383),
(63788, 'Krunal Pandya', 'ALL', 1, 'MI', 'NA', 0, '2019-03-22 14:51:57', 471342),
(63961, 'Shreyas Iyer', 'CAP', 1, 'DD', 'NA', 0, '2019-03-22 14:51:57', 642519),
(64254, 'Jofra Archer', 'ALL', 1, 'RR', 'NA', 0, '2019-03-22 14:51:57', 669855),
(65748, 'Rashid Khan', 'BOW', 1, 'SRH', 'NA', 0, '2019-03-22 14:51:57', 793463),
(65756, 'Rishabh Pant', 'WIC', 1, 'DD', 'NA', 0, '2019-03-22 14:51:57', 931581),
(66812, 'Prithvi Shaw', 'BAT', 1, 'DD', 'NA', 0, '2019-03-22 14:51:57', 1070168),
(66818, 'Shubman Gill', 'BAT', 1, 'KKR', 'NA', 0, '2019-03-22 14:51:57', 1070173),
(67540, 'Mujeeb Ur Rahman', 'BOW', 1, 'KXIP', 'NA', 0, '2019-03-22 14:51:57', 974109);

-- --------------------------------------------------------

--
-- Stand-in structure for view `PLAYER_POINTS`
-- (See below for the actual view)
--
CREATE TABLE `PLAYER_POINTS` (
`PLAYER_ID` int(11)
,`TEAM_ID` int(11)
,`NAME` varchar(40)
,`iplteam` varchar(5)
,`TOTAL_RUNS` bigint(11)
,`TOTAL_RUNS_POINTS` bigint(11)
,`runPoints` bigint(31)
,`fourPoints` bigint(31)
,`sixPoints` bigint(31)
,`runs25Points` bigint(31)
,`strikeRatePoints` bigint(22)
,`duckOutPoints` bigint(21)
,`wicketPoints` bigint(31)
,`threeOr5WicketHaul` bigint(21)
,`maidenPoints` bigint(31)
,`hatrickPoints` bigint(31)
,`economyPoints` decimal(25,3)
,`catchesPoints` bigint(31)
,`stumpingPoints` bigint(31)
,`runOutPoints` bigint(31)
,`momPoints` bigint(31)
,`matchId` bigint(11)
,`playedDate` datetime
,`IstDate` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `PLAYER_SCORE_INFO`
--

CREATE TABLE `PLAYER_SCORE_INFO` (
  `PLAYER_ID` int(11) NOT NULL,
  `NO_OF_WICKETS` int(11) NOT NULL DEFAULT '0',
  `NO_OF_OVERS` decimal(11,2) NOT NULL DEFAULT '0.00',
  `NO_OF_RUNOUTS` int(11) NOT NULL DEFAULT '0',
  `NO_OF_STUMPING` int(11) NOT NULL DEFAULT '0',
  `NO_OF_CATCHES` int(11) NOT NULL DEFAULT '0',
  `NO_OF_MAIDEN` int(11) NOT NULL DEFAULT '0',
  `NO_OF_HATRICK` int(11) NOT NULL DEFAULT '0',
  `BOWLING_RUNS` int(11) NOT NULL DEFAULT '0',
  `NO_OF_SIX` int(11) NOT NULL DEFAULT '0',
  `NO_OF_FOUR` int(11) NOT NULL DEFAULT '0',
  `TOTAL_RUNS` int(11) NOT NULL DEFAULT '0',
  `BATSMAN_BALLS` int(11) NOT NULL DEFAULT '0',
  `IS_OUT` tinyint(1) NOT NULL DEFAULT '0',
  `MOM` int(11) NOT NULL,
  `MATCH_ID` int(11) NOT NULL,
  `PLAYED_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `POINTS_CONFIG_INFO`
--

CREATE TABLE `POINTS_CONFIG_INFO` (
  `POINTS_ID` int(11) NOT NULL,
  `WICKETS_POINTS` int(11) NOT NULL DEFAULT '1',
  `WICKETS3_POINTS` int(11) NOT NULL DEFAULT '1',
  `WICKETS5_POINTS` int(11) NOT NULL DEFAULT '1',
  `ECON_WIC_POINTS` int(11) NOT NULL DEFAULT '1',
  `ECON_NO_WIC_POINTS` int(11) NOT NULL DEFAULT '1',
  `OVERS_POINTS` int(11) NOT NULL DEFAULT '1',
  `RUNOUTS_POINTS` int(11) NOT NULL DEFAULT '1',
  `STUMPING_POINTS` int(11) NOT NULL DEFAULT '1',
  `CATCHES_POINTS` int(11) NOT NULL DEFAULT '1',
  `MAIDEN_POINTS` int(11) NOT NULL DEFAULT '1',
  `HATRICK_POINTS` int(11) NOT NULL DEFAULT '1',
  `BOWLING_RUNS_POINTS` int(11) NOT NULL DEFAULT '1',
  `SIX_POINTS` int(11) NOT NULL DEFAULT '1',
  `FOUR_POINTS` int(11) NOT NULL DEFAULT '1',
  `TOTAL_RUNS_POINTS` int(11) NOT NULL DEFAULT '1',
  `BATSMAN_BALLS_POINTS` int(11) NOT NULL DEFAULT '1',
  `BATSMAN_RUNS_25` int(11) NOT NULL DEFAULT '1',
  `STRIKE_RATE_POINTS` int(11) NOT NULL DEFAULT '1',
  `DUCK_OUT_POINTS` int(11) NOT NULL DEFAULT '1',
  `MOM_POINTS` int(11) NOT NULL,
  `EFF_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `END_DT` timestamp NOT NULL DEFAULT '2018-04-02 06:59:59',
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `POINTS_CONFIG_INFO`
--

INSERT INTO `POINTS_CONFIG_INFO` (`POINTS_ID`, `WICKETS_POINTS`, `WICKETS3_POINTS`, `WICKETS5_POINTS`, `ECON_WIC_POINTS`, `ECON_NO_WIC_POINTS`, `OVERS_POINTS`, `RUNOUTS_POINTS`, `STUMPING_POINTS`, `CATCHES_POINTS`, `MAIDEN_POINTS`, `HATRICK_POINTS`, `BOWLING_RUNS_POINTS`, `SIX_POINTS`, `FOUR_POINTS`, `TOTAL_RUNS_POINTS`, `BATSMAN_BALLS_POINTS`, `BATSMAN_RUNS_25`, `STRIKE_RATE_POINTS`, `DUCK_OUT_POINTS`, `MOM_POINTS`, `EFF_DT`, `END_DT`, `UPDATE_DTM`) VALUES
(1, 35, 30, 50, 1, 2, 1, 25, 25, 10, 50, 100, 1, 3, 2, 1, 1, 10, 1, -10, 20, '2017-04-04 07:00:00', '2020-04-02 06:59:59', '2017-04-06 18:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `POWER_PLAYER_INFO`
--

CREATE TABLE `POWER_PLAYER_INFO` (
  `PLAYER_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `TEAM_ID` int(11) NOT NULL,
  `EFF_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `END_DT` timestamp NOT NULL DEFAULT '2019-04-02 06:59:59',
  `IS_VALID` tinyint(1) NOT NULL DEFAULT '1',
  `POWER_PLAYER` int(11) NOT NULL DEFAULT '2',
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PREFERENCE_INFO`
--

CREATE TABLE `PREFERENCE_INFO` (
  `LEAGUE_ID` int(11) NOT NULL DEFAULT '0',
  `PREFERENCE_NAME` varchar(20) NOT NULL,
  `PREFERENCE_CODE` int(11) NOT NULL,
  `PREFERENCE_VALUE` varchar(20) NOT NULL,
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PREFERENCE_INFO`
--

INSERT INTO `PREFERENCE_INFO` (`LEAGUE_ID`, `PREFERENCE_NAME`, `PREFERENCE_CODE`, `PREFERENCE_VALUE`, `UPDATE_DTM`) VALUES
(1001, 'COLOR', 1, 'GREEN', '2017-03-22 00:03:21'),
(1001, 'COLOR', 2, 'YELLOW', '2017-03-22 00:03:21'),
(1001, 'COLOR', 3, 'RED', '2017-03-22 00:03:38'),
(1001, 'COLOR', 4, 'BLUE', '2017-03-22 00:03:38');

-- --------------------------------------------------------

--
-- Table structure for table `TEAM_INFO`
--

CREATE TABLE `TEAM_INFO` (
  `TEAM_ID` int(11) NOT NULL,
  `TEAM_NAME` varchar(40) NOT NULL,
  `LEAGUE_ID` int(11) NOT NULL,
  `AMOUNT_IN_TREASURY` float NOT NULL DEFAULT '0',
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TEAM_INFO`
--

INSERT INTO `TEAM_INFO` (`TEAM_ID`, `TEAM_NAME`, `LEAGUE_ID`, `AMOUNT_IN_TREASURY`, `UPDATE_DTM`) VALUES
(14, 'Theri Guys', 1015, 0, '2017-03-26 16:12:45'),
(15, 'Okkalis', 1015, 0, '2017-03-26 16:14:13'),
(16, 'Thaaru Maaru', 1015, 0, '2017-03-26 16:14:56'),
(17, 'Mersal Boys', 1015, 0, '2017-03-26 16:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `TEAM_PLAYER_INFO`
--

CREATE TABLE `TEAM_PLAYER_INFO` (
  `TEAM_ID` int(11) NOT NULL,
  `PLAYER_ID` int(11) NOT NULL,
  `AUCTIONED_BY` int(11) NOT NULL DEFAULT '0',
  `SOLD_PRICE` float NOT NULL DEFAULT '0',
  `AUCTION_TYPE` varchar(20) NOT NULL DEFAULT 'OPEN',
  `EFF_DT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `END_DT` timestamp NOT NULL DEFAULT '2019-04-02 06:59:59',
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TEAM_PLAYER_INFO`
--

INSERT INTO `TEAM_PLAYER_INFO` (`TEAM_ID`, `PLAYER_ID`, `AUCTIONED_BY`, `SOLD_PRICE`, `AUCTION_TYPE`, `EFF_DT`, `END_DT`, `UPDATE_DTM`) VALUES
(14, 4, -99, 5.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 11:04:49'),
(14, 1201, 72, 16, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 17:03:13'),
(14, 3722, 72, 10.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 15:17:22'),
(14, 3723, 72, 6, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 15:12:45'),
(14, 3850, 72, 4.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:55:23'),
(14, 3852, 72, 12, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 17:16:08'),
(14, 4176, 72, 6.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:41:36'),
(14, 9782, 72, 11.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:46:20'),
(14, 59314, 72, 5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 15:01:04'),
(14, 63187, 61, 5.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:13:30'),
(14, 63611, 72, 3.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:41:15'),
(14, 63755, 61, 7, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:35:28'),
(15, 2, -99, 4, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 11:04:49'),
(15, 3355, 58, 15, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:48:45'),
(15, 3676, 49, 4.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 17:04:53'),
(15, 3700, 49, 7.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:33:57'),
(15, 4330, 49, 9, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 17:10:55'),
(15, 63751, 49, 6.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:54:45'),
(15, 63961, 49, 9, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:22:56'),
(15, 64254, 49, 4.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:50:34'),
(15, 65756, 58, 8.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:34:42'),
(15, 66812, 58, 10.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:52:10'),
(15, 66818, 58, 3.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 15:09:12'),
(15, 67540, 49, 5.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:14:56'),
(16, 3, -99, 7.75, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 11:04:49'),
(16, 3632, 59, 7, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:52:58'),
(16, 3675, 59, 12.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 17:14:14'),
(16, 3991, 59, 5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:50:29'),
(16, 3993, 59, 17, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:26:05'),
(16, 4311, 59, 4, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 15:07:13'),
(16, 4532, 66, 5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:28:11'),
(16, 4555, 59, 4.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 17:06:23'),
(16, 9844, 52, 9, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:39:19'),
(16, 10115, 59, 4.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:53:51'),
(16, 12047, 59, 8.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:36:03'),
(16, 65748, 59, 11.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 15:05:01'),
(17, 1, -99, 11.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 11:04:49'),
(17, 4308, 53, 6.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:33:18'),
(17, 4338, 67, 3.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 15:19:08'),
(17, 5132, 67, 8, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:48:24'),
(17, 5380, 53, 10.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:55:57'),
(17, 10062, 67, 4.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:30:14'),
(17, 10130, 67, 7, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:20:03'),
(17, 11229, 67, 16, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:59:06'),
(17, 28891, 53, 3, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:18:57'),
(17, 48816, 67, 7.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:45:17'),
(17, 60122, 67, 12.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 16:17:23'),
(17, 63788, 54, 6.5, 'OPEN', '2018-03-01 07:00:00', '2019-04-02 06:59:59', '2019-03-23 14:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `TEAM_PREFERENCE`
--

CREATE TABLE `TEAM_PREFERENCE` (
  `LEAGUE_ID` int(11) NOT NULL DEFAULT '0',
  `TEAM_ID` int(11) NOT NULL,
  `PREFERENCE_NAME` varchar(20) NOT NULL,
  `PREFERENCE_CODE` int(11) NOT NULL,
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TEAM_PREFERENCE`
--

INSERT INTO `TEAM_PREFERENCE` (`LEAGUE_ID`, `TEAM_ID`, `PREFERENCE_NAME`, `PREFERENCE_CODE`, `UPDATE_DTM`) VALUES
(1015, 14, 'COLOR', 1, '2017-03-26 16:12:45'),
(1015, 14, 'COMBO', 0, '2017-04-01 19:06:37'),
(1015, 15, 'COLOR', 4, '2017-03-26 16:14:13'),
(1015, 15, 'COMBO', 0, '2017-04-01 19:06:37'),
(1015, 16, 'COLOR', 3, '2017-03-26 16:14:56'),
(1015, 16, 'COMBO', 0, '2017-04-01 19:06:14'),
(1015, 17, 'COLOR', 2, '2017-03-26 16:18:39'),
(1015, 17, 'COMBO', 0, '2017-04-01 19:06:14');

-- --------------------------------------------------------

--
-- Table structure for table `TestSchedule`
--

CREATE TABLE `TestSchedule` (
  `Name` varchar(100) NOT NULL,
  `Time` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `timestamp`) VALUES
('Lindon James', '2017-02-24 01:18:59'),
('Jack Cowie', '2017-02-24 01:20:20'),
('Joe Cox', '2017-02-24 01:20:20'),
('N. Dutta', '2017-02-24 01:20:20'),
('Bapu Joshi', '2017-02-24 01:20:21'),
('Nana Joshi', '2017-02-24 01:20:21'),
('Jack Newman', '2017-02-24 01:20:21'),
('Nuwan Zoysa', '2017-02-24 01:20:21'),
('Ted a\'Beckett', '2017-02-24 01:20:21'),
('Bobby Abel', '2017-02-24 01:20:21'),
('C. Alfred', '2017-02-24 01:20:26'),
('P. Alleyne', '2017-02-24 01:20:26'),
('Kaushik Amalean', '2017-02-24 01:20:27'),
('Lala Amarnath', '2017-02-24 01:20:27'),
('Jo Angel', '2017-02-24 01:20:27'),
('Bob Appleyard', '2017-02-24 01:20:27'),
('Ted Arnold', '2017-02-24 01:20:27'),
('Jack Badcock', '2017-02-24 01:20:27'),
('Ted Badcock', '2017-02-24 01:20:27'),
('Jack Badley', '2017-02-24 01:20:28'),
('Bob Barber', '2017-02-24 01:20:28'),
('Jack Barrett', '2017-02-24 01:20:28'),
('Joey Benjamin', '2017-02-24 01:20:28'),
('Bob Berry', '2017-02-24 01:20:28'),
('Jack Birkenshaw', '2017-02-24 01:20:28'),
('A. Birkett', '2017-02-24 01:20:28'),
('Jack Blackham', '2017-02-24 01:20:29'),
('Bob Blair', '2017-02-24 01:20:29'),
('Jack Board', '2017-02-24 01:20:29'),
('Jackie Botten', '2017-02-24 01:20:29'),
('Ted Bowley', '2017-02-24 01:20:29'),
('Ray Bright', '2017-02-24 01:20:29'),
('Jack Brown', '2017-02-24 01:20:29'),
('Cec Burke', '2017-02-24 01:20:29'),
('Jock Cameron', '2017-02-24 01:20:30'),
('Joey Carew', '2017-02-24 01:20:30'),
('Bob Catterall', '2017-02-24 01:20:30'),
('Jack Cheetham', '2017-02-24 01:20:30'),
('R. Cole', '2017-02-24 01:20:31'),
('Frederick Cook', '2017-02-24 01:20:31'),
('Geoff Cook', '2017-02-24 01:20:31'),
('Jimmy Cook', '2017-02-24 01:20:31'),
('Nick Cook', '2017-02-24 01:20:31'),
('Sam Cook', '2017-02-24 01:20:31'),
('Simon Cook', '2017-02-24 01:20:32'),
('Bob Cottam', '2017-02-24 01:20:32'),
('Doug Cowie', '2017-02-24 01:20:32'),
('Bob Cowper', '2017-02-24 01:20:32'),
('Jack Crapp', '2017-02-24 01:20:32'),
('Jack Crawford', '2017-02-24 01:20:32'),
('Bob Crisp', '2017-02-24 01:20:33'),
('Bob Cunis', '2017-02-24 01:20:33'),
('J. Da Silva', '2017-02-24 01:20:33'),
('Vijay Dahiya', '2017-02-24 01:20:33'),
('Joe Darling', '2017-02-24 01:20:34'),
('Dai Davies', '2017-02-24 01:20:34'),
('Guy de Alwis', '2017-02-24 01:20:34'),
('Nummy Deane', '2017-02-24 01:20:34'),
('Suresh Deo', '2017-02-24 01:20:34'),
('R. Desraj', '2017-02-24 01:20:34'),
('Ted Dexter', '2017-02-24 01:20:34'),
('Roy Dias', '2017-02-24 01:20:34'),
('Cec Dixon', '2017-02-24 01:20:35'),
('Uton Dowe', '2017-02-24 01:20:35'),
('Jackie Du Preez', '2017-02-24 01:20:35'),
('Flooi Du Toit', '2017-02-24 01:20:35'),
('Jack Durston', '2017-02-24 01:20:35'),
('Jack Edwards', '2017-02-24 01:20:35'),
('Jock Edwards', '2017-02-24 01:20:35'),
('J.J. Ferris', '2017-02-24 01:20:36'),
('J.J. Ferris', '2017-02-24 01:20:36'),
('Jack Fingleton', '2017-02-24 01:20:36'),
('Jack Flavell', '2017-02-24 01:20:36'),
('Chuck Fleetwood-Smith', '2017-02-24 01:20:36'),
('Roy Fredericks', '2017-02-24 01:20:36'),
('Datta Gaekwad', '2017-02-24 01:20:36'),
('Leslie Gay', '2017-02-24 01:20:36'),
('Lee Germon', '2017-02-24 01:20:37'),
('Rajinder Ghai', '2017-02-24 01:20:37'),
('Sunit Ghosh', '2017-02-24 01:20:37'),
('Roy Gilchrist', '2017-02-24 01:20:37'),
('J. Gill', '2017-02-24 01:20:37'),
('Graham Gooch', '2017-02-24 01:20:38'),
('Darren Gough', '2017-02-24 01:20:38'),
('Erik Gouka', '2017-02-24 01:20:38'),
('Jackie Grant', '2017-02-24 01:20:38'),
('Jack Gregory', '2017-02-24 01:20:38'),
('Subroto Guha', '2017-02-24 01:20:39'),
('John Guy', '2017-02-24 01:20:39'),
('Joe Hardstaff Sr.', '2017-02-24 01:20:39'),
('Joe Hardstaff Jr', '2017-02-24 01:20:39'),
('Roy Harford', '2017-02-24 01:20:41'),
('R. Haynes', '2017-02-24 01:20:41'),
('Jack Hearne Sr.', '2017-02-24 01:20:41'),
('Jack Hearne Jr', '2017-02-24 01:20:41'),
('B. Henderson', '2017-02-24 01:20:41'),
('Jackie Hendriks', '2017-02-24 01:20:41'),
('Jack  Heron', '2017-02-24 01:20:42'),
('Jack Hill', '2017-02-24 01:20:42'),
('Teddy Hoad', '2017-02-24 01:20:42'),
('Jack Hobbs', '2017-02-24 01:20:42'),
('D. Holder', '2017-02-24 01:20:42'),
('Bob Holland', '2017-02-24 01:20:42'),
('Joe Humphries', '2017-02-24 01:20:43'),
('Joe Hunter', '2017-02-24 01:20:43'),
('Jack Iddon', '2017-02-24 01:20:43'),
('Jack Ikin', '2017-02-24 01:20:43'),
('Ray Illingworth', '2017-02-24 01:20:43'),
('Lee Irvine', '2017-02-24 01:20:43'),
('Jack Iverson', '2017-02-24 01:20:43'),
('Steven Jack', '2017-02-24 01:20:44'),
('Laxmidas Jai', '2017-02-24 01:20:44'),
('C. John', '2017-02-24 01:20:44'),
('E. Jones', '2017-02-24 01:20:44'),
('Sunil Joshi', '2017-02-24 01:20:44'),
('Ray Julian', '2017-02-24 01:20:44'),
('Jacques Kallis', '2017-02-24 01:20:44'),
('Gus Kempis', '2017-02-24 01:20:45'),
('Roy Kilner', '2017-02-24 01:20:45'),
('Thiru Kumaran', '2017-02-24 01:20:45'),
('Frederick Kuys', '2017-02-24 01:20:45'),
('Stuart Law', '2017-02-24 01:20:46'),
('Brett Lee', '2017-02-24 01:20:46'),
('Harry Lee', '2017-02-24 01:20:46'),
('Phil  Lee', '2017-02-24 01:20:46'),
('Shane Lee', '2017-02-24 01:20:46'),
('Dennis Lillee', '2017-02-24 01:20:47'),
('Dick Lilley', '2017-02-24 01:20:47'),
('Ray Lindwall', '2017-02-24 01:20:47'),
('Gus Logie', '2017-02-24 01:20:47'),
('J.J. Lyons', '2017-02-24 01:20:47'),
('Jack  MacBryan', '2017-02-24 01:20:47'),
('Z. Maccum', '2017-02-24 01:20:48'),
('Jock Maclean', '2017-02-24 01:20:48'),
('Roshan Mahanama', '2017-02-24 01:20:48'),
('N. Malcolm', '2017-02-24 01:20:48'),
('Vijay Manjrekar', '2017-02-24 01:20:48'),
('Frank Mann', '2017-02-24 01:20:48'),
('George Mann', '2017-02-24 01:20:48'),
('Tony Mann', '2017-02-24 01:20:48'),
('Tufty Mann', '2017-02-24 01:20:49'),
('Roy Marshall', '2017-02-24 01:20:49'),
('Jack Martin', '2017-02-24 01:20:49'),
('Manny Martindale', '2017-02-24 01:20:49'),
('Jack Mason', '2017-02-24 01:20:49'),
('Bob Massie', '2017-02-24 01:20:49'),
('Peter May', '2017-02-24 01:20:50'),
('Tim May', '2017-02-24 01:20:50'),
('Edgar Mayne', '2017-02-24 01:20:50'),
('Laurie Mayne', '2017-02-24 01:20:50'),
('Ted McDonald', '2017-02-24 01:20:50'),
('Jackie McGlew', '2017-02-24 01:20:50'),
('Roy McLean', '2017-02-24 01:20:50'),
('Bob McLeod', '2017-02-24 01:20:51'),
('Mohamed  Meman', '2017-02-24 01:20:51'),
('Narendra Menon', '2017-02-24 01:20:51'),
('Roy Miller', '2017-02-24 01:20:51'),
('Roy Minnett', '2017-02-24 01:20:51'),
('Balkrishna Mohoni', '2017-02-24 01:20:51'),
('Nayan Mongia', '2017-02-24 01:20:51'),
('Leonard Moon', '2017-02-24 01:20:52'),
('Frank Mooney', '2017-02-24 01:20:52'),
('Jack Moroney', '2017-02-24 01:20:52'),
('Bapu Nadkarni', '2017-02-24 01:20:52'),
('Parbhu Nana', '2017-02-24 01:20:53'),
('Rangy  Nanan', '2017-02-24 01:20:53'),
('C.K. Nayudu', '2017-02-24 01:20:53'),
('C.S. Nayudu', '2017-02-24 01:20:53'),
('Jack Nel', '2017-02-24 01:20:53'),
('Billy  Newham', '2017-02-24 01:20:53'),
('Bob Newson', '2017-02-24 01:20:54'),
('Jack Nitschke', '2017-02-24 01:20:54'),
('Jack Noreiga', '2017-02-24 01:20:54'),
('Shah Nyalchand', '2017-02-24 01:20:54'),
('Leo O\'Brien', '2017-02-24 01:20:54'),
('Jack Connor', '2017-02-24 01:20:54'),
('Jack O\'Connor', '2017-02-24 01:20:54'),
('Guy Overton', '2017-02-24 01:20:54'),
('Ajit Pai', '2017-02-24 01:20:55'),
('Roy Palmer', '2017-02-24 01:20:55'),
('Roy  Park', '2017-02-24 01:20:55'),
('Ciss Parkin', '2017-02-24 01:20:55'),
('Bob Parry', '2017-02-24 01:20:56'),
('Joe Partridge', '2017-02-24 01:20:56'),
('Jasu  Patel', '2017-02-24 01:20:56'),
('Min  Patel', '2017-02-24 01:20:56'),
('Ted Peate', '2017-02-24 01:20:57'),
('Bobby Peel', '2017-02-24 01:20:57'),
('Nehemiah Perry', '2017-02-24 01:20:57'),
('Dattu Phadkar', '2017-02-24 01:20:57'),
('Jack Plimsoll', '2017-02-24 01:20:57'),
('George Pope', '2017-02-24 01:20:57'),
('Roland Pope', '2017-02-24 01:20:57'),
('Allan  Rae', '2017-02-24 01:20:58'),
('V. Rajagopal', '2017-02-24 01:20:58'),
('Sheikh  Rehman', '2017-02-24 01:20:59'),
('Jack Richards', '2017-02-24 01:20:59'),
('Jackie Roberts', '2017-02-24 01:20:59'),
('John  Robertson', '2017-02-24 01:20:59'),
('Jack  Robertson', '2017-02-24 01:21:00'),
('Ray  Robinson', '2017-02-24 01:21:00'),
('George Rowe', '2017-02-24 01:21:00'),
('Gordon  Rowe', '2017-02-24 01:21:00'),
('Lawrence  Rowe', '2017-02-24 01:21:00'),
('Ambar  Roy', '2017-02-24 01:21:00'),
('Pankaj  Roy', '2017-02-24 01:21:01'),
('Pranab Roy', '2017-02-24 01:21:01'),
('Jacques Rudolph', '2017-02-24 01:21:01'),
('Jack Russell Sr.', '2017-02-24 01:21:01'),
('Jack Russell Jr', '2017-02-24 01:21:01'),
('Jack  Rutherford', '2017-02-24 01:21:01'),
('Jack Ryder', '2017-02-24 01:21:02'),
('Jack Saunders', '2017-02-24 01:21:02'),
('Marcel Schewe', '2017-02-24 01:21:02'),
('Roy  Scott', '2017-02-24 01:21:02'),
('Virender Sehwag', '2017-02-24 01:21:02'),
('Ali Shah', '2017-02-24 01:21:02'),
('Owais Shah', '2017-02-24 01:21:03'),
('Raishi  Shah', '2017-02-24 01:21:03'),
('Ravindu Shah', '2017-02-24 01:21:03'),
('Jack  Sharp', '2017-02-24 01:21:03'),
('Alfred  Shaw', '2017-02-24 01:21:03'),
('Tim Shaw', '2017-02-24 01:21:04'),
('Mohamed Sheikh', '2017-02-24 01:21:04'),
('Sew  Shivnarine', '2017-02-24 01:21:04'),
('Jack  Siedle', '2017-02-24 01:21:04'),
('Bobby Simpson', '2017-02-24 01:21:04'),
('I. Sivaram', '2017-02-24 01:21:04'),
('Joe  Small', '2017-02-24 01:21:04'),
('D. Smith', '2017-02-24 01:21:05'),
('Joe Solomon', '2017-02-24 01:21:05'),
('Man Sood', '2017-02-24 01:21:05'),
('Murphy Su\'a', '2017-02-24 01:21:05'),
('Peter Such', '2017-02-24 01:21:05'),
('Frank  Sugg', '2017-02-24 01:21:05'),
('Martin Suji', '2017-02-24 01:21:05'),
('Ondik Suji', '2017-02-24 01:21:06'),
('R. Surendranath', '2017-02-24 01:21:06'),
('Roy  Swetman', '2017-02-24 01:21:06'),
('Alex Tait', '2017-02-24 01:21:06'),
('Keki  Tarapore', '2017-02-24 01:21:12'),
('Fred Tate', '2017-02-24 01:21:12'),
('Maurice Tate', '2017-02-24 01:21:12'),
('Roy Tattersall', '2017-02-24 01:21:12'),
('Bob Taylor', '2017-02-24 01:21:12'),
('Jaswick Taylor', '2017-02-24 01:21:12'),
('Peter Toohey', '2017-02-24 01:21:13'),
('Joe  Travers', '2017-02-24 01:21:13'),
('V. Vikram Raju', '2017-02-24 01:21:13'),
('Lou Vincent', '2017-02-24 01:21:13'),
('Ted  Wainwright', '2017-02-24 01:21:13'),
('Sajeewa Weerakoon', '2017-02-24 01:21:14'),
('Bob White', '2017-02-24 01:21:14'),
('Jack White', '2017-02-24 01:21:14'),
('Guy Whittall', '2017-02-24 01:21:14'),
('Foffie  Williams', '2017-02-24 01:21:14'),
('G. Williams', '2017-02-24 01:21:14'),
('Bob Willis', '2017-02-24 01:21:14'),
('Jack  Wilson', '2017-02-24 01:21:14'),
('K. Woods', '2017-02-24 01:21:15'),
('Bob  Woolmer', '2017-02-24 01:21:15'),
('Jack  Worrall', '2017-02-24 01:21:15'),
('Bob  Wyatt', '2017-02-24 01:21:15'),
('Teddy  Wynyard', '2017-02-24 01:21:15'),
('Jack Young', '2017-02-24 01:21:15'),
('Aamer  Hameed', '2017-02-24 01:21:16'),
('Aamer Hanif', '2017-02-24 01:21:16'),
('Aamer Malik', '2017-02-24 01:21:16'),
('Aamer Nazir', '2017-02-24 01:21:16'),
('Aamer Sohail', '2017-02-24 01:21:16'),
('Aaqib Javed', '2017-02-24 01:21:16'),
('Josphat Ababu', '2017-02-24 01:21:16'),
('Abdul  Kadir', '2017-02-24 01:21:17'),
('Abdul Qadir', '2017-02-24 01:21:17'),
('Abdul Razzaq', '2017-02-24 01:21:17'),
('Syed Abid Ali', '2017-02-24 01:21:17'),
('Shafiek Abrahams', '2017-02-24 01:21:17'),
('Charlie  Absolom', '2017-02-24 01:21:17'),
('Puss Achong', '2017-02-24 01:21:18'),
('Hylton  Ackerman', '2017-02-24 01:21:18'),
('Andre Adams', '2017-02-24 01:21:18'),
('Chris Adams', '2017-02-24 01:21:18'),
('Jimmy Adams', '2017-02-24 01:21:18'),
('Paul Adams', '2017-02-24 01:21:18'),
('Neil Adcock', '2017-02-24 01:21:18'),
('Hemu Adhikari', '2017-02-24 01:21:19'),
('Afaq Hussain', '2017-02-24 01:21:19'),
('Aftab Baloch', '2017-02-24 01:21:19'),
('Aftab Gul', '2017-02-24 01:21:19'),
('Usman Afzaal', '2017-02-24 01:21:19'),
('Ajit Agarkar', '2017-02-24 01:21:19'),
('Agha Saadat Ali', '2017-02-24 01:21:20'),
('Agha Zahid', '2017-02-24 01:21:20'),
('Jon Agnew', '2017-02-24 01:21:20'),
('Ahmed  Kamal', '2017-02-24 01:21:20'),
('Saliya  Ahangama', '2017-02-24 01:21:20'),
('Akhtar  Sarfraz', '2017-02-24 01:21:20'),
('Akram  Hussain Khan', '2017-02-24 01:21:21'),
('Akram Raza', '2017-02-24 01:21:21'),
('Al Sahariar Rokon', '2017-02-24 01:21:21'),
('John Alabaster', '2017-02-24 01:21:21'),
('Alam Talukdar', '2017-02-24 01:21:21'),
('Terry Alderman', '2017-02-24 01:21:22'),
('Aleem Dar', '2017-02-24 01:21:22'),
('George  Alexander', '2017-02-24 01:21:22'),
('Gerry  Alexander', '2017-02-24 01:21:22'),
('Harry Alexander', '2017-02-24 01:21:22'),
('Rajab Ali', '2017-02-24 01:21:22'),
('Ali Hussain Rizvi', '2017-02-24 01:21:22'),
('Ali Naqvi', '2017-02-24 01:21:23'),
('Alimuddin ', '2017-02-24 01:21:23'),
('David Allan', '2017-02-24 01:21:23'),
('Francis  Allan', '2017-02-24 01:21:23'),
('Peter  Allan', '2017-02-24 01:21:23'),
('Cyril  Allcott', '2017-02-24 01:21:23'),
('David Allen', '2017-02-24 01:21:23'),
('Gubby  Allen', '2017-02-24 01:21:24'),
('Ian Allen', '2017-02-24 01:21:24'),
('Reginald  Allen', '2017-02-24 01:21:24'),
('Mark Alleyne', '2017-02-24 01:21:24'),
('Mike  Allingham', '2017-02-24 01:21:24'),
('Maurice Allom', '2017-02-24 01:21:24'),
('Geoffrey Allott', '2017-02-24 01:21:25'),
('Paul Allott', '2017-02-24 01:21:25'),
('George Allsop', '2017-02-24 01:21:25'),
('Amar  Singh', '2017-02-24 01:21:25'),
('Mohinder Amarnath', '2017-02-24 01:21:25'),
('Surinder  Amarnath', '2017-02-24 01:21:25'),
('Curtly Ambrose', '2017-02-24 01:21:25'),
('Jayantha Amerasinghe', '2017-02-24 01:21:26'),
('Les Ames', '2017-02-24 01:21:26'),
('Aminul Islam Jr', '2017-02-24 01:21:26'),
('Aminul Islam snr', '2017-02-24 01:21:26'),
('Amir Elahi', '2017-02-24 01:21:26'),
('Amir  Elahi', '2017-02-24 01:21:26'),
('Dennis Amiss', '2017-02-24 01:21:26'),
('Pravin Amre', '2017-02-24 01:21:27'),
('Ignatius Anandappa', '2017-02-24 01:21:27'),
('Biddy Anderson', '2017-02-24 01:21:27'),
('Bill Anderson', '2017-02-24 01:21:27'),
('Robert Anderson', '2017-02-24 01:21:27'),
('Keith Andrew', '2017-02-24 01:21:27'),
('Bryan  Andrews', '2017-02-24 01:21:27'),
('Tommy Andrews', '2017-02-24 01:21:28'),
('Joseph Angara', '2017-02-24 01:21:28'),
('Anil Dalpat', '2017-02-24 01:21:28'),
('Anisur  Rehman', '2017-02-24 01:21:28'),
('Salil Ankola', '2017-02-24 01:21:28'),
('Basil Anthony', '2017-02-24 01:21:28'),
('Hamish  Anthony', '2017-02-24 01:21:28'),
('Don Anurasiri', '2017-02-24 01:21:29'),
('Anwar Hussain', '2017-02-24 01:21:29'),
('Anwar Khan', '2017-02-24 01:21:29'),
('Flavian  Aponso', '2017-02-24 01:21:29'),
('Arvind Apte', '2017-02-24 01:21:29'),
('Madhav Apte', '2017-02-24 01:21:29'),
('Alfred Archer', '2017-02-24 01:21:29'),
('David Archer', '2017-02-24 01:21:29'),
('Ken Archer', '2017-02-24 01:21:30'),
('Ron Archer', '2017-02-24 01:21:30'),
('Arif Butt', '2017-02-24 01:21:30'),
('Tom Armitage', '2017-02-24 01:21:30'),
('Warwick Armstrong', '2017-02-24 01:21:30'),
('Geoff Arnold', '2017-02-24 01:21:30'),
('Johnny Arnold', '2017-02-24 01:21:31'),
('Russel Arnold', '2017-02-24 01:21:31'),
('Kevin Arnott', '2017-02-24 01:21:31'),
('Arshad Ayub', '2017-02-24 01:21:31'),
('Arshad Khan', '2017-02-24 01:21:31'),
('Arshad Laiq', '2017-02-24 01:21:31'),
('Arshad Pervez', '2017-02-24 01:21:31'),
('Keith Arthurton', '2017-02-24 01:21:32'),
('Bharat Arun', '2017-02-24 01:21:32'),
('Arun Lal', '2017-02-24 01:21:32'),
('Asad Rauf', '2017-02-24 01:21:32'),
('Nyron Asgarali', '2017-02-24 01:21:32'),
('Ashfaq Ahmed', '2017-02-24 01:21:32'),
('Gobo Ashley', '2017-02-24 01:21:32'),
('Ashraf Ali', '2017-02-24 01:21:33'),
('Asif Iqbal', '2017-02-24 01:21:33'),
('Asif Karim', '2017-02-24 01:21:33'),
('Asif Mahmood', '2017-02-24 01:21:33'),
('Asif Masood', '2017-02-24 01:21:33'),
('Asif Mujtaba', '2017-02-24 01:21:33'),
('Asim  Butt', '2017-02-24 01:21:34'),
('Sudhir Asnani', '2017-02-24 01:21:34'),
('Ewart Astill', '2017-02-24 01:21:34'),
('Nathan Astle', '2017-02-24 01:21:34'),
('Marvan Atapattu', '2017-02-24 01:21:34'),
('Ataur Rehman', '2017-02-24 01:21:34'),
('Athar Ali Khan', '2017-02-24 01:21:35'),
('Athar Zaidi', '2017-02-24 01:21:35'),
('Michael Atherton', '2017-02-24 01:21:35'),
('Bill Athey', '2017-02-24 01:21:35'),
('Atif  Rauf', '2017-02-24 01:21:35'),
('Atiq Khan', '2017-02-24 01:21:35'),
('Atiquz Zaman', '2017-02-24 01:21:35'),
('Denis Atkinson', '2017-02-24 01:21:35'),
('Eric Atkinson', '2017-02-24 01:21:36'),
('Dick Attewell', '2017-02-24 01:21:36'),
('Ian Austin', '2017-02-24 01:21:36'),
('Richard Austin', '2017-02-24 01:21:36'),
('Kirtivardhan Azad', '2017-02-24 01:21:36'),
('Azam Khan', '2017-02-24 01:21:36'),
('Azeem Hafeez', '2017-02-24 01:21:36'),
('Azhar  Hossain', '2017-02-24 01:21:36'),
('Azhar  Khan', '2017-02-24 01:21:37'),
('Azhar Mahmood', '2017-02-24 01:21:37'),
('Azhar  Saeed', '2017-02-24 01:21:37'),
('Mohammad Azharuddin', '2017-02-24 01:21:37'),
('Azmat Rana', '2017-02-24 01:21:37'),
('Faoud Bacchus', '2017-02-24 01:21:37'),
('Adam  Bacher', '2017-02-24 01:21:38'),
('Ali Bacher', '2017-02-24 01:21:38'),
('Hemang Badani', '2017-02-24 01:21:38'),
('Yunus  Badat', '2017-02-24 01:21:38'),
('Sairaj Bahutule', '2017-02-24 01:21:38'),
('Len Baichan', '2017-02-24 01:21:38'),
('Abbas Ali Baig', '2017-02-24 01:21:38'),
('Mark  Bailey', '2017-02-24 01:21:38'),
('Rob Bailey', '2017-02-24 01:21:39'),
('Trevor Bailey', '2017-02-24 01:21:39'),
('Robin Bailhache', '2017-02-24 01:21:39'),
(' Bain', '2017-02-24 01:21:39'),
('David Bairstow', '2017-02-24 01:21:39'),
('Fred Bakewell', '2017-02-24 01:21:39'),
('Paul-Jan Bakker', '2017-02-24 01:21:39'),
('Charles  Baksh', '2017-02-24 01:21:39'),
('Mohamed Baksh', '2017-02-24 01:21:40'),
('Xen Balaskas', '2017-02-24 01:21:40'),
('Chris Balderstone', '2017-02-24 01:21:40'),
('Malinga Bandara', '2017-02-24 01:21:40'),
('N  Bandaratilleke', '2017-02-24 01:21:40'),
('Mantu  Banerjee', '2017-02-24 01:21:41'),
('Shute Nath Banerjee', '2017-02-24 01:21:41'),
('Subrata Banerjee', '2017-02-24 01:21:41'),
('Subroto Banerjee', '2017-02-24 01:21:41'),
('Sanjay Bangar', '2017-02-24 01:21:41'),
('Alec Bannerman', '2017-02-24 01:21:41'),
('Charles Bannerman', '2017-02-24 01:21:41'),
('Eldine Baptiste', '2017-02-24 01:21:42'),
('Baqa Jilani', '2017-02-24 01:21:42'),
('Trevor Barber', '2017-02-24 01:21:42'),
('Wilf Barber', '2017-02-24 01:21:42'),
('Kevan Barbour', '2017-02-24 01:21:42'),
('Warren Bardsley', '2017-02-24 01:21:42'),
('Lloyd Barker', '2017-02-24 01:21:42'),
('Andrew Barlow', '2017-02-24 01:21:43'),
('Dick Barlow', '2017-02-24 01:21:43'),
('Eddie Barlow', '2017-02-24 01:21:43'),
('Graham Barlow', '2017-02-24 01:21:43'),
('Billy Barnes', '2017-02-24 01:21:43'),
('Sid Barnes', '2017-02-24 01:21:43'),
('Sydney Barnes', '2017-02-24 01:21:43'),
('Ben Barnett', '2017-02-24 01:21:44'),
('Charlie Barnett', '2017-02-24 01:21:44'),
('Kim  Barnett', '2017-02-24 01:21:44'),
('Fred Barratt', '2017-02-24 01:21:44'),
('Arthur Barrett', '2017-02-24 01:21:44'),
('Ken Barrington', '2017-02-24 01:21:44'),
('Ivan Barrow', '2017-02-24 01:21:44'),
('Barto Bartlett', '2017-02-24 01:21:44'),
('Gary Bartlett', '2017-02-24 01:21:45'),
('Paul Barton', '2017-02-24 01:21:45'),
('Victor Barton', '2017-02-24 01:21:45'),
('Basit Ali', '2017-02-24 01:21:45'),
('Billy Bates', '2017-02-24 01:21:45'),
('Harold Baumgartner', '2017-02-24 01:21:45'),
('George Bean', '2017-02-24 01:21:46'),
('Donald Beard', '2017-02-24 01:21:46'),
('Graeme  Beard', '2017-02-24 01:21:46'),
('Rolland Beaumont', '2017-02-24 01:21:46'),
('John Beck', '2017-02-24 01:21:46'),
('Danzel Becker', '2017-02-24 01:21:46'),
('Atul  Bedade', '2017-02-24 01:21:46'),
('Bishan Bedi', '2017-02-24 01:21:46'),
('Alec Bedser', '2017-02-24 01:21:47'),
('Denis Begbie', '2017-02-24 01:21:47'),
('Matthew Bell', '2017-02-24 01:21:47'),
('Sandy Bell', '2017-02-24 01:21:47'),
('William Bell', '2017-02-24 01:21:48'),
('John Benaud', '2017-02-24 01:21:48'),
('Richie Benaud', '2017-02-24 01:21:48'),
('Kenneth Benjamin', '2017-02-24 01:21:48'),
('Winston Benjamin', '2017-02-24 01:21:48'),
('Dale Benkenstein', '2017-02-24 01:21:48'),
('Murray Bennett', '2017-02-24 01:21:48'),
('Mark Benson', '2017-02-24 01:21:48'),
('Carlisle Best', '2017-02-24 01:21:49'),
('Nelson Betancourt', '2017-02-24 01:21:49'),
('Michael Bevan', '2017-02-24 01:21:49'),
('Gordon Beves', '2017-02-24 01:21:49'),
('Amit Bhandari', '2017-02-24 01:21:49'),
('Prakash Bhandari', '2017-02-24 01:21:49'),
('Vijay Bharadwaj', '2017-02-24 01:21:49'),
('Raghuram Bhat', '2017-02-24 01:21:50'),
('Bhupinder  Singh', '2017-02-24 01:21:50'),
('Andrew Bichel', '2017-02-24 01:21:50'),
('Martin Bicknell', '2017-02-24 01:21:50'),
('Grahame Bilby', '2017-02-24 01:21:50'),
('Jimmy Binks', '2017-02-24 01:21:50'),
('Alfred Binns', '2017-02-24 01:21:50'),
('Roger Binny', '2017-02-24 01:21:51'),
('Dickie Bird', '2017-02-24 01:21:51'),
('Morice Bird', '2017-02-24 01:21:51'),
('Lionel Birkett', '2017-02-24 01:21:51'),
('Glenn  Bishop', '2017-02-24 01:21:51'),
('Ian Bishop', '2017-02-24 01:21:51'),
('Murray Bisset', '2017-02-24 01:21:51'),
('George Bissett', '2017-02-24 01:21:52'),
('Marlon Black', '2017-02-24 01:21:52'),
('Don Blackie', '2017-02-24 01:21:52'),
(' Blackman', '2017-02-24 01:21:52'),
('John Blain', '2017-02-24 01:21:52'),
('Tony Blain', '2017-02-24 01:21:52'),
('Bruce Blair', '2017-02-24 01:21:52'),
('Richard  Blakey', '2017-02-24 01:21:52'),
('Jimmy Blanckenberg', '2017-02-24 01:21:53'),
('Colin Bland', '2017-02-24 01:21:53'),
('Greg Blewett', '2017-02-24 01:21:53'),
('Ivo Bligh', '2017-02-24 01:21:53'),
('Andy Blignaut', '2017-02-24 01:21:53'),
('Roger Blunt', '2017-02-24 01:21:53'),
('Charlie Blythe', '2017-02-24 01:21:53'),
('Ernest Bock', '2017-02-24 01:21:53'),
('Nicky Boje', '2017-02-24 01:21:54'),
('Bruce  Bolton', '2017-02-24 01:21:54'),
('Brian Bolus', '2017-02-24 01:21:54'),
('Gerald  Bond', '2017-02-24 01:21:54'),
('Shane Bond', '2017-02-24 01:21:54'),
('George Bonnor', '2017-02-24 01:21:54'),
('Stephen Boock', '2017-02-24 01:21:54'),
('David Boon', '2017-02-24 01:21:54'),
('Brian Booth', '2017-02-24 01:21:55'),
('Major Booth', '2017-02-24 01:21:55'),
('Chandu Borde', '2017-02-24 01:21:56'),
('Allan Border', '2017-02-24 01:21:56'),
('Bernard Bosanquet', '2017-02-24 01:21:56'),
('Tertius Bosch', '2017-02-24 01:21:56'),
('Gopal  Bose', '2017-02-24 01:21:56'),
('Hemantha Boteju', '2017-02-24 01:21:57'),
('Ian Botham', '2017-02-24 01:21:57'),
('Mark Boucher', '2017-02-24 01:21:57'),
('Monty Bowden', '2017-02-24 01:21:57'),
('Bill Bowes', '2017-02-24 01:21:57'),
('Keith Boyce', '2017-02-24 01:21:57'),
('Geoff Boycott', '2017-02-24 01:21:57'),
('Harry Boyle', '2017-02-24 01:21:58'),
('Brendon Bracewell', '2017-02-24 01:21:58'),
('John Bracewell', '2017-02-24 01:21:58'),
('Nathan Bracken', '2017-02-24 01:21:58'),
('Grant Bradburn', '2017-02-24 01:21:58'),
('Wynne Bradburn', '2017-02-24 01:21:58'),
('Bill Bradley', '2017-02-24 01:21:58'),
('Don Bradman', '2017-02-24 01:21:59'),
('David Brain', '2017-02-24 01:21:59'),
('Eddo Brandes', '2017-02-24 01:21:59'),
('William Brann', '2017-02-24 01:21:59'),
('Len Braund', '2017-02-24 01:22:00'),
('Mike Brearley', '2017-02-24 01:22:00'),
('Walter Brearley', '2017-02-24 01:22:00'),
('Don Brennan', '2017-02-24 01:22:00'),
('Gary Brent', '2017-02-24 01:22:01'),
('Gavin Briant', '2017-02-24 01:22:01'),
('Johnny Briggs', '2017-02-24 01:22:01'),
('James  Brinkley', '2017-02-24 01:22:01'),
('Dooley Briscoe', '2017-02-24 01:22:01'),
('Chris Broad', '2017-02-24 01:22:01'),
('Bill Brockwell', '2017-02-24 01:22:01'),
('Harry Bromfield', '2017-02-24 01:22:02'),
('Ernest  Bromley', '2017-02-24 01:22:02'),
('Hugh Bromley-Davenport', '2017-02-24 01:22:02'),
('Dennis Brookes', '2017-02-24 01:22:02'),
('Tom Brooks', '2017-02-24 01:22:02'),
(' Brown', '2017-02-24 01:22:03'),
('Alan Brown', '2017-02-24 01:22:03'),
('Alistair  Brown', '2017-02-24 01:22:03'),
('Bill Brown', '2017-02-24 01:22:03'),
('Daryl Brown', '2017-02-24 01:22:03'),
('David Brown', '2017-02-24 01:22:03'),
('Freddie Brown', '2017-02-24 01:22:04'),
('George Brown', '2017-02-24 01:22:04'),
('Lennox Brown', '2017-02-24 01:22:04'),
('Robin Brown', '2017-02-24 01:22:04'),
('Simon Brown', '2017-02-24 01:22:04'),
('Vaughan Brown', '2017-02-24 01:22:04'),
('Barrington Browne', '2017-02-24 01:22:05'),
('Courtney Browne', '2017-02-24 01:22:05'),
('George Browne', '2017-02-24 01:22:05'),
('Snuffy Browne', '2017-02-24 01:22:05'),
('William Bruce', '2017-02-24 01:22:05'),
('Glen  Bruk-Jackson', '2017-02-24 01:22:05'),
('Henderson Bryan', '2017-02-24 01:22:05'),
('Rudi Bryson', '2017-02-24 01:22:06'),
('Claude Buckenham', '2017-02-24 01:22:06'),
('Steve Bucknor', '2017-02-24 01:22:06'),
('Charitha Buddhika', '2017-02-24 01:22:06'),
('Carl Bulfin', '2017-02-24 01:22:06'),
('Peter Burge', '2017-02-24 01:22:07'),
('Chris Burger', '2017-02-24 01:22:07'),
('Mark Burgess', '2017-02-24 01:22:07'),
('Jim Burke', '2017-02-24 01:22:08'),
('Perry Burke', '2017-02-24 01:22:08'),
('Sam Burke', '2017-02-24 01:22:08'),
('Sidney Burke', '2017-02-24 01:22:08'),
('Mark Burmester', '2017-02-24 01:22:08'),
('Ken Burn', '2017-02-24 01:22:08'),
('Frederick Burton', '2017-02-24 01:22:09'),
('Tom Burtt', '2017-02-24 01:22:09'),
('Iain Butchart', '2017-02-24 01:22:09'),
('Alan Butcher', '2017-02-24 01:22:09'),
('Basil Butcher', '2017-02-24 01:22:09'),
('Mark Butcher', '2017-02-24 01:22:09'),
('Roland  Butcher', '2017-02-24 01:22:09'),
('Bunny Butler', '2017-02-24 01:22:10'),
('Harold Butler', '2017-02-24 01:22:10'),
('Ian Butler', '2017-02-24 01:22:10'),
('Harry Butt', '2017-02-24 01:22:10'),
('Leonard  Butterfield', '2017-02-24 01:22:10'),
('Clyde  Butts', '2017-02-24 01:22:10'),
('Dooland Buultjens', '2017-02-24 01:22:10'),
('Izak Buys', '2017-02-24 01:22:11'),
('Robin Bynoe', '2017-02-24 01:22:11'),
('Andy Caddick', '2017-02-24 01:22:11'),
('Chris Cairns', '2017-02-24 01:22:11'),
('Lance Cairns', '2017-02-24 01:22:11'),
('Dave Callaghan', '2017-02-24 01:22:11'),
('Sydney Callaway', '2017-02-24 01:22:12'),
('Ian Callen', '2017-02-24 01:22:12'),
('Robert  Callender', '2017-02-24 01:22:12'),
('Freddy Calthorpe', '2017-02-24 01:22:12'),
('Steve Camacho', '2017-02-24 01:22:12'),
('Frank Cameron', '2017-02-24 01:22:12'),
('Jimmy Cameron', '2017-02-24 01:22:12'),
('John Cameron', '2017-02-24 01:22:13'),
('Alistair Campbell', '2017-02-24 01:22:13'),
('Greg Campbell', '2017-02-24 01:22:13'),
('Ryan Campbell', '2017-02-24 01:22:13'),
('Sherwin Campbell', '2017-02-24 01:22:13'),
('Tom Campbell', '2017-02-24 01:22:13'),
('Peter  Cantrell', '2017-02-24 01:22:13'),
('David Capel', '2017-02-24 01:22:13'),
('George Carew', '2017-02-24 01:22:14'),
('William Carkeek', '2017-02-24 01:22:14'),
('John Carlin', '2017-02-24 01:22:14'),
('Stuart Carlisle', '2017-02-24 01:22:14'),
('Phil  Carlson', '2017-02-24 01:22:14'),
('Peter Carlstein', '2017-02-24 01:22:14'),
('Bob Carpenter', '2017-02-24 01:22:14'),
('Arthur Carr', '2017-02-24 01:22:15'),
('Donald Carr', '2017-02-24 01:22:15'),
('Douglas  Carr', '2017-02-24 01:22:15'),
('Claude Carter', '2017-02-24 01:22:15'),
('Sammy Carter', '2017-02-24 01:22:15'),
('Tom Cartwright', '2017-02-24 01:22:15'),
('Harry Cave', '2017-02-24 01:22:15'),
('George Challenor', '2017-02-24 01:22:16'),
('Upul Chandana', '2017-02-24 01:22:16'),
('Shivnarine Chanderpaul', '2017-02-24 01:22:16'),
('Bhagwat Chandrasekhar', '2017-02-24 01:22:16'),
('Vakkadai  Chandrasekhar', '2017-02-24 01:22:16'),
('Herbert Chang', '2017-02-24 01:22:16'),
('Horace Chapman', '2017-02-24 01:22:16'),
('Percy Chapman', '2017-02-24 01:22:17'),
('Chris Chappell', '2017-02-24 01:22:17'),
('Greg Chappell', '2017-02-24 01:22:17'),
('Ian Chappell', '2017-02-24 01:22:18'),
('Trevor  Chappell', '2017-02-24 01:22:18'),
('Murray Chapple', '2017-02-24 01:22:18'),
('Percie Charlton', '2017-02-24 01:22:18'),
('Henry Charlwood', '2017-02-24 01:22:18'),
('Ewen Chatfield', '2017-02-24 01:22:18'),
('Utpal Chatterjee', '2017-02-24 01:22:18'),
('William Chatterton', '2017-02-24 01:22:18'),
('Chetan Chauhan', '2017-02-24 01:22:19'),
('Rajesh Chauhan', '2017-02-24 01:22:19'),
('Frank Chester', '2017-02-24 01:22:19'),
('Grahame Chevalier', '2017-02-24 01:22:19'),
('Harry Chidgey', '2017-02-24 01:22:19'),
('John Childs', '2017-02-24 01:22:19'),
('Arthur Chipperfield', '2017-02-24 01:22:20'),
('Nikhil Chopra', '2017-02-24 01:22:20'),
('Vijay Chopra', '2017-02-24 01:22:20'),
('Nirode Chowdhury', '2017-02-24 01:22:20'),
('Cyril Christiani', '2017-02-24 01:22:20'),
('Robert Christiani', '2017-02-24 01:22:20'),
('Stanley Christopherson', '2017-02-24 01:22:21'),
('Jim Christy', '2017-02-24 01:22:21'),
('Geoff Chubb', '2017-02-24 01:22:21'),
('Dipak  Chudasama', '2017-02-24 01:22:21'),
('Nobby Clark', '2017-02-24 01:22:21'),
('Wayne Clark', '2017-02-24 01:22:21'),
('Bertie Clarke', '2017-02-24 01:22:21'),
('Nolan  Clarke', '2017-02-24 01:22:22'),
('Sylvester Clarke', '2017-02-24 01:22:22'),
('Tony Clarkson', '2017-02-24 01:22:22'),
('Johnny Clay', '2017-02-24 01:22:22'),
('Donald Cleverley', '2017-02-24 01:22:22'),
('Brian Close', '2017-02-24 01:22:22'),
('John Cochran', '2017-02-24 01:22:23'),
('Shunter Coen', '2017-02-24 01:22:23'),
('Sorabji Colah', '2017-02-24 01:22:23'),
('Len Coldwell', '2017-02-24 01:22:23'),
('David  Colley', '2017-02-24 01:22:23'),
('Richard Collinge', '2017-02-24 01:22:24'),
('Paul Collingwood', '2017-02-24 01:22:24'),
('Herbie Collins', '2017-02-24 01:22:24'),
('Pedro Collins', '2017-02-24 01:22:24'),
('Corey Collymore', '2017-02-24 01:22:25'),
('Ian Colquhoun', '2017-02-24 01:22:25'),
('Peter  Coman', '2017-02-24 01:22:25'),
('Mick Commaille', '2017-02-24 01:22:25'),
('John  Commins', '2017-02-24 01:22:25'),
('Denis Compton', '2017-02-24 01:22:25'),
('Jeremy Coney', '2017-02-24 01:22:25'),
('Bevan Congdon', '2017-02-24 01:22:26'),
('Arthur Coningham', '2017-02-24 01:22:26'),
('Alan Connolly', '2017-02-24 01:22:26'),
('David Constant', '2017-02-24 01:22:26'),
('Learie Constantine', '2017-02-24 01:22:26'),
('Nari Contractor', '2017-02-24 01:22:26'),
('Conky Conyngham', '2017-02-24 01:22:26'),
('Alfred Cooper', '2017-02-24 01:22:27'),
('Bransby Cooper', '2017-02-24 01:22:27'),
('William Cooper', '2017-02-24 01:22:27'),
('Geoff  Cope', '2017-02-24 01:22:27'),
('Bill Copson', '2017-02-24 01:22:28'),
('Dominic Cork', '2017-02-24 01:22:28'),
('Grahame Corling', '2017-02-24 01:22:28'),
('Tich Cornford', '2017-02-24 01:22:28'),
('Gary Cosier', '2017-02-24 01:22:28'),
('John Cottam', '2017-02-24 01:22:29'),
('Tibby Cotter', '2017-02-24 01:22:29'),
('George Coulthard', '2017-02-24 01:22:29'),
('Charles John Coventry', '2017-02-24 01:22:29'),
('Charles Coventry', '2017-02-24 01:22:29'),
('Norman Cowans', '2017-02-24 01:22:29'),
('Chris Cowdrey', '2017-02-24 01:22:30'),
('Colin Cowdrey', '2017-02-24 01:22:30'),
('Alec Coxon', '2017-02-24 01:22:30'),
('Tony Crafter', '2017-02-24 01:22:30'),
('Ian Craig', '2017-02-24 01:22:30'),
('James Cranston', '2017-02-24 01:22:30'),
('Ken Cranston', '2017-02-24 01:22:31'),
('Pat Crawford', '2017-02-24 01:22:31'),
('John Crawley', '2017-02-24 01:22:31'),
('Fen Cresswell', '2017-02-24 01:22:31'),
('Godfrey Cripps', '2017-02-24 01:22:31'),
('Gary Crocker', '2017-02-24 01:22:31'),
('Colin Croft', '2017-02-24 01:22:31'),
('Robert Croft', '2017-02-24 01:22:32'),
('Ian Cromb', '2017-02-24 01:22:32'),
('Hansie Cronje', '2017-02-24 01:22:32'),
('Derek Crookes', '2017-02-24 01:22:32'),
('Jeff Crowe', '2017-02-24 01:22:32'),
('Martin Crowe', '2017-02-24 01:22:33'),
('Cameron Cuffy', '2017-02-24 01:22:33'),
('Daryll Cullinan', '2017-02-24 01:22:33'),
('Clyde Cumberbatch', '2017-02-24 01:22:33'),
('Anderson Cummins', '2017-02-24 01:22:33'),
('Syd Curnow', '2017-02-24 01:22:33'),
('Kevin  Curran', '2017-02-24 01:22:33'),
('Tim  Curtis', '2017-02-24 01:22:34'),
('Robert Cuttell', '2017-02-24 01:22:34'),
('John D\'Arcy', '2017-02-24 01:22:34'),
('Basil D\'Oliveira', '2017-02-24 01:22:34'),
('Antao D\'Souza', '2017-02-24 01:22:34'),
('Oscar Da Costa', '2017-02-24 01:22:34'),
('Adam Dale', '2017-02-24 01:22:35'),
('Eric Dalton', '2017-02-24 01:22:35'),
('Bal  Dani', '2017-02-24 01:22:35'),
('Wayne Daniel', '2017-02-24 01:22:35'),
('Danish Kaneria', '2017-02-24 01:22:35'),
('Len Darling', '2017-02-24 01:22:35'),
('Rick Darling', '2017-02-24 01:22:35'),
('Shiv Sunder Das', '2017-02-24 01:22:36'),
('Deep Dasgupta', '2017-02-24 01:22:36'),
('Pubudu Dassanayake', '2017-02-24 01:22:36'),
('Noel David', '2017-02-24 01:22:36'),
('Alan Davidson', '2017-02-24 01:22:37'),
('Alec Davies', '2017-02-24 01:22:37'),
('Eric Davies', '2017-02-24 01:22:37'),
('Shaun  Davies', '2017-02-24 01:22:37'),
('Bryan Davis', '2017-02-24 01:22:37'),
('Charlie Davis', '2017-02-24 01:22:38'),
('Heath Davis', '2017-02-24 01:22:38'),
('Ian Davis', '2017-02-24 01:22:38'),
('Simon Davis', '2017-02-24 01:22:38'),
('Steve Davis', '2017-02-24 01:22:38'),
('Winston Davis', '2017-02-24 01:22:38'),
('Alan Dawson', '2017-02-24 01:22:38'),
('Eddie Dawson', '2017-02-24 01:22:38'),
('Ossie Dawson', '2017-02-24 01:22:39'),
('Richard Dawson', '2017-02-24 01:22:39'),
('Frank De Caires', '2017-02-24 01:22:39'),
('Jim de Courcy', '2017-02-24 01:22:39'),
('Richard de Groen', '2017-02-24 01:22:39'),
('Tim De Leede', '2017-02-24 01:22:39'),
('Ashantha De Mel', '2017-02-24 01:22:39'),
('Indika De Saram', '2017-02-24 01:22:40'),
('Ajith De Silva', '2017-02-24 01:22:40'),
('Aravinda De Silva', '2017-02-24 01:22:40'),
('Ashley  De Silva', '2017-02-24 01:22:40'),
('Asoka De Silva', '2017-02-24 01:22:40'),
('Chandra De Silva', '2017-02-24 01:22:40'),
('Granville De Silva', '2017-02-24 01:22:40'),
('Lanka De Silva', '2017-02-24 01:22:40'),
('Sajeewa De Silva', '2017-02-24 01:22:41'),
('Stanley  De Silva', '2017-02-24 01:22:41'),
('Fanie de Villiers', '2017-02-24 01:22:41'),
('Harry Dean', '2017-02-24 01:22:41'),
('Phillip DeFreitas', '2017-02-24 01:22:41'),
('Mark Dekker', '2017-02-24 01:22:41'),
('Tony Dell', '2017-02-24 01:22:42'),
('Eric Dempster', '2017-02-24 01:22:42'),
('Stewie Dempster', '2017-02-24 01:22:42'),
('Mike Denness', '2017-02-24 01:22:42'),
('Franklyn  Dennis', '2017-02-24 01:22:42'),
('David Denton', '2017-02-24 01:22:42'),
('Clairmonte Depeiaza', '2017-02-24 01:22:43'),
('Tiny Desai', '2017-02-24 01:22:43'),
('Tom Dewdney', '2017-02-24 01:22:43'),
('John Dewes', '2017-02-24 01:22:43'),
('Rajindra  Dhanraj', '2017-02-24 01:22:43'),
('Pankaj Dharmani', '2017-02-24 01:22:43'),
('Kumar Dharmasena', '2017-02-24 01:22:44'),
('Michael Di Venuto', '2017-02-24 01:22:44'),
('Art Dick', '2017-02-24 01:22:44'),
('George Dickinson', '2017-02-24 01:22:44'),
('Wilf Diedricks', '2017-02-24 01:22:44'),
('Sameer Dighe', '2017-02-24 01:22:44'),
('Dilawar Hussain', '2017-02-24 01:22:44'),
('Graham Dilley', '2017-02-24 01:22:45'),
('Mervyn Dillon', '2017-02-24 01:22:45'),
('Tillakaratne Dilshan', '2017-02-24 01:22:45'),
('Boeta Dippenaar', '2017-02-24 01:22:45'),
('Alf Dipper', '2017-02-24 01:22:45'),
('Buck Divecha', '2017-02-24 01:22:45'),
('Tony Dodemaide', '2017-02-24 01:22:46'),
('Hubert Doggart', '2017-02-24 01:22:46'),
('Tom Dollery', '2017-02-24 01:22:46'),
('Arthur Dolphin', '2017-02-24 01:22:46'),
('Allan Donald', '2017-02-24 01:22:46'),
('Harry Donnan', '2017-02-24 01:22:46'),
('Martin Donnelly', '2017-02-24 01:22:46'),
('Bruce Dooland', '2017-02-24 01:22:46'),
('Dilip Doshi', '2017-02-24 01:22:47'),
('Johnny Douglas', '2017-02-24 01:22:47'),
('Mark  Douglas', '2017-02-24 01:22:47'),
('Simon Doull', '2017-02-24 01:22:47'),
('Robert Dower', '2017-02-24 01:22:47'),
('Graham Dowling', '2017-02-24 01:22:47'),
('Paul Downton', '2017-02-24 01:22:48'),
('Vasbert Drakes', '2017-02-24 01:22:48'),
('Ronald  Draper', '2017-02-24 01:22:48'),
('Rahul Dravid', '2017-02-24 01:22:48'),
('Frank  Druce', '2017-02-24 01:22:49'),
('Chris Drum', '2017-02-24 01:22:49'),
('Andy  Ducat', '2017-02-24 01:22:49'),
('Chris  Duckworth', '2017-02-24 01:22:49'),
('George Duckworth', '2017-02-24 01:22:49'),
('Barry Dudleston', '2017-02-24 01:22:49'),
('Kevin Duers', '2017-02-24 01:22:49'),
('Reggie Duff', '2017-02-24 01:22:49'),
('Jeff Dujon', '2017-02-24 01:22:50'),
('Shaukat Dukanwala', '2017-02-24 01:22:50'),
('Kumar  Duleepsinhji', '2017-02-24 01:22:50'),
('Richard  Dumbrill', '2017-02-24 01:22:50'),
('Jacobus  Duminy', '2017-02-24 01:22:50'),
('Clyde Duncan', '2017-02-24 01:22:50'),
('Ross  Duncan', '2017-02-24 01:22:50'),
('Owen Dunell', '2017-02-24 01:22:51'),
('Steve Dunne', '2017-02-24 01:22:51'),
('John  Dunning', '2017-02-24 01:22:51'),
('Chamara  Dunusinghe', '2017-02-24 01:22:51'),
('Salim Durani', '2017-02-24 01:22:51'),
('Dennis Dyer', '2017-02-24 01:22:51'),
('Greg Dyer', '2017-02-24 01:22:51'),
('Nick Dyer', '2017-02-24 01:22:51'),
('Geoff Dymock', '2017-02-24 01:22:52'),
('John Dyson', '2017-02-24 01:22:52'),
('Charles Eady', '2017-02-24 01:22:52'),
('Mark Ealham', '2017-02-24 01:22:52'),
('Ken  Eastwood', '2017-02-24 01:22:52'),
('Hans  Ebeling', '2017-02-24 01:22:52'),
('Ahmed Ebrahim', '2017-02-24 01:22:52'),
('Dion Ebrahim', '2017-02-24 01:22:53'),
('Bruce Edgar', '2017-02-24 01:22:53'),
('Phil Edmonds', '2017-02-24 01:22:53'),
('Bill Edrich', '2017-02-24 01:22:53'),
('John Edrich', '2017-02-24 01:22:53'),
('Prof Edwards', '2017-02-24 01:22:53'),
('Ross Edwards', '2017-02-24 01:22:53'),
('Wally  Edwards', '2017-02-24 01:22:54'),
('Col Egar', '2017-02-24 01:22:54'),
('Ehteshamuddin ', '2017-02-24 01:22:54'),
('Clive Eksteen', '2017-02-24 01:22:54'),
('Kim Elgie', '2017-02-24 01:22:54'),
('Charlie Elliott', '2017-02-24 01:22:54'),
('Harry Elliott', '2017-02-24 01:22:55'),
('Matthew  Elliott', '2017-02-24 01:22:55'),
('Richard  Ellison', '2017-02-24 01:22:55'),
('Steven Elworthy', '2017-02-24 01:22:55'),
('John Emburey', '2017-02-24 01:22:55'),
('Philip Emery', '2017-02-24 01:22:56'),
('Raymond Emery', '2017-02-24 01:22:56'),
('Sid Emery', '2017-02-24 01:22:56'),
('George  Emmett', '2017-02-24 01:22:56'),
('Tom Emmett', '2017-02-24 01:22:56'),
('Russell Endean', '2017-02-24 01:22:56'),
('Farokh Engineer', '2017-02-24 01:22:56'),
('Sean Ervine', '2017-02-24 01:22:57'),
('Ahmed Esat', '2017-02-24 01:22:57'),
('Ebrahim Essop-Adam', '2017-02-24 01:22:57'),
('Craig Evans', '2017-02-24 01:22:57'),
('David Evans', '2017-02-24 01:22:57'),
('Edwin Evans', '2017-02-24 01:22:57'),
('Godfrey Evans', '2017-02-24 01:22:57'),
('Graeme Evans', '2017-02-24 01:22:58'),
('John Evans', '2017-02-24 01:22:58'),
('Ric Evans', '2017-02-24 01:22:58'),
('Arthur Fagg', '2017-02-24 01:22:58'),
('Fahim Muntasir', '2017-02-24 01:22:58'),
('Neil Fairbrother', '2017-02-24 01:22:58'),
('Alan Fairfax', '2017-02-24 01:22:59'),
('Faisal Iqbal', '2017-02-24 01:22:59'),
('Freddie Fane', '2017-02-24 01:22:59'),
('Ken Farnes', '2017-02-24 01:22:59'),
('Farooq  Ahmed', '2017-02-24 01:22:59'),
('Farooq Chowdhury', '2017-02-24 01:22:59'),
('Farooq  Hamid', '2017-02-24 01:22:59'),
('Buster Farrer', '2017-02-24 01:23:00'),
('Bill Farrimond', '2017-02-24 01:23:00'),
('Farrukh  Zaman', '2017-02-24 01:23:00'),
('George Faulkner', '2017-02-24 01:23:00'),
('Les Favell', '2017-02-24 01:23:00'),
('Fazal Mahmood', '2017-02-24 01:23:00'),
('Fazale Akbar', '2017-02-24 01:23:00'),
('Jonathan Fellows-Smith', '2017-02-24 01:23:01'),
('Percy Fender', '2017-02-24 01:23:01'),
('Jeff Fenwick', '2017-02-24 01:23:01'),
('Wilf Ferguson', '2017-02-24 01:23:01'),
('Maurice Fernandes', '2017-02-24 01:23:01'),
('Dilhara Fernando', '2017-02-24 01:23:01'),
('Lalith  Fernando', '2017-02-24 01:23:02'),
('Ranjit  Fernando', '2017-02-24 01:23:02'),
('Susil  Fernando', '2017-02-24 01:23:02'),
('Ungamandadige Fernando', '2017-02-24 01:23:02'),
('Charles Fichardt', '2017-02-24 01:23:02'),
('Arthur Fielder', '2017-02-24 01:23:02'),
('Mike Findlay', '2017-02-24 01:23:02'),
('Charlie Finlason', '2017-02-24 01:23:02'),
('Frederick Fisher', '2017-02-24 01:23:03'),
('Laurie Fishlock', '2017-02-24 01:23:03'),
('Damien Fleming', '2017-02-24 01:23:03'),
('Matthew  Fleming', '2017-02-24 01:23:03'),
('Nigel Fleming', '2017-02-24 01:23:03'),
('Stephen Fleming', '2017-02-24 01:23:03'),
('Duncan Fletcher', '2017-02-24 01:23:04'),
('Keith Fletcher', '2017-02-24 01:23:04'),
('Andrew Flintoff', '2017-02-24 01:23:04'),
('Claude Floquet', '2017-02-24 01:23:04'),
('Andy Flower', '2017-02-24 01:23:04'),
('Grant Flower', '2017-02-24 01:23:04'),
('Wilfred Flowers', '2017-02-24 01:23:05'),
('Henry Foley', '2017-02-24 01:23:05'),
('Francis Ford', '2017-02-24 01:23:06'),
('Frank Foster', '2017-02-24 01:23:06'),
('James Foster', '2017-02-24 01:23:06'),
('Maurice Foster', '2017-02-24 01:23:06'),
('Neil Foster', '2017-02-24 01:23:07'),
('Tip Foster', '2017-02-24 01:23:07'),
('Arnold Fothergill', '2017-02-24 01:23:07'),
('Graeme Fowler', '2017-02-24 01:23:07'),
('Bruce  Francis', '2017-02-24 01:23:07'),
('George Francis', '2017-02-24 01:23:07'),
('Howard Francis', '2017-02-24 01:23:07'),
('Cyril Francois', '2017-02-24 01:23:08'),
('Billy Frank', '2017-02-24 01:23:08'),
('Charlie Frank', '2017-02-24 01:23:08'),
('James Franklin', '2017-02-24 01:23:08'),
('Trevor  Franklin', '2017-02-24 01:23:08'),
('Paul Franks', '2017-02-24 01:23:08'),
('Mughal Frasat Ali', '2017-02-24 01:23:08'),
('Angus Fraser', '2017-02-24 01:23:08'),
('Michael Frederick', '2017-02-24 01:23:09'),
('Doug Freeman', '2017-02-24 01:23:09'),
('Eric Freeman', '2017-02-24 01:23:09'),
('Tich Freeman', '2017-02-24 01:23:09'),
('Fred Freer', '2017-02-24 01:23:09'),
('Bruce  French', '2017-02-24 01:23:09'),
('Dick French', '2017-02-24 01:23:09'),
('Travis Friend', '2017-02-24 01:23:10'),
('Charles Fry', '2017-02-24 01:23:10'),
('Dickie Fuller', '2017-02-24 01:23:10'),
('Eddie Fuller', '2017-02-24 01:23:10'),
('George Fullerton', '2017-02-24 01:23:10'),
('Ken Funston', '2017-02-24 01:23:10'),
('Hammond Furlonge', '2017-02-24 01:23:10'),
('Richard  Gabriel', '2017-02-24 01:23:10'),
('Chandrasekhar Gadkari', '2017-02-24 01:23:11'),
('Anshuman Gaekwad', '2017-02-24 01:23:11'),
('Hiralal Gaekwad', '2017-02-24 01:23:11'),
('Indika Gallage', '2017-02-24 01:23:11'),
('Jason  Gallian', '2017-02-24 01:23:11'),
('Norman Gallichan', '2017-02-24 01:23:12'),
('Janak Gamage', '2017-02-24 01:23:12'),
('Dennis Gamsy', '2017-02-24 01:23:12'),
('Devang  Gandhi', '2017-02-24 01:23:12'),
('Ashok Gandotra', '2017-02-24 01:23:12'),
('Akalanka Ganegama', '2017-02-24 01:23:12'),
('Doddanarasiah Ganesh', '2017-02-24 01:23:12'),
('Daren Ganga', '2017-02-24 01:23:12'),
('Bhairab Ganguli', '2017-02-24 01:23:13'),
('Sourav Ganguly', '2017-02-24 01:23:13'),
('Sam Gannon', '2017-02-24 01:23:13'),
('Andy Ganteaume', '2017-02-24 01:23:13'),
('Joel Garner', '2017-02-24 01:23:14'),
('Tom Garrett', '2017-02-24 01:23:14'),
('Leon  Garrick', '2017-02-24 01:23:14'),
('Berkeley Gaskin', '2017-02-24 01:23:14'),
('Mike Gatting', '2017-02-24 01:23:14'),
('Ron Gaunt', '2017-02-24 01:23:15'),
('Sunil Gavaskar', '2017-02-24 01:23:15'),
('Chris Gayle', '2017-02-24 01:23:15'),
('Johnny Gayle', '2017-02-24 01:23:15'),
('Gazi Ashraf', '2017-02-24 01:23:15'),
('George Geary', '2017-02-24 01:23:15'),
('Graham Gedye', '2017-02-24 01:23:16'),
('Algy Gehrs', '2017-02-24 01:23:16'),
('Karsan Ghavri', '2017-02-24 01:23:16'),
('Mohammad Ghazali', '2017-02-24 01:23:16'),
('Jayasinghrao Ghorpade', '2017-02-24 01:23:16'),
('Ghulam  Abbas', '2017-02-24 01:23:16'),
('Ghulam Ahmed', '2017-02-24 01:23:17'),
('Ghulam  Ali', '2017-02-24 01:23:17'),
('Ghulam Farooq', '2017-02-24 01:23:20'),
('Ghulam Nousher', '2017-02-24 01:23:21'),
('Paul Gibb', '2017-02-24 01:23:21'),
('Glendon Gibbs', '2017-02-24 01:23:21'),
('Herschelle Gibbs', '2017-02-24 01:23:21'),
('Lance Gibbs', '2017-02-24 01:23:21'),
('Ottis Gibson', '2017-02-24 01:23:21'),
('Ed Giddins', '2017-02-24 01:23:21'),
('George Giffen', '2017-02-24 01:23:22'),
('Walter Giffen', '2017-02-24 01:23:22'),
('Norman Gifford', '2017-02-24 01:23:22'),
('Dave Gilbert', '2017-02-24 01:23:22'),
('Adam Gilchrist', '2017-02-24 01:23:22'),
('Ashley Giles', '2017-02-24 01:23:22'),
('Jason Gillespie', '2017-02-24 01:23:23'),
('Stuart Gillespie', '2017-02-24 01:23:23'),
('Arthur Gilligan', '2017-02-24 01:23:23'),
('Harold Gilligan', '2017-02-24 01:23:23'),
('Gary Gilmour', '2017-02-24 01:23:23'),
('Harold Gimblett', '2017-02-24 01:23:23'),
('George Gladstone', '2017-02-24 01:23:23'),
('Cliff Gladwin', '2017-02-24 01:23:24'),
('John Gleeson', '2017-02-24 01:23:24'),
('Robert Gleeson', '2017-02-24 01:23:24'),
('George Glover', '2017-02-24 01:23:24'),
('John Goddard', '2017-02-24 01:23:24'),
('Tom Goddard', '2017-02-24 01:23:24'),
('Trevor Goddard', '2017-02-24 01:23:25'),
('Francis Gomes', '2017-02-24 01:23:25'),
('Larry Gomes', '2017-02-24 01:23:25'),
('Gerry Gomez', '2017-02-24 01:23:25'),
('Murray Goodwin', '2017-02-24 01:23:25'),
('Yohan  Goonasekera', '2017-02-24 01:23:25'),
('Mahes Goonatillake', '2017-02-24 01:23:26'),
('Ranjan  Goonatillake', '2017-02-24 01:23:26'),
('Quintin Goosen', '2017-02-24 01:23:26'),
('Morappakam Gopalan', '2017-02-24 01:23:26'),
('Coimbatarao Gopinath', '2017-02-24 01:23:26'),
('Norman Gordon', '2017-02-24 01:23:26'),
('Madhav Gothoskar', '2017-02-24 01:23:27'),
('Ian Gould', '2017-02-24 01:23:27'),
('Alf Gover', '2017-02-24 01:23:27'),
('David Gower', '2017-02-24 01:23:27'),
('Edward  Grace', '2017-02-24 01:23:27'),
('Fred  Grace', '2017-02-24 01:23:27'),
('W.G. Grace', '2017-02-24 01:23:28'),
('Shaun  Graf', '2017-02-24 01:23:28'),
('Harry Graham', '2017-02-24 01:23:28'),
('Robert Graham', '2017-02-24 01:23:28'),
('Rolph Grant', '2017-02-24 01:23:28'),
('Tom Graveney', '2017-02-24 01:23:28'),
('Evan  Gray', '2017-02-24 01:23:29'),
('Tony Gray', '2017-02-24 01:23:29'),
('Paul Grayson', '2017-02-24 01:23:29'),
('Mark Greatbatch', '2017-02-24 01:23:29'),
('Tommy Greenhough', '2017-02-24 01:23:29'),
('Alvin Greenidge', '2017-02-24 01:23:30'),
('Geoff Greenidge', '2017-02-24 01:23:30'),
('Gordon Greenidge', '2017-02-24 01:23:30'),
('Andrew Greenwood', '2017-02-24 01:23:30'),
('Luke Greenwood', '2017-02-24 01:23:30'),
('Dave Gregory', '2017-02-24 01:23:30'),
('Ned  Gregory', '2017-02-24 01:23:30'),
('Ross  Gregory', '2017-02-24 01:23:31'),
('Syd Gregory', '2017-02-24 01:23:31'),
('Ian  Greig', '2017-02-24 01:23:31'),
('Tony Greig', '2017-02-24 01:23:31'),
('Mervyn Grell', '2017-02-24 01:23:31'),
('Basil Grieve', '2017-02-24 01:23:31'),
('Ronnie Grieveson', '2017-02-24 01:23:31'),
('Geoff Griffin', '2017-02-24 01:23:32'),
('Adrian Griffith', '2017-02-24 01:23:32'),
('Billy Griffith', '2017-02-24 01:23:32'),
('Charlie Griffith', '2017-02-24 01:23:32'),
('Herman Griffith', '2017-02-24 01:23:32'),
('Clarrie Grimmett', '2017-02-24 01:23:32'),
('Trevor  Gripper', '2017-02-24 01:23:32'),
('Tom  Groube', '2017-02-24 01:23:32'),
('Wally Grout', '2017-02-24 01:23:33'),
('Ghulam Guard', '2017-02-24 01:23:33'),
('Colin  Guest', '2017-02-24 01:23:33'),
('Sammy Guillen', '2017-02-24 01:23:33'),
('Gul Mohammad', '2017-02-24 01:23:33'),
('Gul Mohammad', '2017-02-24 01:23:33'),
('Arachchige  Gunawardene', '2017-02-24 01:23:34'),
('Aruna  Gunawardene', '2017-02-24 01:23:34'),
('Avishka Gunawardene', '2017-02-24 01:23:34'),
('Roshan Guneratne', '2017-02-24 01:23:34'),
('Billy Gunn', '2017-02-24 01:23:34'),
('George Gunn', '2017-02-24 01:23:34'),
('John Gunn', '2017-02-24 01:23:35'),
('Ram Gupta', '2017-02-24 01:23:35'),
('Sandip Gupta', '2017-02-24 01:23:35'),
('Baloo Gupte', '2017-02-24 01:23:35'),
('Fergie Gupte', '2017-02-24 01:23:35'),
('Gursharan  Singh', '2017-02-24 01:23:35'),
('Asanka Gurusinha', '2017-02-24 01:23:36'),
('Haafiz Shahid', '2017-02-24 01:23:36'),
('Aftab  Habib', '2017-02-24 01:23:36'),
('Habibul Bashar', '2017-02-24 01:23:36'),
('Brad Haddin', '2017-02-24 01:23:36'),
('Barry  Hadlee', '2017-02-24 01:23:36'),
('Dayle Hadlee', '2017-02-24 01:23:37'),
('Richard Hadlee', '2017-02-24 01:23:37'),
('Wally Hadlee', '2017-02-24 01:23:37'),
('Hafizur Rahman', '2017-02-24 01:23:37'),
('Nigel Haig', '2017-02-24 01:23:37'),
('Schofield Haigh', '2017-02-24 01:23:37'),
('Darrell Hair', '2017-02-24 01:23:37'),
('Alf Hall', '2017-02-24 01:23:37'),
('Andrew Hall', '2017-02-24 01:23:38'),
('Glen  Hall', '2017-02-24 01:23:38'),
('Wes Hall', '2017-02-24 01:23:38'),
('Baberton Halliwell', '2017-02-24 01:23:38'),
('Charlie Hallows', '2017-02-24 01:23:38'),
('Clive Halse', '2017-02-24 01:23:38'),
('Ron Hamence', '2017-02-24 01:23:38'),
('Gavin Hamilton', '2017-02-24 01:23:39'),
('Gavin Hamilton', '2017-02-24 01:23:39'),
('Jeff Hammond', '2017-02-24 01:23:39'),
('Wally Hammond', '2017-02-24 01:23:39'),
('John Hampshire', '2017-02-24 01:23:39'),
('Philip Hands', '2017-02-24 01:23:40'),
('Reginald Hands', '2017-02-24 01:23:40'),
('Hanif Muhammad', '2017-02-24 01:23:40'),
('Martin  Hanley', '2017-02-24 01:23:40'),
('Hanumant Singh', '2017-02-24 01:23:41'),
('Harbhajan Singh', '2017-02-24 01:23:41'),
('Manohar Hardikar', '2017-02-24 01:23:41'),
('Wally Hardinge', '2017-02-24 01:23:41'),
('Noel Harford', '2017-02-24 01:23:41'),
('Haroon Rashid', '2017-02-24 01:23:42'),
('Daryl Harper', '2017-02-24 01:23:42'),
('Roger Harper', '2017-02-24 01:23:42'),
(' Harris', '2017-02-24 01:23:42'),
('Chris Harris', '2017-02-24 01:23:42'),
('George Harris', '2017-02-24 01:23:43'),
('Roger  Harris', '2017-02-24 01:23:43'),
('Tony Harris', '2017-02-24 01:23:43'),
('Zin Harris', '2017-02-24 01:23:43'),
('John Harry', '2017-02-24 01:23:43'),
('Matthew Hart', '2017-02-24 01:23:44'),
('Terry  Hart', '2017-02-24 01:23:44'),
('Gerald Hartigan', '2017-02-24 01:23:44'),
('Roger Hartigan', '2017-02-24 01:23:44'),
('Albert  Hartkopf', '2017-02-24 01:23:44'),
('Blair Hartland', '2017-02-24 01:23:44'),
('John Hartley', '2017-02-24 01:23:45'),
('Harunur  Rashid', '2017-02-24 01:23:45'),
('Mick Harvey', '2017-02-24 01:23:45'),
('Ian Harvey', '2017-02-24 01:23:45'),
('Mervyn  Harvey', '2017-02-24 01:23:45'),
('Neil Harvey', '2017-02-24 01:23:45'),
('Robert Harvey', '2017-02-24 01:23:45'),
('Harvinder Singh', '2017-02-24 01:23:45'),
('Hasan  Jamil', '2017-02-24 01:23:46'),
('Hasan Raza', '2017-02-24 01:23:46'),
('Haseeb Ahsan', '2017-02-24 01:23:46'),
('Hasibul Hussain', '2017-02-24 01:23:46'),
('Mark Haslam', '2017-02-24 01:23:46'),
('Lindsay Hassett', '2017-02-24 01:23:46'),
('Brian Hastings', '2017-02-24 01:23:46'),
('Maitland Hathorn', '2017-02-24 01:23:47'),
('Chandika Hathurusingha', '2017-02-24 01:23:47'),
('Martin Hawke', '2017-02-24 01:23:47'),
('Neil Hawke', '2017-02-24 01:23:47'),
('Matthew Hayden', '2017-02-24 01:23:47'),
('Ernie Hayes', '2017-02-24 01:23:47'),
('Frank Hayes', '2017-02-24 01:23:48'),
('Johnny Hayes', '2017-02-24 01:23:48'),
('Roydon  Hayes', '2017-02-24 01:23:48'),
('Desmond Haynes', '2017-02-24 01:23:48'),
('Robert Haynes', '2017-02-24 01:23:48'),
('Nantie Hayward', '2017-02-24 01:23:48'),
('Tom Hayward', '2017-02-24 01:23:48'),
('Vijay Hazare', '2017-02-24 01:23:48'),
('Gerry Hazlitt', '2017-02-24 01:23:49'),
('Dean Headley', '2017-02-24 01:23:49'),
('George Headley', '2017-02-24 01:23:49'),
('Ron  Headley', '2017-02-24 01:23:49'),
('Ian Healy', '2017-02-24 01:23:49'),
('Alec Hearne', '2017-02-24 01:23:49'),
('Frank Hearne', '2017-02-24 01:23:49'),
('Frank Hearne', '2017-02-24 01:23:50'),
('George  Hearne', '2017-02-24 01:23:50'),
('Alfred Hearne', '2017-02-24 01:23:50'),
('Warren  Hegg', '2017-02-24 01:23:50'),
('Peter Heine', '2017-02-24 01:23:50'),
('Eddie Hemmings', '2017-02-24 01:23:50'),
('Claude Henderson', '2017-02-24 01:23:50'),
('Matthew Henderson', '2017-02-24 01:23:51'),
('Patsy Hendren', '2017-02-24 01:23:51'),
('Mike Hendrick', '2017-02-24 01:23:51'),
('Stork Hendry', '2017-02-24 01:23:51'),
('Cornelius Henry', '2017-02-24 01:23:51'),
('Omar Henry', '2017-02-24 01:23:51'),
('Rangana Herath', '2017-02-24 01:23:51'),
('Christopher, Heseltine', '2017-02-24 01:23:52'),
('Dinuka Hettiarachchi', '2017-02-24 01:23:52'),
('Peter  Heyn', '2017-02-24 01:23:53'),
('Paul  Hibbert', '2017-02-24 01:23:53'),
('Graeme Hick', '2017-02-24 01:23:53'),
('John Hickson', '2017-02-24 01:23:53'),
('Arthur Hide', '2017-02-24 01:23:53'),
('Jim Higgs', '2017-02-24 01:23:53'),
('Ken Higgs', '2017-02-24 01:23:54'),
('Mark Higgs', '2017-02-24 01:23:54'),
('Andy Hilditch', '2017-02-24 01:23:54'),
('Allen Hill', '2017-02-24 01:23:54'),
('Arthur Hill', '2017-02-24 01:23:54'),
('Clem Hill', '2017-02-24 01:23:54'),
('Malcolm Hilton', '2017-02-24 01:23:55'),
('Charles Hime', '2017-02-24 01:23:55'),
('Dattaram Hindlekar', '2017-02-24 01:23:55'),
('Ryan Hinds', '2017-02-24 01:23:55'),
('Wavell Hinds', '2017-02-24 01:23:55'),
('George Hirst', '2017-02-24 01:23:55'),
('Narendra Hirwani', '2017-02-24 01:23:56'),
('Bill Hitch', '2017-02-24 01:23:56'),
('Des Hoare', '2017-02-24 01:23:56'),
('Robin Hobbs', '2017-02-24 01:23:56'),
('John Hodges', '2017-02-24 01:23:56'),
('Tom Hogan', '2017-02-24 01:23:57');
INSERT INTO `users` (`name`, `timestamp`) VALUES
('Brad Hogg', '2017-02-24 01:23:57'),
('Rodney Hogg', '2017-02-24 01:23:57'),
('Vince Hogg', '2017-02-24 01:23:57'),
('Matthew Hoggard', '2017-02-24 01:23:57'),
('Trevor  Hohns', '2017-02-24 01:23:57'),
('John Holder', '2017-02-24 01:23:58'),
('Roland Holder', '2017-02-24 01:23:58'),
('Vanburn Holder', '2017-02-24 01:23:58'),
('Michael Holding', '2017-02-24 01:23:58'),
('Graeme Hole', '2017-02-24 01:23:58'),
('David Holford', '2017-02-24 01:23:58'),
('Eric Hollies', '2017-02-24 01:23:58'),
('Adam Hollioake', '2017-02-24 01:23:59'),
('Benjamin Hollioake', '2017-02-24 01:23:59'),
('Errol Holmes', '2017-02-24 01:23:59'),
('Percy Holmes', '2017-02-24 01:23:59'),
('John Holt', '2017-02-24 01:23:59'),
('Douglas Hondo', '2017-02-24 01:23:59'),
('Leland Hone', '2017-02-24 01:23:59'),
('David Hookes', '2017-02-24 01:23:59'),
('Carl Hooper', '2017-02-24 01:24:00'),
('Bert Hopkins', '2017-02-24 01:24:00'),
('Len Hopwood', '2017-02-24 01:24:00'),
('Tom Horan', '2017-02-24 01:24:00'),
('Ranji Hordern', '2017-02-24 01:24:00'),
('Monkey Hornby', '2017-02-24 01:24:00'),
('Matthew Horne', '2017-02-24 01:24:00'),
('Philip  Horne', '2017-02-24 01:24:00'),
('Percy  Hornibrook', '2017-02-24 01:24:01'),
('Martin Horton', '2017-02-24 01:24:01'),
('Kenneth Hough', '2017-02-24 01:24:01'),
('Dave Houghton', '2017-02-24 01:24:01'),
('Nigel Howard', '2017-02-24 01:24:01'),
('Tony  Howard', '2017-02-24 01:24:01'),
('Geoff Howarth', '2017-02-24 01:24:02'),
('Hedley Howarth', '2017-02-24 01:24:02'),
('Bill Howell', '2017-02-24 01:24:02'),
('Harry Howell', '2017-02-24 01:24:02'),
('Ian Howell', '2017-02-24 01:24:02'),
('Llorne  Howell', '2017-02-24 01:24:02'),
('Dick Howorth', '2017-02-24 01:24:02'),
('Adam Huckle', '2017-02-24 01:24:03'),
('Andrew Hudson', '2017-02-24 01:24:03'),
('Kim Hughes', '2017-02-24 01:24:03'),
('Merv Hughes', '2017-02-24 01:24:03'),
('Humayun Farhat', '2017-02-24 01:24:03'),
('Geoff  Humpage', '2017-02-24 01:24:03'),
('Bill  Hunt', '2017-02-24 01:24:03'),
('Conrad Hunte', '2017-02-24 01:24:04'),
('Errol Hunte', '2017-02-24 01:24:04'),
('Alan Hurst', '2017-02-24 01:24:04'),
('Alec Hurwood', '2017-02-24 01:24:04'),
('Nasser Hussain', '2017-02-24 01:24:04'),
('Kenneth Hutchings', '2017-02-24 01:24:05'),
('Philip Hutchinson', '2017-02-24 01:24:05'),
('Len Hutton', '2017-02-24 01:24:05'),
('Richard Hutton', '2017-02-24 01:24:05'),
('Leslie Hylton', '2017-02-24 01:24:05'),
('Khanmohammed Ibrahim', '2017-02-24 01:24:05'),
('Iftikhar Malik', '2017-02-24 01:24:06'),
('Alan Igglesden', '2017-02-24 01:24:06'),
('Ijaz Ahmed Jr', '2017-02-24 01:24:06'),
('Ijaz Ahmed snr', '2017-02-24 01:24:06'),
('Ijaz Butt', '2017-02-24 01:24:06'),
('Ijaz Faqih', '2017-02-24 01:24:06'),
('Richard Illingworth', '2017-02-24 01:24:06'),
('Mark Ilott', '2017-02-24 01:24:07'),
('Imran  Abbas', '2017-02-24 01:24:07'),
('Imran Farhat', '2017-02-24 01:24:07'),
('Imran Khan', '2017-02-24 01:24:07'),
('Imran Nazir', '2017-02-24 01:24:07'),
('Imtiaz Abbasi', '2017-02-24 01:24:07'),
('Imtiaz Ahmed', '2017-02-24 01:24:08'),
('Imtiaz Imtiaz Ali', '2017-02-24 01:24:08'),
('Prince Indrajitsinhji', '2017-02-24 01:24:08'),
('Inshan Ali', '2017-02-24 01:24:08'),
('Doug Insole', '2017-02-24 01:24:08'),
('Intikhab Alam', '2017-02-24 01:24:08'),
('John Inverarity', '2017-02-24 01:24:09'),
('Inzamam-ul-Haq ', '2017-02-24 01:24:09'),
('Iqbal Qasim', '2017-02-24 01:24:09'),
('Iqbal Sikander', '2017-02-24 01:24:09'),
('Jenni Irani', '2017-02-24 01:24:09'),
('Ronnie Irani', '2017-02-24 01:24:09'),
('Frank Iredale', '2017-02-24 01:24:09'),
('Irfan  Bhatti', '2017-02-24 01:24:09'),
('Irfan Fazil', '2017-02-24 01:24:10'),
('Bertie Ironmonger', '2017-02-24 01:24:10'),
('David Ironside', '2017-02-24 01:24:10'),
('Raymond Isherwood', '2017-02-24 01:24:10'),
('Islam Khan', '2017-02-24 01:24:10'),
('Israr Ali', '2017-02-24 01:24:10'),
('Barry Jackman', '2017-02-24 01:24:11'),
('Robin  Jackman', '2017-02-24 01:24:11'),
('Archie Jackson', '2017-02-24 01:24:11'),
('Les Jackson', '2017-02-24 01:24:11'),
('Stanley Jackson', '2017-02-24 01:24:11'),
('Ridley Jacobs', '2017-02-24 01:24:11'),
('Ajay Jadeja', '2017-02-24 01:24:11'),
('Wasim Jaffer', '2017-02-24 01:24:12'),
('Jahangir Khan', '2017-02-24 01:24:12'),
('Jahangir Shah', '2017-02-24 01:24:12'),
('Motganhalli Jaisimha', '2017-02-24 01:24:12'),
('Jalaluddin ', '2017-02-24 01:24:12'),
('Ken James', '2017-02-24 01:24:12'),
('Steve  James', '2017-02-24 01:24:12'),
('Wayne James', '2017-02-24 01:24:12'),
('John Jameson', '2017-02-24 01:24:13'),
('Rustomji Jamshedji', '2017-02-24 01:24:13'),
('Floris  Jansen', '2017-02-24 01:24:13'),
('Douglas Jardine', '2017-02-24 01:24:13'),
('Barry Jarman', '2017-02-24 01:24:13'),
('Affie Jarvis', '2017-02-24 01:24:13'),
('Malcolm Jarvis', '2017-02-24 01:24:14'),
('Paul Jarvis', '2017-02-24 01:24:14'),
('Terry Jarvis', '2017-02-24 01:24:14'),
('Jasbir Singh', '2017-02-24 01:24:14'),
('Javed Akhtar', '2017-02-24 01:24:14'),
('Javed Burki', '2017-02-24 01:24:14'),
('Javed Miandad', '2017-02-24 01:24:14'),
('Javed Omar', '2017-02-24 01:24:14'),
('Javed  Qadeer', '2017-02-24 01:24:15'),
('Jawahir  Shah', '2017-02-24 01:24:15'),
('Kenia Jayantilal', '2017-02-24 01:24:15'),
('Stanley  Jayasekera', '2017-02-24 01:24:15'),
('Sunil  Jayasinghe', '2017-02-24 01:24:15'),
('Sanath Jayasuriya', '2017-02-24 01:24:16'),
('Mahela Jayawardene', '2017-02-24 01:24:16'),
('Sridharan Jeganathan', '2017-02-24 01:24:16'),
('Roly Jenkins', '2017-02-24 01:24:17'),
('Terry Jenner', '2017-02-24 01:24:17'),
('Claude Jennings', '2017-02-24 01:24:17'),
('Arthur Jepson', '2017-02-24 01:24:17'),
('Kerry Jeremy', '2017-02-24 01:24:17'),
('Gilbert Jessop', '2017-02-24 01:24:17'),
('Trevor Jesty', '2017-02-24 01:24:17'),
('Vinothen John', '2017-02-24 01:24:18'),
('Clement Johnson', '2017-02-24 01:24:19'),
('David Johnson', '2017-02-24 01:24:19'),
('Hines Johnson', '2017-02-24 01:24:19'),
('Ian Johnson', '2017-02-24 01:24:19'),
('Len Johnson', '2017-02-24 01:24:19'),
('Neil Johnson', '2017-02-24 01:24:19'),
('Tyrel Johnson', '2017-02-24 01:24:20'),
('Bill Johnston', '2017-02-24 01:24:20');

-- --------------------------------------------------------

--
-- Table structure for table `USER_INFO`
--

CREATE TABLE `USER_INFO` (
  `USER_ID` int(11) NOT NULL,
  `USERNAME` varchar(40) NOT NULL,
  `IS_ADMIN` tinyint(1) NOT NULL DEFAULT '0',
  `EMAIL_ID` varchar(40) NOT NULL DEFAULT '',
  `PASSWORD` varchar(100) NOT NULL,
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USER_INFO`
--

INSERT INTO `USER_INFO` (`USER_ID`, `USERNAME`, `IS_ADMIN`, `EMAIL_ID`, `PASSWORD`, `UPDATE_DTM`) VALUES
(47, 'Karan', 1, 'karancbk@gmail.com', 'pass', '2017-03-26 16:08:09'),
(48, 'Marisundar', 0, 'marisundar2006@gmail.com', 'password', '2017-03-26 16:12:45'),
(49, 'Akilan', 0, 'ktakilan@gmail.com', '03111990', '2017-03-26 16:14:13'),
(50, 'Ganesan', 0, 'ganesantn.kongu@gmail.com', '123', '2017-03-26 16:14:56'),
(51, 'Gopal', 0, 'gopalakrishnanjk@gmail.com', 'blasters2017', '2017-03-26 16:18:39'),
(52, 'NK', 0, 'karthi2tup@gmail.com', 'nkthaaru', '2017-03-26 16:23:48'),
(53, 'Karan', 0, 'karunagarankb@gmail.com', 'pass', '2017-03-26 16:24:40'),
(54, 'K.krishnaraj', 0, 'rooneykrishna@gmail.com', 'blasters2017', '2017-03-26 16:26:55'),
(55, 'Balaji', 0, 'balajirajendrancse2012@gmail.com', 'admin123', '2017-03-26 16:28:17'),
(57, 'ARUNAGIRI', 0, 'rlarunagiri@gmail.com', '9677550420arun', '2017-03-26 16:42:36'),
(58, 'PK', 0, '08csr035@gmail.com', '03121990', '2017-03-26 16:49:22'),
(59, 'Hara', 0, 'haraganesh@gmail.com', 'welcome', '2017-03-26 17:05:26'),
(61, 'Kumaravel M', 0, 'mr.kumar.be@gmail.com', '0846', '2017-03-27 04:15:26'),
(62, 'Durairaj', 0, 'bdurairajcse@gmail.com', 'durai@123', '2017-03-27 10:59:46'),
(63, 'Kalees', 0, 'kaleeswaranpm@gmail.com', '1srikalis', '2017-03-27 11:56:24'),
(65, 'Varun Arulmani', 0, 'varun.arulmani@gmail.com', 'nurava', '2017-03-28 01:46:29'),
(66, 'Hari', 0, 'harrycsea@gmail.com', '123456', '2018-03-24 13:16:16'),
(67, 'Naveen', 0, 'navirock.123@gmail.com', '123456', '2018-03-24 14:13:31'),
(68, 'Varun Arulmani', 0, 'varun007arulmani@gmail.com', 'varunvarun', '2018-03-24 14:14:23'),
(69, 'Balaji Mohan', 0, 'smbalaji89@gmail.com', '123456', '2018-05-14 07:10:37'),
(70, 'Karan', 1, 'karan@kk.com', 'passw0rd', '2018-12-28 07:45:03'),
(71, 'Gowtham M', 0, 'gowthagowtham017@gmail.com', 'gowtham017', '2019-03-23 11:10:15'),
(72, 'Naveen', 0, 'naveen1999kg@gmail.com', '12345', '2019-03-23 12:42:28'),
(73, 'Naveen', 0, 'naveen1999@gmail.com', '12345', '2019-03-23 13:57:34');

-- --------------------------------------------------------

--
-- Table structure for table `USER_TEAM_INFO`
--

CREATE TABLE `USER_TEAM_INFO` (
  `TEAM_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `START_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `END_DTM` timestamp NOT NULL DEFAULT '2018-04-02 06:59:59',
  `UPDATE_DTM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USER_TEAM_INFO`
--

INSERT INTO `USER_TEAM_INFO` (`TEAM_ID`, `USER_ID`, `START_DTM`, `END_DTM`, `UPDATE_DTM`) VALUES
(14, 48, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(14, 57, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(14, 61, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(14, 63, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(14, 65, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(14, 68, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(14, 69, '2018-05-14 07:10:37', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(14, 71, '2019-03-23 11:10:15', '2020-04-02 06:59:59', '2019-03-23 11:10:15'),
(14, 72, '2019-03-23 12:42:28', '2020-04-02 06:59:59', '2019-03-23 12:42:28'),
(14, 73, '2019-03-23 13:57:34', '2020-04-02 06:59:59', '2019-03-23 13:57:34'),
(15, 49, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(15, 55, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(15, 58, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(15, 62, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(16, 50, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(16, 52, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(16, 59, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(16, 60, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(16, 66, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(17, 51, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(17, 53, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(17, 54, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59'),
(17, 67, '2017-04-02 06:59:59', '2020-04-02 06:59:59', '2019-03-03 06:59:59');

-- --------------------------------------------------------

--
-- Structure for view `AUCTION_STAT`
--
DROP TABLE IF EXISTS `AUCTION_STAT`;

CREATE ALGORITHM=UNDEFINED DEFINER=`be0u3ovel1ml`@`localhost` SQL SECURITY DEFINER VIEW `AUCTION_STAT`  AS  select `team`.`TEAM_ID` AS `TEAM_ID`,`team`.`LEAGUE_ID` AS `LEAGUE_ID`,ifnull(sum(`TEAM_PLAYER_INFO`.`SOLD_PRICE`),0) AS `totalAmount`,ifnull(count(`TEAM_PLAYER_INFO`.`PLAYER_ID`),0) AS `totalPlayers`,ifnull(`pref`.`PREFERENCE_CODE`,0) AS `preferenceCode` from ((`TEAM_INFO` `team` left join `TEAM_PLAYER_INFO` on(((`team`.`TEAM_ID` = `TEAM_PLAYER_INFO`.`TEAM_ID`) and (`TEAM_PLAYER_INFO`.`AUCTION_TYPE` in ('OPEN','CB1','CB2')) and ('2018-04-30 00:01:00' between `TEAM_PLAYER_INFO`.`EFF_DT` and `TEAM_PLAYER_INFO`.`END_DT`)))) left join `TEAM_PREFERENCE` `pref` on(((`pref`.`TEAM_ID` = `team`.`TEAM_ID`) and (`pref`.`PREFERENCE_NAME` = 'COMBO')))) group by `team`.`TEAM_ID`,`team`.`LEAGUE_ID`,`pref`.`PREFERENCE_CODE` ;

-- --------------------------------------------------------

--
-- Structure for view `PLAYERS_STAT`
--
DROP TABLE IF EXISTS `PLAYERS_STAT`;

CREATE ALGORITHM=UNDEFINED DEFINER=`be0u3ovel1ml`@`localhost` SQL SECURITY DEFINER VIEW `PLAYERS_STAT`  AS  select `player`.`NAME` AS `playerName`,`player`.`IPL_TEAM` AS `iplTeam`,`team`.`TEAM_ID` AS `teamId`,`team`.`LEAGUE_ID` AS `leagueCode`,`info`.`SOLD_PRICE` AS `soldPrice`,`info`.`PLAYER_ID` AS `playerId` from ((`TEAM_PLAYER_INFO` `info` join `TEAM_INFO` `team` on(((`team`.`TEAM_ID` = `info`.`TEAM_ID`) and (`info`.`AUCTION_TYPE` in ('OPEN','CB1','CB2')) and ('2018-04-30 00:01:00' between `info`.`EFF_DT` and `info`.`END_DT`)))) join `PLAYER_INFO` `player` on((`info`.`PLAYER_ID` = `player`.`PLAYER_ID`))) where ((`info`.`AUCTIONED_BY` <> -(99)) and (`info`.`TEAM_ID` <> -(99))) ;

-- --------------------------------------------------------

--
-- Structure for view `PLAYER_POINTS`
--
DROP TABLE IF EXISTS `PLAYER_POINTS`;

CREATE ALGORITHM=UNDEFINED DEFINER=`be0u3ovel1ml`@`localhost` SQL SECURITY DEFINER VIEW `PLAYER_POINTS`  AS  select distinct `teamPlayers`.`PLAYER_ID` AS `PLAYER_ID`,`teamPlayers`.`TEAM_ID` AS `TEAM_ID`,`players`.`NAME` AS `NAME`,`players`.`IPL_TEAM` AS `iplteam`,ifnull(`score`.`TOTAL_RUNS`,0) AS `TOTAL_RUNS`,ifnull(`points`.`TOTAL_RUNS_POINTS`,0) AS `TOTAL_RUNS_POINTS`,((ifnull(`score`.`TOTAL_RUNS`,0) * `points`.`TOTAL_RUNS_POINTS`) * ifnull(`pp`.`POWER_PLAYER`,1)) AS `runPoints`,((ifnull(`score`.`NO_OF_FOUR`,0) * `points`.`FOUR_POINTS`) * ifnull(`pp`.`POWER_PLAYER`,1)) AS `fourPoints`,((ifnull(`score`.`NO_OF_SIX`,0) * `points`.`SIX_POINTS`) * ifnull(`pp`.`POWER_PLAYER`,1)) AS `sixPoints`,(((ifnull(`score`.`TOTAL_RUNS`,0) DIV 25) * `points`.`BATSMAN_RUNS_25`) * ifnull(`pp`.`POWER_PLAYER`,1)) AS `runs25Points`,((ifnull(`score`.`TOTAL_RUNS`,0) - ifnull(`score`.`BATSMAN_BALLS`,0)) * ifnull(`pp`.`POWER_PLAYER`,1)) AS `strikeRatePoints`,(case when (ifnull(`score`.`IS_OUT`,0) and (ifnull(`score`.`TOTAL_RUNS`,0) = 0)) then (`points`.`DUCK_OUT_POINTS` * ifnull(`pp`.`POWER_PLAYER`,1)) else 0 end) AS `duckOutPoints`,((ifnull(`score`.`NO_OF_WICKETS`,0) * `points`.`WICKETS_POINTS`) * ifnull(`pp`.`POWER_PLAYER`,1)) AS `wicketPoints`,(case when ((ifnull(`score`.`NO_OF_WICKETS`,0) >= 3) and (ifnull(`score`.`NO_OF_WICKETS`,0) < 5)) then (`points`.`WICKETS3_POINTS` * ifnull(`pp`.`POWER_PLAYER`,1)) when (ifnull(`score`.`NO_OF_WICKETS`,0) >= 5) then (`points`.`WICKETS5_POINTS` * ifnull(`pp`.`POWER_PLAYER`,1)) else 0 end) AS `threeOr5WicketHaul`,((ifnull(`score`.`NO_OF_MAIDEN`,0) * `points`.`MAIDEN_POINTS`) * ifnull(`pp`.`POWER_PLAYER`,1)) AS `maidenPoints`,((ifnull(`score`.`NO_OF_HATRICK`,0) * `points`.`HATRICK_POINTS`) * ifnull(`pp`.`POWER_PLAYER`,1)) AS `hatrickPoints`,(case when (ifnull(`score`.`NO_OF_WICKETS`,0) > 0) then (((ifnull(`score`.`NO_OF_OVERS`,0) * 1.5) - `score`.`BOWLING_RUNS`) * ifnull(`pp`.`POWER_PLAYER`,1)) when (ifnull(`score`.`NO_OF_WICKETS`,0) = 0) then ((((ifnull(`score`.`NO_OF_OVERS`,0) * 1.5) - `score`.`BOWLING_RUNS`) * 2) * ifnull(`pp`.`POWER_PLAYER`,1)) end) AS `economyPoints`,((ifnull(`score`.`NO_OF_CATCHES`,0) * `points`.`CATCHES_POINTS`) * ifnull(`pp`.`POWER_PLAYER`,1)) AS `catchesPoints`,((ifnull(`score`.`NO_OF_STUMPING`,0) * `points`.`STUMPING_POINTS`) * ifnull(`pp`.`POWER_PLAYER`,1)) AS `stumpingPoints`,((ifnull(`score`.`NO_OF_RUNOUTS`,0) * `points`.`RUNOUTS_POINTS`) * ifnull(`pp`.`POWER_PLAYER`,1)) AS `runOutPoints`,((ifnull(`score`.`MOM`,0) * `points`.`MOM_POINTS`) * ifnull(`pp`.`POWER_PLAYER`,1)) AS `momPoints`,ifnull(`score`.`MATCH_ID`,0) AS `matchId`,convert_tz(ifnull(`score`.`PLAYED_DATE`,now()),'+00:00','+05:30') AS `playedDate`,ifnull(`score`.`PLAYED_DATE`,now()) AS `IstDate` from ((`TEAM_PLAYER_INFO` `teamPlayers` left join (((`PLAYER_SCORE_INFO` `score` join `CRIC_API_MAPPING` `cricApi` on((`score`.`PLAYER_ID` = `cricApi`.`CRIC_PLAYER_ID`))) left join `POWER_PLAYER_INFO` `pp` on(((`pp`.`PLAYER_ID` = `cricApi`.`PLAYER_ID`) and (convert_tz(ifnull(`score`.`PLAYED_DATE`,now()),'+00:00','-12:30') between `pp`.`EFF_DT` and `pp`.`END_DT`) and (`pp`.`IS_VALID` = 1)))) join `POINTS_CONFIG_INFO` `points` on((ifnull(convert_tz(`score`.`PLAYED_DATE`,'+00:00','-12:30'),now()) between `points`.`EFF_DT` and `points`.`END_DT`))) on(((`cricApi`.`PLAYER_ID` = `teamPlayers`.`PLAYER_ID`) and (ifnull(convert_tz(`score`.`PLAYED_DATE`,'+00:00','-12:30'),now()) between `teamPlayers`.`EFF_DT` and `teamPlayers`.`END_DT`)))) join `PLAYER_INFO` `players` on((`teamPlayers`.`PLAYER_ID` = `players`.`PLAYER_ID`))) where ((`players`.`IPL_TEAM` <> 'NN') and (`teamPlayers`.`TEAM_ID` <> -(99))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AUCTION_MESSAGES_INFO`
--
ALTER TABLE `AUCTION_MESSAGES_INFO`
  ADD PRIMARY KEY (`MESSAGE_ID`);

--
-- Indexes for table `AUCTION_PLAYER_INFO`
--
ALTER TABLE `AUCTION_PLAYER_INFO`
  ADD PRIMARY KEY (`AUCTION_ID`);

--
-- Indexes for table `COMBO_PLAYERS_INFO`
--
ALTER TABLE `COMBO_PLAYERS_INFO`
  ADD PRIMARY KEY (`COMBO_ID`,`PLAYER_ID`);

--
-- Indexes for table `CRIC_API_MAPPING`
--
ALTER TABLE `CRIC_API_MAPPING`
  ADD PRIMARY KEY (`CRIC_PLAYER_ID`);

--
-- Indexes for table `LEAGUE_AUCTION_INFO`
--
ALTER TABLE `LEAGUE_AUCTION_INFO`
  ADD PRIMARY KEY (`LEAGUE_ID`,`AUCTION_TYPE`);

--
-- Indexes for table `LEAGUE_INFO`
--
ALTER TABLE `LEAGUE_INFO`
  ADD PRIMARY KEY (`LEAGUE_ID`);

--
-- Indexes for table `LEAGUE_PRICE_TABLE`
--
ALTER TABLE `LEAGUE_PRICE_TABLE`
  ADD PRIMARY KEY (`LEAGUE_ID`,`PLAYER_ID`,`AUCTION_TYPE`);

--
-- Indexes for table `MATCH_DETAILS`
--
ALTER TABLE `MATCH_DETAILS`
  ADD PRIMARY KEY (`MATCH_ID`);

--
-- Indexes for table `MATCH_INFO`
--
ALTER TABLE `MATCH_INFO`
  ADD PRIMARY KEY (`MATCH_ID`);

--
-- Indexes for table `PLAYER_INFO`
--
ALTER TABLE `PLAYER_INFO`
  ADD PRIMARY KEY (`PLAYER_ID`);

--
-- Indexes for table `PLAYER_SCORE_INFO`
--
ALTER TABLE `PLAYER_SCORE_INFO`
  ADD PRIMARY KEY (`PLAYER_ID`,`MATCH_ID`);

--
-- Indexes for table `POINTS_CONFIG_INFO`
--
ALTER TABLE `POINTS_CONFIG_INFO`
  ADD PRIMARY KEY (`POINTS_ID`);

--
-- Indexes for table `POWER_PLAYER_INFO`
--
ALTER TABLE `POWER_PLAYER_INFO`
  ADD PRIMARY KEY (`PLAYER_ID`,`EFF_DT`);

--
-- Indexes for table `PREFERENCE_INFO`
--
ALTER TABLE `PREFERENCE_INFO`
  ADD PRIMARY KEY (`LEAGUE_ID`,`PREFERENCE_NAME`,`PREFERENCE_CODE`,`PREFERENCE_VALUE`);

--
-- Indexes for table `TEAM_INFO`
--
ALTER TABLE `TEAM_INFO`
  ADD PRIMARY KEY (`TEAM_ID`);

--
-- Indexes for table `TEAM_PLAYER_INFO`
--
ALTER TABLE `TEAM_PLAYER_INFO`
  ADD PRIMARY KEY (`TEAM_ID`,`PLAYER_ID`,`EFF_DT`);

--
-- Indexes for table `TEAM_PREFERENCE`
--
ALTER TABLE `TEAM_PREFERENCE`
  ADD PRIMARY KEY (`LEAGUE_ID`,`TEAM_ID`,`PREFERENCE_NAME`,`PREFERENCE_CODE`);

--
-- Indexes for table `USER_INFO`
--
ALTER TABLE `USER_INFO`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Indexes for table `USER_TEAM_INFO`
--
ALTER TABLE `USER_TEAM_INFO`
  ADD PRIMARY KEY (`TEAM_ID`,`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AUCTION_MESSAGES_INFO`
--
ALTER TABLE `AUCTION_MESSAGES_INFO`
  MODIFY `MESSAGE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `LEAGUE_INFO`
--
ALTER TABLE `LEAGUE_INFO`
  MODIFY `LEAGUE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1017;

--
-- AUTO_INCREMENT for table `POINTS_CONFIG_INFO`
--
ALTER TABLE `POINTS_CONFIG_INFO`
  MODIFY `POINTS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `TEAM_INFO`
--
ALTER TABLE `TEAM_INFO`
  MODIFY `TEAM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `USER_INFO`
--
ALTER TABLE `USER_INFO`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
