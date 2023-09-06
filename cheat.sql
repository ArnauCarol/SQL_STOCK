-- Select all records from the 'stock_market' table
SELECT * FROM stock_market;

-- Select all records from the 'ticker' table
SELECT * FROM ticker;

-- Select specific columns from the 'stock_market' table
SELECT open, close FROM stock_market;

-- Select specific columns from the 'ticker' table
SELECT ticker, price FROM ticker;

-- Filter data using WHERE clause in the 'stock_market' table
SELECT * FROM stock_market
WHERE close > 105.00;

-- Filter data using WHERE clause in the 'ticker' table
SELECT * FROM ticker
WHERE ticker = 'AAPL' AND date = '2023-09-01';

-- Update data in the 'stock_market' table
UPDATE stock_market
SET close = 112.00
WHERE open = 110.00;

-- Update data in the 'ticker' table
UPDATE ticker
SET price = 155.00
WHERE ticker = 'AAPL' AND date = '2023-09-01';

-- Delete data from the 'stock_market' table
DELETE FROM stock_market
WHERE low < 100.00;

-- Delete data from the 'ticker' table
DELETE FROM ticker
WHERE ticker = 'GOOG' AND date = '2023-09-01';

-- Summarize data with COUNT in the 'stock_market' table
SELECT COUNT(*) FROM stock_market;

-- Summarize data with COUNT in the 'ticker' table
SELECT COUNT(*) FROM ticker;

-- Calculate the average with AVG in the 'stock_market' table
SELECT AVG(high) FROM stock_market;

-- Calculate the average with AVG in the 'ticker' table
SELECT AVG(price) FROM ticker;

-- Find the maximum value with MAX in the 'stock_market' table
SELECT MAX(high) FROM stock_market;

-- Find the maximum value with MAX in the 'ticker' table
SELECT MAX(price) FROM ticker;

-- Find the minimum value with MIN in the 'stock_market' table
SELECT MIN(low) FROM stock_market;

-- Find the minimum value with MIN in the 'ticker' table
SELECT MIN(price) FROM ticker;

-- Group and aggregate data with GROUP BY in the 'stock_market' table
SELECT open, SUM(high) AS total_high
FROM stock_market
GROUP BY open;

-- Join tables using INNER JOIN in the 'stock_market' and 'ticker' tables
SELECT stock_market.open, stock_market.close, ticker.ticker, ticker.price
FROM stock_market
INNER JOIN ticker
ON stock_market.close = ticker.price;

-- Sort data using ORDER BY in the 'stock_market' table
SELECT * FROM stock_market
ORDER BY close DESC; -- DESC for descending, ASC for ascending

-- Create an index on a column in the 'stock_market' table
CREATE INDEX idx_high ON stock_market(high);

-- Add a PRIMARY KEY constraint in the 'stock_market' table
ALTER TABLE stock_market
ADD PRIMARY KEY (open);

-- Add a FOREIGN KEY constraint in the 'ticker' table
ALTER TABLE ticker
ADD FOREIGN KEY (ticker)
REFERENCES stock_market(open);

-- Create a view
CREATE VIEW stock_market_view AS
SELECT open, close, high
FROM stock_market
WHERE close > 105.00;

-- Backup a database
BACKUP DATABASE your_database
TO disk = 'C:\backup\your_database.bak';

-- Restore a database
RESTORE DATABASE your_database
FROM disk = 'C:\backup\your_database.bak';
