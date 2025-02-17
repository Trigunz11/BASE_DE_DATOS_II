CREATE DATABASE parcial_plan_tienda;
USE parcial_plan_tienda;

CREATE TABLE region (
  region_code VARCHAR(10) PRIMARY KEY,
  region_descript VARCHAR(100) NOT NULL,
  
  region_status ENUM('Active','Inactive') NOT NULL DEFAULT 'Active',
  
  region_tag VARCHAR(50) UNIQUE
);

CREATE TABLE store (
  store_code VARCHAR(10) PRIMARY KEY,
  store_name VARCHAR(100) NOT NULL,
  store_ytd_sales DECIMAL(10,2) NOT NULL,
  
  region_code VARCHAR(10) NOT NULL,
  FOREIGN KEY (region_code) REFERENCES region(region_code),

   store_type ENUM('Physical','Online','Mixed') NOT NULL DEFAULT 'Physical',

   store_active TINYINT(1) NOT NULL DEFAULT 1
);

CREATE TABLE job (
  job_code VARCHAR(10) PRIMARY KEY,
  job_description VARCHAR(100) NOT NULL,
  job_base_pay DECIMAL(10,2) NOT NULL,

  job_type ENUM('Hourly','Salaried','Contract') NOT NULL DEFAULT 'Hourly',

  job_unique VARCHAR(50) UNIQUE
);

CREATE TABLE employee (
  emp_code VARCHAR(10) PRIMARY KEY,
  emp_title VARCHAR(50) NOT NULL,
  emp_lname VARCHAR(50) NOT NULL,
  emp_fname VARCHAR(50) NOT NULL,
  emp_initial CHAR(1),
  emp_dob DATE,

  job_code VARCHAR(10) NOT NULL,
  FOREIGN KEY (job_code) REFERENCES job(job_code),

  store_code VARCHAR(10) NOT NULL,
  FOREIGN KEY (store_code) REFERENCES store(store_code),

  emp_status ENUM('Activo','Inactivo') NOT NULL DEFAULT 'Activo',

  is_fulltime TINYINT(1) NOT NULL DEFAULT 0
);

INSERT INTO region (region_code, region_descript, region_status, region_tag)
VALUES
  ('R01', 'Zona Norte',    'Active',   'RTAG1'),
  ('R02', 'Zona Sur',      'Inactive', 'RTAG2'),
  ('R03', 'Zona Central',  'Active',   'RTAG3');

INSERT INTO store (store_code, store_name, store_ytd_sales, region_code, store_type, store_active)
VALUES
  ('S01', 'Tienda Norte',   15000.00, 'R01', 'Physical', 1),
  ('S02', 'Tienda Sur',     20000.00, 'R02', 'Online',   0),
  ('S03', 'Tienda Central', 30000.00, 'R03', 'Mixed',    1);

INSERT INTO job (job_code, job_description, job_base_pay, job_type, job_unique)
VALUES
  ('J01', 'Gerente General',   2000.00, 'Salaried', 'JOBU1'),
  ('J02', 'Vendedor',          1000.00, 'Hourly',   'JOBU2'),
  ('J03', 'Cajero',             900.00, 'Hourly',   'JOBU3');

INSERT INTO employee (emp_code, emp_title, emp_lname, emp_fname, emp_initial, emp_dob,
                      job_code, store_code, emp_status, is_fulltime)
VALUES
  ('E01', 'Sr.',   'Pérez',  'Carlos', 'C', '1985-03-10', 'J01', 'S01', 'Activo',   1),
  ('E02', 'Sra.',  'García', 'María',  'M', '1990-07-22', 'J02', 'S02', 'Inactivo', 0),
  ('E03', 'Srta.', 'López',  'Ana',    'A', '1995-01-15', 'J03', 'S03', 'Activo',   1);

