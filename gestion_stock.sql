-- Select the highest closing price in the 'stock_market' table
SELECT MAX(close) AS highest_close_price FROM stock_market;

-- Select the lowest closing price in the 'stock_market' table
SELECT MIN(close) AS lowest_close_price FROM stock_market;

-- Calculate the price difference between open and close in the 'stock_market' table
SELECT ticker, open, close, (close - open) AS price_difference
FROM stock_market;

-- Calculate the average closing price for each ticker in the 'ticker' table
SELECT ticker, AVG(price) AS avg_price
FROM ticker
GROUP BY ticker;

-- Select data from 'stock_market' and 'ticker' for specific dates
SELECT stock_market.ticker, stock_market.open, stock_market.close, ticker.date, ticker.price
FROM stock_market
INNER JOIN ticker
ON stock_market.ticker = ticker.ticker
WHERE stock_market.date = '2023-09-03' AND ticker.date = '2023-09-03';

-- Select the top 3 highest closing prices in the 'stock_market' table
SELECT ticker, date, close
FROM stock_market
ORDER BY close DESC
LIMIT 3;

-- Select the top 2 most recent prices for each ticker in the 'ticker' table
SELECT ticker, date, price
FROM (
    SELECT ticker, date, price,
           ROW_NUMBER() OVER(PARTITION BY ticker ORDER BY date DESC) AS rn
    FROM ticker
) ranked
WHERE rn <= 2;

-- Calculate the total high price for each day in the 'stock_market' table
SELECT date, SUM(high) AS total_high
FROM stock_market
GROUP BY date;

-- Delete all records in the 'ticker' table for 'AAPL'
DELETE FROM ticker WHERE ticker = 'AAPL';

-- Update the 'stock_market' table by setting the 'low' column to 110.00 for all records with 'close' < 113.00
UPDATE stock_market
SET low = 110.00
WHERE close < 113.00;

-- Create a view to show the top 3 closing prices in the 'stock_market' table
CREATE VIEW top_closing_prices AS
SELECT ticker, date, close
FROM stock_market
ORDER BY close DESC
LIMIT 3;
