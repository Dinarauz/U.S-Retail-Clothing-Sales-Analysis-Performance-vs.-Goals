CREATE OR REPLACE TABLE fred_sales.monthly_sales_enhanced_5yrgoal AS
SELECT
  observation_date AS date,
  MRTSSM4481USN AS sales_millions,
  ROUND(AVG(MRTSSM4481USN) OVER (
    PARTITION BY EXTRACT(MONTH FROM observation_date)
    ORDER BY observation_date
    ROWS BETWEEN 60 PRECEDING AND 1 PRECEDING
  ), 2) AS rolling_goal,
  MRTSSM4481USN - ROUND(AVG(MRTSSM4481USN) OVER (
    PARTITION BY EXTRACT(MONTH FROM observation_date)
    ORDER BY observation_date
    ROWS BETWEEN 60 PRECEDING AND 1 PRECEDING
  ), 2) AS vs_goal
FROM fred_sales.monthly_sales;
