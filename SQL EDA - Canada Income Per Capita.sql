
-- All Data (Canada Income Per Capita - 1976 to 2019):
SELECT * 
FROM income_per_capita

-- Data Per Year:
SELECT year, AVG(average_income), AVG(median_income)
FROM income_per_capita
GROUP BY year
ORDER BY AVG(average_income) DESC

-- Top 3 years (with highest average income)
SELECT year, AVG(average_income) AS average_income, AVG(median_income) AS median_income
FROM income_per_capita
GROUP BY year
ORDER BY AVG(average_income) DESC
LIMIT 3

-- Bottom 3 years (with least average income)
SELECT year, AVG(average_income) AS average_income, AVG(median_income) AS median_income
FROM income_per_capita
GROUP BY year
ORDER BY AVG(average_income) ASC
LIMIT 3

-- Data Per Province:
SELECT province, AVG(average_income) AS by_average_income, AVG(median_income) AS median_income
FROM income_per_capita
GROUP BY province
ORDER BY AVG(average_income) DESC

-- Top 3 Provinces (Average Income):
SELECT province AS top_3_provinces, AVG(average_income) AS by_average_income, AVG(median_income) AS median_income
FROM income_per_capita
GROUP BY province
ORDER BY AVG(average_income) DESC
LIMIT 3

-- Top 3 Provinces (Median Income):
SELECT province AS top_3_provinces, AVG(average_income) AS average_income, AVG(median_income) AS by_median_income
FROM income_per_capita
GROUP BY province
ORDER BY AVG(median_income) DESC
LIMIT 3

-- Bottom 3 Provinces (Average Income):
SELECT province AS bottom_3_provinces, AVG(average_income) AS by_average_income, AVG(median_income) AS median_income
FROM income_per_capita
GROUP BY province
ORDER BY AVG(average_income) ASC
LIMIT 3

-- Bottom 3 Provinces (Median Income):
SELECT province AS bottom_3_provinces, AVG(average_income) AS average_income, AVG(median_income) AS by_median_income
FROM income_per_capita
GROUP BY province
ORDER BY AVG(median_income) ASC
LIMIT 3

-- Top 3 Provinces (average income in the 21st Century)
SELECT province AS top_3_provinces, AVG(average_income) AS by_average_income_in_21st_century, AVG(median_income) AS median_income
FROM income_per_capita
WHERE year IN ('2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019')
GROUP BY province
ORDER BY AVG(average_income) DESC
LIMIT 3

-- Bottom 3 Provinces (average income in the 21st Century)
SELECT province AS bottom_3_provinces, AVG(average_income) AS by_average_income_in_21st_century, AVG(median_income) AS median_income
FROM income_per_capita
WHERE year IN ('2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019')
GROUP BY province
ORDER BY AVG(average_income) ASC
LIMIT 3

-- Province (peak and lowest income - average and median)
SELECT province, MAX(average_income) AS peak_average_income, MIN(average_income) AS lowest_average_income, MAX(median_income) AS peak_median_income, MIN(median_income) AS lowest_median_income
FROM income_per_capita
GROUP BY province
ORDER BY province ASC

