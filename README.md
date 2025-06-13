# Americas-Clothing-Retail-Sales-Performance-vs-Goals

![3](https://github.com/user-attachments/assets/a88db114-711e-4299-907f-b13f5312aedd)

**Project Summary: Retail Clothing Sales Analysis vs. Rolling Goals**

**Objective**
This project analyze will break in two two parts first part is how U.S retail clothing sales (NAICS 4481) performed compared to simulated rolling sales targets over time. My goal was to understand performance trends, identify underperforming periods, and demonstrate advanced data analysis with SQL and Tableua.

**Dataset**
• Source:* Federal Reserve Economic Data (FRED) (https://fred.stlouisfed.org/series/MRTSSM4481USN?utm_source=chatgpt.com)
• Coverage:* Monthly sales data, Jan 1992 - Mar 2025
• Focus: U.S. Clothing and accessories stores (in millions USD)

**Tools Used:**
• BigQuery SQL - For data modeling, goal logic, YoY joins
• Tableu - KPI cards, multi-axis trend lines and more visualization such as 5-Year Goal.

**Dashboards:**
• https://public.tableau.com/app/profile/dinara.ibotova/viz/MacroTrendAnalysisFRED1AmericasClothingRetailSalesPerformancevs_Goals/Dashboard1?publish=yes
• https://public.tableau.com/app/profile/dinara.ibotova/viz/AmericasClothingRetailSalesPerformancevs_Goals2/Dashboard1?publish=yes

**Key Findings:**


**Methods:**
• Data Import: Loaded CSV into Google BigQuery
• SQL Modeling: Created enhanced table with 5 year rolling goal & variance
• KPI Logic: defined underperforming as vs_goal < 0
• YoY Trends: Compared current year/month against prior year
• Visualization Built Tableau Dashboard with KPI cards, line chars, variance bars, and more.

*This concludes part 1 of the project*


