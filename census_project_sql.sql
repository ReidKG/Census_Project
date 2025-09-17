select *
from population;

-- 1.Which states grew the fastest between 2010 and 2020?
select state,
(max(population) - min(population)) as growth,
ROUND(100.0 * (MAX(population) - MIN(population)) / MIN(population), 2) AS pct_growth
from population
where year between 2010 and 2020
group by state
order by pct_growth desc;

-- 2.What's the trend in median household income in all states
select state,
round(avg(median_household_income),0) as avg_income,
round(avg(pct_bachelors),1) as avg_bachleors,
round(avg(median_age),1) as avg_age
from population
where state in('Colorado', 'Virginia', 'West Virginia')
group by state
;

-- 3.What’s the trend in median household income in Texas from 2010 - 2020
select year, median_household_income
from population
where state = 'Texas'
order by year;

-- 4.Do states with higher bachelor’s degree % also have higher incomes?
select state, 
avg (pct_bachelors) as degree , avg(median_household_income) as income
from population
group by state
order by degree desc;

-- 5.Which states had the largest increase in median age over the decade?
select state,
(max(median_age) - min(median_age)) as growth
from population
group by state
order by growth desc
;

-- 6A.Which states have high population growth AND high INCOME growth?
select state,
(max(median_household_income) - min(median_household_income)) as income_increase
from population
group by state
order by income_increase desc
;

-- 6B.Which states have high POPULATION growth AND high income growth?
select state,
(max(population) - min(population)) as pop_increase
from population
group by state
order by pop_increase-- income_increase desc
;  

-- 7.Year by year income for 2 fastest growing stated vs one near bottom
SELECT state, year, median_household_income
FROM population
WHERE state IN ('Colorado', 'Virginia', 'West Virginia')
	and year between 2010 and 2020
ORDER BY state, year
;

-- Q8.Year by year percent bachelors
SELECT state, year, pct_bachelors
FROM population
WHERE state IN ('Colorado', 'Virginia', 'West Virginia')
and year between 2010 and 2020
ORDER BY state, year;

-- Q9.AverageOverDecade
SELECT state,
       ROUND(AVG(median_household_income),0) AS avg_income,
       ROUND(AVG(pct_bachelors),1) AS avg_bachelors,
       ROUND(AVG(median_age),1) AS avg_age
FROM population
WHERE state IN ('Colorado', 'Virginia', 'West Virginia')
GROUP BY state;


