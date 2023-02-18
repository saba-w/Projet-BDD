--On ajoute quelques utilisateurs
Insert into USERS
(
    "idUsers",
    "login",
    "email",
    "password",
    "username",
    "localisation"
) VALUES (
    1,
    'lilly',
    'lilly@gmail.com',
    'blahblah123',
    'Lilly Tamene',
    'Strasbourg'
);

Insert into USERS
(
   "idUsers",
    "login",
    "email",
    "password",
    "username",
    "localisation"
) VALUES (
    2,
    'saba',
    'saba@yahoo.com',
    'blah456',
    'Saba_W',
    'Lyon'
);

Insert into USERS
(
    "idUsers",
    "login",
    "email",
    "password",
    "username",
    "localisation"
) VALUES (
    3,
    'tsi',
    'tsyione@gmail.com',
    'machinbidule789',
    'Tsiyone',
    'Ethiopie'
);

Insert into USERS
(
    "idUsers",
    "login",
    "email",
    "password",
    "username",
    "localisation"
) VALUES (
    4,
    'esayas77',
    'esayas@yahoo.com',
    'bestbrother789',
    'Esayas',
    'Paris'
);
Insert into USERS
(
    "idUsers",
    "login",
    "email",
    "password",
    "username",
    "localisation"
) VALUES (
    5,
    'tamene',
    'tamene@gmail.com',
    'loveisreal401',
    'Tamene Woldearegay',
    'Nice'
);

-- On ajoute les unités de base
INSERT INTO UNITES
(
    "idUnites",
    "nom",
    "symbol"
) VALUES (
    1,
    'Sans unité',
    NULL
);

INSERT INTO UNITES 
(
    "idUnites",
    "nom",
    "symbol"
) VALUES (
    2,
    'Gramme',
    'g'
);

INSERT INTO UNITES 
(
    "idUnites",
    "nom",
    "symbol"
) VALUES (
    3,
    'Litre',
    'L'
);

INSERT INTO UNITES 
(
    "idUnites",
    "nom",
    "symbol"
) VALUES (
    4,
    'Cuillère à café (tea spoon)',
    'tsp'
);

-- Création des régimes
INSERT INTO REGIME 
(
    "idRegime",
    "nom"
) VALUES (
    1,
    'Sans gluten'
);

INSERT INTO REGIME 
(
    "idRegime",
    "nom"
) VALUES (
    2,
    'Végétarien'
);

INSERT INTO REGIME 
(
    "idRegime",
    "nom"
) VALUES (
    3,
    'Végan'
);

--Regime que les utilisateur suivent
INSERT INTO USER_REGIME
(
    "regime",
    "users"
) VALUES (
    2,
    2
);

-- Définition de quelques types d'étapes
INSERT INTO ETAPE_TYPES
(
  "idEtapeTypes",
  "nom"
) VALUES (
  1,
  'Préparation'
);

INSERT INTO ETAPE_TYPES
(
  "idEtapeTypes",
  "nom"
) VALUES (
  2,
  'Cuisson'
);

INSERT INTO ETAPE_TYPES
(
  "idEtapeTypes",
  "nom"
) VALUES (
  3,
  'Repos'
);

INSERT INTO ETAPE_TYPES
(
  "idEtapeTypes",
  "nom"
) VALUES (
  4,
  'Dégustation'
);

-- Insertion de quelques ingrédients
INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    1,
    'Carotte',
    74,
    0,
    41,
    0.24,
    0.93,
    9.58,
    1,
    4 
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    2,
    'Endive',
    22,
    1,
    17.4,
    0.2,
    1.03,
    2.37,
    1,
    4
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    3,
    'Pomme de terre',
    89,
    0,
    80,
    0.24,
    1.8,
    16.70,
    1,
    4 
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    4,
    'Poireau',
    58,
    1,
    25,
    0.2,
    1.1,
    3,
    1,
    4
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    5,
    'Citron',
    70,
    0,
    17,
    0.2,
    0.6,
    5.4,
    1,
    4 
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    6,
    'Cumin',
    33,
    0,
    427,
    22.3,
    17.8,
    33.7,
    4,
    4 
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    7,
    'Cube de bouillon de viande',
    10,
    1,
    136,
    4.8,
    11.7,
    11.5,
    1,
    4
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur" 
) VALUES (
    8,
    'Lardon',
    54,
    1,
    338,
    26,
    24,
    2,
    2,
    4 
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    9,
    'Chocolat',
    44,
    0,
    591,
    43.6,
    10.4,
    26.9,
    2,
    1 
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    10,
    'Sucre',
    98,
    0,
    387,
    0,
    0,
    99.98,
    2,
    1 
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    11,
    'Oeufs',
    74,
    0,
    140,
    9.83,
    12.7,
    0.27,
    1,
    3 
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    12,
    'Maizena',
    24,
    1,
    355,
    0.5,
    0.5,
    86,
    2,
    3 
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    13,
    'Lait de soja',
    24,
    1,
    355,
    0.5,
    0.5,
    86,
    3,
    2 
);

INSERT INTO INGREDIENTS 
(
    "idIngredients",
    "nom",
    "popularite",
    "dispo_par_defaut",
    "calories",
    "lipides",
    "proteines",
    "glucides",
    "unites",
    "auteur"   
) VALUES (
    14,
    'Lait d''amandes',
    24,
    1,
    355,
    0.5,
    0.5,
    86,
    3,
    4 
);

-- Categories d'ingredients
INSERT INTO CATEGORIES 
(
    "idCategories",
    "nom"
) VALUES (
    1,
    'Produit Laitier'
);

INSERT INTO CATEGORIES 
(
    "idCategories",
    "nom"
) VALUES (
    2,
    'Epices'
);

INSERT INTO CATEGORIES 
(
    "idCategories",
    "nom"
) VALUES (
    3,
    'Viandes-Oeuf-Poissons'
);

INSERT INTO CATEGORIES 
(
    "idCategories",
    "nom"
) VALUES (
    4,
    'Fruits et légumes'
);

INSERT INTO CATEGORIES 
(
    "idCategories",
    "nom"
) VALUES (
    5,
    'Féculents'
);

INSERT INTO CATEGORIES 
(
    "idCategories",
    "nom"
) VALUES (
    6,
    'Produits sucrés'
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    1,
    4
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    2,
    4
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    3,
    5
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    4,
    4
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    5,
    4
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    6,
    2
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    7,
    2
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    8,
    3
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    9,
    6
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    10,
    6
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    11,
    3
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    12,
    5
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    13,
    1
);

INSERT INTO CATEGORIES_D_INGREDIENTS
(
    "ingredients",
    "categories"
) VALUES (
    14,
    1
);

-- Insertion de restriction sur quelques ingrédients
INSERT INTO INGREDIENTS_INTERDITS
(
    "regime",
    "ingredients"
) VALUES (
    3,
    7
);

INSERT INTO INGREDIENTS_INTERDITS
(
    "regime",
    "ingredients"
) VALUES (
    3,
    8
);

INSERT INTO INGREDIENTS_INTERDITS
(
    "regime",
    "ingredients"
) VALUES (
    2,
    7
);

INSERT INTO INGREDIENTS_INTERDITS
(
    "regime",
    "ingredients"
) VALUES (
    2,
    8
);

INSERT INTO INGREDIENTS_INTERDITS
(
    "regime",
    "ingredients"
) VALUES (
    3,
    11
);

-- Insertion de quelques recettes
INSERT INTO RECETTES
(
    "idRecettes",
    "nom",
    "description",
    "prix",
    "difficulte",
    "duree_total",
    "nb_personnes",
    "calories",
    "protides",
    "lipides",
    "glucides",
    "glucides_dont_sucres",
    "auteur_user"
) VALUES (
    1,
    'Soupe d''automne',
    NULL,
    3,
    1,
    50,
    3,
    24.5,
    0,
    0.305,
    3.87,
    2.7,
    4
);

INSERT INTO RECETTES
(
    "idRecettes",
    "nom",
    "description",
    "prix",
    "difficulte",
    "duree_total",
    "nb_personnes",
    "calories",
    "protides",
    "lipides",
    "glucides",
    "glucides_dont_sucres",
    "auteur_user"
) VALUES (
    2,
    'Fondant au chocolat',
    NULL,
    2,
    2,
    12,
    6,
    440,
    0,
    26,
    47,
    40,
    3
);

INSERT INTO RECETTES
(
    "idRecettes",
    "nom",
    "description",
    "prix",
    "difficulte",
    "duree_total",
    "nb_personnes",
    "calories",
    "protides",
    "lipides",
    "glucides",
    "glucides_dont_sucres",
    "auteur_user"
) VALUES (
    3,
    'Creme de citron',
    NULL,
    3,
    2,
    30,
    4,
    786,
    0,
    12,
    62,
    61,
    1
);

-- On indique les ingrédients utilisés par la recette
INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    1,
    1,
    3
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    2,
    1,
    4
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    3,
    1,
    2
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    4,
    1,
    1
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    5,
    1,
    1
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    6,
    1,
    1
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    7,
    1,
    1
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    8,
    1,
    100
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    9,
    2,
    500
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    10,
    2,
    200
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    11,
    2,
    8
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    10,
    3,
    150
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    11,
    3,
    4
);

INSERT INTO INGREDIENTS_RECETTES
(
    "ingredients",
    "recettes",
    "quantite"
) VALUES (
    12,
    3,
    30
);

-- Définition des étapes
INSERT INTO ETAPES 
(
    "idEtapes",
    "nom",
    "description",
    "duree",
    "ordre",
    "etapestypes",
    "recettes"
) VALUES (
    1,
    'Préparer les légumes',
    'Couper les endives et le poireau en tronçons, les carottes et les pommes de terre en rondelles.',
    10,
    1,
    1,
    1
);

INSERT INTO ETAPES 
(
    "idEtapes",
    "nom",
    "description",
    "duree",
    "ordre",
    "etapestypes",
    "recettes"
) VALUES (
    2,
    'Faire revenir sur un poelle',
    'Faites revenir les lardons, les carottes et les pommes de terre dans de la margarine quelques minutes.',
    7,
    2,
    2,
    1
);

INSERT INTO ETAPES 
(
    "idEtapes",
    "nom",
    "description",
    "duree",
    "ordre",
    "etapestypes",
    "recettes"
) VALUES (
    3,
    'Ajouter les légumes',
    'Ajouter le reste des légumes et faire revenir quelques minutes.',
    8,
    3,
    2,
    1
);

INSERT INTO ETAPES 
(
    "idEtapes",
    "nom",
    "description",
    "duree",
    "ordre",
    "etapestypes",
    "recettes"
) VALUES (
    4,
    'Assaisonner',
    'Ajouter un filet de jus de citron, le cumin, saler un peu, bien poivrer.',
    0,
    4,
    2,
    1
);

INSERT INTO ETAPES 
(
    "idEtapes",
    "nom",
    "description",
    "duree",
    "ordre",
    "etapestypes",
    "recettes"
) VALUES (
    5,
    'Laisser cuire les légumes',
    'Ajouter 1,5 litre d''eau et le bouillon. Laisser cuire une demi-heure environ, jusqu''à ce que les légumes soient bien cuits.',
    30,
    5,
    2,
    1
);

INSERT INTO ETAPES 
(
    "idEtapes",
    "nom",
    "description",
    "duree",
    "ordre",
    "etapestypes",
    "recettes"
) VALUES (
    6,
    'Mixer et servir',
    'Mixer la soupe, et servir bien chaud - avec du pain aux noix ou six céréales',
    4,
    5,
    4,
    1
);

INSERT INTO ETAPES 
(
    "idEtapes",
    "nom",
    "description",
    "duree",
    "ordre",
    "etapestypes",
    "recettes"
) VALUES (
    7,
    'Préparation',
    'Faire fondre le chocolat au bain marie. Pendant ce temps melanger les oeuf et le sucre et faire blanchir. Ensuite ajouter le chocolat',
    5,
    1,
    1,
    2
);

INSERT INTO ETAPES 
(
    "idEtapes",
    "nom",
    "description",
    "duree",
    "ordre",
    "etapestypes",
    "recettes"
) VALUES (
    8,
    'Mettre au four',
    'Faire cuire le fondant pendant environ 7 à 10 minutes. Attention, vérifier la cuisson en plantant la pointe du couteau au milieu du fondant.',
    7,
    2,
    2,
    2
);

INSERT INTO ETAPES 
(
    "idEtapes",
    "nom",
    "description",
    "duree",
    "ordre",
    "etapestypes",
    "recettes"
) VALUES (
    9,
    'Dégustation',
    'Bonne appétit.',
    0,
    3,
    4,
    2
);

INSERT INTO ETAPES 
(
    "idEtapes",
    "nom",
    "description",
    "duree",
    "ordre",
    "etapestypes",
    "recettes"
) VALUES (
    10,
    'Préparation des aliments.',
    'Presser les citrons et mettre le jus avec les zestes dans la casserole. Battre les oeufs dans un récipient séparé.',
    15,
    1,
    1,
    3
);

INSERT INTO ETAPES 
(
    "idEtapes",
    "nom",
    "description",
    "duree",
    "ordre",
    "etapestypes",
    "recettes"
) VALUES (
    11,
    'Cuisson',
    'Mettre à feu fort et continuer à remuer à l aide d un fouet.',
    15,
    2,
    2,
    3
);

-- Ajout de media pour la recette
INSERT INTO MEDIA_TYPES
(
    "idMediaTypes",
    "nom",
    "is_video"
) VALUES (
    1,
    'Photos',
    1
);

INSERT INTO MEDIA_TYPES
(
    "idMediaTypes",
    "nom",
    "is_video"
) VALUES (
    2,
    'Videos YouTube',
    0
);

INSERT INTO MEDIAS
(
    "idMedias",
    "url",
    "recettes",
    "media_types"
) VALUES (
    1,
    'https://www.youtube.com/watch?v=9BuL3lp4M6U',
    1,
    2
);

INSERT INTO MEDIAS
(
    "idMedias",
    "url",
    "recettes",
    "media_types"
) VALUES (
    2,
    'https://www.marmiton.org/recettes/recette_fondant-au-chocolat-ultra-facile_61739.aspx',
    2,
    1
);

INSERT INTO MEDIAS
(
    "idMedias",
    "url",
    "recettes",
    "media_types"
) VALUES (
    3,
    'https://www.bing.com/videos/search?q=Cr%C3%A8me+de+citron',
    3,
    2
);

-- Ajout de recettes dans le planning des utilisaterus
INSERT INTO PLANNING
(
    "users",
    "recettes",
    "date"
) VALUES (
    2,
    1,
    TO_DATE('30/01/2022 15:30', 'DD/MM/YYYY HH24:MI')
);

INSERT INTO PLANNING
(
    "users",
    "recettes",
    "date"
) VALUES (
    3,
    2,
    TO_DATE('22/01/2022 10:00', 'DD/MM/YYYY HH24:MI')
);

INSERT INTO PLANNING
(
    "users",
    "recettes",
    "date"
) VALUES (
    5,
    3,
    TO_DATE('23/01/2022 17:30', 'DD/MM/YYYY HH24:MI')
);

INSERT INTO PLANNING
(
    "users",
    "recettes",
    "date"
) VALUES (
    1,
    3,
    TO_DATE('21/01/2022 11:30', 'DD/MM/YYYY HH24:MI')
);

INSERT INTO PLANNING
(
    "users",
    "recettes",
    "date"
) VALUES (
    4,
    3,
    TO_DATE('24/01/2022 10:30', 'DD/MM/YYYY HH24:MI')
);

INSERT INTO PLANNING
(
    "users",
    "recettes",
    "date"
) VALUES (
    4,
    2,
    TO_DATE('24/01/2022 10:30', 'DD/MM/YYYY HH24:MI')
);

-- Insertion d'ingrédient qu'un utilisateur à chez lui
INSERT INTO USERS_INGREDIENTS 
(
    "ingredients",
    "users",
    "quantite"
) VALUES (
    8,
    3,
    50
);

INSERT INTO USERS_INGREDIENTS 
(
    "ingredients",
    "users",
    "quantite"
) VALUES (
    7,
    1,
    3
);

INSERT INTO USERS_INGREDIENTS 
(
    "ingredients",
    "users",
    "quantite"
) VALUES (
    14,
    2,
    500
);

INSERT INTO USERS_INGREDIENTS 
(
    "ingredients",
    "users",
    "quantite"
) VALUES (
    9,
    4,
    250
);

-- Insertion d'ingredient à acheter par un utilisateur
INSERT INTO INGREDIENTS_TO_BUY
(
    "ingredients",
    "users",
    "quantite",
    "date"
) VALUES (
    13,
    3,
    500,
    TO_DATE('17/01/2021 10:00', 'DD/MM/YYYY HH24:MI')
);

INSERT INTO INGREDIENTS_TO_BUY
(
    "ingredients",
    "users",
    "quantite",
    "date"
) VALUES (
    9,
    3,
    500,
    TO_DATE('17/01/2022 10:00', 'DD/MM/YYYY HH24:MI')
);

INSERT INTO INGREDIENTS_TO_BUY
(
    "ingredients",
    "users",
    "quantite",
    "date"
) VALUES (
    10,
    1,
    500,
    TO_DATE('27/11/2021 10:00', 'DD/MM/YYYY HH24:MI')
);

INSERT INTO INGREDIENTS_TO_BUY
(
    "ingredients",
    "users",
    "quantite",
    "date"
) VALUES (
    5,
    1,
    5,
    TO_DATE('27/01/2022 10:00', 'DD/MM/YYYY HH24:MI')
);

-- Archive
INSERT INTO USER_INGREDIENTS_ARCHIVE
(
    "ingredients",
    "users",
    "quantite",
    "date"
) VALUES (
    8,
    3,
    50,
    TO_DATE('27/10/2021 10:00', 'DD/MM/YYYY HH24:MI')
);

INSERT INTO PLANNING_ARCHIVE
(
    "users",
    "recettes",
    "date"
) VALUES (
    5,
    1,
    TO_DATE('29/10/2021 10:00', 'DD/MM/YYYY HH24:MI')
);