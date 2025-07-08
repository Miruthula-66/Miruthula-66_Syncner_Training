DROP TABLE IF EXISTS Sales_Reports, Order_Details, Orders, Products, Customers;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);
INSERT INTO Customers VALUES
(1, 'Alice'),
(2, 'Bob');
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO Products VALUES
(1, 'Laptop', 1000),
(2, 'Mouse', 20),
(3, 'Keyboard', 50);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Orders VALUES
(101, 1, '2023-01-01'),
(102, 2, '2023-01-02');
CREATE TABLE Order_Details (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Order_Details VALUES
(101, 1, 2),  
(101, 2, 3),  
(102, 3, 1); 

CREATE VIEW Sales_Reports AS
SELECT 
    o.order_id,
    o.order_date,
    c.customer_name,
    p.product_name,
    od.quantity,
    p.price,
    od.quantity * p.price AS total_price
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id;
SELECT * FROM Sales_Reports;
