/* script de création de la bdScolaire*/


/* ******************************************************************************** */
/**/
/*	CRÉATION DE LA BASE DE DONNÉE : */
/**/
/*********************/
/* no 1-2 création de la base de données si la database existe la détruire */

use master

/* CODE POUR EXECUTER LE CODE MÊME SI QUELQU'UN L'UTILISE */
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Glg_bd')
BEGIN 
ALTER DATABASE Glg_bd SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE Glg_bd
END

GO
CREATE DATABASE Glg_bd
GO

/*********************/
/*no 3 création de tbl_session  */

use Glg_bd /* pour utiliser la table dans laquelle on veux créer une table */
GO

CREATE TABLE tbl_session (
    no_session nchar (5) NOT NULL primary key,
) 
GO

/*********************/
/*no 4 tbl_cours */

CREATE TABLE tbl_cours (
    no_cours nchar (8) NOT NULL primary key,
	nom nvarchar (100)  NOT NULL,
	ponderation nchar (5)
) 
GO

ALTER TABLE tbl_cours 
ADD CONSTRAINT DF_pondCours DEFAULT '1-1-1' FOR ponderation 

GO

/*********************/
/*no 5 tbl_offreCours */

CREATE TABLE tbl_offreCours (
    no_offreCours INT IDENTITY NOT NULL,
	no_session nchar (5) NOT NULL,
	no_cours nchar (8) NOT NULL,
	CONSTRAINT pk_offreCours primary key (no_offreCours),
	CONSTRAINT un_offreCours UNIQUE (no_session, no_cours), 
	CONSTRAINT fk_no_session FOREIGN KEY (no_session) REFERENCES tbl_session(no_session),
	CONSTRAINT fk_no_cours FOREIGN KEY (no_cours) REFERENCES tbl_cours(no_cours)	
)
GO

/*********************/
/* no 6 tbl_etudiant */

CREATE TABLE tbl_etudiant (
	no_da nchar (7) NOT NULL PRIMARY KEY,
	nom nvarchar (100) NOT NULL,
	prenom nvarchar (100) NOT NULL,
	email nvarchar (100) NULL
)
GO

/*********************/
/* no 7 table tbl_inscription, */

CREATE TABLE tbl_inscription (
	no_da nchar (7) NOT NULL,
	no_offreCours int NOT NULL,
	note decimal (5,2) NULL
)
GO

/*********************/
/* no 8 modification tbl_inscription */

ALTER TABLE tbl_inscription
ADD CONSTRAINT FK_inscription_da FOREIGN KEY (no_da) REFERENCES tbl_etudiant (no_da),
CONSTRAINT FK_inscription_offreCours FOREIGN KEY (no_offreCours) REFERENCES tbl_offreCours (no_offreCours),
CONSTRAINT PK_inscription PRIMARY KEY (no_da, no_offreCours),
CONSTRAINT CK_note CHECK (note >=0  AND note <=100)
GO

/*********************/
/* no 9 check sur session A H E*/

ALTER TABLE tbl_session
ADD CONSTRAINT CK_session CHECK (no_session LIKE '[A,H,E]%')
GO


/* pour afficher les contraintes */
/*
sp_help tbl_session
*/
GO
/* affiche le détail de la contrainte */
/*
sp_helptext CK_tbl_session
*/

/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/**/
/*	 EXERCICE 1 : */
/**/
/* exercice sur SQL : insert update delete*/
/* placez cet exercice dans le même fichier .sql de votre création de schéma. enregistrer sur votre github */

/*********************/
/* no 1 */

INSERT INTO tbl_etudiant (no_da, nom, prenom, email)
VALUES ('1234567', 'Bloom', 'Rose', '1234567@hotmail.ca')
GO
/* SELECT * FROM tbl_etudiant */

/*********************/
/* no 2 */

INSERT INTO tbl_cours (no_cours, nom, ponderation)
VALUES ('4204B2BA', 'Base de données 2', '2-3-2'), ('4203B1BA', 'Base de données 1', '2-2-1')
GO
/* SELECT * FROM tbl_cours */

/*********************/
/* no 3 */

UPDATE tbl_cours
SET no_cours = '4203B2BA'
WHERE no_cours = '4203B1BA'
GO
/* SELECT * FROM tbl_cours */

/*********************/
/* no 4 */

/* A. */
INSERT INTO tbl_session (no_session) 
VALUES ('H2025')
GO
/* SELECT * FROM tbl_session */

INSERT INTO tbl_offreCours (no_session, no_cours)
VALUES ('H2025', '4203B2BA')
GO
/* SELECT * FROM tbl_offreCours */

/* B. */
INSERT INTO tbl_inscription (no_da, no_offreCours)
VALUES ('1234567',(SELECT no_offreCours 
					FROM tbl_offreCours
					WHERE no_cours = '4203B2BA' AND no_session = 'H2025'))
GO
/* SELECT * FROM tbl_inscription */

/*********************/
/* no 5 */

CREATE TABLE tbl_prealable(
no_coursBase nchar(8) not null REFERENCES tbl_cours (no_cours),
no_coursPrealable nchar(8) not null REFERENCES tbl_cours (no_cours),
CONSTRAINT PK_prealable PRIMARY KEY (no_coursBase, no_coursPrealable)
)
GO

INSERT INTO tbl_prealable(no_coursBase, no_coursPrealable)
VALUES ('4204B2BA' , '4203B2BA')
GO
/* 
SELECT * FROM tbl_prealable 
SELECT * FROM tbl_cours
SELECT * FROM tbl_inscription
*/

/*********************/
/* no 6 */

INSERT INTO tbl_etudiant (no_da, prenom, nom, email)
SELECT '25000' + str(BusinessEntityID,2) AS BusinessEntityID,FirstName,LastName,(FirstName + '.'+ LastName + '@gmail.com')
FROM AdventureWorks2022.Person.Person
WHERE BusinessEntityID between 10 and 20
GO

/* 
SELECT * FROM AdventureWorks2022.Person.person 
SELECT * FROM tbl_etudiant 
*/

/*********************/
/* no 7 */

INSERT INTO tbl_cours (no_cours, nom, ponderation)
VALUES('4204A2BA','méthode de développement', null)


INSERT INTO tbl_offreCours(no_cours,no_session)
VALUES('4204A2BA','H2025')


INSERT INTO tbl_inscription(no_da,no_offreCours)
SELECT no_da,(SELECT no_offreCours
  FROM tbl_offreCours
  WHERE no_cours = '4204A2BA' and
  no_session = 'H2025')
FROM tbl_etudiant
GO

/* SELECT * FROM tbl_cours */
/* SELECT * FROM tbl_offreCours */
/* SELECT * FROM tbl_inscription */

/*********************/
/* no 8 */

DELETE FROM tbl_inscription
WHERE no_da = '2500017'

DELETE FROM tbl_inscription
WHERE no_da in (SELECT no_da
				FROM tbl_etudiant
				WHERE prenom = 'Kevin' and nom = 'Brown')

/*********************/
/*  no 9 */

/* AJOUTER UNE COLONNE */ 
ALTER TABLE tbl_cours
ADD pond nchar(5) 
GO

/* TRANSFEREE LES DONNEES */ 
UPDATE tbl_cours
SET pond  = ponderation 
GO

/* DETRUIRE LE LIEN (LA CONTRAINTE) */
ALTER TABLE tbl_cours
DROP CONSTRAINT DF_pondCours 
GO

/* DETRUIRE PONDERATION */
ALTER TABLE tbl_cours
DROP COLUMN ponderation 
GO

/* AJOUTER UN CONTRAITE PAR DEFAUT */
ALTER TABLE tbl_cours
ADD CONSTRAINT DF_pondCours 
DEFAULT '1-1-1' FOR pond
GO

INSERT INTO tbl_cours (no_cours,nom)
VALUES ('test','test')
GO

/* SELECT * FROM tbl_cours */

/* si vous avez enlevé une contrainte, n'oubliez pas de la remettre */
/*	Faire générer un gros select (concevoir une requête dans l’éditeur) sur toutes vos tables */
/*	pour bien voir le resultat final. */


/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 

/* Exercice #2 */

/* Exercice sur SQL : sur les procédures stockées */

use Glg_bd 
go

/* 1.	Faites une procédure stockées qui retourne le nombre total de cours à une session donnée.
		elle prend en paramètre : la session

A) pas de paramètre output  */
CREATE PROCEDURE GetTotalCourses
    @Session nchar(5)
AS
    SELECT COUNT(*) AS 'Nombre de cour total de la session :' 
    FROM tbl_offreCours
    WHERE no_session = @Session;
GO

/*Faites l'appel de cette procédure */
DECLARE @Session nchar(5) = 'H2024';
EXEC GetTotalCourses @Session;

/* Afficher les tables pour comparer */ 
Select* from tbl_offreCours;
Select* from tbl_cours;


/* B)	même question mais retourne un paramètre output pour le nombre de cours de cette session */
CREATE PROCEDURE GetTotalCoursesWithOutput
    @Session nchar(5),
    @NombreDeCours INT OUTPUT
AS
BEGIN
    SELECT @NombreDeCours = COUNT(*)
    FROM tbl_offreCours
    WHERE no_session = @Session;
END
GO

/*Faites l'appel de cette procédure */
DECLARE @Session nchar(5) = 'H2025';
DECLARE @NombreDeCours INT;
EXEC GetTotalCoursesWithOutput @Session, @NombreDeCours OUTPUT;
SELECT @NombreDeCours AS TotalCourses;
GO


/* 2.	Faites une procédure stockées qui ajoute ou modifie un étudiant selon qu'il existe ou pas.
		les paramètres seront : son no de DA, nom,prenom,email
		Noter qu'on ne peut pas modifier la clé.
		Votre procédure aura un paramètre return qui nous indiquera si on a modifier ou pas
		Choisissez 2 valeurs > que 0 qui auront ces 2 significations soit ajout ou modification effectuée */

CREATE or ALTER PROCEDURE AddOrUpdateStudent
@no_da nchar(7),
@nom nvarchar(100),
@prenom nvarchar(100),
@email nvarchar(100),
@ReturnValue INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM tbl_etudiant WHERE no_da = @no_da)
    BEGIN
        /* Modifier l'étudiant existant */
        UPDATE tbl_etudiant
        SET nom = @nom,
            prenom = @prenom,
            email = @email
        WHERE no_da = @no_da;

        SET @ReturnValue = 2; /* 2 = Valeur pour modification effectuée */
    END
    ELSE
    BEGIN
        /* Ajouter un nouvel étudiant */
        INSERT INTO tbl_etudiant (no_da, nom, prenom, email)
        VALUES (@no_da, @nom, @prenom, @email);

        SET @ReturnValue = 1; /* 1 = Valeur pour ajout effectué */
    END
END
GO

/* appel de votre procedure et affichage de la valeur return */
DECLARE @ReturnValue INT;
EXEC AddOrUpdateStudent '1234567', 'Doe', 'Johnny', 'johndoe@example.com', @ReturnValue OUTPUT;
SELECT @ReturnValue AS OperationResult;

/* Afficher les tables pour comparer */ 
SELECT* FROM tbl_etudiant







/* ************************************************************ */ 
/*
/* NOTES : */
/*
/* ***** ENREGISTRER UN SCRIPT ***** */
/* Click droite sur la BD */
/* Tâches */
/* Générer des scripts... */
/* Suivant */
/* Suivant */
/* Avancé */
/* Types de données à inclure dans le script : Schéma et données */
/* Ok */
/* Enregistrer comme fichier de script */
/* Suivant */
/* Suivant */
/* Terminer */
/* ************************************************************ */ 