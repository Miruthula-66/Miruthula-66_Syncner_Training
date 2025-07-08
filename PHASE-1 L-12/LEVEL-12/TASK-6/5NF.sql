CREATE TABLE Product_Suppliers (
    product_id VARCHAR(10),
    supplier_id VARCHAR(10),
    PRIMARY KEY (product_id, supplier_id)
);
INSERT INTO Product_Suppliers VALUES
('P1', 'S1'),
('P2', 'S1'),
('P2', 'S2');
CREATE TABLE Supplier_Orders (
    supplier_id VARCHAR(10),
    order_id VARCHAR(10),
    PRIMARY KEY (supplier_id, order_id)
);
INSERT INTO Supplier_Orders VALUES
('S1', '101'),
('S2', '101');
CREATE TABLE Product_Orders (
    product_id VARCHAR(10),
    order_id VARCHAR(10),
    PRIMARY KEY (product_id, order_id)
);
INSERT INTO Product_Orders VALUES
('P1', '101'),
('P2', '101');

SELECT * FROM Product_Suppliers;
SELECT * FROM Supplier_Orders;
SELECT * FROM Product_Orders;
