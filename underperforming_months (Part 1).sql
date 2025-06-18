-- Preview data
SELECT * FROM fred_sales.monthly_sales LIMIT 10;

CREATE OR REPLACE TABLE fred_sales.monthly_sales_enhanced AS
SELECT
  observation_date AS date,
  MRTSSM4481USN AS sales_millions,
  LAG(MRTSSM4481USN, 12) OVER (ORDER BY observation_date) * 1.05 AS goal,
  MRTSSM4481USN - (LAG(MRTSSM4481USN, 12) OVER (ORDER BY observation_date) * 1.05) AS vs_goal
FROM fred_sales.monthly_sales;

-- Identify underperforming months
SELECT
  date,
  sales_millions,
  goal,
  vs_goal
FROM fred_sales.monthly_sales_enhanced
WHERE vs_goal < 0
ORDER BY vs_goal ASC;
