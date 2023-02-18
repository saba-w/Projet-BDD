SET MARKUP HTML ON SPOOL ON HEAD "<TITLE>SQL*Plus Report</title> -
<STYLE TYPE='TEXT/CSS'><!--BODY {background: ffffc6} --></STYLE>"
SET ECHO OFF
SPOOL req4.htm
SELECT usr."login" FROM USERS usr, RECETTES rec WHERE usr."idUsers" = rec."auteur_user"
    AND rec."auteur_user" NOT IN (
        SELECT "auteur_user" FROM RECETTES WHERE "idRecettes" IN (
            SELECT "recettes" FROM INGREDIENTS_RECETTES WHERE "ingredients" IN (
                SELECT inrec."ingredients" FROM REGIME rg, INGREDIENTS_INTERDITS inrec
                WHERE rg."idRegime" = inrec."regime" AND rg."nom" = 'Végétarien'
            )
        )
);
SPOOL OFF
SET MARKUP HTML OFF
SET ECHO ON