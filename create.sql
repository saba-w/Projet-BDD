CREATE TABLE USERS (
  "idUsers" INT NOT NULL,
  "login" VARCHAR(45) NOT NULL,
  "email" VARCHAR(45) NOT NULL,
  "password" VARCHAR(255) NOT NULL,
  "username" VARCHAR(45) NOT NULL,
  "localisation" VARCHAR(50) NOT NULL,
  CONSTRAINT USER_PK PRIMARY KEY ("idUsers"),
  CONSTRAINT USER_U UNIQUE ("login", "email"),
  CONSTRAINT USERS_MAIL_CK CHECK ("email" LIKE '%_@_%')
);

CREATE TABLE RECETTES (
  "idRecettes" INT NOT NULL,
  "nom" VARCHAR(255) NOT NULL,
  "description" CLOB,
  "prix" INT NOT NULL,
  "difficulte" INT NOT NULL,
  "duree_total" INT NOT NULL,
  "nb_personnes" INT NOT NULL,
  "calories" INT NOT NULL,
  "protides" DECIMAL(10,5) NOT NULL,
  "lipides" DECIMAL(10,5) NOT NULL,
  "glucides" DECIMAL(10,5) NOT NULL,
  "glucides_dont_sucres" DECIMAL(10,5) NOT NULL,
  "auteur_user" INT NOT NULL,
  CONSTRAINT RECCETES_PK PRIMARY KEY ("idRecettes"),
  CONSTRAINT RECETTES_PRIX_CK CHECK ("prix" BETWEEN 1 AND 5),
  CONSTRAINT RECETTES_DIFF_CK CHECK ("difficulte" BETWEEN 1 AND 5),
  CONSTRAINT RECETTES_DUREE_CK CHECK ("duree_total" > 0),
  CONSTRAINT RECETTES_NBPERS_CK CHECK ("nb_personnes" > 0),
  CONSTRAINT RECETTES_CAL_CK CHECK ("calories" >= 0),
  CONSTRAINT RECETTES_PRO_CK CHECK ("protides" >= 0),
  CONSTRAINT RECETTES_LIP_CK CHECK ("lipides" >= 0),
  CONSTRAINT RECETTES_GLU_CK CHECK ("glucides" >= 0),
  CONSTRAINT RECETTES_SUCRES_CK CHECK (
	"glucides_dont_sucres" >= 0
	AND "glucides_dont_sucres" <= "glucides"
  ),
  CONSTRAINT "fk_recettes"
    FOREIGN KEY ("auteur_user")
    REFERENCES USERS ("idUsers")
    NOT DEFERRABLE
);

CREATE TABLE UNITES (
  "idUnites" INT NOT NULL,
  "nom" VARCHAR(45) NOT NULL,
  "symbol" VARCHAR(10) NULL,
  CONSTRAINT UNITES_PK PRIMARY KEY ("idUnites"),
  CONSTRAINT UNITES_U UNIQUE ("nom", "symbol")
);

CREATE TABLE INGREDIENTS (
  "idIngredients" INT NOT NULL,
  "nom" VARCHAR(45) NOT NULL,
  "popularite" INT NOT NULL,
  "dispo_par_defaut" number(1) DEFAULT 0 NOT NULL,
  "calories" INT NOT NULL,
  "lipides" DECIMAL(10,5) NOT NULL,
  "proteines" DECIMAL(10,5) NOT NULL,
  "glucides" DECIMAL(10,5) NOT NULL,
  "unites" INT NOT NULL,
  "auteur" INT NOT NULL,
  CONSTRAINT INGREDIENTS_PK PRIMARY KEY ("idIngredients"),
  CONSTRAINT INGREDIENTS_U UNIQUE ("nom"),
  CONSTRAINT INGR_POP_CK CHECK ("popularite" >= 0),
  CONSTRAINT INGR_CAL_CK CHECK ("calories" >= 0),
  CONSTRAINT INGR_PRO_CK CHECK ("proteines" >= 0),
  CONSTRAINT INGR_LIP_CK CHECK ("lipides" >= 0),
  CONSTRAINT INGR_GLU_CK CHECK ("glucides" >= 0),
  CONSTRAINT "fk_ingrd_unites"
    FOREIGN KEY ("unites")
    REFERENCES UNITES ("idUnites")
    NOT DEFERRABLE,
  CONSTRAINT "fk_ingrd_users"
    FOREIGN KEY ("auteur")
    REFERENCES USERS ("idUsers")
    NOT DEFERRABLE  
);

CREATE TABLE REGIME (
  "idRegime" INT NOT NULL,
  "nom" VARCHAR(45) NOT NULL,
  CONSTRAINT REGIME_PK PRIMARY KEY ("idRegime"),
  CONSTRAINT REGIME_U UNIQUE ("nom")
);

CREATE TABLE ETAPE_TYPES (
  "idEtapeTypes" INT NOT NULL,
  "nom" VARCHAR(45) NOT NULL,
  CONSTRAINT ETAPE_TYPES_PK PRIMARY KEY ("idEtapeTypes"),
  CONSTRAINT ETAPE_TYPES_U UNIQUE ("nom")
);

CREATE TABLE ETAPES (
  "idEtapes" INT NOT NULL,
  "nom" VARCHAR(255) NOT NULL,
  "description" CLOB,
  "duree" INT NOT NULL,
  "ordre" INT NOT NULL,
  "etapestypes" INT NOT NULL,
  "recettes" INT NOT NULL,
  CONSTRAINT ETAPES_PK PRIMARY KEY ("idEtapes"),
  CONSTRAINT ETAPES_DUR_CK CHECK ("duree" >= 0),
  CONSTRAINT "fk_etapes_types"
    FOREIGN KEY ("etapestypes")
    REFERENCES ETAPE_TYPES ("idEtapeTypes")
    NOT DEFERRABLE,
  CONSTRAINT "fk_etapes_recettes"
    FOREIGN KEY ("recettes")
    REFERENCES RECETTES ("idRecettes")
    NOT DEFERRABLE
);

CREATE TABLE MEDIA_TYPES (
  "idMediaTypes" INT NOT NULL,
  "nom" VARCHAR(100) NOT NULL,
  "is_video" number(1) DEFAULT 0 NOT NULL,
  CONSTRAINT MEDIA_TYPES_PK PRIMARY KEY ("idMediaTypes"),
  CONSTRAINT MEDIA_TYPES_U UNIQUE ("nom")
);

CREATE TABLE MEDIAS (
  "idMedias" INT NOT NULL,
  "url" VARCHAR2(2048) NOT NULL,
  "recettes" INT NOT NULL,
  "media_types" INT NOT NULL,
  CONSTRAINT MEDIAS_PK PRIMARY KEY ("idMedias"),
  CONSTRAINT "fk_medias_recettes"
    FOREIGN KEY ("recettes")
    REFERENCES RECETTES ("idRecettes")
    NOT DEFERRABLE,
  CONSTRAINT "fk_medias_types"
    FOREIGN KEY ("media_types")
    REFERENCES MEDIA_TYPES ("idMediaTypes")
    NOT DEFERRABLE
);

CREATE TABLE CATEGORIES (
  "idCategories" INT NOT NULL,
  "nom" VARCHAR(45) NOT NULL,
  CONSTRAINT CATEGORIES_PK PRIMARY KEY ("idCategories"),
  CONSTRAINT CATEGORIES_U UNIQUE ("nom")
);

CREATE TABLE CATEGORIES_D_INGREDIENTS (
  "ingredients" INT NOT NULL,
  "categories" INT NOT NULL,
  CONSTRAINT CATEGORIES_INGRD_PK PRIMARY KEY ("ingredients", "categories"),
  CONSTRAINT "fk_ingrd_has_categories_ingrds"
    FOREIGN KEY ("ingredients")
    REFERENCES INGREDIENTS ("idIngredients")
    NOT DEFERRABLE,
  CONSTRAINT "fk_ingrd_has_categories"
    FOREIGN KEY ("categories")
    REFERENCES CATEGORIES ("idCategories")
    NOT DEFERRABLE
);

CREATE TABLE USER_REGIME (
  "regime" INT NOT NULL,
  "users" INT NOT NULL,
  CONSTRAINT USER_REGIME_PK PRIMARY KEY ("regime", "users"),
  CONSTRAINT "fk_regime_has_users_regime"
    FOREIGN KEY ("regime")
    REFERENCES REGIME ("idRegime")
    NOT DEFERRABLE,
  CONSTRAINT "fk_regime_has_users"
    FOREIGN KEY ("users")
    REFERENCES USERS ("idUsers")
    NOT DEFERRABLE
);

CREATE TABLE INGREDIENTS_INTERDITS (
  "regime" INT NOT NULL,
  "ingredients" INT NOT NULL,
  CONSTRAINT INGRD_INTERDITS_PK PRIMARY KEY ("regime", "ingredients"),
  CONSTRAINT "fk_ingrds_interdits_regime"
    FOREIGN KEY ("regime")
    REFERENCES REGIME ("idRegime")
    NOT DEFERRABLE,
  CONSTRAINT "fk_ingrds_interdits_ingrds"
    FOREIGN KEY ("ingredients")
    REFERENCES INGREDIENTS ("idIngredients")
    NOT DEFERRABLE
);

CREATE TABLE USERS_INGREDIENTS (
  "ingredients" INT NOT NULL,
  "users" INT NOT NULL,
  "quantite" DECIMAL(10,5) NOT NULL,
  CONSTRAINT USERS_INGRD_PK PRIMARY KEY ("ingredients", "users"),
  CONSTRAINT USERS_INGRD_QTE_CK CHECK ("quantite" > 0),
  CONSTRAINT "fk1_users_ingrds"
    FOREIGN KEY ("ingredients")
    REFERENCES INGREDIENTS ("idIngredients")
    NOT DEFERRABLE,
  CONSTRAINT "fk2_users_ingrds"
    FOREIGN KEY ("users")
    REFERENCES USERS ("idUsers")
    NOT DEFERRABLE
);

CREATE TABLE INGREDIENTS_TO_BUY (
  "ingredients" INT NOT NULL,
  "users" INT NOT NULL,
  "quantite" DECIMAL(10,5) NOT NULL,
  "date" DATE NOT NULL,
  CONSTRAINT INGRD_TO_BUY_PK PRIMARY KEY ("ingredients", "users"),
  CONSTRAINT TO_BUY_INGRD_QTE_CK CHECK ("quantite" > 0),
  CONSTRAINT "fk1_ingrd_to_buy"
    FOREIGN KEY ("ingredients")
    REFERENCES INGREDIENTS ("idIngredients")
    NOT DEFERRABLE,
  CONSTRAINT "fk2_ingrd_to_buy"
    FOREIGN KEY ("users")
    REFERENCES USERS ("idUsers")
    NOT DEFERRABLE
);

CREATE TABLE USER_INGREDIENTS_ARCHIVE (
  "ingredients" INT NOT NULL,
  "users" INT NOT NULL,
  "quantite" DECIMAL(10,5) NOT NULL,
  "date" DATE NOT NULL,
  CONSTRAINT USER_INGRD_ARCHIVE_PK PRIMARY KEY ("ingredients", "users"),
  CONSTRAINT U_ARCHIVE_INGRD_QTE_CK CHECK ("quantite" > 0),
  CONSTRAINT "fk_ingredients_has_users_ingredients3"
    FOREIGN KEY ("ingredients")
    REFERENCES INGREDIENTS ("idIngredients")
    NOT DEFERRABLE,
  CONSTRAINT "fk_ingredients_has_users_users3"
    FOREIGN KEY ("users")
    REFERENCES USERS ("idUsers")
    NOT DEFERRABLE
);

CREATE TABLE INGREDIENTS_RECETTES (
  "ingredients" INT NOT NULL,
  "recettes" INT NOT NULL,
  "quantite" DECIMAL(10,5) NOT NULL,
  CONSTRAINT INGRD_RECETTES_PK PRIMARY KEY ("ingredients", "recettes"),
  CONSTRAINT RECETTES_INGRD_QTE_CK CHECK ("quantite" > 0),
  CONSTRAINT "fk_ingredients_has_recettes_ingredients1"
    FOREIGN KEY ("ingredients")
    REFERENCES INGREDIENTS ("idIngredients")
    NOT DEFERRABLE,
  CONSTRAINT "fk_ingredients_has_recettes_recettes1"
    FOREIGN KEY ("recettes")
    REFERENCES RECETTES ("idRecettes")
    NOT DEFERRABLE
);

CREATE TABLE PLANNING (
  "users" INT NOT NULL,
  "recettes" INT NOT NULL,
  "date" DATE NOT NULL,
  CONSTRAINT PLANNING_PK PRIMARY KEY ("users", "recettes"),
  CONSTRAINT "fk_users_has_recettes_users1"
    FOREIGN KEY ("users")
    REFERENCES USERS ("idUsers")
    NOT DEFERRABLE,
  CONSTRAINT "fk_users_has_recettes_recettes1"
    FOREIGN KEY ("recettes")
    REFERENCES RECETTES ("idRecettes")
    NOT DEFERRABLE
);

CREATE TABLE PLANNING_ARCHIVE (
  "users" INT NOT NULL,
  "recettes" INT NOT NULL,
  "date" DATE NOT NULL,
  CONSTRAINT PLANNING_ARCHIVE_PK PRIMARY KEY ("users", "recettes"),
  CONSTRAINT "fk_users_has_recettes1_users1"
    FOREIGN KEY ("users")
    REFERENCES USERS ("idUsers")
    NOT DEFERRABLE,
  CONSTRAINT "fk_users_has_recettes1_recettes1"
    FOREIGN KEY ("recettes")
    REFERENCES RECETTES ("idRecettes")
    NOT DEFERRABLE
);