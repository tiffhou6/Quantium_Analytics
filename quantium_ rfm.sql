-- Use the Quantium database
USE Quantium;

-- Dropping any previous temporary table if it exists
DROP TABLE IF EXISTS rfm;
DROP TABLE IF EXISTS temp_rfm;
DROP TABLE IF EXISTS temp_rfm_scores;

-- RFM Calculation 
CREATE TABLE temp_rfm AS
SELECT
    lylty_card_nbr AS customer_id,
    MAX(date) AS last_order_date,
    '2019-06-30' AS Max_Transaction_Date,
    DATEDIFF('2019-06-30', MAX(date)) AS rec,
    COUNT(txn_id) AS freq,
    ROUND(SUM(tot_sales)) AS mon
FROM 
    merged
GROUP BY 
    lylty_card_nbr;

-- Assign RFM Scores 
CREATE TABLE temp_rfm_scores AS
SELECT 
    r.*,
    NTILE(5) OVER (ORDER BY rec DESC) AS Recency,
    NTILE(5) OVER (ORDER BY freq) AS Frequency,
    NTILE(5) OVER (ORDER BY mon) AS Monetary
FROM 
    temp_rfm r;

-- Customer Segmentation Based on RFM Scores 
CREATE TABLE rfm AS
SELECT 
    c.customer_id,
    c.Recency,
    c.Frequency,
    c.Monetary,
    CONCAT(c.Recency, c.Frequency, c.Monetary) AS rfm_score,
     CASE 
        -- Best Customers: High recency, high frequency, high monetary
        WHEN c.Recency = 5 AND c.Frequency = 5 AND c.Monetary = 5 THEN 'Best'

        -- Recent/New Customers: High recency, low frequency, low monetary
        WHEN c.Recency BETWEEN 4 AND 5 AND c.Frequency <= 2 THEN 'Recent/New'
        
        -- Loyal Customers: Moderate recency and frequency, moderate monetary
        WHEN c.Recency >= 3 AND c.Frequency >= 4 AND c.Monetary >= 3 THEN 'Loyal'
        
        -- At Risk Customers: Low recency, moderate frequency, moderate monetary
        WHEN c.Recency <= 2 AND c.Frequency >= 3 AND c.Monetary >= 3 THEN 'At Risk'
        
        -- Inactive Customers: Very low recency, low frequency, low monetary
        WHEN c.Recency = 1 AND c.Frequency <= 2 AND c.Monetary <= 2 THEN 'Inactive'
        
        -- Growing Customers: High recency, increasing frequency, and increasing monetary
        WHEN c.Recency BETWEEN 4 AND 5 AND c.Frequency >=3 AND c.Monetary >=3 THEN 'Growing'
        
       ELSE 'General'
    END AS Segment
FROM 
    temp_rfm_scores c;

SELECT * 
FROM rfm
ORDER BY 
    Recency, Frequency, Monetary, customer_id;

SELECT distinct Segment, Recency, Frequency, Monetary
from rfm;

-- Count and percentage of customers in each Segment
SELECT Segment, 
COUNT(*) as count, 
ROUND((SUM(customer_id)*100)/(SELECT SUM(customer_id) FROM rfm),2) AS percentage
from rfm
GROUP BY Segment
ORDER BY count DESC;

DROP VIEW IF EXISTS rfm_merged;
-- Merge rfm data with the merged data
CREATE VIEW rfm_merged AS
SELECT 
    r.customer_id,
    r.Recency,
    r.Frequency,
    r.Monetary,
    r.rfm_score,
    r.Segment,
    m.DATE,
    m.STORE_NBR,
    m.TXN_ID,
    m.PROD_NBR,
    m.PROD_NAME,
    m.BRAND,
    m.PROD_QTY,
    m.SIZE,
    m.TOT_SALES,
    m.LIFESTAGE,
    m.PREMIUM_CUSTOMER
FROM rfm r JOIN merged m ON r.customer_id = m.LYLTY_CARD_NBR;
    
-- Count and percentage of customers in each LIFESTAGE within each Segment (100%/Segment)
SELECT LIFESTAGE, Segment, COUNT(*) AS count, 
ROUND((COUNT(*) * 100) / SUM(COUNT(*)) OVER (PARTITION BY Segment), 1) AS percentage
FROM rfm_merged
GROUP BY Segment, LIFESTAGE
ORDER BY Segment, LIFESTAGE;

-- Count and percentage of customers in each PREMIUM_CUSTOMER within each Segment (100%/Segment)
SELECT Segment, PREMIUM_CUSTOMER, COUNT(*) AS count, 
ROUND((COUNT(*) * 100) / SUM(COUNT(*)) OVER (PARTITION BY Segment), 1) AS percentage
FROM rfm_merged
GROUP BY Segment, PREMIUM_CUSTOMER
ORDER BY Segment, PREMIUM_CUSTOMER;

-- Average RFM 
SELECT 
    ROUND(AVG(rec), 2) AS Avg_Recency,
    ROUND(AVG(freq), 2) AS Avg_Frequency,
    ROUND(AVG(mon), 2) AS Avg_Monetary
FROM 
    temp_rfm;




