-- How many entries in the countries table are from Africa?
SELECT count(*) 
FROM countries 
WHERE continent = 'Africa';

-- What was the total population of the continent of Oceania in 2005?
SELECT sum(population_years.population)
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE countries.continent = 'Oceania'
	AND population_years.year = 2005;
	
-- What is the average population of countries in South America in 2003?
SELECT avg(population_years.population)
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE countries.continent = 'South America'
	AND population_years.year = 2003;
	
-- What country had the smallest population in 2007?
SELECT countries.name, 
	countries.continent,
	population_years.population
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE population_years.year = 2007
	AND population_years.population is NOT NULL
ORDER BY population_years.population
LIMIT 1;

-- What is the average population of Poland during the time period covered by this dataset?
SELECT avg(population_years.population)
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE countries.name = 'Poland';

-- How many countries have the word “The” in their name?
SELECT count(*)
FROM countries
WHERE name like '%the%';

-- What was the total population of each continent in 2010?
SELECT countries.continent, 
	sum(population_years.population)
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE population_years.year = 2010
GROUP BY 1;