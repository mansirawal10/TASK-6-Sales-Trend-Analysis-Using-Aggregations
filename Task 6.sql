-- 📅 Query 1: Group By Year and Month
-- Extract year and month from order date
SELECT 
  CAST(strftime('%Y', Date) AS INTEGER) AS Year,
  CAST(strftime('%m', Date) AS INTEGER) AS Month
FROM OnlineSalesData
GROUP BY Year, Month;


-- 💰 Query 2: Total Revenue by Month (SUM of Sales)
-- Calculate monthly total revenue using Units_Sold * Unit_Price
SELECT
  strftime('%Y', Date) AS Year,
  strftime('%m', Date) AS Month,
  SUM(Units_Sold * Unit_Price) AS Total_Revenue
FROM OnlineSalesData
GROUP BY Year, Month
ORDER BY Year, Month;


-- 📦 Query 3: Order Volume (Sum of Units Sold)
-- Show total number of products sold per month
SELECT 
  CAST(strftime('%Y', Date) AS INTEGER) AS Year,
  CAST(strftime('%m', Date) AS INTEGER) AS Month,
  SUM(Units_Sold) AS Order_Volume
FROM OnlineSalesData
GROUP BY Year, Month
ORDER BY Year, Month;


-- 📊 Query 4: Sorted by Most Recent Month
-- Display revenue and volume sorted by latest month first
SELECT 
  strftime('%Y', Date) AS Year,
  strftime('%m', Date) AS Month,
  SUM(Units_Sold * Unit_Price) AS Total_Revenue,
  SUM(Units_Sold) AS Order_Volume
FROM OnlineSalesData
GROUP BY Year, Month
ORDER BY Year DESC, Month DESC;


-- ⏳ Query 5: Filter by Specific Time Period (Latest 6 Months)
-- Show revenue and volume for the last 6 months from 2024-08-27
SELECT 
  strftime('%Y', Date) AS Year,
  strftime('%m', Date) AS Month,
  SUM(Units_Sold * Unit_Price) AS Total_Revenue,
  SUM(Units_Sold) AS Order_Volume
FROM OnlineSalesData
WHERE Date >= DATE('2024-08-27', '-6 months')
GROUP BY Year, Month
ORDER BY Year DESC, Month DESC;