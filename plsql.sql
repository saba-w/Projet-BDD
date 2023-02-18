--1
--Définir une fonction qui change le nom d’un ingrédient par un autre dans les étapes de
--réalisation d’une recette
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

--2
--Définir une fonction qui retourne la liste des ingrédients où la quantité d’ingrédient a été
--adaptée pour un nombre de personnes différent du nombre de personnes de la recette
--d’origine
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

--3
--Définir une procédure qui crée une copie de recette où certains ingrédients ont été
--remplacés par d’autres équivalents et où le nombre de personnes peut-être différent de
--celui de la recette originale.


--4
--Définir une fonction qui retourne un booléen si la recette ne contient que des ingrédients
--valides pour un certain régime (« végétarien », « sans-gluten », …).
CREATE OR REPLACE FUNCTION recette_compatible_regime(
  v_id_recette IN RECETTES."idRecettes"%TYPE,
  v_regime IN REGIME."nom"%TYPE
) RETURN BOOLEAN IS
BEGIN
  DECLARE
    v_res BOOLEAN := TRUE;
    CURSOR c_recettes IS
      SELECT "recettes" FROM INGREDIENTS_RECETTES WHERE "ingredients" IN 
      (
        SELECT iir."ingredients" FROM REGIME r, INGREDIENTS_INTERDITS iir
        WHERE r."idRegime" = iir."regime" AND r."nom" = v_regime
      );
  BEGIN  
    FOR v_recette IN c_recettes LOOP
      IF v_recette."recettes" = v_id_recette THEN v_res := FALSE;
      END IF;
    END LOOP;

    RETURN v_res;
  END;
END;
/


--5??
--Définir une fonction qui génère une liste d’ingrédients à acheter.
--La liste d’ingrédient sera générée pour un utilisateur, à partir d’un planning de recette à
--réaliser, une liste d’ingrédients disponibles et la date estimée des achats.
CREATE OR REPLACE function genere_liste (
  user INTEGER,
  planning INTEGER, 
  liste DATE
) RETURN CLOB IS
  v_res CLOB :=  '';
BEGIN
  DECLARE 
    v_ingredient INGREDIENTS."idIngredients"%TYPE;
    CURSOR c_liste IS
      SELECT "ingredients" as v_ingredient FROM INGREDIENTS_RECETTES INNER JOIN PLANNING
        ON PLANNING.recettes = INGREDIENTS_RECETTES.recettes
        GROUP BY v_ingredient;
  BEGIN 
    FOR test IN c_liste LOOP
      INSERT INTO INGREDIENTS_TO_BUY VALUES(test.v_ingredient, user, 10, liste);
    END loop;
  COMMIT;
  END;
END;
/

--CREATE OR REPLACE FUNCTION liste (idUsers INTEGER)
--RETURN CHAR
--IS
    --curseur sur les planning 
--    CURSOR planning_curs IS
--        SELECT * FROM USERS U
--        NATURAL JOIN PLANNING
--        WHERE U.idUsers = idUsers;
--    planning_row planning_curs%ROWTYPE;

    --curseur sur les ingridients qui manquent
--    CURSOR ing_curs IS
--        SELECT * FROM INGREDIENTS;
--    ing_row ing_curs%ROWTYPE;
--    retour CHAR;
--BEGIN
--    retour := 'La liste des ingridients a achete :\n';
    
    --doubles boucle pour trouver les ingridients deans une recette
--    FOR planning_row IN plannig_curs
--    LOOP
--        FOR ing_row IN ing_curs
--        LOOP
--            IF (planning_row.idplanning = ing_row.idplanning)
--            THEN
                --on concatene le resultat dans le string sous forme d'une liste
--                retour := retour || ing_row.nom;
--                retour := retour || '\n';
--            END IF;
--        END LOOP;
--    END LOOP;
--    RETURN retour;
--END;
--/