DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,  
    customer_id INT   
);
CREATE TABLE Order_Details (
    order_id INT,
    product_id VARCHAR(10),
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Products (product_id, product_name, price) VALUES
('P1', 'Laptop', 1000),
('P2', 'Mouse', 20),
('P3', 'Keyboard', 50);
INSERT INTO Orders (order_id, order_date, customer_id) VALUES
(101, '2025-04-14', 1),
(102, '2025-04-15', 2);
INSERT INTO Order_Details (order_id, product_id, quantity)
SELECT 101, 'P1', 2
WHERE NOT EXISTS (SELECT 1 FROM Order_Details WHERE order_id = 101 AND product_id = 'P1');
INSERT INTO Order_Details (order_id, product_id, quantity)
SELECT 101, 'P2', 3
WHERE NOT EXISTS (SELECT 1 FROM Order_Details WHERE order_id = 101 AND product_id = 'P2');
INSERT INTO Order_Details (order_id, product_id, quantity)
SELECT 102, 'P3', 1
WHERE NOT EXISTS (SELECT 1 FROM Order_Details WHERE order_id = 102 AND product_id = 'P3');
SELECT * FROM Products;
SELECT order_id, product_id, quantity
FROM Order_Details;
