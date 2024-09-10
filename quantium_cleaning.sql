USE Quantium;
/* 1. Data Cleaning & Pre-Processing */
-- Update excel serial date to standard date
ALTER TABLE transaction_data ADD new_date DATE;
UPDATE transaction_data t
SET t.new_date = DATE_ADD('1899-12-30', INTERVAL t.DATE DAY);
ALTER TABLE transaction_data DROP COLUMN DATE;
ALTER TABLE transaction_data CHANGE new_date DATE DATE;

-- Separate PROD_NAME into BRAND, PRODUCT, and SIZE 
/* Since the size isn't always the last 4 characters, 
we search for numeric pattern within each row and store into new column labeled SIZE. */
ALTER TABLE transaction_data ADD COLUMN SIZE VARCHAR(10);
UPDATE transaction_data
SET SIZE = TRIM(REGEXP_SUBSTR(PROD_NAME, '[0-9]+[a-zA-Z]*'));

-- Remove the extracted size from PROD_NAME
UPDATE transaction_data
SET PROD_NAME = TRIM(REPLACE(PROD_NAME, SIZE, ''));
SELECT PROD_NAME, SIZE FROM transaction_data;

-- Extract the first word, assuming it's the brand name
ALTER TABLE transaction_data ADD COLUMN potential_brand VARCHAR(100);
SET SQL_SAFE_UPDATES = 0;
UPDATE transaction_data
SET potential_brand = TRIM(SUBSTRING_INDEX(PROD_NAME, ' ', 1));

-- Check for distinct potential brand names, then clean and standardize them by creating mapping tables.
/* 29 rows returned - some of these rows represent the same brand but with variations in wording. 
Final count should be 21. */
SELECT DISTINCT potential_brand FROM transaction_data;

CREATE TABLE brand_mapping (
    original_brand VARCHAR(100),
    standardized_brand VARCHAR(100)
);
INSERT INTO brand_mapping (original_brand, standardized_brand) VALUES
('Natural', 'Natural Chip Company'),
('CCs', 'CCs'),
('Smiths', 'Smiths'),
('Kettle', 'Kettle'),
('Old', 'Old El Paso'),
('Grain', 'Grain Waves'),
('Doritos', 'Doritos'),
('Twisties', 'Twisties'),
('WW', 'Woolworths'),
('Thins', 'Thins'),
('Burger', 'Burger Rings'),
('NCC', 'Natural Chip Company'),
('Cheezels', 'Cheezels'),
('Infzns', 'Infuzions'),
('Red', 'Red Rock Deli'),
('Pringles', 'Pringles'),
('Dorito', 'Doritos'),
('Infuzions', 'Infuzions'),
('Smith', 'Smiths'),
('GrnWves', 'Grain Waves'),
('Tyrrells', 'Tyrrells'),
('Cobs', 'Cobs'),
('Woolworths', 'Woolworths'),
('French', 'French Fries'),
('RRD', 'Red Rock Deli'),
('Tostitos', 'Tostitos'),
('Cheetos', 'Cheetos'),
('Snbts', 'Sunbites'),
('Sunbites', 'Sunbites');

-- Update BRAND by joining the brand_mapping table
ALTER TABLE transaction_data ADD COLUMN BRAND VARCHAR(100);
UPDATE transaction_data t
JOIN brand_mapping bm ON t.potential_brand = bm.original_brand
SET t.BRAND = bm.standardized_brand;
ALTER TABLE transaction_data DROP COLUMN potential_brand;
SET SQL_SAFE_UPDATES = 1;

SELECT DISTINCT BRAND FROM transaction_data; -- 21 
SELECT * FROM transaction_data;

