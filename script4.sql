CREATE DATABASE IF NOT EXISTS join_demo;
USE join_demo;


CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers (customer_id, name, city) VALUES
(1, 'Alice', 'Chennai'),
(2, 'Bob', 'Mumbai'),
(3, 'Charlie', 'Delhi'),
(4, 'David', 'Bangalore');

INSERT INTO Orders (order_id, customer_id, product, amount) VALUES
(101, 1, 'Laptop', 75000),
(102, 2, 'Keyboard', 1500),
(103, 1, 'Mouse', 800),
(104, 5, 'Monitor', 10000); 

SELECT c.name, o.product, o.amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

SELECT c.name, o.product, o.amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

SELECT c.name, o.product, o.amount
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

SELECT c.name, o.product, o.amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id

UNION

SELECT c.name, o.product, o.amount
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;
