-- CDC KPI 
-- Leading Cause of Death
SELECT cause, SUM(Deaths) AS "Total Deaths"
FROM leading_causes
WHERE cause != 'All causes'
GROUP BY cause
ORDER BY "Total Deaths" DESC;

-- Leading Cause per State
SELECT state, cause, total_deaths
FROM (
    SELECT state, cause, SUM(deaths) AS total_deaths,
           ROW_NUMBER() OVER (PARTITION BY state ORDER BY SUM(deaths) DESC) AS rank
    FROM leading_causes
	WHERE cause != 'All causes'
    GROUP BY state, cause
) as ranked_causes
WHERE rank = 1
ORDER BY total_deaths desc;

-- Average Age Adjusted per Year
SELECT year, ROUND(AVG(age_adjusted), 2) AS "Average Age Adjusted Death Rate"
FROM leading_causes
GROUP BY Year
ORDER BY Year;