-- Tvorba náhledů k sekundární tabulce

CREATE OR REPLACE VIEW third_support_document AS
SELECT DISTINCT 
c.country AS stat,
c.population AS populace,
c.continent AS kontinent,
c.region_in_world AS region1
FROM  countries c 
WHERE c.continent = 'Europe';

SELECT *
FROM third_support_document tsd 


CREATE OR REPLACE VIEW fourth_support_document AS
SELECT DISTINCT 
e.year AS rok,
e.country AS stat2,
e.GDP AS HDP,
e.gini AS GINI,
e.population AS populace_ec
FROM  economies e 
WHERE e.gini IS NOT NULL 
AND e.GDP IS NOT NULL 
AND e.`year` BETWEEN 2006 AND 2018
;


CREATE OR REPLACE TABLE t_jaroslav_podobsky_project_SQL_secondary_final AS 
SELECT 
fsd.rok,
tsd.stat,
fsd.HDP,
fsd.GINI,
tsd.populace
FROM third_support_document tsd 
JOIN fourth_support_document fsd 
ON tsd.stat = fsd.stat2
GROUP BY stat ,rok 
ORDER BY stat
;


-- Náhledové příkazy / -- Preview commands

SELECT * -- má pouze 244 záznamů tak u připojované tabulky provedeme DISTINCT -- lze fitrovat kontinent a region IN world
FROM countries c 

SELECT *
FROM economies e  


SELECT*
FROM t_jaroslav_podobsky_project_SQL_secondary_final;

SELECT*
FROM  t_jaroslav_podobsky_project_SQL_primary_final;

	-- 