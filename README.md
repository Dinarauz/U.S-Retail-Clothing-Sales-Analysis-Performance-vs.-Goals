# U.S Retail Clothing Sales Analysis - Retail Analytics & Performance Tracking

![3](https://github.com/user-attachments/assets/a88db114-711e-4299-907f-b13f5312aedd)

**Performance vs Rolling Goals (1992-2025)**

**Objective**
This project analyze how U.S retail clothing sales (NAICS 4481) performed over time compared to sales goals. It is structured in two parts and levearaging both SQL and Tableu to deliver data - driven insights and visual storytelling. My goal was to understand performance trends, identify underperforming periods, and demonstrate advanced data analysis with SQL and Tableau. Part 1 will focus on macro level trends using data from the Federeal Reserve Economic Data (FRED).

**Dataset**
*Source:* Federal Reserve Economic Data (FRED) (https://fred.stlouisfed.org/series/MRTSSM4481USN?)
*Coverage:* Monthly sales data, Jan 1992 - Mar 2025
*Focus:* U.S. Clothing and accessories stores (in millions USD)

**Tools Used:**
• BigQuery SQL - For data modeling, goal logic, YoY joins
• Google Cloud
• Tableau - KPI cards, multi-axis trend lines and more visualization such as 5-Year Goal.

**Dashboards:**
1. https://public.tableau.com/app/profile/dinara.ibotova/viz/MacroTrendAnalysisFRED1AmericasClothingRetailSalesPerformancevs_Goals/Dashboard1?publish=yes
2.  https://public.tableau.com/app/profile/dinara.ibotova/viz/AmericasClothingRetailSalesPerformancevs_Goals2/Dashboard1?publish=yes

**Key Findings:**
1. 2020 saw the most sharpest drop below goal, which aligns with the COVID-19 retail distruption.
2. 2021 - 2024 saw strong recovery - which shows variance to goal turned strongly positive.
3. 250 months underperformed across the full time period (between Jan 1992 - March 2025)
4. Max overperformance is $13.9 Million
5. Worst month: -$14.5 Million
6. Long - term growth trends are stabilitizing, but seasonal volatily remains.

**Key Steps:**
• Loaded sales data from FRED into BigQuery
• Created rolling 5-year average and 5% YoY goal benchmarks
• Calculated performance vs. goals (vs_goal)
• Analyzed underperforming months and YoY trends using SQL
• Built Tableau Dashboards with 
     • KPI cards
     • Trend lines
     • Performance variance bar charts

*This concludes part 1 of the project*

**Part 2: Retail Sector Breakdown (Census)**
Part 2 of this project expands from a single NAICS code (448) to a detailed breakdown of multiple retail sub-sectors within U.S. clothing and department stores. The objective was to analyze how each sector performed relative to 5-year rolling sales goals. 

**Dataset**
*Source:* Census - Retails sales: (https://www.census.gov/retail/sales.html)
*Coverage:* Monthly sales data, Jan 2023 - Mar 2025
*Focus:* Retail sub-sectors under NAICS 448, 4481, 44812, 44814, 44819, 4482, 4522, and 45221

**Tools Used**
-Python (pandas, matplotlib) for data cleaning, rolling goal logic and metric calc
-Tableau for dashboards
-Jupyter Notebooks for analysis
-Google Collab

**Dashboards:**
1. https://app.powerbi.com/groups/me/reports/58057680-9eb2-40b7-8a7b-c1429d568651/1135791d0231b5449e50?experience=power-bi
2. https://public.tableau.com/app/profile/dinara.ibotova/viz/RetailSectorAnalysisPart2/Dashboard1?publish=yes

**Key Findings**
1. all sectors exceeded their rolling goals - which led to 100% above goal rating
2. Family Clothing Stores led the performance ranking with an average of +10.7% above goal
3. Department Stores and Shoe Stores underperformed during the quarter 1 and quarter 3 months
4. Quarter 1 which is Jan - March shows consisted underperformance across sectors - highlights a seasonal demand dropping
5. Total sales across all sectors during the period exceeded $1.75 billion, with a net variance of $116 million above goal.
6. Sector - wide average % difference shows high variance, suggesting opportunities for more stable performance strtegies.
   

