WITH mleko_chleb AS (
	SELECT 
		nazev_produktu,
		round(avg(prumerna_cena_produktu), 2) AS cena, 
		rok,
		round(avg(mzda_za_rok), 2) AS mzda
	FROM t_jaroslav_podobsky_project_SQL_primary_final
	WHERE nazev_produktu IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový') AND rok IN ('2006', '2018')
	GROUP BY 
		nazev_produktu,
		rok 
	ORDER BY 
		nazev_produktu,
		rok	
	)
	SELECT 
		rok,
		nazev_produktu,
		round((mzda/cena),0) AS 'KG/L'
	FROM mleko_chleb;


-- Náhledové příkazy / -- Preview commands

SELECT*
FROM  t_jaroslav_podobsky_project_SQL_primary_final;

	-- 
