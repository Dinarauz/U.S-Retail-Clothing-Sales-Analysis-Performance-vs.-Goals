-- Monthly sales trend by sector
SELECT
  FORMAT_DATE('%Y-%m', date) AS month,
  naics_code,
  kind_of_business,
  SUM(sales_million) AS monthly_sales_million,
  SUM(rolling_goal) AS monthly_rolling_goal,
  ROUND(SUM(sales_million - rolling_goal), 2) AS monthly_vs_goal
FROM `census_retail.rolling_5yr_goal_2025`
WHERE rolling_goal IS NOT NULL
GROUP BY month, naics_code, kind_of_business
ORDER BY month, naics_code;
