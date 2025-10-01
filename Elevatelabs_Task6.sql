CREATE DATABASE online_sales_db;
USE online_sales_db;

CREATE TABLE online_sales (
    order_id INT,
    order_date DATETIME,
    product_id VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    amount DECIMAL(15,2)
);




USE online_sales_db;


CREATE TABLE IF NOT EXISTS online_sales (
    order_id INT,
    order_date DATETIME,
    product_id VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    amount DECIMAL(15,2)
);


LOAD DATA LOCAL INFILE 'C:/Users/sakin/Downloads/online_sales_dataset.csv'
INTO TABLE online_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@order_id, @stockcode, @description, @quantity, @order_date, @unit_price, @c7, @c8, @c9, @c10, @c11, @c12, @c13, @c14, @c15, @c16, @c17)
SET
    order_id = @order_id,
    product_id = @stockcode,
    quantity = @quantity,
    order_date = STR_TO_DATE(@order_date, '%Y-%m-%d %H:%i:%s'),
    unit_price = @unit_price,
    amount = @quantity * @unit_price;


UPDATE online_sales
SET amount = quantity * unit_price;


SELECT EXTRACT(MONTH FROM order_date) AS month
FROM online_sales
LIMIT 5;


SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month
FROM online_sales
GROUP BY year, month
LIMIT 5;


SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY year, month
LIMIT 5;


SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY year, month
LIMIT 5;


SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY year, month
ORDER BY year, month;


SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 3;
