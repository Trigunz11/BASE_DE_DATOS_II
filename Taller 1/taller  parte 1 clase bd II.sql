
CREATE DATABASE Tienda;
USE Tienda;


CREATE TABLE Category (
    name VARCHAR(100) PRIMARY KEY
);

CREATE TABLE Orders (
    id INT PRIMARY KEY
);

CREATE TABLE Product (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category_name VARCHAR(100),
    FOREIGN KEY (category_name) REFERENCES Category(name)
);

CREATE TABLE Order_Line (
    id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Food (
    id INT PRIMARY KEY,
    expiration_date DATE,
    calories INT,
    FOREIGN KEY (id) REFERENCES Product(id)
);

CREATE TABLE Furniture (
    id INT PRIMARY KEY,
    manufacture_date DATE,
    FOREIGN KEY (id) REFERENCES Product(id)
);


INSERT INTO Category (name) VALUES ('Muebles'), ('Alimentos');

INSERT INTO Product (id, name, price, category_name) VALUES
(1, 'Silla', 50.00, 'Muebles'),
(2, 'Mesa', 150.00, 'Muebles'),
(3, 'Escritorio', 200.00, 'Muebles'),
(4, 'Lámpara', 30.00, 'Alimentos'),
(5, 'Sofá', 500.00, 'Muebles'),
(6, 'Cama', 700.00, 'Muebles'),
(7, 'Estante', 250.00, 'Muebles'),
(8, 'Ropero', 600.00, 'Muebles'),
(9, 'Mesa de centro', 100.00, 'Muebles'),
(10, 'Banco', 40.00, 'Muebles');

INSERT INTO Food (id, expiration_date, calories) VALUES
(4, '2025-12-31', 200);

INSERT INTO Furniture (id, manufacture_date) VALUES
(1, '2023-05-20'),
(2, '2022-07-18'),
(3, '2021-11-30'),
(5, '2023-02-14'),
(6, '2024-06-05'),
(7, '2023-07-10'),
(8, '2021-09-22'),
(9, '2022-12-01'),
(10, '2023-03-11');

INSERT INTO Orders (id) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

INSERT INTO Order_Line (id, order_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 5, 1),
(4, 3, 7, 2),
(5, 4, 9, 1),
(6, 5, 2, 3),
(7, 6, 4, 2),
(8, 7, 6, 1),
(9, 8, 8, 1),
(10, 9, 10, 4);



