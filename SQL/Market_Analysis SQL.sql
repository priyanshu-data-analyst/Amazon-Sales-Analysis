/* =========================================================
   AMAZON DIWALI SALES 2025 – SQL BUSINESS ANALYSIS
   Dataset: amazon_sales_2025_inr
   Rows: ~15,000
   Analyst: Priyanshu Gupta
   ========================================================= */
   
/* -----------------------------
   1. DATA OVERVIEW
------------------------------ */
SELECT COUNT(*) AS total_rows
FROM amazon_sales_2025_inr;


/* -----------------------------
   2. CORE BUSINESS KPIs
------------------------------ */
-- KPI 1: Total Revenue
SELECT 
    ROUND(SUM(Total_Sales_INR), 2) AS total_revenue_inr
FROM amazon_sales_2025_inr;

-- KPI 2: Total Orders
SELECT 
    COUNT(DISTINCT Order_ID) AS total_orders
FROM amazon_sales_2025_inr;

-- KPI 3: Average Order Value (AOV)
SELECT 
    ROUND(
        SUM(Total_Sales_INR) / COUNT(DISTINCT Order_ID), 
        2
    ) AS avg_order_value
FROM amazon_sales_2025_inr;

/* -----------------------------
   3. CATEGORY ANALYSIS
------------------------------ */
-- Revenue by Product Category
SELECT 
    Product_Category,
    ROUND(SUM(Total_Sales_INR), 2) AS revenue
FROM amazon_sales_2025_inr
GROUP BY Product_Category
ORDER BY revenue DESC;

-- Orders by Product Category
SELECT 
    Product_Category,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM amazon_sales_2025_inr
GROUP BY Product_Category
ORDER BY total_orders DESC;

/* -----------------------------
   4. STATE-WISE SALES ANALYSIS
------------------------------ */

SELECT 
    State,
    ROUND(SUM(Total_Sales_INR), 2) AS revenue
FROM amazon_sales_2025_inr
GROUP BY State
ORDER BY revenue DESC;

/* -----------------------------
   5. PRICE SEGMENT ANALYSIS
------------------------------ */

SELECT
    CASE
        WHEN Unit_Price_INR < 500 THEN 'Low Price'
        WHEN Unit_Price_INR BETWEEN 500 AND 2000 THEN 'Mid Price'
        ELSE 'High Price'
    END AS price_segment,
    COUNT(Order_ID) AS total_orders,
    ROUND(SUM(Total_Sales_INR), 2) AS revenue
FROM amazon_sales_2025_inr
GROUP BY price_segment;

/* -----------------------------
   6. PAYMENT METHOD ANALYSIS
------------------------------ */

SELECT
    Payment_Method,
    COUNT(Order_ID) AS total_orders,
    ROUND(SUM(Total_Sales_INR), 2) AS revenue
FROM amazon_sales_2025_inr
GROUP BY Payment_Method
ORDER BY revenue DESC;

/* -----------------------------
   7. DELIVERY PERFORMANCE
------------------------------ */

SELECT
    Delivery_Status,
    COUNT(Order_ID) AS total_orders
FROM amazon_sales_2025_inr
GROUP BY Delivery_Status;

/* -----------------------------
   8. CUSTOMER RATING ANALYSIS
------------------------------ */
SELECT
    Review_Rating,
    COUNT(Order_ID) AS total_orders,
    ROUND(SUM(Total_Sales_INR), 2) AS revenue
FROM amazon_sales_2025_inr
GROUP BY Review_Rating
ORDER BY Review_Rating DESC;

/* -----------------------------
   9. TOP 10 PRODUCTS BY REVENUE
------------------------------ */


SELECT
    Product_Name,
    ROUND(SUM(Total_Sales_INR), 2) AS revenue
FROM amazon_sales_2025_inr
GROUP BY Product_Name
ORDER BY revenue DESC
LIMIT 10;