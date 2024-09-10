USE Quantium;
/* 2. Sales Analysis */

--  Sales Trend by DATE
SELECT DATE, ROUND(SUM(t.TOT_SALES),1) AS total_sales
FROM transaction_data AS t
GROUP BY DATE
ORDER BY DATE;

--  Total Sales by Month
SELECT YEAR(t.DATE) AS year, MONTH(t.DATE) AS month, ROUND(SUM(t.TOT_SALES),1) AS total_sales
FROM transaction_data AS t
GROUP BY YEAR(t.DATE), MONTH(t.DATE)
ORDER BY YEAR(t.DATE), MONTH(t.DATE);

--  Total Sales by BRAND
SELECT BRAND, ROUND(SUM(t.TOT_SALES),2) AS total_sales, ROUND((SUM(t.TOT_SALES)*100)/
	(SELECT SUM(t.TOT_SALES) FROM transaction_data AS t),1) AS percentage
FROM transaction_data AS t
GROUP BY t.BRAND
ORDER BY total_sales;

--  Total Sales by SIZE
SELECT SIZE, ROUND(SUM(t.TOT_SALES),2) AS total_sales, ROUND((SUM(t.TOT_SALES)*100)/
	(SELECT SUM(t.TOT_SALES) FROM transaction_data AS t),1) AS percentage
FROM transaction_data AS t
GROUP BY t.SIZE
ORDER BY total_sales;

DROP VIEW IF EXISTS merged;
-- Merge two datasets
CREATE VIEW merged AS
SELECT 
	t.DATE,
    t.STORE_NBR,
    t.LYLTY_CARD_NBR,
    t.TXN_ID,
    t.PROD_NBR,
    t.PROD_NAME,
	t.BRAND,
    t.PROD_QTY,
    t.SIZE,
    t.TOT_SALES,
    p.LIFESTAGE,
    p.PREMIUM_CUSTOMER
FROM transaction_data t
JOIN purchase_behaviour p ON t.LYLTY_CARD_NBR = p.LYLTY_CARD_NBR;

-- Total Sales by LIFESTAGE
SELECT LIFESTAGE, COUNT(DISTINCT LYLTY_CARD_NBR) AS customer_count, ROUND(SUM(TOT_SALES),2) AS total_sales, ROUND((SUM(TOT_SALES)*100)/
	(SELECT SUM(TOT_SALES) FROM merged),2) AS percentage
FROM merged
GROUP BY LIFESTAGE
ORDER BY total_sales;

-- Total Sales by PREMIUM_CUSTOMER 
SELECT PREMIUM_CUSTOMER, COUNT(DISTINCT LYLTY_CARD_NBR) AS customer_count, ROUND(SUM(TOT_SALES),2) AS total_sales, ROUND((SUM(TOT_SALES)*100)/
	(SELECT SUM(TOT_SALES) FROM merged),1) AS percentage
FROM merged
GROUP BY PREMIUM_CUSTOMER
ORDER BY total_sales;

-- Distribution of product quantities sold
/* Ranges from 1 to 5 for most, with 2 outliers at 200. */
SELECT PROD_QTY, COUNT(*)
FROM transaction_data
GROUP BY PROD_QTY
ORDER BY PROD_QTY;

-- Average PROD_QTY, TOT_SALES, SIZE per transaction
/* avg(TOT_SALES) = 7.3		avg(PROD_QTY) = 1.91 	avg(SIZE) = 182.43 */
SELECT ROUND(AVG(TOT_SALES),2), ROUND(AVG(PROD_QTY),2), ROUND(AVG(SIZE),2)
FROM transaction_data;

-- Average TOT_SALES, PROD_QTY, SIZE by PREMIUM_CUSTOMER
/* TOT_SALES: Mainstream > Premium > Budget
   SIZE: Mainstream > Budget > Premium */  
SELECT PREMIUM_CUSTOMER, ROUND(AVG(TOT_SALES),2), ROUND(AVG(PROD_QTY),2), ROUND(AVG(SIZE),2) 
FROM merged
GROUP BY PREMIUM_CUSTOMER
ORDER BY PREMIUM_CUSTOMER;

-- Average TOT_SALES, PROD_QTY, SIZE by LIFESTAGE 
SELECT LIFESTAGE, ROUND(AVG(TOT_SALES),2), ROUND(AVG(PROD_QTY),2), ROUND(AVG(SIZE),2) 
FROM merged
GROUP BY LIFESTAGE;

-- BRAND Sales Trend by DATE
SELECT DATE, BRAND, COUNT(*) AS brand_count
FROM merged
GROUP BY DATE, BRAND
ORDER BY DATE, brand_count DESC;
    
-- BRAND count by PREMIUM_CUSTOMER
SELECT PREMIUM_CUSTOMER, BRAND, COUNT(*) AS brand_count
FROM merged
GROUP BY PREMIUM_CUSTOMER, BRAND
ORDER BY PREMIUM_CUSTOMER, brand_count DESC;
    
-- BRAND count by LIFESTAGE
SELECT LIFESTAGE, BRAND, COUNT(*) AS brand_count
FROM merged
GROUP BY LIFESTAGE, BRAND
ORDER BY LIFESTAGE, brand_count DESC;

-- BRAND count by SIZE
SELECT BRAND, SIZE, COUNT(*) AS brand_count
FROM merged
GROUP BY BRAND, SIZE
ORDER BY BRAND, SIZE;


-- Overall Revenue
SELECT round(SUM(TOT_SALES),1) AS Total_Rev, SUM(PROD_QTY) AS Total_Units_Sold, ROUND(SUM(TOT_SALES) / SUM(PROD_QTY), 2) AS Average_Price_Per_Bag
FROM transaction_data;

-- Avg Sales
SELECT  ROUND(SUM(PROD_QTY) / COUNT(DISTINCT DATE), 0) AS Avg_DailySold_Qt,
ROUND(SUM(TOT_SALES) / COUNT(DISTINCT DATE), 0) AS Avg_DailySales,
ROUND(SUM(TOT_SALES) / COUNT(DISTINCT EXTRACT(YEAR_MONTH FROM DATE)), 0) AS Avg_MonthlySales
FROM transaction_data;

-- Avg Trans
SELECT ROUND(AVG(PROD_QTY), 1) AS Avg_Bag_Per_Trans, 
    ROUND(AVG(TOT_SALES), 2) AS Avg_Rev_Per_Trans
FROM transaction_data;

-- Customer Distribution
select LIFESTAGE, PREMIUM_CUSTOMER, count(*)
from merged
group by LIFESTAGE, PREMIUM_CUSTOMER
order by LIFESTAGE;