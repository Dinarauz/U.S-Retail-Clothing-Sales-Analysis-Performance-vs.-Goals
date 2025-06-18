--all codes from part 2

--cleaning
SELECT *
FROM `clothing-sales-analysis.census_retail.monthly_retail_sales_unadjusted`
LIMIT 10;

--rename columns
CREATE OR REPLACE TABLE `census_retail.retail_sales_2025_renamed` AS
SELECT
  `Date` AS date,
  `NAICS  Code` AS naics_code,
  `Kind of Business` AS kind_of_business,
  `Sales Million` AS sales_million
FROM `census_retail.monthly_retail_sales_unadjusted`;

--5 year goal per sector
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

---- Monthly sales trend by sector
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
