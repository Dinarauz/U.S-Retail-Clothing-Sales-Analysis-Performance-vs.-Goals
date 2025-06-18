CREATE OR REPLACE TABLE `census_retail.tableau_export_2025` AS
SELECT
  FORMAT_DATE('%Y-%m', date) AS month,
  naics_code,
  kind_of_business,
  sales_million,
  rolling_goal,
  sales_million - rolling_goal AS vs_goal,
  ROUND((sales_million - rolling_goal)/rolling_goal * 100, 2) AS percent_diff
FROM `census_retail.rolling_5yr_goal_2025`
WHERE rolling_goal IS NOT NULL;