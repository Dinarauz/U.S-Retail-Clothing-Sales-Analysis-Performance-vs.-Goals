# U.S Retail Clothing Sales Analysis - Retail Analytics & Performance Tracking

![3](https://github.com/user-attachments/assets/a88db114-711e-4299-907f-b13f5312aedd)

## Performance vs Rolling Goals (1992-2025)

**Objective**
Two-part analysis tracking how U.S. retail clothing sales performed against rolling 5-year goals. Part 1 covers macro trends from 1992-2025, Part 2 breaks down specific retail sectors from 2023-2025.

## Part 1: Macro Trend Analysis (FRED Data)
**The Goal**
Track U.S. clothing and accessories store sales (NAICS 4481) over 33 years to see when the industry hit or missed its targets compared to rolling 5-year averages.

**What I Found**
COVID Impact: 2020 had the sharpest drop below goal - no surprise given retail shutdowns
**Strong Recovery:** 2021-2024 bounced back hard with performance turning strongly positive

**Long-term Stats:**
• 250 months underperformed (out of ~400 months)
• Best month: +$13.9M above goal
• Worst month: -$14.5M below goal
• Long-term growth stabilizing but seasonal volatility continues

## Technical Approach
**Dataset**
*Source:* Federal Reserve Economic Data (FRED) (https://fred.stlouisfed.org/series/MRTSSM4481USN?)
*Coverage:* Monthly sales data, Jan 1992 - Mar 2025
*Focus:* U.S. Clothing and accessories stores (in millions USD)

**Tools Used:**
• BigQuery SQL for data modeling and goal calculations
• Google Cloud for data storage
• Tableau for visualization
     • KPI cards
     • Trend lines
     • Performance variance bar charts

**Analysis Steps:**
• Created rolling 5-year average benchmarks
• Applied 5% YoY goal logic
• Calculated variance to goal (vs_goal)
• Identified underperforming periods
• Built trend and variance visualizations

**Dashboards:**
1. https://public.tableau.com/app/profile/dinara.ibotova/viz/MacroTrendAnalysisFRED1AmericasClothingRetailSalesPerformancevs_Goals/Dashboard1?publish=yes
2.  https://public.tableau.com/app/profile/dinara.ibotova/viz/AmericasClothingRetailSalesPerformancevs_Goals2/Dashboard1?publish=yes

*This concludes part 1 of the project*

## Part 2: Retail Sector Breakdown (Census Data)
**The Expansion**
Zoomed into specific retail sub-sectors within clothing and department stores to see which categories outperformed and which struggled.

**What I Found**
All sectors beat their goals - 100% above-goal rating across the board

**Category Performance:**
• Winner: Family Clothing Stores (+10.7% above goal on average)
• Struggled: Department Stores and Shoe Stores in Q1 and Q3

**Seasonal Pattern:** Q1 (Jan-Mar) consistently underperformed across sectors - seasonal demand drop

**Financial Impact:**
• Total sales: $1.75 billion+ across all sectors
• Net variance: $116M above goal
• High variance suggests room for more stable strategies

## Technical Approach
**Dataset**
*Source:* Census - Retails sales: (https://www.census.gov/retail/sales.html)
*Coverage:* Monthly sales data, Jan 2023 - Mar 2025
*Focus:* Retail sub-sectors under NAICS 448, 4481, 44812, 44814, 44819, 4482, 4522, and 45221

**Tools Used**
• Python (pandas, matplotlib) for data cleaning, rolling goal logic and metric calc
• Jupyter Notebooks / Google Colab for analysis
• Tableau and Power BI for dashboards

**Analysis Process:**
• Applied rolling goal logic per sector
• Calculated performance metrics and % variance
• Identified seasonal patterns by quarter
• Ranked sectors by goal achievement

**Dashboards:**
1. **Power BI:** https://github.com/Dinarauz/U.S-Retail-Clothing-Sales-Analysis-Performance-vs.-Goals/blob/main/visuals/retail%20part%202-2.pdf (For interactive Power BI dashboard please send me your email: https://app.powerbi.com/groups/me/reports/58057680-9eb2-40b7-8a7b-c1429d568651/1135791d0231b5449e50?experience=power-bi)
2. **Tableau:** https://public.tableau.com/app/profile/dinara.ibotova/viz/RetailSectorAnalysisPart2/Dashboard1?publish=yes

## Business Insights
**Macro Level (Part 1):**
• The industry is resilient - recovered from COVID faster than expected
• Long-term growth is stabilizing, but watch for seasonal dips
• 250 underperforming months over 33 years shows consistent challenges hitting targets

**Sector Level (Part 2):**
• Family Clothing Stores are doing well
• Q1 weakness across sectors suggests inventory or marketing adjustments needed for Jan-Mar
• Department Stores and Shoe Stores need Q1/Q3 strategies to reduce seasonal vulnerability
• High variance despite beating goals means performance is unpredictable

## Project Structure
**Part 1: SQL + BigQuery**
• Complex date joins for YoY comparisons
• Rolling average calculations
• Performance variance logic

**Part 2: Python + Multi-platform viz**
• Data cleaning and transformation
• Sector-specific metric calculations
• Cross-platform dashboard creation (Tableau + Power BI)
