SELECT *
FROM `clothing-sales-analysis.census_retail.retail_sales_2025_renamed`
WHERE naics_code IN (448, 4481, 44812, 44814, 44819, 4482, 4522, 45221)
ORDER BY date;

SELECT
  naics_code,
  kind_of_business,
  FORMAT_DATE('%Y-%m', date) AS month,
  SUM(sales_million) AS total_sales_million
FROM `clothing-sales-analysis.census_retail.retail_sales_2025_renamed`
WHERE naics_code IN (448, 4481, 44812, 44814, 44819, 4482, 4522, 45221)
GROUP BY naics_code, kind_of_business, month
ORDER BY month;

CREATE OR REPLACE TABLE `census_retail.rolling_5yr_goal_2025` AS
SELECT
  *,
  ROUND(AVG(sales_million) OVER (
    PARTITION BY naics_code
    ORDER BY date
    ROWS BETWEEN 60 PRECEDING AND 1 PRECEDING
  ), 2) AS rolling_goal
FROM `clothing-sales-analysis.census_retail.retail_sales_2025_renamed`;

SELECT
  date,
  naics_code,
  kind_of_business,
  sales_million,
  rolling_goal,
  sales_million - rolling_goal AS vs_goal,
  ROUND((sales_million - rolling_goal) / rolling_goal * 100, 2) AS percent_diff
FROM `census_retail.rolling_5yr_goal_2025`
WHERE rolling_goal IS NOT NULL;