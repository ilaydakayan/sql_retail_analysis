-- CREATE TABLE IN retail_db (database)
CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);

-- Count total number of transactions in the dataset
SELECT COUNT(*)
FROM retail_sales;

-- Identify records with missing values in critical columns
SELECT *
FROM retail_sales
WHERE 
    sale_date IS NULL 
    OR sale_time IS NULL 
    OR customer_id IS NULL 
    OR gender IS NULL 
    OR age IS NULL 
    OR category IS NULL 
    OR quantity IS NULL 
    OR price_per_unit IS NULL 
    OR cogs IS NULL;

-- Remove records containing NULL values to ensure data consistency
DELETE FROM retail_sales
WHERE 
    sale_date IS NULL 
    OR sale_time IS NULL 
    OR customer_id IS NULL 
    OR gender IS NULL 
    OR age IS NULL 
    OR category IS NULL 
    OR quantity IS NULL 
    OR price_per_unit IS NULL 
    OR cogs IS NULL;

-- Verify total number of clean records after data cleaning
-- Result: 1,987 records
SELECT COUNT(*)
FROM retail_sales;


-- Identify all unique product categories in the dataset
SELECT DISTINCT category
FROM retail_sales;

-- Check whether transaction IDs are unique
-- Result: 1,987 distinct transaction IDs (no duplicates)
SELECT COUNT(DISTINCT transactions_id)
FROM retail_sales;


-- PART 3: Business Questions

-- Business Question 1:
-- When do customers shop the most, and which hours generate the highest revenue?
-- Purpose: Identify peak hours to optimise staffing and promotions.

SELECT 
    EXTRACT(HOUR FROM sale_time) AS sale_hour,
    COUNT(*) AS transaction_count,
    SUM(total_sale) AS total_revenue
FROM retail_sales
GROUP BY sale_hour
ORDER BY total_revenue DESC;


-- Business Question 2:
-- Which product categories generate the highest total revenue?
-- Purpose: Understand which categories drive overall business performance.

SELECT 
    category,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC;

-- Business Question 3:
-- Who are the top-spending customers?
-- Purpose: Identify high-value customers for retention strategies.

SELECT 
    customer_id,
    SUM(total_sale) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;




-- Business Question 4:
-- Which customers have high visit frequency but relatively low average spend?
-- Purpose: Identify customers with strong engagement but untapped revenue potential.

SELECT 
    customer_id,
    COUNT(transactions_id) AS transaction_count,
    SUM(total_sale) AS total_spent,
    ROUND(
        (SUM(total_sale) / COUNT(transactions_id))::numeric,
        2
    ) AS avg_spent_per_transaction
FROM retail_sales
GROUP BY customer_id
HAVING COUNT(transactions_id) >= 10
ORDER BY avg_spent_per_transaction ASC;

-- Business Question 5:
-- How is customer purchase behaviour distributed across transaction frequency?
-- Purpose: Understand whether revenue depends on many occasional buyers or a few frequent ones.

SELECT 
    transaction_count,
    COUNT(customer_id) AS number_of_customers
FROM (
    SELECT 
        customer_id,
        COUNT(transactions_id) AS transaction_count
    FROM retail_sales
    GROUP BY customer_id
) t
GROUP BY transaction_count
ORDER BY transaction_count DESC;


-- Business Question 6:
-- Do peak hours generate high revenue because of transaction volume,
-- or because customers spend more per transaction?
-- Purpose: Distinguish between high-volume hours and high-value hours
-- to support pricing, promotion, and staffing decisions.

SELECT 
    EXTRACT(HOUR FROM sale_time) AS sale_hour,
    COUNT(transactions_id) AS transaction_count,
    SUM(total_sale) AS total_revenue,
    ROUND(
        (SUM(total_sale) / COUNT(transactions_id))::numeric,
        2
    ) AS avg_revenue_per_transaction
FROM retail_sales
GROUP BY sale_hour
ORDER BY total_revenue DESC;


-- Business Question 7:
-- In which product categories do high-potential customers (frequent but low-average spenders) concentrate?
-- Purpose: Identify categories where targeted upselling strategies could increase revenue.

SELECT
    category,
    COUNT(DISTINCT customer_id) AS high_potential_customers,
    AVG(avg_spent_per_transaction) AS avg_spent_level
FROM (
    SELECT
        customer_id,
        category,
        COUNT(transactions_id) AS transaction_count,
        (SUM(total_sale) / COUNT(transactions_id)) AS avg_spent_per_transaction
    FROM retail_sales
    GROUP BY customer_id, category
    HAVING COUNT(transactions_id) >= 10
) t
GROUP BY category
ORDER BY high_potential_customers DESC;
