SET MARKUP HTML ON SPOOL ON HEAD "<TITLE>SQL*Plus Report</title> -
<STYLE TYPE='TEXT/CSS'><!--BODY {background: ffffc6} --></STYLE>"
SET ECHO OFF
SPOOL req2.htm
CREATE OR REPLACE FUNCTION replace_quantite(
  v_id_recette IN RECETTES."idRecettes"%TYPE,
  v_nb_persones IN RECETTES."nb_personnes"%TYPE
) RETURN CLOB IS
BEGIN
  DECLARE
    v_nb_persones_origin RECETTES."nb_personnes"%TYPE;
    CURSOR c_ingrs IS
      SELECT ir."ingredients", ir."quantite", i."nom", u."symbol"
        FROM INGREDIENTS_RECETTES ir, INGREDIENTS i, UNITES u
        WHERE ir."ingredients" = i."idIngredients" AND i."unites" = u."idUnites" AND ir."recettes" = v_id_recette;
    v_res CLOB := 'INGREDIENTS :' || CHR(10);
  BEGIN 
    SELECT "nb_personnes" INTO v_nb_persones_origin FROM RECETTES WHERE "idRecettes" = v_id_recette;
    FOR v_ingr IN c_ingrs LOOP
      v_res := v_res || '  * ' || v_ingr."nom" || ' (quantité : ' || (v_ingr."quantite" / v_nb_persones_origin) * v_nb_persones || ' ' || v_ingr."symbol" || ')' || CHR(10);
    END LOOP;

    RETURN v_res;
  END;
END;
/
SELECT * FROM RECETTES WHERE "recettes"=1;
BEGIN
  dbms_output.put_line(replace_quantite(1, 6));
END;
/
SELECT * FROM RECETTES WHERE "recettes"=1;
SPOOL OFF
SET MARKUP HTML OFF
SET ECHO ON