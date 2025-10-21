-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2025 at 07:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todolist`
--

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `regid` int(11) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`regid`, `fname`, `lname`, `email`, `pass`, `mobile`, `address`) VALUES
(1, 'Harshitha', 'Merugu', 'sweety@gmail.com', '1234', 9949631507, 'hyderabad\r\n5-50 ,ramayampet,medak,502101'),
(2, 'SWEETY', 'sweety', 'sweety1@gmail.com', '1234', 9949631507, 'ewekwjij'),
(3, 'new', 'new', 'new@gmail.com', 'new', 9949631507, 'ewekwjij'),
(4, 'new', 'new', 'new@gmail.com', 'new', 9949631507, 'abcd');

-- --------------------------------------------------------

--
-- Table structure for table `taskid_pks`
--

CREATE TABLE `taskid_pks` (
  `regid` int(11) DEFAULT NULL,
  `taskid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taskid_pks`
--

INSERT INTO `taskid_pks` (`regid`, `taskid`) VALUES
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `taskid` int(11) NOT NULL,
  `taskname` varchar(50) DEFAULT NULL,
  `taskdate` varchar(10) DEFAULT NULL,
  `taskstatus` int(1) DEFAULT NULL CHECK (`taskstatus` in (1,2,3)),
  `regid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`taskid`, `taskname`, `taskdate`, `taskstatus`, `regid`) VALUES
(1, 'unstop', '2025-10-14', 3, 1),
(1, 'upload  CAD,AI worksheets', '2025-10-14', 3, 2),
(2, 'new task', '2025-10-14', 2, 1),
(2, 'go home', '2025-10-14', 3, 2),
(3, 'student counselling form', '2025-10-18', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`regid`);

--
-- Indexes for table `taskid_pks`
--
ALTER TABLE `taskid_pks`
  ADD KEY `taskid_pks_regid_fk` (`regid`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`taskid`,`regid`),
  ADD KEY `tasks_regid_fk` (`regid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `taskid_pks`
--
ALTER TABLE `taskid_pks`
  ADD CONSTRAINT `taskid_pks_regid_fk` FOREIGN KEY (`regid`) REFERENCES `register` (`regid`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_regid_fk` FOREIGN KEY (`regid`) REFERENCES `register` (`regid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
