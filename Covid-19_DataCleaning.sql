/* 
Covid-19 Data Cleaning 
*/


--Calculating World's total number of cases, total number of mortalities and World-wide mortality rate.
--As continent column contain Null values, we will fiter it out in order to calculate values only for those continents which are included in our world.

SELECT
SUM(new_cases) AS Total_Cases,
SUM(new_deaths) AS Total_Deaths,
(SUM(new_deaths)/SUM(new_cases))*100 AS Mortality_Rate
FROM
Portfolio_Project.dbo.Covid_Deaths
WHERE
continent is not NULL
ORDER BY 
1,
2


--Verifying that accumulated continent data has been filtered out.
--Checking it by setting the location to World.

SELECT
SUM(new_cases) AS Total_Cases,
SUM(new_deaths) AS Total_Deaths,
(SUM(new_deaths)/SUM(new_cases))*100 AS Mortality_Rate
FROM
Portfolio_Project.dbo.Covid_Deaths
WHERE
location = 'World'
ORDER BY 
1,
2


--Calculating Continent-wise highest infection count and Population infection rate.

SELECT
location,
population,
MAX(CAST(total_cases AS int)) AS Highest_Infection_Count, 
MAX((CAST(total_cases AS int)/population))*100 AS Percent_Population_Infected
FROM
Portfolio_Project.dbo.Covid_Deaths
WHERE
continent is NULL AND location != 'World' AND location != 'European Union' AND location != 'High Income' AND location != 'Lower middle income' AND location != 'Low income' AND location != 'Upper middle income'   
GROUP BY
location,
population
ORDER BY
Percent_Population_Infected desc


--Calculating Country-wise highest infection count and Population infection rate

SELECT
location,
population,
MAX(CAST(total_cases AS int)) AS Highest_Infection_Count,
MAX((CAST(total_cases AS int)/population))*100 AS Percent_Population_Infected
FROM
Portfolio_Project.dbo.Covid_Deaths
WHERE
location != 'World' AND location != 'European Union' AND location != 'High Income' AND location != 'Lower middle income' AND location != 'Low income' AND location != 'Upper middle income'   
GROUP BY
location,
population
ORDER BY
Percent_Population_Infected desc


--Checking for duplicates, confirming number of countries and total count of covid data entries reported by each country on daily basis.

SELECT 
location, 
COUNT(*) AS Total_Entries
FROM 
Portfolio_Project.dbo.Covid_Deaths
WHERE
location != 'World' AND location != 'European Union' AND location != 'High Income' AND location != 'Lower middle income' AND location != 'Low income' AND location != 'Upper middle income' AND location != 'Africa' AND location != 'Oceania' AND location != 'Europe' AND location != 'North America' AND location != 'South America' AND location != 'Asia'    
GROUP BY 
location
ORDER BY
1


--Filtering out countries that have not reported their Covid-19 data to WHO and have NULL values in their Total cases column.

SELECT
location,
population,
MAX(CAST(total_cases AS int)) AS Highest_Infection_Count,
MAX((CAST(total_cases AS int)/population))*100 AS Percent_Population_Infected
FROM
Portfolio_Project.dbo.Covid_Deaths
WHERE
total_cases is not NULL AND continent is not NULL OR location != 'World' AND location != 'European Union' AND location != 'High Income' AND location != 'Lower middle income' AND location != 'Low income' AND location != 'Upper middle income' AND location != 'Africa' AND location != 'Oceania' AND location != 'Europe' AND location != 'North America' AND location != 'South America' AND location != 'Asia' 
GROUP BY
location,
population
ORDER BY
Percent_Population_Infected desc


-- Filtering out locations which form part of the United Kingdom.

SELECT
location,
population,
MAX(CAST(total_cases AS int)) AS Highest_Infection_Count,
MAX((CAST(total_cases AS int)/population))*100 AS Percent_Population_Infected
FROM
Portfolio_Project.dbo.Covid_Deaths
WHERE
total_cases IS NOT NULL AND continent is NOT NULL OR location != 'World' AND location != 'European Union' AND location != 'High Income' AND location != 'Lower middle income' AND location != 'Low income' AND location != 'Upper middle income' AND location != 'Africa' AND location != 'Oceania' AND location != 'Europe' AND location != 'North America' AND location != 'South America' AND location != 'Asia' AND location != 'England' AND location != 'Northern Ireland' AND location != 'Wales' AND location != 'Scotland'    
GROUP BY
location,
population
ORDER BY
Percent_Population_Infected desc


--Country reports for Covid-19 infection rate logged by date.
--Sorted countries with highest covid infection rate

SELECT
location,
population,
date,
MAX(CAST(total_cases AS int)) AS Highest_Infection_Count,
MAX((CAST(total_cases AS int)/population))*100 AS Percent_Population_Infected
FROM
Portfolio_Project.dbo.Covid_Deaths
WHERE 
total_cases IS NOT NULL AND continent is NOT NULL OR location != 'World' AND location != 'European Union' AND location != 'High Income' AND location != 'Lower middle income' AND location != 'Low income' AND location != 'Upper middle income' AND location != 'Africa' AND location != 'Oceana' AND location != 'Europe' AND location != 'North America' AND location != 'South America' AND location != 'Asia' AND location != 'England' AND location != 'Northern Ireland' AND location != 'Wales' AND location != 'Scotland'
GROUP BY
location,
population,
date
ORDER BY
Percent_Population_Infected DESC
  

--Changing date format from DATETIME data type to DATE (YYYY-MM-DD)

SELECT
location,
population,
CONVERT(varchar, date, 23) AS Date_NewFormat,
MAX(CAST(total_cases AS int)) AS Highest_Infection_Count,
MAX((CAST(total_cases AS int)/population))*100 AS Percent_Population_Infected
FROM
Portfolio_Project.dbo.Covid_Deaths
WHERE 
total_cases IS NOT NULL AND continent is NOT NULL OR location != 'World' AND location != 'European Union' AND location != 'High Income' AND location != 'Lower middle income' AND location != 'Low income' AND location != 'Upper middle income' AND location != 'Africa' AND location != 'Oceana' AND location != 'Europe' AND location != 'North America' AND location != 'South America' AND location != 'Asia' AND location != 'England' AND location != 'Northern Ireland' AND location != 'Wales' AND location != 'Scotland'
GROUP BY
location,
population,
date
ORDER BY
Percent_Population_Infected DESC
  
