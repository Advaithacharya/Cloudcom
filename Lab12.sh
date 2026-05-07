#Start MySQL Container

docker run --name mysql1 -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mysql:8

#Connect to the Running MySQL
docker exec -it mysql1 mysql -uroot -proot

#Create a New Database
CREATE DATABASE shop;
USE shop;
CREATE TABLE customers (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
city VARCHAR(100)
);
CREATE TABLE orders (
id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
product VARCHAR(100),
amount INT,
FOREIGN KEY (customer_id) REFERENCES customers(id)
);

#Insert Some Sample Data
INSERT INTO customers (name, city) VALUES
('Alice', 'New York'),
('Bob', 'Chicago'),
('Charlie', 'Los Angeles');
INSERT INTO orders (customer_id, product, amount) VALUES
(1, 'Laptop', 1200),
(1, 'Mouse', 25),
(2, 'Phone', 800),
(3, 'Tablet', 300),
(2, 'Keyboard', 45);

#A. Find All Orders for "Alice"
SELECT o.id, o.product, o.amount
FROM orders o
JOIN customers c ON o.customer_id = c.id
WHERE c.name = 'Alice';
#B. Find Orders With Amount Greater Than 500
SELECT c.name, o.product, o.amount
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.amount > 500;
#C. Find Customers Who Didn't Order Anything
SELECT name
FROM customers
WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);
#D. Show Total Spend Per Customer
SELECT c.name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;

#Quick View of the Tables

DESCRIBE customers;
DESCRIBE orders;

SELECT * FROM customers;
SELECT * FROM orders;

DELETE FROM customers WHERE city = 'Chicago';

DROP TABLE orders;
