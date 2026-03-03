# Census SQL Analysis Project

## 📌 Overview
This project analyzes U.S. census-style data (2010–2020) to practice SQL skills and demonstrate real-world data analysis.  
The dataset includes **population, median age, median household income, and percent of adults with a bachelor’s degree** for each U.S. state.  

I used SQL in MySQL Workbench to answer **8 analytical questions**, then summarized the findings in plain English.  

---

## 🛠️ Tools
- **Database:** MySQL (via MySQL Workbench)  
- **Language:** SQL  
- **Visualization:** Excel / Google Sheets (for charts)  

---

*Finding:* Tests correlation between education and income across states.  

---

### 4. Which states had the largest increase in median age over the decade?  
```sql
SELECT state,
       MAX(median_age) - MIN(median_age) AS age_increase
FROM population
WHERE year BETWEEN 2010 AND 2020
GROUP BY state
ORDER BY age_increase DESC
LIMIT 10;
```
*Finding:* Highlights aging states (Midwest/Northeast tend to lead).  

---

### 5. Which states have high population growth AND high income growth?  
```sql
SELECT state,
       ROUND(100.0 * (MAX(population) - MIN(population)) / MIN(population), 2) AS pct_pop_growth,
       ROUND(100.0 * (MAX(median_household_income) - MIN(median_household_income)) / MIN(median_household_income), 2) AS pct_income_growth
FROM population
WHERE year BETWEEN 2010 AND 2020
GROUP BY state
HAVING pct_pop_growth > 15 AND pct_income_growth > 20
ORDER BY pct_income_growth DESC;
```
*Finding:* Identifies states succeeding on both fronts.  

---

### 6. Median Household Income Trend (Colorado, Virginia, West Virginia)  
```sql
SELECT state, year, median_household_income
FROM population
WHERE state IN ('Colorado','Virginia','West Virginia')
  AND year BETWEEN 2010 AND 2020
ORDER BY state, year;
```
*Finding:* Compares income growth across 3 focus states (export to line chart).  

---

### 7. Education (% with Bachelor’s degree) Trend (Colorado, Virginia, West Virginia)  
```sql
SELECT state, year, pct_bachelors
FROM population
WHERE state IN ('Colorado','Virginia','West Virginia')
  AND year BETWEEN 2010 AND 2020
ORDER BY state, year;
```
*Finding:* Compares education levels across the same 3 states.  

---

### 8. Quick Summary Stats (Average over the Decade)  
```sql
SELECT state,
       ROUND(AVG(median_household_income), 0) AS avg_income,
       ROUND(AVG(pct_bachelors), 1) AS avg_bachelors,
       ROUND(AVG(median_age), 1) AS avg_age
FROM population
WHERE state IN ('Colorado','Virginia','West Virginia')
  AND year BETWEEN 2010 AND 2020
GROUP BY state;
```
*Finding:* Gives a neat side-by-side comparison table of income, education, and age.  

---

## 📈 Insights
- **Growth:** Colorado and Virginia grew quickly, while West Virginia declined.  
- **Income:** Texas and high-education states saw steady income gains.  
- **Education & Income:** Strong link between % with bachelor’s degree and median household income.  
- **Regional differences:** Aging in slower-growth states, youth + education in high-growth ones.  

---
