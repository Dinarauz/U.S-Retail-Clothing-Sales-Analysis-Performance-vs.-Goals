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

