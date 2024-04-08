# Engeto_SQL_projekt_2024_01_16
Data for project no.1

# SQL_project_data_academy_16_01_2024
Analysis of basic foodstuffs availability

Název projektu: Dostupnost základních potravin široké veřejnosti 

Vypracoval: Jaroslav Podobský (Discord: jaroslavpodobsky_82628),( www.linkedin.com/in/jaroslav-p-72939315a )

<div class="badge-base LI-profile-badge" data-locale="cs_CZ" data-size="medium" data-theme="dark" data-type="VERTICAL" data-vanity="jaroslav-p-72939315a" data-version="v1"><a class="badge-base__link LI-simple-link" href="https://cz.linkedin.com/in/jaroslav-p-72939315a?trk=profile-badge">Jaroslav P.</a></div>



Datum odevzdání: 8.4.2024

Úvod do projektu
Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.

Potřebují k tomu od vás připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.

Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.

Výzkumné otázky

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce,
projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

Primární tabulky:
1. czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
2. czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.
3. czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
4. czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.
5. czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.
6. czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
7. czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.

Číselníky sdílených informací o ČR:
1. czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.
2. czechia_district – Číselník okresů České republiky dle normy LAU.

Dodatečné tabulky:
1. countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
2. economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.

Nahrané soubory:
1) PDF soubor: Podklad_k_projektu_SQL.PDF      
2) SQL dotaz: Prim_table_1.sql
3) SQL dotaz: Sec_table_2.sql
3) SQL dotaz: 1_otazka.sql
4) SQL dotaz: 2_otazka.sql
5) SQL dotaz: 3_otazka.sql
6) SQL dotaz: 4_otazka.sql
7) SQL dotaz: 5_otazka.sql

