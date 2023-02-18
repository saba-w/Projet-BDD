--1
--Pas plus de 20 ingrédients par recettes.
CREATE OR REPLACE TRIGGER number_ingredients
  BEFORE INSERT
  ON INGREDIENTS_RECETTES
  FOR EACH ROW
BEGIN
  DECLARE
    v_nb_ingr NUMBER;
  BEGIN
    SELECT COUNT("ingredients") INTO v_nb_ingr
      FROM INGREDIENTS_RECETTES
      WHERE "recettes" = :new."recettes";
    IF v_nb_ingr >= 20 THEN
      raise_application_error(-20000, 'Pas plus de 20 ingrédients par recette !');
    END IF;
  END;
END;
/

--2
--La liste des ingrédients à acheter ne peut pas être générée plus d’un mois à l’avance.
CREATE OR REPLACE TRIGGER date_list_ingred
  BEFORE INSERT OR UPDATE
  ON INGREDIENTS_TO_BUY
  FOR EACH ROW
BEGIN
  BEGIN
    IF :new."date" >= ADD_MONTHS(SYSDATE, 1) THEN
      raise_application_error(-20000, 'La liste des ingrédients à acheter ne peut pas être générée plus d''un mois à l''avance !');
    END IF;
  END;
END;
/

--3
--La durée d’une recette est égale au moins au minimum de la durée de ses étapes.
CREATE OR REPLACE TRIGGER duration_recette
  BEFORE INSERT OR UPDATE
  ON RECETTES
  FOR EACH ROW
BEGIN
  DECLARE
    v_duree_etapes ETAPES."duree"%TYPE;
    v_duree_recette RECETTES."duree_total"%TYPE;
  BEGIN
    SELECT SUM("duree") INTO v_duree_etapes
      FROM ETAPES
      WHERE "recettes" = :new."idRecettes";
    SELECT "duree_total" INTO v_duree_recette
      FROM RECETTES
      WHERE "idRecettes" = :new."idRecettes";
    IF v_duree_recette < v_duree_etapes THEN
      raise_application_error(-20000, 'La durée d''une recette doit être égale au moins au minimum de la durée de ses étapes !');
    END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN NULL;
  END;
END;
/

--4??
--Le nombre de calorie d’une recette est similaire à celui de la somme des calories de ses
--ingrédients (+/- 20%).
CREATE OR REPLACE TRIGGER quantite_calories
AFTER UPDATE OR DELETE ON INGREDIENTS_RECETTES
FOR EACH ROW
DECLARE
    v_calories NUMERIC;
BEGIN
     SELECT "calories" into v_calories from INGREDIENTS where :INGREDIENTS_RECETTES."ingredients" = "idIngredients";
        UPDATE RECETTES SET RECETTES."calories" = RECETTES."calories" - (v_calories * :INGREDIENTS_RECETTES."quantite")
        WHERE :INGREDIENTS_RECETTES."recettes" = "idRecettes";
END;
/

--5
--Les plannings de recettes et la liste des courses sont archivés lorsqu’ils sont supprimés ou
--une fois les dates associées dépassées.

--CREATE OR REPLACE PROCEDURE enlever(a_idliste number)
--IS
--    l_id_planning PLANNING.("users", "recettes")%TYPE;
--    l_nb_date date%TYPE;

--    CURSOR l_liste IS 
--    SELECT * FROM INGREDIENTS_TO_BUY WHERE ("ingredients", "users") = a_idliste;

    
--BEGIN 

    --Load id planning
--    SELECT ("users", "recettes") INTO l_id_planning FROM INGREDIENTS_TO_BUY 
--    NATURAL JOIN RECETTES NATURAL JOIN PLANNING
--    WHERE ("ingredients", "users") = a_idliste;
--
--  
--
    --ADD ARCHIVES
--    INSERT INTO USER_INGREDIENTS_ARCHIVE VALUES ( l_ingredients
--				,l_users
--				,l_quantite
--				,l_date
--                                 );
--    
--    DELETE FROM INGREDIENTS_TO_BUY WHERE ("ingredients", "users") = a_idliste;
--
--    
--    COMMIT;
--
--END;
--/
