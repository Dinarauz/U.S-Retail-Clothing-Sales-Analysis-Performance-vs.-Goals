-- Total variance by sector for 2025
SELECT
  naics_code,
  kind_of_business,
  SUM(sales_million) AS total_sales,
  SUM(rolling_goal) AS total_goal,
  ROUND(SUM(sales_million - rolling_goal), 2) AS total_vs_goal,
  ROUND((SUM(sales_million - rolling_goal) / SUM(rolling_goal)) * 100, 2) AS percent_diff
FROM `census_retail.rolling_5yr_goal_2025`
WHERE rolling_goal IS NOT NULL
GROUP BY naics_code, kind_of_business
ORDER BY percent_diff DESC;
