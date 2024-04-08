-- Tvorba náhledů k primární tabulce

CREATE OR REPLACE VIEW first_support_document AS
SELECT
	cpib.name AS nazev_odvetvi,
	cp.industry_branch_code AS kod_odvetvi,
	cp.payroll_year AS roky,
	cp.value AS mzda_za_rok,
	cp.calculation_code AS fyz_prepocet,
	cp.value_type_code AS typ_avg_hodnoty,
	cp.unit_code AS kod_kategorie,
	cpc.name AS cpc_nazev,
	cpvt. name AS nazev_kat
FROM czechia_payroll cp 
	JOIN czechia_payroll_calculation cpc 
		ON cp.calculation_code=cpc.code 		
	JOIN czechia_payroll_industry_branch cpib 
		ON cp.industry_branch_code=cpib.code
	JOIN czechia_payroll_unit cpu 
		ON cp.unit_code = cpu.code
	JOIN czechia_payroll_value_type cpvt 
		ON cp.value_type_code =cpvt.code
	WHERE value !=316 AND value IS NOT NULL AND calculation_code = '200'
		AND  unit_code= '200' 
	GROUP BY cp.payroll_year, cp.industry_branch_code
;

-- nahled první tabulky
SELECT*
FROM  first_support_document;
-- __________________________________________________________


-- Tvorba druhého náhledu

CREATE OR REPLACE VIEW second_support_document AS
SELECT 
		cpc.name AS nazev_produktu,
		YEAR(cp.date_to) AS Rok_uvedene_ceny_produktu,
		round(AVG (cp.value),2) AS prumerna_cena_produktu, -- zaokrouhlena prumerna cena
		date_format(cp.date_from, '%Y') AS rok,
		region_code
FROM czechia_price cp
	JOIN czechia_price_category cpc 
		ON cp.category_code = cpc.code 
	GROUP BY cpc.name, YEAR(cp.date_to)
;
	
-- nahled druhé tabulky
SELECT*
FROM  second_support_document ;



-- Tvorba primární tabulky z náhledů

CREATE OR REPLACE TABLE t_jaroslav_podobsky_project_SQL_primary_final
SELECT *
FROM first_support_document fsd  
	JOIN second_support_document ssd 
		ON  fsd.roky = ssd.rok_uvedene_ceny_produktu;

-- nahled primární tabulky
SELECT*
FROM  t_jaroslav_podobsky_project_SQL_primary_final;


	
-- Náhledové příkazy / -- Preview commands	

	SELECT*
	FROM  first_support_document 
	
	SELECT*
	FROM  czechia_payroll cp 
	
	SELECT*
	FROM  czechia_payroll_calculation cpc 
	
	SELECT *
	FROM czechia_payroll_unit cpu 
	
	SELECT*
	FROM  czechia_payroll_industry_branch cpib 
	
	SELECT*
	FROM  czechia_payroll_value_type cpvt 
	
	SELECT*
	FROM  czechia_price cp 
	
	-- 
	
	