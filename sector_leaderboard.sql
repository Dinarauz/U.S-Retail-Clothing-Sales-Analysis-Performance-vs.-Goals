-- Sector leaderboard: Avg vs_goal and percent_diff by NAICS
SELECT
  naics_code,
  kind_of_business,
  ROUND(AVG(sales_million - rolling_goal), 2) AS avg_vs_goal,
  ROUND(AVG((sales_million - rolling_goal) / rolling_goal) * 100, 2) AS avg_percent_diff
FROM `census_retail.rolling_5yr_goal_2025`
WHERE rolling_goal IS NOT NULL
GROUP BY naics_code, kind_of_business
ORDER BY avg_percent_diff DESC;