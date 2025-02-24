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

/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 

/* AJOUT TABLE DÉPARTEMENT ET EMPLOYÉ */

use Glg_bd
GO

CREATE TABLE [dbo].[tbl_departement](
	[no_departement] [int] IDENTITY(1,1) NOT NULL,
	[nom_departement] [nvarchar](30) NOT NULL,
	[no_employe_resp] [nchar](8) NULL,
 CONSTRAINT [PK_departement] PRIMARY KEY CLUSTERED 
(
	[no_departement] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[tbl_employe](
	[no_employe] [nchar](8) NOT NULL,
	[nom] [nvarchar](30) NOT NULL,
	[prenom] [nvarchar](30) NULL,
	[no_departement] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[no_employe] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tbl_employe]  WITH CHECK ADD FOREIGN KEY([no_departement])
REFERENCES [dbo].[tbl_departement] ([no_departement])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].tbl_departement  
ADD FOREIGN KEY([no_employe_resp]) REFERENCES [dbo].tbl_employe ([no_employe])

GO

insert into tbl_departement 
values('informatique',null)
go
insert into tbl_departement
values('administration',null)
go
insert into tbl_departement
values('science',null)
go
insert into tbl_departement
values('génie civil',null)
go
insert into tbl_departement
values('soin infirmier',null)
go

insert into tbl_employe
values('1','Poirier','Richard','1')
go
insert into tbl_employe
values('2','Veilleux','Pascal','1')
go
insert into tbl_employe
values('3','Poirier','Jean','3')
go
insert into tbl_employe
values('4','Veilleux','Louise','4')
go
insert into tbl_employe
values('5','Bégin','Carl','2')
go
insert into tbl_employe
values('6','Côté','Steeve','4')
go
insert into tbl_employe
values('7','Tremblay','Joanne','2')
go

update tbl_departement
set no_employe_resp = '1'
where no_departement = '1'
go
update tbl_departement
set no_employe_resp = '5'
where no_departement = '2'
go
update tbl_departement
set no_employe_resp = '6'
where no_departement = '4'
go

/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 

/* Exercie #3 */
/* Table dérivée (temporaire) */ 

/* Exercice sur les tables dérivées, With(CTE), alias: */
/* à partir de lt_biblio, le cas scolaire complet y a été ajouté */
use Glg_bd
go

/* 
1- faire afficher les cours qui ont un préalable ( avec le no_cours_préalable) (1 lignes)
*/
SELECT no_cours 'Numéro de cours', nom 'Cours qui ont un préalable', no_coursPrealable AS 'Numéro de cours du préalable'
FROM tbl_cours INNER JOIN tbl_prealable
ON tbl_cours.no_cours = tbl_prealable.no_coursBase

/*
2- Faire afficher les cours et leur préalable (qu’il en ait ou pas) (3 lignes)
*/
SELECT no_cours 'Numéro de cours', nom AS 'Cours qui ont un préalable', no_coursPrealable AS 'Numéro de cours du préalable'
FROM tbl_cours LEFT OUTER JOIN tbl_prealable
ON tbl_cours.no_cours = tbl_prealable.no_coursBase

/*
3- En utilisant a) une table dérivée et b) With (CTE), c) des alias, affichez tous les cours avec ou sans préalable 
	et pour leur préalable, affichez le nom de cours de celui-ci (3 lignes)
*/
/* a) une table dérivée */
SELECT tbl_cours.no_cours 'Numéro de cours', tbl_cours.nom AS 'Cours qui ont un préalable', tbl_prealable.no_coursPrealable AS 'Numéro de cours du préalable', tableTemporaireCours.nom AS 'Nom du cours préalable'
FROM tbl_cours LEFT OUTER JOIN tbl_prealable
ON tbl_cours.no_cours = tbl_prealable.no_coursBase
LEFT OUTER JOIN (SELECT no_cours, nom FROM tbl_cours) tableTemporaireCours
ON tableTemporaireCours.no_cours = tbl_prealable.no_coursPrealable

/* b) With (DTE)*/
WITH tabletemporaireCours (no_cours, nom_cours)
AS (SELECT no_cours, nom FROM tbl_cours)

SELECT tbl_cours.no_cours 'Numéro de cours', tbl_cours.nom AS 'Cours qui ont un préalable', tbl_prealable.no_coursPrealable AS 'Numéro de cours du préalable', tableTemporaireCours.nom_cours AS 'Nom du cours préalable'
FROM tbl_cours LEFT OUTER JOIN tbl_prealable
ON tbl_cours.no_cours = tbl_prealable.no_coursBase
LEFT OUTER JOIN tabletemporaireCours
ON tableTemporaireCours.no_cours = tbl_prealable.no_coursPrealable

/* c) alias*/
SELECT tbl_cours.no_cours 'Numéro de cours', tbl_cours.nom AS 'Cours qui ont un préalable', tbl_prealable.no_coursPrealable AS 'Numéro de cours du préalable', coursDeuxièmeInstance.nom AS 'Nom du cours préalable'
FROM tbl_cours LEFT OUTER JOIN tbl_prealable
ON tbl_cours.no_cours = tbl_prealable.no_coursBase
LEFT OUTER JOIN tbl_cours AS coursDeuxièmeInstance
ON coursDeuxièmeInstance.no_cours = tbl_prealable.no_coursPrealable

/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 

/********************************************ROW_NUMBER********************************************/

/* Données à ajouter dans scolaire avant l'exercice sur rowNumber */
use Glg_bd /* mettre ta BD*/

/* données une année avant 2025 */
insert into tbl_etudiant (no_da,prenom,nom,email)
select '24000' + str(businessEntityID,2) as Contact_ID,FirstName,LastName, FirstName + LastName + '@'+'gmail.com'
from AdventureWorks2022.Person.person
where businessEntityID >30 and businessEntityID< 40
go
/*select * from tbl_etudiant
select * from tbl_inscription
select * from tbl_offreCours
select * from tbl_session
*/

insert into tbl_session (no_session)
values ('H2024')
go
insert into tbl_offreCours (no_session,no_cours)
values('H2024','4204A2BA')
go


insert into tbl_inscription(no_da,no_offreCours)
select no_da,(select no_offreCours from tbl_offreCours where no_cours = '4204A2BA' and no_session ='H2024') from tbl_etudiant
 where no_da > '2400031' and no_da < '2400040'
go

update tbl_inscription
set note =  60+substring(no_da,6,2)
where no_offreCours = (select no_offreCours from tbl_offreCours where no_cours = '4204A2BA' and no_session ='H2024')
go
update tbl_inscription
set note = 99
where no_da = 2400032
go
					

update tbl_inscription
set note = 78
where no_da = 2400033 and no_offreCours = (select no_offreCours 
											from tbl_offreCours 
											where no_cours = '4204A2BA' and no_session ='H2024')
go

use AdventureWorks2022
go
/********************************************ROW_NUMBER********************************************/
/*	ROW_NUMBER :	permet d'assigner un entier séquentiel à chaque ligne d'une requête 
					le numéro part à 1
	syntaxe :		ROW_NUMBER() OVER (
					[PARTITION BY partition_expression, ... ]
					ORDER BY sort_expression [ASC | DESC], ...
					)
	partition by:	divise le resultat en groupe de ligne. 
					Le nombre entier est assigné à chaque groupe et réinitialisé pour chaque groupe
					partition by est optionnel, si on l'omet, il traite toutes les lignes au complet comme un seul groupe
	order by	:	obligatoire car les nombres sont assignés selon le tri choisi.
*/
/*	exemple sans partition */
SELECT BusinessEntityID, LastName, FirstName, Title, ROW_NUMBER() OVER (ORDER BY LastName, FirstName) Ordre
FROM     Person.Person

/*	exemple avec partition, créant des sous groupes, remarquer que l'ordre recommence à 0 sur changement de valeur du regroupement */
SELECT BusinessEntityID, LastName, FirstName, Title, ROW_NUMBER() OVER (PARTITION BY title ORDER BY LastName, FirstName) Ordre
FROM     Person.Person
where title is not null

/*	ROW_NUMBER est intéressant pour la pagination (pensons dans une page Web où l'on veut afficher page par page pour accélérer l'affichage )
	exemple affichant les clients de la page 2, une page ayant 10 clients
	Remarquez qu'on utilise une table dérivée pour pouvoir restreindre sur l'ordre --> ** L'ORDRE EXISTE TOUJOURS DANS UNE TABLE TEMPORAIRE ** */
select *
from (
		SELECT BusinessEntityID, LastName, FirstName, Title, ROW_NUMBER() OVER (ORDER BY LastName, FirstName) Ordre
		FROM     Person.Person ) tableTemporaireClient
where ordre > 20 and ordre <= 30 /* la table temporaire permet d'utiliser ordre dans le where */


/********************************************RANK********************************************/
/*	
rank	:	permet d'assigner un rang séquentiel à chaque ligne d'une requête 
			le numéro part à 1
			Une ligne du groupe qui a la même valeur recevra le même rang, ainsi les numéros peuvent ne pas être consécutifs.
			instruction intéressante pour top-N ou bottom-N tel qu'utilisé dans les pages Web par exemple.
syntaxe : 	RANK() OVER (
			[PARTITION BY partition_expression, ... ]
			ORDER BY sort_expression [ASC | DESC], ...
			)	
			
partition by :	divise le resultat en groupe de ligne. 
				Le nombre entier est assigné à chaque groupe et réinitialisé pour chaque groupe
				optionnel, si on l'omet, il traite toutes les lignes au complet comme un seul groupe
order by :		obligatoire car les nombres sont assignés selon le tri choisi.
*/
/*	exemple sans partition, il y a des trous dans le rang car plusieurs produits ont le même prix */
SELECT ProductID, Name, ListPrice, 
	RANK () OVER ( ORDER BY ListPrice DESC) 'rang des prix '
FROM     Production.Product
/* Si on voudrais avoir les top 2 des produits les plus cher, les neuf premiers produits s'afficherais puisque les */
/*			5 premiers ont le même prix (prix plus cher) et les 4 suivant on le même prix (deuxième prix plus cher) */ 


/*	exemple avec partition, créant des sous groupes, il y a des trous dans le rang
	donne le rang des prix par sous catégorie, sur changement de valeur de la catégorie, recommence à 1 */
SELECT	ProductID, Name, ListPrice, ProductSubcategoryID,
		RANK () OVER ( PARTITION BY ProductSubcategoryID ORDER BY ListPrice DESC) 'rang des prix '
FROM     Production.Product
where ProductSubcategoryID is not null

/* donne le rang des prix par sous catégorie mais seulement les rangs de prix <= 3, s'il y a  lieu : utilisation de table dérivée */
select * 
from (
		SELECT	ProductID, Name, ListPrice, ProductSubcategoryID,
				RANK () OVER ( PARTITION BY ProductSubcategoryID ORDER BY ListPrice DESC) 'rang des prix'
		FROM     Production.Product
		where ProductSubcategoryID is not null) tableTemporairePrixProduit
where [rang des prix] <= 3



/********************************************NEWID********************************************/
/* newid : génére un numéro unique, soit un uniqueidentifier */
/* exemple : afficher 5 lignes au hasard à partir de notre table person
			 par exemple, on pourrait afficher x produits au hasard sur une page Web */ 
SELECT top 5 BusinessEntityID, LastName, FirstName, Title ,NEWID()
FROM     Person.Person
order by newid()


/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 

/*Exercice #3 */

	use Glg_bd
	go

	use LT_biblio /* Pour les mêmess résultats que les exercices */ 
	GO

/*  1-	affichez la liste de classe (no_da, nom, prenom ) en ordre alphabétique de nom et prénom pour un cours 
	donnée et une session donnée, avec le rang avant les noms. pour 4204A2BA, H2025
	Chaque rang doit être unique donc (ROW_NUMBER ou rank ?) (9 lignes ) */ 
SELECT tbl_etudiant.no_da, nom, prenom, 
	ROW_NUMBER() OVER (ORDER BY nom, prenom DESC)
FROM tbl_etudiant 
	INNER JOIN tbl_inscription 
	ON tbl_etudiant.no_da = tbl_inscription.no_da
	INNER JOIN tbl_offreCours
	ON tbl_offreCours.no_offreCours = tbl_inscription.no_offreCours
WHERE tbl_offreCours.no_cours = '4204A2BA' AND tbl_offreCours.no_session = 'H2025' 
		

/*	2- affichez la liste des étudiants (no_da, nom, prenom , no_cours, session et note) 
	en ordre de note (desc) selon le no_cours, session 
	et indiquer le rang selon la note. 
	Si 2 étudiants ont une même note, il auront le même rang, créant ainsi un trou dans les rangs.
	Donc ROW_NUMBER ou rank ?
	(19 lignes) */
SELECT no_cours, no_session, note, tbl_etudiant.no_da, tbl_etudiant.nom, tbl_etudiant.prenom,   
	RANK() OVER (PARTITION BY no_cours, no_session ORDER BY note DESC) 'Rang des notes'
FROM tbl_etudiant 
	INNER JOIN tbl_inscription 
	ON tbl_etudiant.no_da = tbl_inscription.no_da
	INNER JOIN tbl_offreCours
	ON tbl_offreCours.no_offreCours = tbl_inscription.no_offreCours
WHERE tbl_inscription.note IS NOT NULL
/*	Remarquez qui a le même rang. (Cracium et Thibaudeau, Laszlo et Dudenhoefer) */

/* 3- Pour une bourse, affichez seulement les étudiants au 1e ou 2e rang de note et ce par cours/ session 
	Placez les résultats en ordre de cours et session (6 lignes )
	truc : table dérivée ou with(DTE) 
	(exemple : 4203B2BA H2025, 1e Cracium, 2e Thibaudeau) */
SELECT *
FROM (
SELECT no_cours, no_session, note, tbl_etudiant.no_da, tbl_etudiant.nom, tbl_etudiant.prenom, 
	RANK() OVER (PARTITION BY no_cours, no_session ORDER BY note DESC) 'Rang'
FROM tbl_etudiant 
	INNER JOIN tbl_inscription 
	ON tbl_etudiant.no_da = tbl_inscription.no_da
	INNER JOIN tbl_offreCours
	ON tbl_offreCours.no_offreCours = tbl_inscription.no_offreCours
WHERE tbl_inscription.note IS NOT NULL) tabletemporaireBourseEtudiant
WHERE [Rang] <= 2

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