CREATE DATABASE sports_management;
USE sports_management;

-- Tabla LOCATIONS
CREATE TABLE LOCATIONS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(250),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    deleted_at DATETIME
);

-- Tabla TOURNAMENTS
CREATE TABLE TOURNAMENTS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location_id INT NOT NULL,
    name VARCHAR(250) NOT NULL,
    date_start DATETIME,
    date_end DATETIME,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    deleted_at DATETIME,
    FOREIGN KEY (location_id) REFERENCES LOCATIONS(id)
);

-- Tabla TEAMS
CREATE TABLE TEAMS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location_id INT NOT NULL,
    category ENUM('junior', 'senior', 'professional') NOT NULL DEFAULT 'junior',
    FOREIGN KEY (location_id) REFERENCES LOCATIONS(id)
);

-- Tabla GAMES
CREATE TABLE GAMES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_booking INT NOT NULL,
    tournament_id INT NOT NULL,
    team1_id INT NOT NULL,
    team2_id INT NOT NULL,
    score_t1 INT,
    score_t2 INT,
    FOREIGN KEY (tournament_id) REFERENCES TOURNAMENTS(id),
    FOREIGN KEY (team1_id) REFERENCES TEAMS(id),
    FOREIGN KEY (team2_id) REFERENCES TEAMS(id)
);

-- Tabla PEOPLE
CREATE TABLE PEOPLE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surnames VARCHAR(200) NOT NULL,
    DNI VARCHAR(9) NOT NULL,
    email VARCHAR(250) NOT NULL,
    password VARCHAR(250) NOT NULL,
    birthday DATETIME
);

-- Tabla SCORES
CREATE TABLE SCORES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_id INT NOT NULL,
    team_id INT NOT NULL,
    game_id INT NOT NULL,
    score INT,
    FOREIGN KEY (tournament_id) REFERENCES TOURNAMENTS(id),
    FOREIGN KEY (team_id) REFERENCES TEAMS(id),
    FOREIGN KEY (game_id) REFERENCES GAMES(id)
);

-- Tabla FACILITIES
CREATE TABLE FACILITIES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    facility_type ENUM('training-court', 'indoor-court', 'outdoor-court') NOT NULL DEFAULT 'training-court',
    facility_status ENUM('maintenance', 'available', 'reserved') NOT NULL DEFAULT 'available',
    FOREIGN KEY (location_id) REFERENCES LOCATIONS(id)
);

-- Tabla BOOKINGS
CREATE TABLE BOOKINGS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    facility_id INT NOT NULL,
    person_id INT NOT NULL,
    date_start DATETIME NOT NULL,
    date_end DATETIME NOT NULL,
    reservation_status ENUM('pending', 'confirmed', 'cancelled') NOT NULL DEFAULT 'pending',
    reservation_type ENUM('class', 'game', 'training'),
    FOREIGN KEY (facility_id) REFERENCES FACILITIES(id),
    FOREIGN KEY (person_id) REFERENCES PEOPLE(id)
);

-- Tabla PAYMENTS
CREATE TABLE PAYMENTS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    concept VARCHAR(250),
    FOREIGN KEY (person_id) REFERENCES PEOPLE(id)
);

-- Tabla COMMENTS
CREATE TABLE COMMENTS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    person_create_id INT NOT NULL,
    comment VARCHAR(250) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    deleted_at DATETIME,
    FOREIGN KEY (player_id) REFERENCES PEOPLE(id),
    FOREIGN KEY (person_create_id) REFERENCES PEOPLE(id)
);

-- Tabla PLAYERS
CREATE TABLE PLAYERS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL,
    level ENUM('junior', 'youth', 'amateur', 'semi-professional', 'professional') NOT NULL DEFAULT 'junior',
    position ENUM('point-guard', 'shooting-guard', 'small-forward', 'center') NOT NULL DEFAULT 'point-guard',
    category ENUM('junior', 'senior', 'professional') NOT NULL DEFAULT 'junior',
    team_id INT NOT NULL,
    FOREIGN KEY (person_id) REFERENCES PEOPLE(id),
    FOREIGN KEY (team_id) REFERENCES TEAMS(id)
);

-- Tabla STAFF
CREATE TABLE STAFF (
    id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL,
    job ENUM('employee', 'captain', 'coach', 'player') NOT NULL DEFAULT 'player',
    hire_date DATETIME NOT NULL,
    FOREIGN KEY (person_id) REFERENCES PEOPLE(id)
);

-- Insert en LOCATIONS
INSERT INTO LOCATIONS (name, address, created_at, updated_at) VALUES
('Central Park', '123 Main St', NOW(), NOW()),
('Downtown Arena', '456 Elm St', NOW(), NOW()),
('Westside Court', '789 Oak St', NOW(), NOW()),
('Northside Field', '101 Pine St', NOW(), NOW()),
('Eastside Gym', '202 Maple St', NOW(), NOW());

-- Insert en TOURNAMENTS
INSERT INTO TOURNAMENTS (location_id, name, date_start, date_end, created_at, updated_at) VALUES
(1, 'Spring Tournament', '2024-06-01 09:00:00', '2024-06-07 18:00:00', NOW(), NOW()),
(2, 'Summer Cup', '2024-07-01 10:00:00', '2024-07-05 20:00:00', NOW(), NOW()),
(3, 'Fall Challenge', '2024-09-01 11:00:00', '2024-09-07 19:00:00', NOW(), NOW()),
(4, 'Winter Games', '2024-12-01 12:00:00', '2024-12-05 21:00:00', NOW(), NOW()),
(5, 'Year-End Tournament', '2024-12-26 13:00:00', '2024-12-31 22:00:00', NOW(), NOW());

-- Insert en TEAMS
INSERT INTO TEAMS (name, location_id, category) VALUES
('Team Alpha', 1, 'junior'),
('Team Beta', 2, 'senior'),
('Team Gamma', 3, 'professional'),
('Team Delta', 4, 'junior'),
('Team Epsilon', 5, 'senior');

-- Insert en PEOPLE
INSERT INTO PEOPLE (name, surnames, DNI, email, password, birthday) VALUES
('John Doe', 'Doe', '12345678A', 'john.doe@example.com', 'password123', '2000-01-01'),
('Jane Smith', 'Smith', '87654321B', 'jane.smith@example.com', 'password123', '1990-02-02'),
('Alice Johnson', 'Johnson', '11223344C', 'alice.johnson@example.com', 'password123', '1985-03-03'),
('Bob Brown', 'Brown', '44332211D', 'bob.brown@example.com', 'password123', '1975-04-04'),
('Charlie Black', 'Black', '99887766E', 'charlie.black@example.com', 'password123', '1965-05-05');

-- Insert en GAMES
INSERT INTO GAMES (id_booking, tournament_id, team1_id, team2_id, score_t1, score_t2) VALUES
(1, 1, 1, 2, 50, 45),
(2, 2, 3, 4, 60, 55),
(3, 3, 2, 5, 70, 65),
(4, 4, 1, 3, 80, 75),
(5, 5, 4, 5, 90, 85);