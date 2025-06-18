-- Identify underperforming sectors and months
SELECT *
FROM (
  SELECT
    date,
    naics_code,
    kind_of_business,
    sales_million,
    rolling_goal,
    sales_million - rolling_goal AS vs_goal,
    ROUND((sales_million - rolling_goal) / rolling_goal * 100, 2) AS percent_diff
  FROM `census_retail.rolling_5yr_goal_2025`
  WHERE rolling_goal IS NOT NULL
)
WHERE vs_goal < 0
ORDER BY percent_diff ASC;