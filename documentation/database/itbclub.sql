-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 23, 2024 at 01:48 PM
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

--
-- Dumping data for table `BOOKINGS`
--

INSERT INTO `BOOKINGS` (`id`, `facility_id`, `person_id`, `date_start`, `date_end`, `reservation_status`, `reservation_type`) VALUES
(53, 101, 201, '2024-05-25 10:00:00', '2024-05-25 12:00:00', 'confirmed', 'class'),
(54, 102, 202, '2024-05-26 14:00:00', '2024-05-26 16:00:00', 'confirmed', 'game'),
(55, 103, 203, '2024-05-27 09:00:00', '2024-05-27 11:00:00', 'confirmed', 'training'),
(56, 101, 204, '2024-05-28 15:00:00', '2024-05-28 17:00:00', 'pending', 'game'),
(57, 102, 205, '2024-05-29 11:00:00', '2024-05-29 13:00:00', 'pending', 'class');

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

--
-- Dumping data for table `COMMENTS`
--

INSERT INTO `COMMENTS` (`id`, `player_id`, `person_create_id`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 201, 301, 'Good job!', '2024-05-25 10:00:00', '2024-05-25 10:00:00', NULL),
(12, 202, 302, 'Keep it up!', '2024-05-26 14:00:00', '2024-05-26 14:00:00', NULL),
(13, 203, 303, 'Well played!', '2024-05-27 09:00:00', '2024-05-27 09:00:00', NULL),
(14, 204, 304, 'Great effort!', '2024-05-28 15:00:00', '2024-05-28 15:00:00', NULL),
(15, 205, 305, 'Nice performance!', '2024-05-29 11:00:00', '2024-05-29 11:00:00', NULL);

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

--
-- Dumping data for table `FACILITIES`
--

INSERT INTO `FACILITIES` (`id`, `location_id`, `name`, `facility_type`, `facility_status`) VALUES
(1, 1, 'Tennis Court', 'outdoor-court', 'available'),
(2, 2, 'Basketball Court', 'indoor-court', 'reserved'),
(3, 3, 'Football Field', 'outdoor-court', 'maintenance'),
(4, 1, 'Swimming Pool', 'outdoor-court', 'available'),
(5, 2, 'Gymnasium', 'indoor-court', 'available'),
(6, 1, 'Tennis Court', 'outdoor-court', 'available'),
(7, 2, 'Basketball Court', 'indoor-court', 'reserved'),
(8, 3, 'Football Field', 'outdoor-court', 'maintenance'),
(9, 1, 'Swimming Pool', 'outdoor-court', 'available'),
(10, 2, 'Gymnasium', 'indoor-court', 'available'),
(101, 1, 'Tennis Court 1', 'outdoor-court', 'available'),
(102, 2, 'Basketball Court 1', 'outdoor-court', 'available'),
(103, 3, 'Gym Room 1', 'training-court', 'available');

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

--
-- Dumping data for table `LOCATIONS`
--

INSERT INTO `LOCATIONS` (`id`, `name`, `address`, `created_at`, `updated_at`, `deteled_at`) VALUES
(1, 'Sports Center', '123 Main St', '2024-05-25 10:00:00', '2024-05-25 10:00:00', NULL),
(2, 'Community Park', '456 Elm St', '2024-05-26 14:00:00', '2024-05-26 14:00:00', NULL),
(3, 'School Playground', '789 Oak St', '2024-05-27 09:00:00', '2024-05-27 09:00:00', NULL),
(4, 'Recreation Center', '101 Pine St', '2024-05-28 15:00:00', '2024-05-28 15:00:00', NULL),
(5, 'Fitness Club', '111 Maple St', '2024-05-29 11:00:00', '2024-05-29 11:00:00', NULL),
(6, 'Sports Center', '123 Main St', '2024-05-25 10:00:00', '2024-05-25 10:00:00', NULL),
(7, 'Community Park', '456 Elm St', '2024-05-26 14:00:00', '2024-05-26 14:00:00', NULL),
(8, 'School Playground', '789 Oak St', '2024-05-27 09:00:00', '2024-05-27 09:00:00', NULL),
(9, 'Recreation Center', '101 Pine St', '2024-05-28 15:00:00', '2024-05-28 15:00:00', NULL),
(10, 'Fitness Club', '111 Maple St', '2024-05-29 11:00:00', '2024-05-29 11:00:00', NULL);

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

--
-- Dumping data for table `PAYMENTS`
--

INSERT INTO `PAYMENTS` (`id`, `person_id`, `quantity`, `concept`, `date`) VALUES
(11, 201, 50, 'Membership Fee', '2024-05-25 10:00:00'),
(12, 202, 30, 'Training Session', '2024-05-26 14:00:00'),
(13, 203, 25, 'Court Rental', '2024-05-27 09:00:00'),
(14, 204, 40, 'Game Registration', '2024-05-28 15:00:00'),
(15, 205, 20, 'Equipment Purchase', '2024-05-29 11:00:00');

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

--
-- Dumping data for table `PEOPLE`
--

INSERT INTO `PEOPLE` (`id`, `name`, `surnames`, `DNI`, `email`, `password`, `birthdate`, `user_type`, `player_level`, `team_id`) VALUES
(201, 'John', 'Doe', '12345678A', 'john@example.com', 'password', '1990-01-01 00:00:00', 'player', 'professional', NULL),
(202, 'Jane', 'Doe', '87654321B', 'jane@example.com', 'password', '1995-02-01 00:00:00', 'player', 'semi-professional', NULL),
(203, 'Alice', 'Smith', '23456789C', 'alice@example.com', 'password', '1985-03-01 00:00:00', 'player', 'professional', NULL),
(204, 'Bob', 'Johnson', '54321678D', 'bob@example.com', 'password', '1992-04-01 00:00:00', 'player', 'youth', NULL),
(205, 'Eva', 'Brown', '34567890E', 'eva@example.com', 'password', '1998-05-01 00:00:00', 'player', 'junior', NULL),
(301, 'Alice', 'Jones', '12345678A', 'alice@example.com', 'password', '1990-01-01 00:00:00', 'player', 'professional', NULL),
(302, 'Bob', 'Smith', '87654321B', 'bob@example.com', 'password', '1995-02-01 00:00:00', 'player', 'semi-professional', NULL),
(303, 'Charlie', 'Brown', '23456789C', 'charlie@example.com', 'password', '1985-03-01 00:00:00', 'player', 'professional', NULL),
(304, 'David', 'Wilson', '54321678D', 'david@example.com', 'password', '1992-04-01 00:00:00', 'player', 'youth', NULL),
(305, 'Eva', 'Taylor', '34567890E', 'eva@example.com', 'password', '1998-05-01 00:00:00', 'player', 'junior', NULL);

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

--
-- Dumping data for table `TEAMS`
--

INSERT INTO `TEAMS` (`id`, `name`, `location_id`, `category`, `total_score`, `img`, `captain`, `player1`, `player2`, `player3`, `player4`) VALUES
(501, 'Team A', 1, 'junior', 0, 'team_a.png', 201, 202, 203, 204, 205),
(502, 'Team B', 2, 'senior', 0, 'team_b.png', 206, 207, 208, 209, 210),
(503, 'Team C', 3, 'professional', 0, 'team_c.png', 211, 212, 213, 214, 215),
(504, 'Team D', 4, 'junior', 0, 'team_d.png', 216, 217, 218, 219, 220),
(505, 'Team E', 5, 'senior', 0, 'team_e.png', 221, 222, 223, 224, 225);

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
-- Dumping data for table `TOURNAMENTS`
--

INSERT INTO `TOURNAMENTS` (`id`, `location_id`, `name`, `date_start`, `date_end`, `created_at`, `updated_at`, `deleted_at`) VALUES
(101, 1, 'Tennis Tournament', '2024-05-25 10:00:00', '2024-05-25 12:00:00', '2024-05-25 10:00:00', '2024-05-25 10:00:00', NULL),
(102, 2, 'Basketball Tournament', '2024-05-26 14:00:00', '2024-05-26 16:00:00', '2024-05-26 14:00:00', '2024-05-26 14:00:00', NULL),
(103, 3, 'Football Tournament', '2024-05-27 09:00:00', '2024-05-27 11:00:00', '2024-05-27 09:00:00', '2024-05-27 09:00:00', NULL),
(104, 4, 'Swimming Tournament', '2024-05-28 15:00:00', '2024-05-28 17:00:00', '2024-05-28 15:00:00', '2024-05-28 15:00:00', NULL),
(105, 5, 'Athletics Tournament', '2024-05-29 11:00:00', '2024-05-29 13:00:00', '2024-05-29 11:00:00', '2024-05-29 11:00:00', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `COMMENTS`
--
ALTER TABLE `COMMENTS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `FACILITIES`
--
ALTER TABLE `FACILITIES`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `GAMES`
--
ALTER TABLE `GAMES`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `LOCATIONS`
--
ALTER TABLE `LOCATIONS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `PAYMENTS`
--
ALTER TABLE `PAYMENTS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `PEOPLE`
--
ALTER TABLE `PEOPLE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT for table `TEAMS`
--
ALTER TABLE `TEAMS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;

--
-- AUTO_INCREMENT for table `TOURNAMENTS`
--
ALTER TABLE `TOURNAMENTS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BOOKINGS`
--
ALTER TABLE `BOOKINGS`
  ADD CONSTRAINT `FK_facilityB` FOREIGN KEY (`facility_id`) REFERENCES `FACILITIES` (`id`),
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
