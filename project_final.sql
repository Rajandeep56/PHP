-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 29, 2022 at 04:55 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `Availability`
--

CREATE TABLE `Availability` (
  `aptNumber` int(11) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Time` time NOT NULL,
  `Day` text NOT NULL,
  `medicalLicence` int(11) DEFAULT NULL,
  `healthNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Availability`
--

INSERT INTO `Availability` (`aptNumber`, `Status`, `Time`, `Day`, `medicalLicence`, `healthNo`) VALUES
(1, 'Available', '03:00:00', 'Monday', 6754387, 3456789),
(2, 'Available', '04:00:00', 'Monday', 6754387, 3456789),
(3, 'Available', '11:00:00', 'Saturday', 8769870, 3456789);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `medicalLicence` int(11) NOT NULL,
  `doctorName` text NOT NULL,
  `email` text NOT NULL,
  `phoneNo` int(11) NOT NULL,
  `address` text NOT NULL,
  `specialization` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`medicalLicence`, `doctorName`, `email`, `phoneNo`, `address`, `specialization`) VALUES
(2343245, 'Raj', 'test@gmail.com', 123467786, '234ghcc', 'Heart'),
(6754387, 'Rajan', 'rajan@gmail.com', 1236787934, 'testing testing', 'Eye Care'),
(8769870, 'Rajandeep', 'rajan@gmail.com', 1234567658, '7896 street', 'Heart Specialist');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `fname` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `healthNo` int(7) NOT NULL,
  `email` text NOT NULL,
  `phoneNo` int(10) NOT NULL,
  `address` text NOT NULL,
  `gender` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`fname`, `lname`, `healthNo`, `email`, `phoneNo`, `address`, `gender`) VALUES
('Test', 'Patient', 2345645, 'testing@gmail.com', 1234542345, '6474hfdjcdk', 'Male'),
('Rajandeep', 'Keep', 3456780, 'rajan@gmail.com', 1234567882, '5674 st', 'Female'),
('Rajan', 'Deep', 3456789, 'rajan@gmail.com', 1234567882, '5674 st', 'Female'),
('Rajandeep', 'Kaur', 7860943, 'rajandeep@gmail.com', 1256786543, '778 street , Surrey,bc', 'Female'),
('Rajan', 'Test', 7878987, 'test@gmail.com', 1234567826, '567tyhgu', 'Female'),
('Final ', 'Test', 7894532, 'rajan@gmail.com', 1234356789, '789 yt', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `documentId` int(11) NOT NULL,
  `pdf_file` text NOT NULL,
  `healthNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Availability`
--
ALTER TABLE `Availability`
  ADD PRIMARY KEY (`aptNumber`),
  ADD KEY `medicalLicence` (`medicalLicence`),
  ADD KEY `healthNo` (`healthNo`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`medicalLicence`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`healthNo`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`documentId`),
  ADD KEY `healthNo` (`healthNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Availability`
--
ALTER TABLE `Availability`
  MODIFY `aptNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `documentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Availability`
--
ALTER TABLE `Availability`
  ADD CONSTRAINT `availability_ibfk_1` FOREIGN KEY (`medicalLicence`) REFERENCES `doctors` (`medicalLicence`),
  ADD CONSTRAINT `availability_ibfk_2` FOREIGN KEY (`healthNo`) REFERENCES `registration` (`healthNo`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`healthNo`) REFERENCES `registration` (`healthNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
