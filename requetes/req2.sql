SET MARKUP HTML ON SPOOL ON HEAD "<TITLE>SQL*Plus Report</title> -
<STYLE TYPE='TEXT/CSS'><!--BODY {background: ffffc6} --></STYLE>"
SET ECHO OFF
SPOOL req2.htm
SELECT "nom" FROM RECETTES WHERE "idRecettes" IN (
    SELECT "recettes" FROM PLANNING HAVING COUNT("recettes") = (
        SELECT MAX(COUNT("recettes")) FROM PLANNING GROUP BY "recettes"
    )
    GROUP BY "recettes"
);
SPOOL OFF
SET MARKUP HTML OFF
SET ECHO ON