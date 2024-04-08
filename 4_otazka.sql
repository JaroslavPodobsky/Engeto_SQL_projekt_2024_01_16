CREATE OR REPLACE VIEW fourth_q AS 
SELECT
	rok,
	round(avg(mzda_za_rok),0) AS prumerna_mzda,
	round(avg(prumerna_cena_produktu),2) AS prumerna_cena
FROM  t_jaroslav_podobsky_project_SQL_primary_final
	WHERE nazev_kat 
		IN ('Průměrná hrubá mzda na zaměstnance')
GROUP BY rok 
ORDER BY nazev_produktu, roky 
;
-- dopočet z view

CREATE OR REPLACE VIEW fifth_q AS 
SELECT
	fq2.rok AS predchozi_rok,
	fq.rok,
	round((fq.prumerna_cena - fq2.prumerna_cena) / fq2.prumerna_cena * 100, 1) AS rust_ceny,
	round((fq.prumerna_mzda- fq2.prumerna_mzda) / fq2.prumerna_mzda * 100, 1) AS rust_mezd
FROM  fourth_q  fq
	JOIN fourth_q fq2
		ON fq2.rok +1  =fq.rok
GROUP BY rok 
ORDER BY rust_ceny DESC
;




-- Náhledové příkazy / -- Preview commands

SELECT*
FROM fourth_q 

SELECT*
FROM fifth_q  

SELECT*
FROM  t_jaroslav_podobsky_project_SQL_primary_final;


	-- 


