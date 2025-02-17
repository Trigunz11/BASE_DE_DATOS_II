CREATE DATABASE parcial_sis_fact;
USE parcial_sis_fact;

CREATE TABLE tamano (
  tamano_id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_tamano VARCHAR(50) NOT NULL,
  clasificacion VARCHAR(50) NOT NULL,
  estado ENUM('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  unique_code VARCHAR(50) UNIQUE
);

CREATE TABLE color (
  color_id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_color VARCHAR(50) NOT NULL,
  nombre_color VARCHAR(50) NOT NULL,
  es_base TINYINT(1) NOT NULL DEFAULT 0,
  status ENUM('Aprobado','Pendiente','Rechazado') NOT NULL DEFAULT 'Pendiente'
);

CREATE TABLE categorias (
  categoria_id INT AUTO_INCREMENT PRIMARY KEY,
  categoria_principal VARCHAR(50) NOT NULL,
  nombre_categoria VARCHAR(100) NOT NULL,
   es_visible TINYINT(1) NOT NULL DEFAULT 1,
   ref_unica VARCHAR(50) UNIQUE
);

CREATE TABLE producto (
  producto_id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_producto VARCHAR(100) NOT NULL,
  otros_datos TEXT,
  tamano_id INT NOT NULL,
  FOREIGN KEY (tamano_id) REFERENCES tamano(tamano_id),
    estado ENUM('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
   en_oferta TINYINT(1) NOT NULL DEFAULT 0
);

CREATE TABLE categoria_de_productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  producto_id INT NOT NULL,
  categoria_id INT NOT NULL,
  FOREIGN KEY (producto_id) REFERENCES producto(producto_id),
  FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id),
    es_principal TINYINT(1) NOT NULL DEFAULT 0,
  tag VARCHAR(50) UNIQUE
);

CREATE TABLE colores_del_producto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  producto_id INT NOT NULL,
  color_id INT NOT NULL,
  FOREIGN KEY (producto_id) REFERENCES producto(producto_id),
  FOREIGN KEY (color_id) REFERENCES color(color_id),
  es_primario TINYINT(1) NOT NULL DEFAULT 0,
   alias_color VARCHAR(50) UNIQUE
);

INSERT INTO tamano (codigo_tamano, clasificacion, estado, unique_code)
VALUES
  ('T-S', 'Small',  'Activo',   'UQ1'),
  ('T-M', 'Medium', 'Activo',   'UQ2'),
  ('T-L', 'Large',  'Inactivo', 'UQ3');

INSERT INTO color (codigo_color, nombre_color, es_base, status)
VALUES
  ('CL-001', 'Rojo',  0, 'Aprobado'),
  ('CL-002', 'Azul',  1, 'Pendiente'),
  ('CL-003', 'Verde', 0, 'Rechazado');

INSERT INTO categorias (categoria_principal, nombre_categoria, es_visible, ref_unica)
VALUES
  ('Ropa',       'Camisas',    1, 'CATUQ1'),
  ('Ropa',       'Pantalones', 1, 'CATUQ2'),
  ('Accesorios', 'Cinturones', 1, 'CATUQ3');

INSERT INTO producto (nombre_producto, otros_datos, tamano_id, estado, en_oferta)
VALUES
  ('Camiseta Deportiva', 'Camiseta para entrenamiento', 1, 'Activo', 0),
  ('Pantalón Jeans',     'Pantalón azul de mezclilla',  2, 'Activo', 1),
  ('Zapatos Casual',     'Zapatos color negro',         3, 'Inactivo', 0);

INSERT INTO categoria_de_productos (producto_id, categoria_id, es_principal, tag)
VALUES
  (1, 1, 1, 'TAG1'),
  (2, 2, 0, 'TAG2'),
  (3, 3, 1, 'TAG3');

INSERT INTO colores_del_producto (producto_id, color_id, es_primario, alias_color)
VALUES
  (1, 1, 1, 'RojoPrincipal'),
  (2, 2, 0, 'AzulSecundario'),
  (3, 3, 1, 'VerdePrincipal');
