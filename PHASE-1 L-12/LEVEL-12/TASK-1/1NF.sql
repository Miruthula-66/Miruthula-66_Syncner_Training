CREATE DATABASE IF NOT EXISTS normalization;
USE normalization;

CREATE TABLE Orders_raw (
    order_id INT,
    customer_name VARCHAR(100),
    products TEXT
);

INSERT INTO Orders_raw VALUES
(1, 'Alice', 'Mouse, Keyboard'),
(2, 'Bob', 'Monitor'),
(3, 'Alice', 'Laptop, Mouse, Mousepad');
CREATE TABLE Orders_1NF (
    order_id INT,
    customer_name VARCHAR(100),
    product VARCHAR(100),
    PRIMARY KEY (order_id, product)
);
INSERT INTO Orders_1NF VALUES
(1, 'Alice', 'Mouse'),
(1, 'Alice', 'Keyboard'),
(2, 'Bob', 'Monitor'),
(3, 'Alice', 'Laptop'),
(3, 'Alice', 'Mouse'),
(3, 'Alice', 'Mousepad');
SELECT * FROM Orders_1NF;



