CREATE DATABASE empresa_xyz;
USE empresa_xyz;

CREATE TABLE perfiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_vigencia DATE,
    descripcion TEXT,
    encargado VARCHAR(100)
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo',
    contraseña VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    salario DECIMAL(10,2),
    fecha_ingreso DATE,
    perfil_id INT,
    FOREIGN KEY (perfil_id) REFERENCES perfiles(id) ON DELETE SET NULL
);


CREATE TABLE login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    exito BOOLEAN,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE actividades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    fecha DATE,
    puntos_asignados INT
);

CREATE TABLE fidelizacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    actividad_id INT,
    puntos INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (actividad_id) REFERENCES actividades(id) ON DELETE CASCADE
);


INSERT INTO perfiles (nombre, fecha_vigencia, descripcion, encargado) VALUES
('Administrador', '2002-05-17', 'Administra el sistema', 'Gerente General'),
('Empleado', '2011-09-29', 'Trabajador estándar', 'RRHH'),
('Supervisor', '2020-12-03', 'Supervisa actividades', 'Jefe de Operaciones'),
('Soporte Técnico', '2015-07-21', 'Asistencia TI', 'TI Manager'),
('Marketing', '2018-03-15', 'Gestión de redes sociales', 'Director de Marketing'),
('Ventas', '2009-10-08', 'Atención al cliente', 'Jefe de Ventas'),
('Logística', '2016-06-19', 'Supervisa envíos', 'Gerente Logística'),
('Finanzas', '2023-08-25', 'Manejo de presupuesto', 'Director Financiero'),
('Recursos Humanos', '2007-11-11', 'Manejo de personal', 'Jefe de RRHH'),
('Desarrollador', '2025-02-05', 'Desarrollador de software', 'Líder de Proyecto');

INSERT INTO usuarios (nombre, apellido, estado, contraseña, cargo, salario, fecha_ingreso, perfil_id) VALUES
('Juan', 'Perez', 'Activo', SHA2('pass5124',256), 'Gerente', 3572.80, '2005-07-13', 1),
('Maria', 'Gomez', 'Activo', SHA2('pass2371',256), 'Empleado', 1925.50, '2017-04-05', 2),
('Carlos', 'Lopez', 'Inactivo', SHA2('pass9483',256), 'Supervisor', 2784.10, '2011-10-28', 3),
('Ana', 'Torres', 'Activo', SHA2('pass5632',256), 'Soporte Técnico', 2156.75, '2009-09-07', 4),
('Luis', 'Ramirez', 'Activo', SHA2('pass4325',256), 'Marketing', 2469.00, '2021-12-30', 5),
('Paula', 'Fernandez', 'Inactivo', SHA2('pass6790',256), 'Ventas', 2265.20, '2015-03-18', 6),
('Hector', 'Martinez', 'Activo', SHA2('pass7203',256), 'Logística', 2897.35, '2020-05-23', 7),
('Laura', 'Diaz', 'Activo', SHA2('pass1284',256), 'Finanzas', 3987.80, '2001-02-14', 8),
('Pedro', 'Ortiz', 'Activo', SHA2('pass9945',256), 'Recursos Humanos', 2750.00, '2008-08-21', 9),
('Sofia', 'Reyes', 'Activo', SHA2('pass3356',256), 'Desarrollador', 3678.40, '2014-11-04', 10);

INSERT INTO actividades (nombre, descripcion, fecha, puntos_asignados) VALUES
('Taller de Liderazgo', 'Capacitación para gerentes', '2006-06-17', 45),
('Día de Integración', 'Jornada recreativa con juegos', '2012-03-23', 55),
('Capacitación Técnica', 'Curso avanzado en herramientas digitales', '2020-07-09', 30),
('Torneo Deportivo', 'Competencia de fútbol y voleibol', '2017-09-15', 60),
('Voluntariado', 'Ayuda comunitaria organizada por la empresa', '2013-12-05', 75),
('Curso de Python', 'Introducción a la programación en Python', '2018-04-22', 40),
('Hackathon Empresarial', 'Competencia de desarrollo de software', '2025-02-01', 70),
('Sesión de Innovación', 'Día de brainstorming para proyectos', '2003-11-19', 35),
('Competencia de Ventas', 'Premio a los mejores vendedores', '2009-08-07', 65),
('Día de la Familia', 'Evento social para colaboradores y familiares', '2016-01-29', 50);

DELIMITER //

CREATE PROCEDURE insertar_registros_login()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE usuario_random INT;
    DECLARE fecha_random DATETIME;
    DECLARE exito_random BOOLEAN;

    WHILE i <= 100 DO
        SET usuario_random = FLOOR(1 + (RAND() * 20)); -- Usuario aleatorio entre 1 y 20
        SET fecha_random = STR_TO_DATE(
            CONCAT(
                FLOOR(2000 + (RAND() * 26)), '-', -- Año entre 2000 y 2025
                LPAD(FLOOR(1 + (RAND() * 12)), 2, '0'), '-',  -- Mes entre 1 y 12
                LPAD(FLOOR(1 + (RAND() * 28)), 2, '0'), ' ',  -- Día entre 1 y 28
                LPAD(FLOOR(RAND() * 24), 2, '0'), ':',  -- Hora entre 0 y 23
                LPAD(FLOOR(RAND() * 60), 2, '0'), ':',  -- Minuto entre 0 y 59
                LPAD(FLOOR(RAND() * 60), 2, '0')   -- Segundo entre 0 y 59
            ), 
            '%Y-%m-%d %H:%i:%s'
        );
        SET exito_random = FLOOR(RAND() * 2); -- 0 o 1 aleatorio

        INSERT INTO login (usuario_id, fecha_hora, exito)
        VALUES (usuario_random, fecha_random, exito_random);

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE insertar_registros_fidelizacion()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE usuario_random INT;
    DECLARE actividad_random INT;
    DECLARE puntos_random INT;
    DECLARE fecha_random DATETIME;

    WHILE i <= 50 DO
        -- Generar usuario aleatorio entre 1 y 20
        SET usuario_random = FLOOR(1 + (RAND() * 20));

        -- Generar actividad aleatoria entre 1 y 15
        SET actividad_random = FLOOR(1 + (RAND() * 15));

        -- Generar puntos aleatorios entre 10 y 100
        SET puntos_random = FLOOR(10 + (RAND() * 91));

        -- Generar fecha aleatoria entre 2000 y 2025
        SET fecha_random = DATE_FORMAT(
            FROM_DAYS(FLOOR(TO_DAYS('2025-12-31') - RAND() * (TO_DAYS('2025-12-31') - TO_DAYS('2000-01-01')))), 
            '%Y-%m-%d %H:%i:%s'
        );

        -- Insertar en la tabla fidelización
        INSERT INTO fidelizacion (usuario_id, actividad_id, puntos, fecha)
        VALUES (usuario_random, actividad_random, puntos_random, fecha_random);

        -- Incrementar contador
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

INSERT INTO actividades (nombre, descripcion, fecha, puntos_asignados) VALUES
('Desafío de Logística', 'Descripción de Desafío de Logística', '2019-08-15', 92),
('Capacitación en Finanzas', 'Descripción de Capacitación en Finanzas', '2025-03-05', 88),
('Torneo de Ajedrez', 'Descripción de Torneo de Ajedrez', '2008-11-22', 61),
('Seminario de RRHH', 'Descripción de Seminario de RRHH', '2002-07-09', 55),
('Charlas Motivacionales', 'Descripción de Charlas Motivacionales', '2023-10-30', 77);

INSERT INTO usuarios (nombre, apellido, estado, contraseña, cargo, salario, fecha_ingreso, perfil_id) VALUES
('Jorge', 'Velazquez', 'Inactivo', SHA2('pass9258',256), 'Gerente', 2428.44, '2024-01-28', 8),
('Andrea', 'Luna', 'Inactivo', SHA2('pass2230',256), 'Empleado', 2164.86, '2001-02-25', 7),
('Raul', 'Santos', 'Activo', SHA2('pass5604',256), 'Supervisor', 4350.38, '2021-04-15', 4),
('Diana', 'Cruz', 'Activo', SHA2('pass3586',256), 'Soporte Técnico', 4460.95, '2021-01-25', 9),
('Alberto', 'Castro', 'Inactivo', SHA2('pass9806',256), 'Marketing', 2482.66, '2015-07-20', 4),
('Fernanda', 'Garcia', 'Activo', SHA2('pass1124',256), 'Ventas', 3617.19, '2017-06-10', 2),
('Ricardo', 'Mendoza', 'Activo', SHA2('pass6782',256), 'Logística', 3118.85, '2009-09-14', 3),
('Elena', 'Hernandez', 'Inactivo', SHA2('pass4902',256), 'Finanzas', 4895.74, '2003-08-08', 10),
('Oscar', 'Navarro', 'Activo', SHA2('pass2245',256), 'Recursos Humanos', 3520.10, '2022-03-05', 6),
('Valeria', 'Morales', 'Activo', SHA2('pass3547',256), 'Desarrollador', 2840.60, '2012-12-18', 5);

CALL insertar_registros_login();

CALL insertar_registros_fidelizacion();

SELECT * FROM login;

CREATE VIEW vista_fidelizacion AS
SELECT u.id AS usuario_id, u.nombre, u.apellido, a.nombre AS actividad, f.puntos, f.fecha
FROM fidelizacion f
JOIN usuarios u ON f.usuario_id = u.id
JOIN actividades a ON f.actividad_id = a.id;

CREATE VIEW vista_login AS
SELECT u.id AS usuario_id, u.nombre, u.apellido, l.fecha_hora, 
       IF(l.exito = 1, 'Éxito', 'Fallido') AS estado
FROM login l
JOIN usuarios u ON l.usuario_id = u.id;

CREATE VIEW vista_puntos_acumulados AS
SELECT u.id AS usuario_id, u.nombre, u.apellido, SUM(f.puntos) AS total_puntos
FROM fidelizacion f
JOIN usuarios u ON f.usuario_id = u.id
GROUP BY u.id;

DELIMITER //

CREATE PROCEDURE agregar_usuario(
    IN p_nombre VARCHAR(50), IN p_apellido VARCHAR(50), IN p_contraseña VARCHAR(255),
    IN p_cargo VARCHAR(100), IN p_salario DECIMAL(10,2), IN p_fecha_ingreso DATE, IN p_perfil_id INT
)
BEGIN
    INSERT INTO usuarios (nombre, apellido, estado, contraseña, cargo, salario, fecha_ingreso, perfil_id)
    VALUES (p_nombre, p_apellido, 'Activo', SHA2(p_contraseña, 256), p_cargo, p_salario, p_fecha_ingreso, p_perfil_id);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE registrar_fidelizacion(IN p_usuario_id INT, IN p_actividad_id INT)
BEGIN
    DECLARE puntos INT;
    SELECT puntos_asignados INTO puntos FROM actividades WHERE id = p_actividad_id;
    INSERT INTO fidelizacion (usuario_id, actividad_id, puntos, fecha) 
    VALUES (p_usuario_id, p_actividad_id, puntos, NOW());
END //

DELIMITER ;

SELECT * FROM vista_fidelizacion;
SELECT * FROM vista_login;
SELECT * FROM vista_puntos_acumulados;

DROP PROCEDURE IF EXISTS insertar_registros_login;
DROP PROCEDURE IF EXISTS insertar_registros_fidelizacion;
DROP PROCEDURE IF EXISTS registrar_fidelizacion;


DELIMITER //

CREATE PROCEDURE registrar_evento(
    IN p_tipo_evento VARCHAR(20), -- 'login' o 'fidelizacion'
    IN p_usuario_id INT,
    IN p_actividad_id INT, -- Solo para fidelización
    IN p_exito TINYINT, -- Solo para login
    IN p_puntos INT -- Solo para fidelización
)
BEGIN
    IF p_tipo_evento = 'login' THEN
        INSERT INTO login (usuario_id, fecha_hora, exito)
        VALUES (p_usuario_id, NOW(), p_exito);
    ELSEIF p_tipo_evento = 'fidelizacion' THEN
        INSERT INTO fidelizacion (usuario_id, actividad_id, puntos, fecha)
        VALUES (p_usuario_id, p_actividad_id, p_puntos, NOW());
    END IF;
END //

DELIMITER ;

CALL registrar_evento('login', 3, NULL, 1, NULL);
CALL registrar_evento('fidelizacion', 5, 2, NULL, 50);

SHOW PROCEDURE STATUS WHERE Db = DATABASE();
SELECT * FROM vista_puntos_acumulados;

CALL agregar_usuario('Carlos', 'López', 'password123', 'Analista', 2500.00, '2025-02-10', 2);
CALL registrar_evento('login', 3, NULL, 1, NULL);
CALL registrar_evento('fidelizacion', 5, 2, NULL, 50);
SELECT * FROM vista_puntos_acumulados;