--  yoy_comparison
WITH monthly_sales AS (
  SELECT
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month,
    SUM(sales_millions) AS total_sales
  FROM fred_sales.monthly_sales_enhanced
  GROUP BY year, month
),
yoy_comparison AS (
  SELECT
    curr.year AS current_year,
    curr.month,
    curr.total_sales AS current_sales,
    prev.total_sales AS prev_sales,
    curr.total_sales - prev.total_sales AS absolute_change,
    ROUND((curr.total_sales - prev.total_sales) / prev.total_sales * 100, 2) AS percent_change
  FROM monthly_sales curr
  JOIN monthly_sales prev
    ON curr.month = prev.month AND curr.year = prev.year + 1
)
SELECT * FROM yoy_comparison
ORDER BY current_year, month;
