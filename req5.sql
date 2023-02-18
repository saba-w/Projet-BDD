SET MARKUP HTML ON SPOOL ON HEAD "<TITLE>SQL*Plus Report</title> -
<STYLE TYPE='TEXT/CSS'><!--BODY {background: ffffc6} --></STYLE>"
SET ECHO OFF
SPOOL req5.htm
SELECT "login", "username" AS "nom/prenom", "email" AS "adresse mail", "localisation" AS "adresse",
    (SELECT COUNT("idRecettes") FROM RECETTES WHERE "auteur_user" = USERS."idUsers") AS "nb_reccettes_creer",
    (SELECT COUNT("idIngredients") FROM INGREDIENTS WHERE "auteur" = USERS."idUsers") AS "nb_ingredients_creer",
    (SELECT COUNT(*) FROM USERS_INGREDIENTS WHERE "users" = USERS."idUsers") AS "nb_ingredients_chez_lui",
    (SELECT COUNT(*) FROM PLANNING WHERE "users" = USERS."idUsers" AND "date" >= SYSDATE) AS "nb_recettes_prévu_de_réaliser"
FROM USERS;
SPOOL OFF
SET MARKUP HTML OFF
SET ECHO ON
