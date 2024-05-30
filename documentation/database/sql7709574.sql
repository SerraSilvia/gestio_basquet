-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql7.freemysqlhosting.net
-- Temps de generació: 30-05-2024 a les 09:42:45
-- Versió del servidor: 5.5.62-0ubuntu0.14.04.1
-- Versió de PHP: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `sql7709574`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `BOOKINGS`
--

CREATE TABLE `BOOKINGS` (
  `id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `reservation_status` enum('pending','confirmed','cancelled') NOT NULL DEFAULT 'pending',
  `reservation_type` enum('class','game','training') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcant dades de la taula `BOOKINGS`
--

INSERT INTO `BOOKINGS` (`id`, `facility_id`, `person_id`, `date_start`, `date_end`, `reservation_status`, `reservation_type`) VALUES
(54, 102, 202, '2024-05-26 14:00:00', '2024-05-26 16:00:00', 'confirmed', 'game'),
(55, 103, 203, '2024-05-27 09:00:00', '2024-05-27 11:00:00', 'confirmed', 'training'),
(56, 101, 204, '2024-05-28 15:00:00', '2024-05-28 17:00:00', 'pending', 'game'),
(57, 102, 205, '2024-05-29 11:00:00', '2024-05-29 13:00:00', 'pending', 'class'),
(58, 102, 202, '2024-05-26 14:00:00', '2024-05-26 16:00:00', 'pending', 'game'),
(59, 7, 316, '2024-06-07 19:00:00', '2024-06-07 21:00:00', 'pending', 'class'),
(60, 2, 316, '2024-05-29 08:00:00', '2024-05-29 10:00:00', 'pending', 'training'),
(61, 8, 316, '2024-06-20 10:00:00', '2024-06-20 12:00:00', 'pending', 'class'),
(62, 5, 316, '2024-05-30 19:00:00', '2024-05-30 21:00:00', 'pending', 'class'),
(67, 5, 316, '2024-05-30 19:00:00', '2024-05-30 21:00:00', 'pending', 'class'),
(68, 102, 316, '2024-06-07 08:00:00', '2024-06-07 10:00:00', 'pending', 'class'),
(69, 2, 316, '2024-05-30 10:00:00', '2024-05-30 12:00:00', 'pending', 'class'),
(70, 9, 324, '2024-06-13 12:00:00', '2024-06-13 14:00:00', 'pending', 'training'),
(71, 5, 324, '2024-06-13 12:00:00', '2024-06-13 14:00:00', 'pending', 'training'),
(72, 1, 402, '2024-06-07 10:00:00', '2024-06-07 12:00:00', 'pending', 'training');

-- --------------------------------------------------------

--
-- Estructura de la taula `COMMENTS`
--

CREATE TABLE `COMMENTS` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `person_create_id` int(11) NOT NULL,
  `comment` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcant dades de la taula `COMMENTS`
--

INSERT INTO `COMMENTS` (`id`, `player_id`, `person_create_id`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, 202, 302, 'Keep it up!', '2024-05-26 14:00:00', '2024-05-26 14:00:00', NULL),
(13, 203, 303, 'Well played!', '2024-05-27 09:00:00', '2024-05-27 09:00:00', NULL),
(14, 204, 304, 'Great effort!', '2024-05-28 15:00:00', '2024-05-28 15:00:00', NULL),
(15, 205, 305, 'Nice performance!', '2024-05-29 11:00:00', '2024-05-29 11:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de la taula `FACILITIES`
--

CREATE TABLE `FACILITIES` (
  `id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `facility_type` enum('training-court','indoor-court','outdoor-court') NOT NULL DEFAULT 'outdoor-court',
  `facility_status` enum('maintenance','available','reserved') NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcant dades de la taula `FACILITIES`
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
-- Estructura de la taula `GAMES`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcant dades de la taula `GAMES`
--

INSERT INTO `GAMES` (`id`, `id_booking`, `tournament_id`, `team1_id`, `team2_id`, `score_t1`, `score_t2`, `tournament_position`) VALUES
(28, 54, 101, 501, 502, 20, 30, 3);

-- --------------------------------------------------------

--
-- Estructura de la taula `LOCATIONS`
--

CREATE TABLE `LOCATIONS` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcant dades de la taula `LOCATIONS`
--

INSERT INTO `LOCATIONS` (`id`, `name`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Barcelona', '123 Main St', '2024-05-25 10:00:00', '2024-05-25 10:00:00', NULL),
(2, 'Terrassa', '456 Elm St', '2024-05-26 14:00:00', '2024-05-26 14:00:00', NULL),
(3, 'Sabadell', '789 Main St', '2024-05-25 10:00:00', '2024-05-28 10:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de la taula `PAYMENTS`
--

CREATE TABLE `PAYMENTS` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `concept` varchar(250) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcant dades de la taula `PAYMENTS`
--

INSERT INTO `PAYMENTS` (`id`, `person_id`, `quantity`, `concept`, `date`) VALUES
(11, 201, 50, 'Membership Fee', '2024-05-25 10:00:00'),
(12, 202, 30, 'Training Session', '2024-05-26 14:00:00'),
(13, 203, 25, 'Court Rental', '2024-05-27 09:00:00'),
(14, 204, 40, 'Game Registration', '2024-05-28 15:00:00');

-- --------------------------------------------------------

--
-- Estructura de la taula `PEOPLE`
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
  `team_id` int(11) DEFAULT NULL,
  `profile_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcant dades de la taula `PEOPLE`
--

INSERT INTO `PEOPLE` (`id`, `name`, `surnames`, `DNI`, `email`, `password`, `birthdate`, `user_type`, `player_level`, `team_id`, `profile_img`) VALUES
(201, 'Johnny2', 'Doe', '12345678A', 'john@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '1998-05-01 00:00:00', 'player', 'professional', 501, 'avatar4.png'),
(202, 'Jane', 'Doe', '87654321B', 'jane@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '1995-02-01 00:00:00', 'player', 'semi-professional', NULL, NULL),
(203, 'Alice', 'Smith', '23456789C', 'alice@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '1985-03-01 00:00:00', 'player', 'professional', NULL, NULL),
(204, 'Bob', 'Johnson', '54321678D', 'bob@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '1992-04-01 00:00:00', 'player', 'youth', NULL, NULL),
(205, 'Eva', 'Brown', '34567890E', 'eva@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '1998-05-01 00:00:00', 'player', 'junior', NULL, NULL),
(301, 'Alice', 'Jones', '12345678A', 'alice@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '1990-01-01 00:00:00', 'player', 'professional', NULL, NULL),
(302, 'Bob', 'Smith', '87654321B', 'bob@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '1995-02-01 00:00:00', 'player', 'semi-professional', NULL, NULL),
(303, 'Charlie', 'Brown', '23456789C', 'charlie@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '1985-03-01 00:00:00', 'player', 'professional', NULL, NULL),
(304, 'David', 'Wilson', '54321678D', 'david@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '1992-04-01 00:00:00', 'player', 'youth', NULL, NULL),
(305, 'Eva', 'Taylor', '34567890E', 'eva@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '1998-05-01 00:00:00', 'player', 'junior', NULL, NULL),
(315, 'admin', 'admin', '00000000A', 'admin@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2002-07-10 10:22:00', 'admin', '', NULL, NULL),
(316, 'David', 'Marin', '12345467Q', 'davidmarin@itb.cat', '1f3e11927c6c05b5344d1a89eb56ee27', '1992-07-17 08:48:00', 'admin', '', NULL, NULL),
(320, 'Anna', 'Cano', '12121212A', 'anna@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2002-08-23 12:12:00', 'admin', '', NULL, NULL),
(323, 'Pepe', 'Pepito', '12121212S', 'pepe@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2002-12-12 12:12:00', 'player', '', NULL, NULL),
(324, 'Oscar', 'Serrano', '56565656L', 'oscar.serrano.7e5@itb.cat', '1f3e11927c6c05b5344d1a89eb56ee27', '2024-04-17 10:41:00', 'player', 'junior', 526, 'avatar3.png'),
(327, 'Pep', 'Guardiola', '12121212A', 'pep@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '1988-12-12 12:12:00', 'captain', '', NULL, NULL),
(400, 'Manolo', 'Lopez', '12121212A', 'manolo@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2024-05-08 00:00:00', 'player', 'semi-professional', 518, NULL),
(401, 'Pepe', 'Pepo', '34343425E', 'pepe@itb.cat', '1f3e11927c6c05b5344d1a89eb56ee27', '2003-03-07 01:17:00', 'player', '', NULL, NULL),
(402, 'Daniel', 'Soley', '10987723M', 'daniel@itb.cat', '1f3e11927c6c05b5344d1a89eb56ee27', '2024-05-04 09:31:00', 'player', 'semi-professional', 526, 'avatar1.png'),
(403, 'silvia', 'serra', '12345678K', 'silvia@itb.cat', '202cb962ac59075b964b07152d234b70', '1985-12-01 09:52:00', 'player', 'semi-professional', 501, 'avatar6.png'),
(404, 'Doe', 'Doe', '87654321A', 'doe@itb.cat', '202cb962ac59075b964b07152d234b70', '2024-05-01 09:59:00', 'player', '', NULL, NULL),
(405, 'Luffy', 'LO', '22323232J', 'luffy@itb.cat', '1f3e11927c6c05b5344d1a89eb56ee27', '2000-03-10 10:06:00', 'player', 'professional', 544, 'avatar6.png'),
(406, 'Miguel', 'Martin', '20209383T', 'miguel@itb.cat', '1f3e11927c6c05b5344d1a89eb56ee27', '1992-03-06 10:15:00', 'player', 'junior', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de la taula `TEAMS`
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
  `player4` int(30) NOT NULL,
  `tournament_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcant dades de la taula `TEAMS`
--

INSERT INTO `TEAMS` (`id`, `name`, `location_id`, `category`, `total_score`, `img`, `captain`, `player1`, `player2`, `player3`, `player4`, `tournament_id`) VALUES
(501, 'Team A', 1, 'junior', 0, 'team_a.png', 201, 202, 203, 204, 205, 101),
(502, 'Team B', 2, 'senior', 0, 'team_b.png', 206, 207, 208, 209, 210, 101),
(503, 'Team C', 3, 'professional', 0, 'team_c.png', 211, 212, 213, 214, 215, 101),
(504, 'Team D', 1, 'junior', 0, 'team_d.png', 216, 217, 218, 219, 220, 101),
(505, 'Team E', 2, 'senior', 0, 'team_e.png', 221, 222, 223, 224, 225, 101),
(512, 'Pepito', 1, 'senior', 0, 'img_prueba.img', 219, 201, 201, 201, 201, 101),
(515, 'Team F', 2, 'junior', 0, 'team_f.png', 220, 0, 0, 0, 0, 101),
(518, 'Nombre_del_equipo', 1, 'senior', 0, 'prueba.img', 400, 0, 0, 0, 0, 101),
(522, 'Nombre del equipo', 1, 'senior', 0, 'image.png', 123, 0, 0, 0, 0, NULL),
(523, 'Deivid Team', 1, 'junior', 0, 'image.png', 316, 0, 1, 0, 0, 118),
(525, 'The Best', 1, 'senior', 0, 'imagen_de_prueba.jpg', 323, 0, 0, 0, 0, NULL),
(526, 'Oscar Team', 1, 'senior', 0, 'image.png', 324, 0, 401, 0, 0, NULL),
(544, 'Luffy && Friends', 2, 'junior', 0, 'image.png', 405, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de la taula `TOURNAMENTS`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcant dades de la taula `TOURNAMENTS`
--

INSERT INTO `TOURNAMENTS` (`id`, `location_id`, `name`, `date_start`, `date_end`, `created_at`, `updated_at`, `deleted_at`) VALUES
(101, 1, 'Badbinton Tournament', '2024-07-29 10:00:00', '2024-07-31 12:00:00', '2024-05-25 10:00:00', '2024-05-25 10:00:00', NULL),
(102, 2, 'Basketball Tournament', '2024-07-26 14:00:00', '2024-07-30 16:00:00', '2024-05-26 14:00:00', '2024-05-26 14:00:00', NULL),
(103, 3, 'Football Tournament', '2024-05-27 09:00:00', '2024-05-27 11:00:00', '2024-05-27 09:00:00', '2024-05-27 09:00:00', NULL),
(104, 3, 'Tennis Tournament', '2024-05-28 15:00:00', '2024-05-25 18:00:00', '2024-05-25 10:00:00', '2024-05-28 10:00:00', '0000-00-00 00:00:00'),
(115, 1, 'Torneo de Primavera', '2024-03-01 10:00:00', '2024-03-10 18:00:00', '2024-01-15 12:00:00', '2024-02-01 14:30:00', '0000-00-00 00:00:00'),
(116, 3, 'MI primer torneo', '2024-05-30 15:44:00', '2024-06-09 15:44:00', '2024-05-29 13:44:14', '2024-05-29 13:44:14', NULL),
(118, 3, 'Mi torneo abierto', '2024-07-12 12:00:00', '2024-08-12 19:00:00', '2024-05-29 15:53:45', '2024-05-29 15:53:45', NULL),
(121, 1, 'Super super torneo', '2024-06-30 12:12:00', '2024-07-10 12:12:00', '2024-05-30 07:58:33', '2024-05-30 07:58:33', NULL),
(122, 2, 'Pepito tournament', '2024-06-30 12:12:00', '2024-07-30 12:12:00', '2024-05-30 08:19:04', '2024-05-30 08:19:04', NULL);

--
-- Indexos per taules bolcades
--

--
-- Index de la taula `BOOKINGS`
--
ALTER TABLE `BOOKINGS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_facilityB` (`facility_id`),
  ADD KEY `FK_personB` (`person_id`);

--
-- Index de la taula `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_personP` (`player_id`),
  ADD KEY `FK_authorP` (`person_create_id`);

--
-- Index de la taula `FACILITIES`
--
ALTER TABLE `FACILITIES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_locationF` (`location_id`);

--
-- Index de la taula `GAMES`
--
ALTER TABLE `GAMES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tournament` (`tournament_id`),
  ADD KEY `FK_team1` (`team1_id`),
  ADD KEY `FK_team2` (`team2_id`),
  ADD KEY `FK_bookingG` (`id_booking`);

--
-- Index de la taula `LOCATIONS`
--
ALTER TABLE `LOCATIONS`
  ADD PRIMARY KEY (`id`);

--
-- Index de la taula `PAYMENTS`
--
ALTER TABLE `PAYMENTS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `FK_person` (`person_id`);

--
-- Index de la taula `PEOPLE`
--
ALTER TABLE `PEOPLE`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `FK_teamP` (`team_id`);

--
-- Index de la taula `TEAMS`
--
ALTER TABLE `TEAMS`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `captain` (`captain`),
  ADD KEY `FK_locationT` (`location_id`),
  ADD KEY `FK_tournamentT` (`tournament_id`);

--
-- Index de la taula `TOURNAMENTS`
--
ALTER TABLE `TOURNAMENTS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_location` (`location_id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `BOOKINGS`
--
ALTER TABLE `BOOKINGS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT per la taula `COMMENTS`
--
ALTER TABLE `COMMENTS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT per la taula `FACILITIES`
--
ALTER TABLE `FACILITIES`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT per la taula `GAMES`
--
ALTER TABLE `GAMES`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT per la taula `LOCATIONS`
--
ALTER TABLE `LOCATIONS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT per la taula `PAYMENTS`
--
ALTER TABLE `PAYMENTS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT per la taula `PEOPLE`
--
ALTER TABLE `PEOPLE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;
--
-- AUTO_INCREMENT per la taula `TEAMS`
--
ALTER TABLE `TEAMS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=546;
--
-- AUTO_INCREMENT per la taula `TOURNAMENTS`
--
ALTER TABLE `TOURNAMENTS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- Restriccions per taules bolcades
--

--
-- Restriccions per la taula `BOOKINGS`
--
ALTER TABLE `BOOKINGS`
  ADD CONSTRAINT `FK_facilityB` FOREIGN KEY (`facility_id`) REFERENCES `FACILITIES` (`id`),
  ADD CONSTRAINT `FK_personB` FOREIGN KEY (`person_id`) REFERENCES `PEOPLE` (`id`);

--
-- Restriccions per la taula `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD CONSTRAINT `FK_authorP` FOREIGN KEY (`person_create_id`) REFERENCES `PEOPLE` (`id`),
  ADD CONSTRAINT `FK_personP` FOREIGN KEY (`player_id`) REFERENCES `PEOPLE` (`id`);

--
-- Restriccions per la taula `FACILITIES`
--
ALTER TABLE `FACILITIES`
  ADD CONSTRAINT `FK_locationF` FOREIGN KEY (`location_id`) REFERENCES `LOCATIONS` (`id`);

--
-- Restriccions per la taula `GAMES`
--
ALTER TABLE `GAMES`
  ADD CONSTRAINT `FK_bookingG` FOREIGN KEY (`id_booking`) REFERENCES `BOOKINGS` (`id`),
  ADD CONSTRAINT `FK_team1` FOREIGN KEY (`team1_id`) REFERENCES `TEAMS` (`id`),
  ADD CONSTRAINT `FK_team2` FOREIGN KEY (`team2_id`) REFERENCES `TEAMS` (`id`),
  ADD CONSTRAINT `FK_tournament` FOREIGN KEY (`tournament_id`) REFERENCES `TOURNAMENTS` (`id`);

--
-- Restriccions per la taula `PAYMENTS`
--
ALTER TABLE `PAYMENTS`
  ADD CONSTRAINT `FK_person` FOREIGN KEY (`person_id`) REFERENCES `PEOPLE` (`id`);

--
-- Restriccions per la taula `PEOPLE`
--
ALTER TABLE `PEOPLE`
  ADD CONSTRAINT `FK_teamP` FOREIGN KEY (`team_id`) REFERENCES `TEAMS` (`id`);

--
-- Restriccions per la taula `TEAMS`
--
ALTER TABLE `TEAMS`
  ADD CONSTRAINT `FK_locationT` FOREIGN KEY (`location_id`) REFERENCES `LOCATIONS` (`id`),
  ADD CONSTRAINT `FK_tournamentT` FOREIGN KEY (`tournament_id`) REFERENCES `TOURNAMENTS` (`id`);

--
-- Restriccions per la taula `TOURNAMENTS`
--
ALTER TABLE `TOURNAMENTS`
  ADD CONSTRAINT `FK_location` FOREIGN KEY (`location_id`) REFERENCES `LOCATIONS` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
