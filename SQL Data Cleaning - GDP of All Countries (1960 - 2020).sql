-- Creating a backup for the data
CREATE TABLE gdp_data_cleaning AS
SELECT *
FROM gdp_data_sheet;

-- An overview of the data
SELECT *
FROM gdp_data_cleaning;


-- Check and confirming that there are no duplicates
WITH duplicate_check AS(
SELECT
	state,
	country,
	gdp,
	year,
	ROW_NUMBER () OVER (
		PARTITION BY state, country, gdp, year
		ORDER BY 
			country, gdp DESC)
FROM gdp_data_cleaning
)

SELECT *
FROM duplicate_check
WHERE row_number > 1;


-- Checking and confirming that there are no null values
SELECT *
FROM gdp_data_cleaning
WHERE year IS NULL OR rank IS NULL OR country IS NULL OR state IS NULL OR gdp IS NULL OR gdp_percent IS NULL;

-- Changing the data type for the 'year' column from text to smallint
ALTER TABLE gdp_data_cleaning
ALTER COLUMN year TYPE SMALLINT USING year::SMALLINT

-- Changing 'state' column name to continent
ALTER TABLE gdp_data_cleaning
RENAME COLUMN state TO continent;

-- Splitting the 'America' continent group to 'South America' and 'North America'
-- Based on data from https://www.countries-ofthe-world.com/countries-of-south-america.html
UPDATE gdp_data_cleaning
SET continent = 'South America'
WHERE country IN ('Argentina', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Guyana', 'Paraguay', 'Peru', 'Suriname', 'Uruguay', 'Venezuela', 'Falkland Islands', 'French Guiana', 'South Georgia', 'the South Sandwich Islands');

UPDATE gdp_data_cleaning
SET continent = 'North America'
WHERE continent = 'America';

-- Changing Congo (gold) to Congo (Kinshasa)
UPDATE gdp_data_cleaning
SET country = 'Congo (Kinshasa)'
WHERE country = 'Congo (Gold)';



