CREATE TABLE Customers (
    customer_id VARCHAR(10),
    customer_name VARCHAR(100),
    customer_address VARCHAR(100),
    phone_number VARCHAR(20)
);
INSERT INTO Customers (customer_id, customer_name, customer_address, phone_number) VALUES
('C1', 'Alice', '123 Main St', '555-1234'),
('C1', 'Alice', '456 Park Ave', '555-5678');

CREATE TABLE Customer_Addresses (
    customer_id VARCHAR(10),
    address VARCHAR(100)
);

INSERT INTO Customer_Addresses (customer_id, address) VALUES
('C1', '123 Main St'),
('C1', '456 Park Ave');
CREATE TABLE Customer_Phones (
    customer_id VARCHAR(10),
    phone_number VARCHAR(20)
);
SELECT * FROM Customer_Addresses;

DROP TABLE IF EXISTS Customer_Phones;

CREATE TABLE Customer_Phones (
    customer_id VARCHAR(10),
    phone_number VARCHAR(20),
    PRIMARY KEY (customer_id, phone_number)
);
INSERT IGNORE INTO Customer_Phones (customer_id, phone_number) VALUES
('C1', '555-1234'),
('C1', '555-5678');
SELECT * FROM Customer_Phones;
