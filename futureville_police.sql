-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 27, 2019 at 09:39 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `futureville_police`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignedTo`
--

CREATE TABLE `assignedTo` (
  `officerID` int(11) NOT NULL,
  `caseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignedTo`
--

INSERT INTO `assignedTo` (`officerID`, `caseID`) VALUES
(1000, 106),
(1000, 109),
(1001, 100),
(1001, 104),
(1001, 108),
(1002, 103),
(1002, 107),
(1401, 103),
(1402, 102),
(1402, 107),
(1502, 101),
(1502, 105);

-- --------------------------------------------------------

--
-- Table structure for table `belongsTo`
--

CREATE TABLE `belongsTo` (
  `caseID` int(11) NOT NULL,
  `evidenceID` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `belongsTo`
--

INSERT INTO `belongsTo` (`caseID`, `evidenceID`) VALUES
(100, '201'),
(101, '202'),
(103, '202'),
(102, '204'),
(104, '205'),
(105, '206'),
(106, '207'),
(107, '208'),
(108, '209'),
(109, '210');

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `caseID` int(11) NOT NULL,
  `Crime` char(20) NOT NULL,
  `location` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`caseID`, `Crime`, `location`) VALUES
(100, 'Murder', 'Dunsmuir St'),
(101, 'Bank Robbery', '678 Granville St'),
(102, 'Murder', '55th St'),
(103, 'Murder', '32th St'),
(104, 'Murder', '22nd St'),
(105, 'Home Invasion', '100th St'),
(106, 'Gambling Ring', 'Main St'),
(107, 'Grand Theft Auto', '2nd Ave'),
(108, 'Murder', '11th St'),
(109, 'Major Drug Deal', '200th St');

-- --------------------------------------------------------

--
-- Table structure for table `DateOfCrime`
--

CREATE TABLE `DateOfCrime` (
  `crime` char(20) NOT NULL,
  `date` date NOT NULL,
  `location` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DateOfCrime`
--

INSERT INTO `DateOfCrime` (`crime`, `date`, `location`) VALUES
('Bank Robbery', '2019-02-23', '678 Granville St'),
('Gambling Ring', '2016-04-18', 'Main St'),
('Grand Theft Auto', '2019-02-13', '2nd Ave'),
('Home Invasion', '2019-01-03', '100th St'),
('House Robbery', '2019-04-22', '43rd St'),
('Major Drug Deal', '2019-11-05', '200th St'),
('Murder', '2019-07-30', '11th St'),
('Murder', '2019-01-03', '22nd St'),
('Murder', '2019-05-25', '55th St'),
('Murder', '2019-08-29', 'Dunsmuir St');

-- --------------------------------------------------------

--
-- Table structure for table `Detective`
--

CREATE TABLE `Detective` (
  `officerID` int(11) NOT NULL,
  `fullName` char(20) NOT NULL,
  `precinct` char(20) NOT NULL,
  `address` char(20) NOT NULL,
  `supervisorID` int(11) DEFAULT NULL,
  `department` char(20) NOT NULL,
  `Status` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Detective`
--

INSERT INTO `Detective` (`officerID`, `fullName`, `precinct`, `address`, `supervisorID`, `department`, `Status`) VALUES
(1000, 'Franklin McMann', '57th precinct', '7th St', 1402, 'Vice', 'Desk'),
(1001, 'Barkley Smith', '44th precinct', '7th St', 1402, 'Homocide', 'Field'),
(1002, 'Donald Mcdonald', '57th precinct', '23rd St', 1402, 'Robbery', 'Desk'),
(1401, 'Lisa Simpson', '44th precinct', '8th St', 1402, 'Robbery', 'Field'),
(1402, 'Dan Ronley', '44th precinct', '5th St', NULL, 'Homocide', 'Desk'),
(1501, 'Edward Vedder', '94th precinct', '19th St', 1402, 'Homocide', 'Desk'),
(1502, 'Curtis Cobain', '1st precinct', '111th St', 1402, 'Robbery', 'Field');

-- --------------------------------------------------------

--
-- Table structure for table `Evidence`
--

CREATE TABLE `Evidence` (
  `evidenceID` char(20) NOT NULL,
  `description` char(40) NOT NULL,
  `dateFound` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Evidence`
--

INSERT INTO `Evidence` (`evidenceID`, `description`, `dateFound`) VALUES
('201', 'One knife and one pistol', '2019-08-29'),
('202', 'Two witnesses saw robbery', '2019-02-23'),
('203', 'Camera footage', '2019-02-23'),
('204', 'pistol found in trashcan', '2019-05-25'),
('205', 'Camera footage', '2019-02-23'),
('206', 'Fingerprints', '2019-01-05'),
('207', 'Informant tip', '2019-10-22'),
('208', 'License plate 7T3-F2Q', '2019-02-13'),
('209', 'Victims blood', '2019-08-01'),
('210', 'Bag of drugs found', '2019-11-12');

-- --------------------------------------------------------

--
-- Table structure for table `goodDeedsPerformed`
--

CREATE TABLE `goodDeedsPerformed` (
  `suspectID` char(20) NOT NULL,
  `deedNumber` char(4) NOT NULL,
  `description` char(30) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `goodDeedsPerformed`
--

INSERT INTO `goodDeedsPerformed` (`suspectID`, `deedNumber`, `description`, `date`) VALUES
('302', '0001', 'Donated $20 to charity', '2016-06-22'),
('302', '0002', 'Picked up litter', '2014-02-02'),
('302', '0003', 'Helped extinguish housefire', '2015-04-23'),
('303', '0001', 'Volunteer Work', '2018-05-02'),
('304', '0001', 'Saved a cat stuck in tree', '2017-03-03'),
('304', '0002', 'Saved a dog stuck in tree', '2017-03-03'),
('304', '0003', 'Saved a pig stuck in tree', '2017-03-03'),
('304', '0004', 'Saved a bird stuck in tree', '2017-03-03'),
('304', '0005', 'Saved another cat in a tree', '2017-03-03'),
('304', '0006', 'Saved a human stuck in tree', '2017-03-03'),
('305', '0001', 'Helped extinguish housefire', '2015-04-23');

-- --------------------------------------------------------

--
-- Table structure for table `jailCells`
--

CREATE TABLE `jailCells` (
  `jailID` char(20) NOT NULL,
  `Address` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jailCells`
--

INSERT INTO `jailCells` (`jailID`, `Address`) VALUES
('0001', '1111 22nd Ave'),
('0002', '400 Broadway St'),
('0003', '17th St'),
('0004', '17th St'),
('0005', '29th St');

-- --------------------------------------------------------

--
-- Table structure for table `Officer_Has`
--

CREATE TABLE `Officer_Has` (
  `officerID` int(11) NOT NULL,
  `functionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Officer_Has`
--

INSERT INTO `Officer_Has` (`officerID`, `functionID`) VALUES
(1003, 101),
(1003, 103),
(1004, 101),
(1004, 105),
(1005, 103),
(1006, 104),
(1007, 102),
(1010, 101),
(1010, 102),
(1010, 103),
(1010, 104),
(1010, 105),
(1010, 106),
(1020, 101),
(1020, 102),
(1020, 103),
(1020, 104),
(1020, 105),
(1020, 106),
(1022, 101),
(1022, 102),
(1022, 103),
(1022, 104),
(1022, 105),
(1022, 106),
(1024, 101),
(1024, 102),
(1024, 103),
(1024, 104),
(1024, 105),
(1024, 106),
(1026, 104),
(1026, 106);

-- --------------------------------------------------------

--
-- Table structure for table `Patrol`
--

CREATE TABLE `Patrol` (
  `officerID` int(11) NOT NULL,
  `fullName` char(20) NOT NULL,
  `precinct` char(20) NOT NULL,
  `address` char(20) NOT NULL,
  `supervisorID` int(11) DEFAULT NULL,
  `carFleetNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Patrol`
--

INSERT INTO `Patrol` (`officerID`, `fullName`, `precinct`, `address`, `supervisorID`, `carFleetNumber`) VALUES
(1300, 'Joe Denverm', '44th precinct', '23rd St', 1001, 55),
(1302, 'Tom Lopaz', '57th precinct', '29th St', 1002, 68),
(1303, 'Mark Lopaz', '57th precinct', '63rd St', 1001, 68),
(1304, 'Jennifer Carlsson', '57th precinct', '134th St', 1002, 76),
(1305, 'Terry Johnson', '44th precinct', '120th St', 1001, 44),
(1306, 'Barry Johnson', '94th precinct', '120th St', 1501, 12),
(1307, 'Sandy Johnson', '94th precinct', '120th St', 1501, 12),
(1308, 'Annabelle Winchester', '94th precinct', '11th St', 1501, 32),
(1309, 'Hannah Dulley', '94th precinct', '3rd Ave', 1501, 43),
(1310, 'Harold Dulley', '94th precinct', '3rd Ave', 1501, 45),
(1311, 'Zaid Abrams', '94th precinct', '10th St', 1501, 90),
(1312, 'Wanda Rae', '94th precinct', '41st St', 1501, 90),
(1313, 'Vivian Potter', '94th precinct', '42nd St', 1501, 43),
(1314, 'Adam Adamson', '1st precinct', '4th Ave', 1502, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Robocop`
--

CREATE TABLE `Robocop` (
  `officerID` int(11) NOT NULL,
  `fullName` char(20) NOT NULL,
  `precinct` char(20) NOT NULL,
  `address` char(20) NOT NULL,
  `supervisorID` int(11) NOT NULL,
  `versionNumber` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Robocop`
--

INSERT INTO `Robocop` (`officerID`, `fullName`, `precinct`, `address`, `supervisorID`, `versionNumber`) VALUES
(1003, 'CrimeBot201', '44th precinct', '17th St', 1001, 'v10.2'),
(1004, 'ScoutBot1001', '57th precinct', '21th St', 1002, 'v5.7'),
(1005, 'ScoutBot1002', '44th precinct', '17th St', 1001, 'v5.7'),
(1006, 'CrimeBot202', '57th precinct', '21th St', 1002, 'v10.1'),
(1007, 'CrimeBot203', '44th precinct', '17th St', 1001, 'v10.2'),
(1010, 'UltraBot000', '57th precinct', '21th St', 1002, 'v14.0'),
(1020, 'UltraBot001', '57th precinct', '21th St', 1002, 'v14.0'),
(1022, 'UltraBot002', '94th precinct', '70th St', 1501, 'v14.0'),
(1024, 'UltraBot003', '94th precinct', '70th St', 1501, 'v14.0'),
(1026, 'CrimeBot204', '1st precinct', '30th St', 1502, 'v10.1'),
(1028, 'UselessBot000', '1st precinct', '30th St', 1502, 'v1.0'),
(1030, 'UselessBot001', '44th precinct', '17th St', 1001, 'v1.0');

-- --------------------------------------------------------

--
-- Table structure for table `roboFunction`
--

CREATE TABLE `roboFunction` (
  `functionID` int(11) NOT NULL,
  `functionName` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roboFunction`
--

INSERT INTO `roboFunction` (`functionID`, `functionName`) VALUES
(101, 'Night Vision'),
(102, 'Smoke Cluster Cannon'),
(103, 'Jetpack'),
(104, 'MMA Techniques'),
(105, 'x8 zoom'),
(106, 'Power Of Love');

-- --------------------------------------------------------

--
-- Table structure for table `Suspected`
--

CREATE TABLE `Suspected` (
  `suspectID` char(20) NOT NULL,
  `caseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Suspected`
--

INSERT INTO `Suspected` (`suspectID`, `caseID`) VALUES
('301', 100),
('302', 101),
('303', 102),
('304', 103),
('305', 104);

-- --------------------------------------------------------

--
-- Table structure for table `Suspects_DetainedIn`
--

CREATE TABLE `Suspects_DetainedIn` (
  `suspectID` char(20) NOT NULL,
  `suspectName` char(20) DEFAULT NULL,
  `crimeRate` int(11) DEFAULT NULL,
  `jailID` char(10) DEFAULT NULL,
  `dateOfRelease` date DEFAULT NULL,
  `dateOfDetention` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Suspects_DetainedIn`
--

INSERT INTO `Suspects_DetainedIn` (`suspectID`, `suspectName`, `crimeRate`, `jailID`, `dateOfRelease`, `dateOfDetention`) VALUES
('301', 'Gordon William', 70, '0001', '2035-09-13', '2019-09-16'),
('302', 'Adam White', 50, '0002', '2028-08-23', '2012-09-12'),
('303', 'Gordon McDan', 70, '0003', '2040-03-10', '2019-03-10'),
('304', 'Sly Cooper', 35, '0004', '2022-02-08', '2019-02-08'),
('305', 'Adam Sake', 10, '0005', '2020-04-30', '2018-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `witnessedBy`
--

CREATE TABLE `witnessedBy` (
  `witnessID` char(4) NOT NULL,
  `caseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `witnessedBy`
--

INSERT INTO `witnessedBy` (`witnessID`, `caseID`) VALUES
('0001', 100),
('0002', 101),
('0003', 101),
('0004', 103),
('0005', 104),
('0006', 105),
('0007', 107),
('0008', 109),
('0009', 109);

-- --------------------------------------------------------

--
-- Table structure for table `witnesses`
--

CREATE TABLE `witnesses` (
  `witnessID` char(20) NOT NULL,
  `Address` char(20) NOT NULL,
  `fullName` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `witnesses`
--

INSERT INTO `witnesses` (`witnessID`, `Address`, `fullName`) VALUES
('0001', '1224 7th Ave', 'Barney Brown'),
('0002', '891 Main St', 'Esmerelda Smith'),
('0003', '891 Main St', 'Jerry Smith'),
('0004', '36th St', 'Arnold Scott'),
('0005', '52nd St', 'Gerald Santana'),
('0006', '100th St', 'Lucas Davenport'),
('0007', '2nd Ave', 'Sherry Applebees'),
('0008', '33rd Blvrd', 'Bradley Pitt'),
('0009', '33rd Blvrd', 'Angie Jolene');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignedTo`
--
ALTER TABLE `assignedTo`
  ADD PRIMARY KEY (`officerID`,`caseID`),
  ADD KEY `caseID` (`caseID`);

--
-- Indexes for table `belongsTo`
--
ALTER TABLE `belongsTo`
  ADD PRIMARY KEY (`caseID`),
  ADD KEY `evidenceID` (`evidenceID`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`caseID`);

--
-- Indexes for table `DateOfCrime`
--
ALTER TABLE `DateOfCrime`
  ADD PRIMARY KEY (`crime`,`location`);

--
-- Indexes for table `Detective`
--
ALTER TABLE `Detective`
  ADD PRIMARY KEY (`officerID`),
  ADD KEY `supervisorID` (`supervisorID`);

--
-- Indexes for table `Evidence`
--
ALTER TABLE `Evidence`
  ADD PRIMARY KEY (`evidenceID`);

--
-- Indexes for table `goodDeedsPerformed`
--
ALTER TABLE `goodDeedsPerformed`
  ADD PRIMARY KEY (`suspectID`,`deedNumber`);

--
-- Indexes for table `jailCells`
--
ALTER TABLE `jailCells`
  ADD PRIMARY KEY (`jailID`);

--
-- Indexes for table `Officer_Has`
--
ALTER TABLE `Officer_Has`
  ADD PRIMARY KEY (`officerID`,`functionID`),
  ADD KEY `functionID` (`functionID`);

--
-- Indexes for table `Patrol`
--
ALTER TABLE `Patrol`
  ADD PRIMARY KEY (`officerID`),
  ADD KEY `supervisorID` (`supervisorID`);

--
-- Indexes for table `Robocop`
--
ALTER TABLE `Robocop`
  ADD PRIMARY KEY (`officerID`),
  ADD KEY `supervisorID` (`supervisorID`);

--
-- Indexes for table `roboFunction`
--
ALTER TABLE `roboFunction`
  ADD PRIMARY KEY (`functionID`);

--
-- Indexes for table `Suspected`
--
ALTER TABLE `Suspected`
  ADD PRIMARY KEY (`suspectID`,`caseID`),
  ADD KEY `caseID` (`caseID`);

--
-- Indexes for table `Suspects_DetainedIn`
--
ALTER TABLE `Suspects_DetainedIn`
  ADD PRIMARY KEY (`suspectID`),
  ADD KEY `jailID` (`jailID`);

--
-- Indexes for table `witnessedBy`
--
ALTER TABLE `witnessedBy`
  ADD PRIMARY KEY (`witnessID`),
  ADD KEY `caseID` (`caseID`);

--
-- Indexes for table `witnesses`
--
ALTER TABLE `witnesses`
  ADD PRIMARY KEY (`witnessID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignedTo`
--
ALTER TABLE `assignedTo`
  ADD CONSTRAINT `assignedto_ibfk_1` FOREIGN KEY (`officerID`) REFERENCES `Detective` (`officerID`),
  ADD CONSTRAINT `assignedto_ibfk_2` FOREIGN KEY (`caseID`) REFERENCES `cases` (`caseID`);

--
-- Constraints for table `belongsTo`
--
ALTER TABLE `belongsTo`
  ADD CONSTRAINT `belongsto_ibfk_1` FOREIGN KEY (`caseID`) REFERENCES `cases` (`caseID`),
  ADD CONSTRAINT `belongsto_ibfk_2` FOREIGN KEY (`evidenceID`) REFERENCES `evidence` (`evidenceID`);

--
-- Constraints for table `Detective`
--
ALTER TABLE `Detective`
  ADD CONSTRAINT `detective_ibfk_1` FOREIGN KEY (`supervisorID`) REFERENCES `Detective` (`officerID`);

--
-- Constraints for table `goodDeedsPerformed`
--
ALTER TABLE `goodDeedsPerformed`
  ADD CONSTRAINT `gooddeedsperformed_ibfk_1` FOREIGN KEY (`suspectID`) REFERENCES `Suspects_DetainedIn` (`suspectID`);

--
-- Constraints for table `Officer_Has`
--
ALTER TABLE `Officer_Has`
  ADD CONSTRAINT `officer_has_ibfk_1` FOREIGN KEY (`officerID`) REFERENCES `Robocop` (`officerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `officer_has_ibfk_2` FOREIGN KEY (`functionID`) REFERENCES `roboFunction` (`functionID`) ON DELETE CASCADE;

--
-- Constraints for table `Patrol`
--
ALTER TABLE `Patrol`
  ADD CONSTRAINT `patrol_ibfk_1` FOREIGN KEY (`supervisorID`) REFERENCES `Detective` (`officerID`);

--
-- Constraints for table `Robocop`
--
ALTER TABLE `Robocop`
  ADD CONSTRAINT `robocop_ibfk_1` FOREIGN KEY (`supervisorID`) REFERENCES `Detective` (`officerID`);

--
-- Constraints for table `Suspected`
--
ALTER TABLE `Suspected`
  ADD CONSTRAINT `suspected_ibfk_1` FOREIGN KEY (`suspectID`) REFERENCES `Suspects_DetainedIn` (`suspectID`),
  ADD CONSTRAINT `suspected_ibfk_2` FOREIGN KEY (`caseID`) REFERENCES `cases` (`caseID`);

--
-- Constraints for table `Suspects_DetainedIn`
--
ALTER TABLE `Suspects_DetainedIn`
  ADD CONSTRAINT `suspects_detainedin_ibfk_1` FOREIGN KEY (`jailID`) REFERENCES `jailCells` (`jailID`);

--
-- Constraints for table `witnessedBy`
--
ALTER TABLE `witnessedBy`
  ADD CONSTRAINT `witnessedby_ibfk_1` FOREIGN KEY (`caseID`) REFERENCES `Cases` (`caseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
