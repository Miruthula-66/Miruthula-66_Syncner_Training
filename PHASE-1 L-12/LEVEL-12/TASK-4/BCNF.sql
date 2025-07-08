CREATE TABLE Products (
    product_id VARCHAR(10),
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    warehouse_id VARCHAR(10),
    PRIMARY KEY (product_id, warehouse_id)
);

INSERT INTO Products (product_id, product_name, price, warehouse_id) VALUES
('P1', 'Laptop', 1000.00, 'W1'),
('P2', 'Mouse', 20.00, 'W2');

CREATE TABLE Product_Warehouses (
    product_id VARCHAR(10) PRIMARY KEY,
    warehouse_id VARCHAR(10)
);

INSERT INTO Product_Warehouses (product_id, warehouse_id) VALUES
('P1', 'W1'),
('P2', 'W2');

CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO Products (product_id, product_name, price) VALUES
('P1', 'Laptop', 1000.00),
('P2', 'Mouse', 20.00);

SELECT * FROM Products;

SELECT * FROM Product_Warehouses;

