-- Otázka č.2 


CREATE OR REPLACE VIEW first_q AS
SELECT
	nazev_odvetvi,
	rok,
	mzda_za_rok,
	LAG(mzda_za_rok) OVER (PARTITION BY nazev_odvetvi ORDER BY rok) AS predchozi_mzda_za_rok,	
	kod_odvetvi
FROM t_jaroslav_podobsky_project_SQL_primary_final
	WHERE typ_avg_hodnoty = 5958
		AND rok BETWEEN 2006 AND 2018
		AND fyz_prepocet = 200
		AND mzda_za_rok IS NOT NULL 
GROUP BY  nazev_odvetvi, rok
;

-- data points index in time / pro časové řady
SELECT
	rok,
	nazev_odvetvi,
	predchozi_mzda_za_rok,
	mzda_za_rok,
	ROUNd((mzda_za_rok - predchozi_mzda_za_rok) / predchozi_mzda_za_rok  * 100,2) AS rust_mezd
FROM first_q 
	WHERE predchozi_mzda_za_rok IS NOT null
GROUP BY  nazev_odvetvi, rok
;

-- mzdy v odvětvích
-- růst mezd mezi roky 2006 a 2007, 2017 a 2018, 2007 a 2018

SELECT 
	a.nazev_odvetvi,
	a.rok_2007,
	b.rok_2018,
	a.mzda_za_rok07,
	b.mzda_za_rok18,
	a.rust_mezd_06_07,
	b.rust_mezd_17_18,
	ROUNd((b.mzda_za_rok18 - a.mzda_za_rok07) / a.mzda_za_rok07  * 100,2) AS rust_mezd_07_18
From(
	SELECT
		rok AS rok_2007,
		nazev_odvetvi,
		predchozi_mzda_za_rok AS predchozi_mzda_za_rok07,
		mzda_za_rok AS mzda_za_rok07,
		ROUNd((mzda_za_rok - predchozi_mzda_za_rok) / predchozi_mzda_za_rok  * 100,2) AS rust_mezd_06_07
	FROM first_q 
	WHERE rok = '2007'
) a
JOIN (
	SELECT
		rok AS rok_2018,
		nazev_odvetvi,
		predchozi_mzda_za_rok AS predchozi_mzda_za_rok18,
		mzda_za_rok AS mzda_za_rok18,
		ROUNd((mzda_za_rok - predchozi_mzda_za_rok) / predchozi_mzda_za_rok  * 100,2) AS rust_mezd_17_18
	FROM first_q 
		WHERE rok = '2018'
	) b ON a.nazev_odvetvi = b. nazev_odvetvi
 GROUP BY  nazev_odvetvi
 ORDER BY rust_mezd_07_18 DESC
;



-- Náhledové příkazy / -- Preview commands

SELECT*
FROM first_q  


	-- 

