## 🔄 Project Lifecycle
**Step 1: [Data Cleaning & Transformation](LINK_TO_CLEANING_REPO)** ⬅️
The raw data underwent a rigorous cleaning process (removing duplicates, fixing nulls, and standardizing types) before analysis.

**Step 2: Exploratory Data Analysis (Current Repository)** ➡️
This stage focuses on extracting actionable insights and trends from the cleaned dataset.


# SQL-Exploratory-Data-Analysis-Global-Layoffs-Trends
Following the successful cleaning and standardization of the global layoffs dataset, this project focuses on Exploratory Data Analysis (EDA). Using advanced MySQL queries, I investigated the data to uncover patterns, identify the industries most impacted by economic shifts, and track the progression of layoffs over time.
Key Analytical Deep-Dives

High-Level Summary Statistics
Identified the companies with the highest total layoffs and those that completely shut down (100% layoff rate).

Analyzed the relationship between the stage of the company (Seed, Series A, Post-IPO) and the volume of layoffs.

Time-Series & Trend Analysis
Rolling Totals: Created a month-over-month rolling total of layoffs using Window Functions to visualize the acceleration of job losses over a three-year period.

Yearly Comparisons: Aggregated data by year to identify which specific years acted as the "peak" for the tech industry downturn.

Segmented Industry & Geographic Insights
Ranked industries (e.g., Consumer, Retail, Transportation) by total job losses to identify sector-specific vulnerability.

Grouped layoffs by country to determine which global markets faced the most significant workforce reductions.

Advanced Ranking & CTEs
Top 5 Yearly Rankings: Utilized multiple Common Table Expressions (CTEs) and DENSE_RANK() to create a top-5 list of companies with the most layoffs for each individual year, providing a granular look at industry leaders during the crisis.

Technical SQL Skills Demonstrated
Window Functions: SUM() OVER(ORDER BY ...) for rolling totals and DENSE_RANK() OVER(PARTITION BY ...) for segmented rankings.

Date Manipulation: Extensive use of YEAR(), SUBSTRING(), and time-based grouping.

Complex Aggregations: Multi-level GROUP BY and ORDER BY operations to pivot data for specific insights.

Multi-Layered CTEs: Structuring readable and efficient queries for advanced ranking logic.
