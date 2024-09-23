--4.1
/* No, because of the 1 M relationship */
--4.2
/* No, because there is no fips '80' */
--4.3
/* Close to what we had in class, so yes*/
--4.5
/* yes, it describes the tables correctly*/
--4.6
WITH latest_year AS (
    -- Find the most recent year in the income table
    SELECT MAX(year) AS recent_year
    FROM income
)

SELECT n.name, i.income, i.year
FROM income i
JOIN name n ON i.fips = n.fips
JOIN latest_year ly ON i.year = ly.recent_year
ORDER BY i.income DESC
LIMIT 1;

/* Yes, the code worked in PgAdmin and gave DC as the highest income*/
--4.7
WITH va_population AS (
    -- Get population data for Virginia over the last 5 years
    SELECT pop, year
    FROM population
    WHERE fips = '51' -- VA FIPS code
    ORDER BY year DESC
    LIMIT 1 OFFSET 5 -- To get the population from 5 years ago
),

recent_population AS (
    -- Get the most recent population data for Virginia
    SELECT pop AS recent_pop
    FROM population
    WHERE fips = '51'
    ORDER BY year DESC
    LIMIT 1 -- Most recent year
)

SELECT 
    (rp.recent_pop - vp.pop) * 100.0 / vp.pop AS growth_rate_percentage
FROM va_population vp, recent_population rp;

/* prompt= calculate the VA population growth rate for the past five
years as a percentage */
/* had to adjust the prompt, it returned 2.512 for the past 5 years*/
--4.8
/* yes, it just specific answers to the question you ask. */
