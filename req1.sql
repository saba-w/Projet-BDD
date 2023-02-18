SET MARKUP HTML ON SPOOL ON HEAD "<TITLE>SQL*Plus Report</title> -
<STYLE TYPE='TEXT/CSS'><!--BODY {background: ffffc6} --></STYLE>"
SET ECHO OFF
SPOOL req1.htm
CREATE OR REPLACE FUNCTION change_name(
    v_id_recette IN RECETTES."idRecettes"%TYPE,
    v_source IN INGREDIENTS."idIngredients"%TYPE,
    v_dest IN INGREDIENTS."idIngredients"%TYPE
) RETURN CLOB IS 
BEGIN
  DECLARE
    CURSOR c_etapes IS 
      SELECT LOWER("nom") AS "name", LOWER("description") AS "descr", CONCAT("duree", 'min') AS "duration"
      FROM ETAPES WHERE "recettes" = v_id_recette ORDER BY "ordre";
    v_ingr_src INGREDIENTS."nom"%TYPE;
    v_ingr_dst INGREDIENTS."nom"%TYPE;
    v_res CLOB := '';
  BEGIN
    SELECT "nom" INTO v_ingr_src FROM INGREDIENTS WHERE "idIngredients" = v_source;
    SELECT "nom" INTO v_ingr_dst FROM INGREDIENTS WHERE "idIngredients" = v_dest;
    FOR v_etape IN c_etapes LOOP 
      v_res := v_res || REPLACE(v_etape."name", v_ingr_src, v_ingr_dst);
      v_res := v_res || CHR(10);
    END LOOP;

    RETURN v_res;
  END;
END;
/
SELECT * FROM INGREDIENTS_RECETTES WHERE "recettes"=1;
BEGIN
  dbms_output.put_line(change_name(1, 1, 13));
END;
/
SELECT * FROM INGREDIENTS_RECETTES WHERE "recettes"=1;
SPOOL OFF
SET MARKUP HTML OFF
SET ECHO ON