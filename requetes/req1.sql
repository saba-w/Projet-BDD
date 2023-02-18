SET MARKUP HTML ON SPOOL ON HEAD "<TITLE>SQL*Plus Report</title> -
<STYLE TYPE='TEXT/CSS'><!--BODY {background: ffffc6} --></STYLE>"
SET ECHO OFF
SPOOL req1.htm
SELECT "idRecettes", "nom" 
  FROM RECETTES r WHERE "calories" / "nb_personnes" < 200
      AND r."idRecettes" NOT IN (
          SELECT "idRecettes" FROM RECETTES WHERE "idRecettes" IN (
              SELECT "recettes" FROM INGREDIENTS_RECETTES WHERE "ingredients" IN (
                  SELECT ir."ingredients" FROM REGIME r, INGREDIENTS_INTERDITS ir
                  WHERE r."idRecettes" = ir."regime" AND r."nom" = 'Sans gluten'
                )
            )
        )
      AND r."idRecettes" IN (
          SELECT DISTINCT "recettes" FROM PLANNING WHERE "recettes" = r."idRecettes"
);
SPOOL OFF
SET MARKUP HTML OFF
SET ECHO ON