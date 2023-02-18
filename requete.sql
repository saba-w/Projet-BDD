--1
--Les recettes qui ont moins de 200 calories par personne,
--dont tous les ingrédients sont sans gluten et qui apparaissent
--sur le planning d’un utilisateur.
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

--2
--La recette la plus souvent présente dans des plannings d’utilisateurs.
SELECT "nom" FROM RECETTES WHERE "idRecettes" IN (
    SELECT "recettes" FROM PLANNING HAVING COUNT("recettes") = (
        SELECT MAX(COUNT("recettes")) FROM PLANNING GROUP BY "recettes"
    )
    GROUP BY "recettes"
);

--3
--Pour chaque ingrédient, nombre de recette et nombre de catégorie dans lesquelles il apparaît.
SELECT ingr."nom", 
COUNT(DISTINCT irec."recettes") AS "nb_de_recettes", 
COUNT (DISTINCT icat."categories") AS "nb_de_categories"
FROM INGREDIENTS ingr, INGREDIENTS_RECETTES irec, CATEGORIES_D_INGREDIENTS icat
WHERE ingr."idIngredients" = irec."ingredients" 
AND ingr."idIngredients" = icat."ingredients"
GROUP BY ingr."nom";

--4
--Les utilisateurs qui n’ont ajouté à la base de données
--que des recettes végétariennes
SELECT usr."login" FROM USERS usr, RECETTES rec WHERE usr."idUsers" = rec."auteur_user"
    AND rec."auteur_user" NOT IN (
        SELECT "auteur_user" FROM RECETTES WHERE "idRecettes" IN (
            SELECT "recettes" FROM INGREDIENTS_RECETTES WHERE "ingredients" IN (
                SELECT inrec."ingredients" FROM REGIME rg, INGREDIENTS_INTERDITS inrec
                WHERE rg."idRegime" = inrec."regime" AND rg."nom" = 'Végétarien'
            )
        )
);

--5
--Pour chaque utilisateur, son login, son nom, son prénom, son adresse, son nombre de recette
--créé, son nombre d’ingrédients enregistrés, le nombre de recette qu’il a prévu de réaliser (la
--recette est dans son planning à une date postérieure à la date d’aujourd’hui)
SELECT "login", "username" AS "nom/prenom", "email" AS "adresse mail", "localisation" AS "adresse",
    (SELECT COUNT("idRecettes") FROM RECETTES WHERE "auteur_user" = USERS."idUsers") AS "nb_reccettes_creer",
    (SELECT COUNT("idIngredients") FROM INGREDIENTS WHERE "auteur" = USERS."idUsers") AS "nb_ingredients_creer",
    (SELECT COUNT(*) FROM USERS_INGREDIENTS WHERE "users" = USERS."idUsers") AS "nb_ingredients_chez_lui",
    (SELECT COUNT(*) FROM PLANNING WHERE "users" = USERS."idUsers" AND "date" >= SYSDATE) AS "nb_recettes_prévu_de_réaliser"
FROM USERS;
