-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 23, 2024 at 10:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itbclub`
--

-- --------------------------------------------------------

--
-- Table structure for table `BOOKINGS`
--

CREATE TABLE `BOOKINGS` (
  `id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `reservation_status` enum('pending','confirmed','cancelled') NOT NULL DEFAULT 'pending',
  `reservation_type` enum('class','game','training') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `COMMENTS`
--

CREATE TABLE `COMMENTS` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `person_create_id` int(11) NOT NULL,
  `comment` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FACILITIES`
--

CREATE TABLE `FACILITIES` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `facility_type` enum('training-court','indoor-court','outdoor-court') NOT NULL DEFAULT 'outdoor-court',
  `facility_status` enum('maintenance','available','reserved') NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GAMES`
--

CREATE TABLE `GAMES` (
  `id` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `team1_id` int(11) NOT NULL,
  `team2_id` int(11) NOT NULL,
  `score_t1` int(11) DEFAULT NULL,
  `score_t2` int(11) DEFAULT NULL,
  `tournament_position` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `LOCATIONS`
--

CREATE TABLE `LOCATIONS` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deteled_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PAYMENTS`
--

CREATE TABLE `PAYMENTS` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `concept` varchar(250) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PEOPLE`
--

CREATE TABLE `PEOPLE` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surnames` varchar(200) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `birthdate` datetime DEFAULT NULL,
  `user_type` enum('player','admin','coach','captain','employee') NOT NULL DEFAULT 'player',
  `player_level` enum('junior','youth','semi-professional','professional') DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TEAMS`
--

CREATE TABLE `TEAMS` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location_id` int(11) NOT NULL,
  `category` enum('junior','senior','professional') NOT NULL DEFAULT 'junior',
  `total_score` int(11) DEFAULT NULL,
  `img` varchar(250) NOT NULL DEFAULT 'user.png',
  `captain` int(30) NOT NULL,
  `player1` int(30) NOT NULL,
  `player2` int(30) NOT NULL,
  `player3` int(30) NOT NULL,
  `player4` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TOURNAMENTS`
--

CREATE TABLE `TOURNAMENTS` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BOOKINGS`
--
ALTER TABLE `BOOKINGS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_facilityB` (`facility_id`),
  ADD KEY `FK_personB` (`person_id`);

--
-- Indexes for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_personP` (`player_id`),
  ADD KEY `FK_authorP` (`person_create_id`);

--
-- Indexes for table `FACILITIES`
--
ALTER TABLE `FACILITIES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_locationF` (`location_id`);

--
-- Indexes for table `GAMES`
--
ALTER TABLE `GAMES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tournament` (`tournament_id`),
  ADD KEY `FK_team1` (`team1_id`),
  ADD KEY `FK_team2` (`team2_id`),
  ADD KEY `FK_bookingG` (`id_booking`);

--
-- Indexes for table `LOCATIONS`
--
ALTER TABLE `LOCATIONS`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `PAYMENTS`
--
ALTER TABLE `PAYMENTS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `FK_person` (`person_id`);

--
-- Indexes for table `PEOPLE`
--
ALTER TABLE `PEOPLE`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `FK_teamP` (`team_id`);

--
-- Indexes for table `TEAMS`
--
ALTER TABLE `TEAMS`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `captain` (`captain`),
  ADD KEY `FK_locationT` (`location_id`);

--
-- Indexes for table `TOURNAMENTS`
--
ALTER TABLE `TOURNAMENTS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_location` (`location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BOOKINGS`
--
ALTER TABLE `BOOKINGS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FACILITIES`
--
ALTER TABLE `FACILITIES`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `GAMES`
--
ALTER TABLE `GAMES`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `LOCATIONS`
--
ALTER TABLE `LOCATIONS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PAYMENTS`
--
ALTER TABLE `PAYMENTS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PEOPLE`
--
ALTER TABLE `PEOPLE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TEAMS`
--
ALTER TABLE `TEAMS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TOURNAMENTS`
--
ALTER TABLE `TOURNAMENTS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BOOKINGS`
--
ALTER TABLE `BOOKINGS`
  ADD CONSTRAINT `FK_facilityB` FOREIGN KEY (`facility_id`) REFERENCES `BOOKINGS` (`id`),
  ADD CONSTRAINT `FK_personB` FOREIGN KEY (`person_id`) REFERENCES `PEOPLE` (`id`);

--
-- Constraints for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD CONSTRAINT `FK_authorP` FOREIGN KEY (`person_create_id`) REFERENCES `PEOPLE` (`id`),
  ADD CONSTRAINT `FK_personP` FOREIGN KEY (`player_id`) REFERENCES `PEOPLE` (`id`);

--
-- Constraints for table `FACILITIES`
--
ALTER TABLE `FACILITIES`
  ADD CONSTRAINT `FK_locationF` FOREIGN KEY (`location_id`) REFERENCES `LOCATIONS` (`id`);

--
-- Constraints for table `GAMES`
--
ALTER TABLE `GAMES`
  ADD CONSTRAINT `FK_bookingG` FOREIGN KEY (`id_booking`) REFERENCES `BOOKINGS` (`id`),
  ADD CONSTRAINT `FK_team1` FOREIGN KEY (`team1_id`) REFERENCES `TEAMS` (`id`),
  ADD CONSTRAINT `FK_team2` FOREIGN KEY (`team2_id`) REFERENCES `TEAMS` (`id`),
  ADD CONSTRAINT `FK_tournament` FOREIGN KEY (`tournament_id`) REFERENCES `TOURNAMENTS` (`id`);

--
-- Constraints for table `PAYMENTS`
--
ALTER TABLE `PAYMENTS`
  ADD CONSTRAINT `FK_person` FOREIGN KEY (`person_id`) REFERENCES `PEOPLE` (`id`);

--
-- Constraints for table `PEOPLE`
--
ALTER TABLE `PEOPLE`
  ADD CONSTRAINT `FK_teamP` FOREIGN KEY (`team_id`) REFERENCES `TEAMS` (`id`);

--
-- Constraints for table `TEAMS`
--
ALTER TABLE `TEAMS`
  ADD CONSTRAINT `FK_locationT` FOREIGN KEY (`location_id`) REFERENCES `LOCATIONS` (`id`);

--
-- Constraints for table `TOURNAMENTS`
--
ALTER TABLE `TOURNAMENTS`
  ADD CONSTRAINT `FK_location` FOREIGN KEY (`location_id`) REFERENCES `LOCATIONS` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
