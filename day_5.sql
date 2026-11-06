-- ============================================================
-- 7 DAYS SQL CHALLENGE
-- DAY 5: SALES & PRODUCT PERFORMANCE ANALYSIS
-- Database: sql7challenge
-- ============================================================

USE sql7challenge;

-- QUERY 1: Total Sales Value from Non-Cancelled Orders

SELECT
    SUM(oi.quantity * oi.unit_price) AS total_sales_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status <> 'Cancelled';

-- QUERY 2: Sales by Product Category

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status <> 'Cancelled'
GROUP BY p.category
ORDER BY total_sales DESC;

-- QUERY 3: Top 10 Products by Sales

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC
LIMIT 10;

-- QUERY 4: Total Quantity Sold by Product

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;

-- QUERY 5: Average Selling Price by Category

SELECT
    category,
    ROUND(AVG(price), 2) AS avg_selling_price
FROM products
GROUP BY category
ORDER BY avg_selling_price DESC;

-- QUERY 6: Sales Value by Sales Channel

SELECT
    o.channel,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status <> 'Cancelled'
GROUP BY o.channel
ORDER BY total_sales DESC;

-- QUERY 7: Estimated Profit by Product

SELECT
    p.product_id,
    p.product_name,
    SUM((oi.unit_price - p.cost) * oi.quantity)
        AS estimated_profit
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
ORDER BY estimated_profit DESC;

-- QUERY 8: Top 5 Categories by Quantity Sold

SELECT
    p.category,
    SUM(oi.quantity) AS total_quantity_sold
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status <> 'Cancelled'
GROUP BY p.category
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- ============================================================
-- END OF DAY 5
-- ============================================================