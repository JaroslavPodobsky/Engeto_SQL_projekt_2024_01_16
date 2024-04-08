
SELECT 
	tf.stat,
	tf.rok,
	fq.rok,
	tf.HDP,
	lag(tf.HDP) OVER (ORDER BY tf.rok) AS HDP_min_rok,
	ROUNd((tf.HDP - (lag(tf.HDP) OVER (ORDER BY tf.rok))) * 100 / (lag(tf.HDP) OVER (ORDER BY tf.rok)), 2) AS rust_HDP,
	fq.rust_ceny,
	fq.rust_mezd
FROM t_jaroslav_podobsky_project_sql_secondary_final tf
	JOIN fifth_q fq
 		ON fq.predchozi_rok= tf.rok
WHERE tf.stat = 'Czech Republic'
;



-- Náhledové příkazy / -- Preview commands

SELECT*
FROM fifth_q  


SELECT*
FROM  t_jaroslav_podobsky_project_SQL_primary_final;

SELECT*
FROM t_jaroslav_podobsky_project_SQL_secondary_final;


	-- 
