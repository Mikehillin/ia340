--4.1
/* No, because of the 1 M relationship */
--4.2
/* No, because there is no fips '80' */
--4.3
/* Close to what we had in class, so yes*/
--4.4
--4.5
/* yes, it describes the tables correctly*/
--4.6
select name.name, income.income, income.year
from income
join name on income.fips = name


--4.7
calculate the pop growth rate in VA for each year in the past 5 years 
store the growth rate in float
--4.8

