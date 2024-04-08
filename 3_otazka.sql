

CREATE OR REPLACE VIEW third_q AS 
SELECT 
	tj.nazev_produktu,
	tj.rok,
	tj2.rok AS rok2,		
	round ((tj.prumerna_cena_produktu - tj2.prumerna_cena_produktu)/tj2.prumerna_cena_produktu * 100,2 ) AS rust_ceny,
	tj.prumerna_cena_produktu
FROM t_jaroslav_podobsky_project_sql_primary_final tj
	CROSS JOIN t_jaroslav_podobsky_project_sql_primary_final tj2
		ON tj. nazev_produktu = tj2. nazev_produktu
		AND tj. rok = tj2.rok -1
	GROUP BY nazev_produktu, tj2.rok
	ORDER BY nazev_produktu 
;


SELECT 
nazev_produktu,
round(avg(rust_ceny), 2) AS prumerny_rust_ceny
FROM third_q
GROUP BY nazev_produktu
ORDER BY prumerny_rust_ceny DESC



-- Náhledové příkazy / -- Preview commands

SELECT*
FROM  t_jaroslav_podobsky_project_SQL_primary_final;

SELECT 
rok ,
rust_ceny ,
nazev_produktu
FROM third_q
WHERE nazev_produktu LIKE 'Jakostní víno bílé'

--  WHERE nazev_produktu = 'máslo'
-- ORDER BY nazev_produktu

SELECT *
FROM third_q


	-- 