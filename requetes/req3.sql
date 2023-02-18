SET MARKUP HTML ON SPOOL ON HEAD "<TITLE>SQL*Plus Report</title> -
<STYLE TYPE='TEXT/CSS'><!--BODY {background: ffffc6} --></STYLE>"
SET ECHO OFF
SPOOL req3.htm
SELECT ingr."nom", 
COUNT(DISTINCT irec."recettes") AS "nb_de_recettes", 
COUNT (DISTINCT icat."categories") AS "nb_de_categories"
FROM INGREDIENTS ingr, INGREDIENTS_RECETTES irec, CATEGORIES_D_INGREDIENTS icat
WHERE ingr."idIngredients" = irec."ingredients" 
AND ingr."idIngredients" = icat."ingredients"
GROUP BY ingr."nom";
SPOOL OFF
SET MARKUP HTML OFF
SET ECHO ON