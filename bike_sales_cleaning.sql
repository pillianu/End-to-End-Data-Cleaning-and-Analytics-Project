## Firstly I take dataset i.e.raw_bike_sales

CREATE TABLE raw_bike_sales (
    order_id INT,
    order_date VARCHAR(50),
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    store_region VARCHAR(50)
);

INSERT INTO raw_bike_sales (order_id, order_date, customer_name, product_name, category, price, store_region) VALUES
(1001, '2026-01-10', 'Alice Smith', 'Trail Blazer 2000', 'Mountain', 1200.00, 'North'),
(1002, '2026-01-11', 'Bob Jones', 'Road Runner Lite', 'Road', 850.00, 'South'),
(1003, '2026-01-12', 'Charlie Brown', 'City Slicker', 'Hybrid', 500.00, NULL),
(1004, '2026-01-13', 'Diana Prince', 'Trail Blazer 2000', 'mouNTain', 1200.00, 'West'),
(1001, '2026-01-10', 'Alice Smith', 'Trail Blazer 2000', 'Mountain', 1200.00, 'North'), -- Duplicate Row
(1005, '2026-01-14', 'Evan Wright', 'Speedster Pro', 'Road', 1500.00, 'East'),
(1006, '2026-01-15', 'Fiona Gallagher', 'E-Bike Prime', 'electric', 2200.00, 'North'),
(1007, '2026-01-16', 'George Clark', 'Rock Climber X', 'Mountain', 1350.00, NULL),
(1008, '2026-01-17', 'Hannah Abbott', 'City Slicker', 'HYBRID', 500.00, 'South'),
(1009, '2026-01-18', 'Ian Malcolm', 'Speedster Pro', 'Road', 1500.00, 'West');

## Process 1: Data Exploration (Look)
# Query 1: Check total record count
SELECT COUNT(*) AS total_rows 
FROM raw_bike_sales;

# Query 2: Look for typos in product categories
SELECT DISTINCT category 
FROM raw_bike_sales;

# Query 3: Check for blank values in crucial areas
SELECT COUNT(*) AS missing_regions 
FROM raw_bike_sales 
WHERE store_region IS NULL;

## Process 2: Data Cleaning (Fix)
# Query 1: Standardize the categories to lowercase
UPDATE raw_bike_sales
SET category = LOWER(TRIM(category));

# Query 2: Handle missing regions
UPDATE raw_bike_sales
SET store_region = 'Unknown'
WHERE store_region IS NULL;

# Query 3: To clear duplicate rows
CREATE TABLE 
temp_bike_sales AS SELECT DISTINCT * FROM raw_bike_sales;

## Process 3: Data Analysis (Solve)
# Query 1: Top-performing bike categories by revenue
SELECT category,
       SUM(price) AS total_revenue,
       COUNT(order_id) AS total_units_sold
FROM raw_bike_sales
GROUP BY category
ORDER BY total_revenue DESC;

# Query 2: Best performing store regionsql
SELECT store_region,
       SUM(price) AS regional_revenue
FROM raw_bike_sales
GROUP BY store_region
ORDER BY regional_revenue DESC;

# Rank individual products using Window Functions 
SELECT product_name, 
RANK() OVER(ORDER BY SUM(price) DESC) AS sales_rank 
FROM raw_bike_sales 
GROUP BY product_name;
