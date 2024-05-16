-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS torneo_db;
USE torneo_db;
 
-- Creación de la tabla SEUS
CREATE TABLE SEUS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    direccio VARCHAR(250),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    deleted_at DATETIME
);

-- Creación de la tabla TORNEJOS
CREATE TABLE TORNEJOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    seu_id INT NOT NULL,
    nom VARCHAR(250) NOT NULL,
    data_inici DATETIME,
    data_fi DATETIME,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    deleted_at DATETIME,
    FOREIGN KEY (seu_id) REFERENCES SEUS(id)
);

-- Creación de la tabla EQUIPS
CREATE TABLE EQUIPS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    sede_id INT NOT NULL,
    categoria ENUM('juvenil', 'senior', 'profesional') NOT NULL DEFAULT 'juvenil',
    FOREIGN KEY (sede_id) REFERENCES SEUS(id)
);

-- Creación de la tabla PERSONES
CREATE TABLE PERSONES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(200) NOT NULL,
    DNI VARCHAR(9) NOT NULL,
    email VARCHAR(250) NOT NULL,
    contrasenya VARCHAR(250) NOT NULL,
    data_naixement DATETIME,
    equip_id INT NOT NULL,
    FOREIGN KEY (equip_id) REFERENCES EQUIPS(id)
);

-- Creación de la tabla PARTITS
CREATE TABLE PARTITS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_reserva INT NOT NULL,
    torneig_id INT NOT NULL,
    equip1_id INT NOT NULL,
    equip2_id INT NOT NULL,
    puntuacio_e1 INT,
    puntuacio_e2 INT,
    FOREIGN KEY (torneig_id) REFERENCES TORNEJOS(id),
    FOREIGN KEY (equip1_id) REFERENCES EQUIPS(id),
    FOREIGN KEY (equip2_id) REFERENCES EQUIPS(id)
);

-- Creación de la tabla INSTALACIONS
CREATE TABLE INSTALACIONS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sede_id INT NOT NULL,
    nom VARCHAR(150) NOT NULL,
    tipus_instalacio ENUM('pista entrenament', 'pista interior', 'pista exterior') NOT NULL DEFAULT 'pista entrenament',
    estat_instalacio ENUM('manteniment', 'disponible', 'reservat') NOT NULL DEFAULT 'disponible',
    FOREIGN KEY (sede_id) REFERENCES SEUS(id)
);

-- Creación de la tabla RESERVES
CREATE TABLE RESERVES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    instalacio_id INT NOT NULL,
    persona_id INT NOT NULL,
    data_reserva DATETIME NOT NULL,
    data_fi DATETIME NOT NULL,
    estat_reserva ENUM('pendent', 'confirmat', 'cancelat') NOT NULL DEFAULT 'pendent',
    tipus_reserva ENUM('classe', 'partit', 'entrenament'),
    FOREIGN KEY (instalacio_id) REFERENCES INSTALACIONS(id),
    FOREIGN KEY (persona_id) REFERENCES PERSONES(id)
);

-- Creación de la tabla PAGAMENTS
CREATE TABLE PAGAMENTS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT NOT NULL,
    quantia DOUBLE NOT NULL,
    concepte VARCHAR(250),
    FOREIGN KEY (persona_id) REFERENCES PERSONES(id)
);

-- Creación de la tabla PUNTUA
CREATE TABLE PUNTUA (
    id INT PRIMARY KEY AUTO_INCREMENT,
    torneig_id INT NOT NULL,
    equip_id INT NOT NULL,
    partit_id INT NOT NULL,
    puntuacio INT,
    FOREIGN KEY (torneig_id) REFERENCES TORNEJOS(id),
    FOREIGN KEY (equip_id) REFERENCES EQUIPS(id),
    FOREIGN KEY (partit_id) REFERENCES PARTITS(id)
);

-- Creación de la tabla JUGADOR
CREATE TABLE JUGADOR (
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT NOT NULL,
    nivell ENUM('prebenjami', 'benjami', 'infantil', 'cadet', 'amateur', 'senior') NOT NULL DEFAULT 'cadet',
    posicio ENUM('base', 'escolta', 'alero', 'pivot') NOT NULL DEFAULT 'base',
    categoria ENUM('juvenil', 'senior', 'professional') NOT NULL DEFAULT 'juvenil',
    FOREIGN KEY (persona_id) REFERENCES PERSONES(id)
);

-- Creación de la tabla STAFF
CREATE TABLE STAFF (
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT NOT NULL,
    carrec ENUM('treballador', 'capita', 'entrenador', 'jugador') NOT NULL DEFAULT 'jugador',
    FOREIGN KEY (persona_id) REFERENCES PERSONES(id)
);

-- Creación de la tabla COMENTARIS
CREATE TABLE COMENTARIS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    jugador_id INT NOT NULL,
    persona_creat_id INT NOT NULL,
    comentari VARCHAR(250) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    deleted_at DATETIME,
    FOREIGN KEY (jugador_id) REFERENCES JUGADOR(id),
    FOREIGN KEY (persona_creat_id) REFERENCES PERSONES(id)
);


/*Inserts de prova*/
-- Insertando en la tabla SEUS
INSERT INTO SEUS (nom, direccio, created_at, updated_at) VALUES 
('Seu Central', 'Carrer Major, 1', NOW(), NOW()),
('Seu Nord', 'Carrer Nord, 23', NOW(), NOW()),
('Seu Sud', 'Carrer Sud, 45', NOW(), NOW()),
('Seu Est', 'Carrer Est, 67', NOW(), NOW()),
('Seu Oest', 'Carrer Oest, 89', NOW(), NOW());

-- Insertando en la tabla TORNEJOS
INSERT INTO TORNEJOS (seu_id, nom, data_inici, data_fi, created_at, updated_at) VALUES 
(1, 'Torneig Primavera', '2024-03-01 09:00:00', '2024-03-10 18:00:00', NOW(), NOW()),
(2, 'Torneig Estiu', '2024-06-15 09:00:00', '2024-06-25 18:00:00', NOW(), NOW()),
(3, 'Torneig Tardor', '2024-09-01 09:00:00', '2024-09-10 18:00:00', NOW(), NOW()),
(4, 'Torneig Hivern', '2024-12-01 09:00:00', '2024-12-10 18:00:00', NOW(), NOW()),
(5, 'Torneig Nadal', '2024-12-20 09:00:00', '2024-12-30 18:00:00', NOW(), NOW());

-- Insertando en la tabla EQUIPS
INSERT INTO EQUIPS (nom, sede_id, categoria) VALUES 
('Equip A', 1, 'juvenil'),
('Equip B', 2, 'senior'),
('Equip C', 3, 'professional'),
('Equip D', 4, 'juvenil'),
('Equip E', 5, 'senior');

-- Insertando en la tabla PERSONES
INSERT INTO PERSONES (nom, cognoms, DNI, email, contrasenya, data_naixement, equip_id) VALUES 
('Joan', 'Garcia', '12345678A', 'joan@example.com', 'password123', '1990-01-01', 1),
('Maria', 'Lopez', '87654321B', 'maria@example.com', 'password123', '1985-02-02', 2),
('Carlos', 'Martinez', '11223344C', 'carlos@example.com', 'password123', '1995-03-03', 3),
('Ana', 'Sanchez', '44332211D', 'ana@example.com', 'password123', '2000-04-04', 4),
('Luis', 'Rodriguez', '66778899E', 'luis@example.com', 'password123', '1998-05-05', 5);

-- Insertando en la tabla PARTITS
INSERT INTO PARTITS (id_reserva, torneig_id, equip1_id, equip2_id, puntuacio_e1, puntuacio_e2) VALUES 
(1, 1, 1, 2, 30, 25),
(2, 2, 3, 4, 20, 20),
(3, 3, 1, 3, 25, 30),
(4, 4, 2, 4, 15, 10),
(5, 5, 3, 5, 35, 30);

-- Insertando en la tabla INSTALACIONS
INSERT INTO INSTALACIONS (sede_id, nom, tipus_instalacio, estat_instalacio) VALUES 
(1, 'Pista Central', 'pista entrenament', 'disponible'),
(2, 'Pista Nord', 'pista interior', 'manteniment'),
(3, 'Pista Sud', 'pista exterior', 'reservat'),
(4, 'Pista Est', 'pista entrenament', 'disponible'),
(5, 'Pista Oest', 'pista interior', 'disponible');

-- Insertando en la tabla RESERVES
INSERT INTO RESERVES (instalacio_id, persona_id, data_reserva, data_fi, estat_reserva, tipus_reserva) VALUES 
(1, 1, '2024-05-15 10:00:00', '2024-05-15 12:00:00', 'pendent', 'classe'),
(2, 2, '2024-05-16 10:00:00', '2024-05-16 12:00:00', 'confirmat', 'partit'),
(3, 3, '2024-05-17 10:00:00', '2024-05-17 12:00:00', 'cancelat', 'entrenament'),
(4, 4, '2024-05-18 10:00:00', '2024-05-18 12:00:00', 'pendent', 'classe'),
(5, 5, '2024-05-19 10:00:00', '2024-05-19 12:00:00', 'confirmat', 'partit');

-- Insertando en la tabla PAGAMENTS
INSERT INTO PAGAMENTS (persona_id, quantia, concepte) VALUES 
(1, 50.00, 'Inscripción torneo primavera'),
(2, 60.00, 'Inscripción torneo estiu'),
(3, 70.00, 'Inscripción torneo tardor'),
(4, 80.00, 'Inscripción torneo hivern'),
(5, 90.00, 'Inscripción torneo nadal');

-- Insertando en la tabla PUNTUA
INSERT INTO PUNTUA (torneig_id, equip_id, partit_id, puntuacio) VALUES 
(1, 1, 1, 30),
(2, 2, 2, 20),
(3, 3, 3, 25),
(4, 4, 4, 15),
(5, 5, 5, 35);

-- Insertando en la tabla JUGADOR
INSERT INTO JUGADOR (persona_id, nivell, posicio, categoria) VALUES 
(1, 'cadet', 'base', 'juvenil'),
(2, 'senior', 'escolta', 'senior'),
(3, 'amateur', 'alero', 'professional'),
(4, 'cadet', 'pivot', 'juvenil'),
(5, 'senior', 'base', 'senior');

-- Insertando en la tabla STAFF
INSERT INTO STAFF (persona_id, carrec) VALUES 
(1, 'administrador'),
(2, 'neteja'),
(3, 'entrenador'),
(4, 'conserge'),
(5, 'entrenador');

-- Insertando en la tabla COMENTARIS
INSERT INTO COMENTARIS (jugador_id, persona_creat_id, comentari, created_at, updated_at) VALUES 
(1, 2, 'Gran actuació al partit!', NOW(), NOW()),
(2, 3, 'Bon entrenament!', NOW(), NOW()),
(3, 4, 'Esforç excel·lent!', NOW(), NOW()),
(4, 5, 'Necessita millorar en defensa.', NOW(), NOW()),
(5, 1, 'Molt bona tècnica.', NOW(), NOW());
