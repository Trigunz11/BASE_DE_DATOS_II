CREATE DATABASE MundoZ;
USE MundoZ;

CREATE TABLE Players (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL
);

CREATE TABLE Classes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE Characters (
    id INT PRIMARY KEY AUTO_INCREMENT,
    player_id INT,
    class_id INT,
    name VARCHAR(50) UNIQUE NOT NULL,
    level INT DEFAULT 1,
    experience INT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES Players(id) ON DELETE CASCADE,
    FOREIGN KEY (class_id) REFERENCES Classes(id) ON DELETE SET NULL
);

CREATE TABLE Guilds (
    id INT PRIMARY KEY AUTO_INCREMENT,
    guild_name VARCHAR(50) UNIQUE NOT NULL,
    leader_id INT,
    FOREIGN KEY (leader_id) REFERENCES Characters(id) ON DELETE SET NULL
);

CREATE TABLE Quests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quest_name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    experience_reward INT,
    gold_reward INT
);

CREATE TABLE Items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(50) UNIQUE NOT NULL,
    item_type ENUM('Weapon', 'Armor', 'Potion', 'Misc') NOT NULL,
    effect_description TEXT
);

CREATE TABLE Inventory (
    id INT PRIMARY KEY AUTO_INCREMENT,
    character_id INT,
    item_id INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (character_id) REFERENCES Characters(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES Items(id) ON DELETE CASCADE
);

CREATE TABLE Battles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    character_1_id INT,
    character_2_id INT,
    winner_id INT,
    battle_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (character_1_id) REFERENCES Characters(id) ON DELETE CASCADE,
    FOREIGN KEY (character_2_id) REFERENCES Characters(id) ON DELETE CASCADE,
    FOREIGN KEY (winner_id) REFERENCES Characters(id) ON DELETE CASCADE
);

INSERT INTO Players (username, email, join_date) VALUES
('GuerreroX', 'guerrerox@email.com', '2024-01-10'),
('MagoSupremo', 'magosupremo@email.com', '2024-02-15'),
('AsesinoSombra', 'asesinosombra@email.com', '2024-03-05');

INSERT INTO Classes (class_name, description) VALUES
('Guerrero', 'Especializado en combate cuerpo a cuerpo y resistencia física'),
('Mago', 'Dominio de la magia y ataques a distancia'),
('Asesino', 'Rápido y letal en ataques sorpresa');

INSERT INTO Characters (player_id, class_id, name, level, experience) VALUES
(1, 1, 'Thorax', 10, 5000),
(2, 2, 'Merlinus', 12, 6200),
(3, 3, 'Shadowblade', 15, 8000);

INSERT INTO Guilds (guild_name, leader_id) VALUES
('Héroes de la Luz', 1),
('Magos Eternos', 2),
('Sombras Letales', 3);

INSERT INTO Quests (quest_name, description, experience_reward, gold_reward) VALUES
('Defensa del Castillo', 'Proteger la fortaleza de la invasión enemiga', 1000, 500),
('Recuperar la Espada Perdida', 'Encontrar el arma legendaria en la cueva mística', 1500, 700);

INSERT INTO Items (item_name, item_type, effect_description) VALUES
('Espada del Alba', 'Weapon', 'Aumenta el ataque en 20 puntos'),
('Armadura de Hierro', 'Armor', 'Reduce el daño recibido en 15%'),
('Poción de Curación', 'Potion', 'Restaura 50 puntos de vida');

INSERT INTO Inventory (character_id, item_id, quantity) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 5);

INSERT INTO Battles (character_1_id, character_2_id, winner_id) VALUES
(1, 2, 1),
(2, 3, 3),
(1, 3, 3);
