/* script de cr�ation de la bdScolaire*/


/* ******************************************************************************** */
/**/
/*	CR�ATION DE LA BASE DE DONN�E : */
/**/
/*********************/
/* no 1-2 cr�ation de la base de donn�es si la database existe la d�truire */

use master

/* CODE POUR EXECUTER LE CODE M�ME SI QUELQU'UN L'UTILISE */
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
/*no 3 cr�ation de tbl_session  */

use Glg_bd /* pour utiliser la table dans laquelle on veux cr�er une table */
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
/* affiche le d�tail de la contrainte */
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
/* placez cet exercice dans le m�me fichier .sql de votre cr�ation de sch�ma. enregistrer sur votre github */

/*********************/
/* no 1 */

INSERT INTO tbl_etudiant (no_da, nom, prenom, email)
VALUES ('1234567', 'Bloom', 'Rose', '1234567@hotmail.ca')
GO
/* SELECT * FROM tbl_etudiant */

/*********************/
/* no 2 */

INSERT INTO tbl_cours (no_cours, nom, ponderation)
VALUES ('4204B2BA', 'Base de donn�es 2', '2-3-2'), ('4203B1BA', 'Base de donn�es 1', '2-2-1')
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
VALUES('4204A2BA','m�thode de d�veloppement', null)


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

/* si vous avez enlev� une contrainte, n'oubliez pas de la remettre */
/*	Faire g�n�rer un gros select (concevoir une requ�te dans l��diteur) sur toutes vos tables */
/*	pour bien voir le resultat final. */


/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 

/* Exercice #2 */

/* Exercice sur SQL : sur les proc�dures stock�es */

use Glg_bd 
go

/* 1.	Faites une proc�dure stock�es qui retourne le nombre total de cours � une session donn�e.
		elle prend en param�tre : la session

A) pas de param�tre output  */
CREATE PROCEDURE GetTotalCourses
    @Session nchar(5)
AS
    SELECT COUNT(*) AS 'Nombre de cour total de la session :' 
    FROM tbl_offreCours
    WHERE no_session = @Session;
GO

/*Faites l'appel de cette proc�dure */
DECLARE @Session nchar(5) = 'H2024';
EXEC GetTotalCourses @Session;

/* Afficher les tables pour comparer */ 
Select* from tbl_offreCours;
Select* from tbl_cours;


/* B)	m�me question mais retourne un param�tre output pour le nombre de cours de cette session */
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

/*Faites l'appel de cette proc�dure */
DECLARE @Session nchar(5) = 'H2025';
DECLARE @NombreDeCours INT;
EXEC GetTotalCoursesWithOutput @Session, @NombreDeCours OUTPUT;
SELECT @NombreDeCours AS TotalCourses;
GO


/* 2.	Faites une proc�dure stock�es qui ajoute ou modifie un �tudiant selon qu'il existe ou pas.
		les param�tres seront : son no de DA, nom,prenom,email
		Noter qu'on ne peut pas modifier la cl�.
		Votre proc�dure aura un param�tre return qui nous indiquera si on a modifier ou pas
		Choisissez 2 valeurs > que 0 qui auront ces 2 significations soit ajout ou modification effectu�e */

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
        /* Modifier l'�tudiant existant */
        UPDATE tbl_etudiant
        SET nom = @nom,
            prenom = @prenom,
            email = @email
        WHERE no_da = @no_da;

        SET @ReturnValue = 2; /* 2 = Valeur pour modification effectu�e */
    END
    ELSE
    BEGIN
        /* Ajouter un nouvel �tudiant */
        INSERT INTO tbl_etudiant (no_da, nom, prenom, email)
        VALUES (@no_da, @nom, @prenom, @email);

        SET @ReturnValue = 1; /* 1 = Valeur pour ajout effectu� */
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

/* AJOUT TABLE D�PARTEMENT ET EMPLOY� */

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
values('g�nie civil',null)
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
values('5','B�gin','Carl','2')
go
insert into tbl_employe
values('6','C�t�','Steeve','4')
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
/* Table d�riv�e (temporaire) */ 

/* Exercice sur les tables d�riv�es, With(CTE), alias: */
/* � partir de lt_biblio, le cas scolaire complet y a �t� ajout� */
use Glg_bd
go

/* 
1- faire afficher les cours qui ont un pr�alable ( avec le no_cours_pr�alable) (1 lignes)
*/
SELECT no_cours 'Num�ro de cours', nom 'Cours qui ont un pr�alable', no_coursPrealable AS 'Num�ro de cours du pr�alable'
FROM tbl_cours INNER JOIN tbl_prealable
ON tbl_cours.no_cours = tbl_prealable.no_coursBase

/*
2- Faire afficher les cours et leur pr�alable (qu�il en ait ou pas) (3 lignes)
*/
SELECT no_cours 'Num�ro de cours', nom AS 'Cours qui ont un pr�alable', no_coursPrealable AS 'Num�ro de cours du pr�alable'
FROM tbl_cours LEFT OUTER JOIN tbl_prealable
ON tbl_cours.no_cours = tbl_prealable.no_coursBase

/*
3- En utilisant a) une table d�riv�e et b) With (CTE), c) des alias, affichez tous les cours avec ou sans pr�alable 
	et pour leur pr�alable, affichez le nom de cours de celui-ci (3 lignes)
*/
/* a) une table d�riv�e */
SELECT tbl_cours.no_cours 'Num�ro de cours', tbl_cours.nom AS 'Cours qui ont un pr�alable', tbl_prealable.no_coursPrealable AS 'Num�ro de cours du pr�alable', tableTemporaireCours.nom AS 'Nom du cours pr�alable'
FROM tbl_cours LEFT OUTER JOIN tbl_prealable
ON tbl_cours.no_cours = tbl_prealable.no_coursBase
LEFT OUTER JOIN (SELECT no_cours, nom FROM tbl_cours) tableTemporaireCours
ON tableTemporaireCours.no_cours = tbl_prealable.no_coursPrealable

/* b) With (DTE)*/
WITH tabletemporaireCours (no_cours, nom_cours)
AS (SELECT no_cours, nom FROM tbl_cours)

SELECT tbl_cours.no_cours 'Num�ro de cours', tbl_cours.nom AS 'Cours qui ont un pr�alable', tbl_prealable.no_coursPrealable AS 'Num�ro de cours du pr�alable', tableTemporaireCours.nom_cours AS 'Nom du cours pr�alable'
FROM tbl_cours LEFT OUTER JOIN tbl_prealable
ON tbl_cours.no_cours = tbl_prealable.no_coursBase
LEFT OUTER JOIN tabletemporaireCours
ON tableTemporaireCours.no_cours = tbl_prealable.no_coursPrealable

/* c) alias*/
SELECT tbl_cours.no_cours 'Num�ro de cours', tbl_cours.nom AS 'Cours qui ont un pr�alable', tbl_prealable.no_coursPrealable AS 'Num�ro de cours du pr�alable', coursDeuxi�meInstance.nom AS 'Nom du cours pr�alable'
FROM tbl_cours LEFT OUTER JOIN tbl_prealable
ON tbl_cours.no_cours = tbl_prealable.no_coursBase
LEFT OUTER JOIN tbl_cours AS coursDeuxi�meInstance
ON coursDeuxi�meInstance.no_cours = tbl_prealable.no_coursPrealable

/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 

/********************************************ROW_NUMBER********************************************/

/* Donn�es � ajouter dans scolaire avant l'exercice sur rowNumber */
use Glg_bd /* mettre ta BD*/

/* donn�es une ann�e avant 2025 */
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
/*	ROW_NUMBER :	permet d'assigner un entier s�quentiel � chaque ligne d'une requ�te 
					le num�ro part � 1
	syntaxe :		ROW_NUMBER() OVER (
					[PARTITION BY partition_expression, ... ]
					ORDER BY sort_expression [ASC | DESC], ...
					)
	partition by:	divise le resultat en groupe de ligne. 
					Le nombre entier est assign� � chaque groupe et r�initialis� pour chaque groupe
					partition by est optionnel, si on l'omet, il traite toutes les lignes au complet comme un seul groupe
	order by	:	obligatoire car les nombres sont assign�s selon le tri choisi.
*/
/*	exemple sans partition */
SELECT BusinessEntityID, LastName, FirstName, Title, ROW_NUMBER() OVER (ORDER BY LastName, FirstName) Ordre
FROM     Person.Person

/*	exemple avec partition, cr�ant des sous groupes, remarquer que l'ordre recommence � 0 sur changement de valeur du regroupement */
SELECT BusinessEntityID, LastName, FirstName, Title, ROW_NUMBER() OVER (PARTITION BY title ORDER BY LastName, FirstName) Ordre
FROM     Person.Person
where title is not null

/*	ROW_NUMBER est int�ressant pour la pagination (pensons dans une page Web o� l'on veut afficher page par page pour acc�l�rer l'affichage )
	exemple affichant les clients de la page 2, une page ayant 10 clients
	Remarquez qu'on utilise une table d�riv�e pour pouvoir restreindre sur l'ordre --> ** L'ORDRE EXISTE TOUJOURS DANS UNE TABLE TEMPORAIRE ** */
select *
from (
		SELECT BusinessEntityID, LastName, FirstName, Title, ROW_NUMBER() OVER (ORDER BY LastName, FirstName) Ordre
		FROM     Person.Person ) tableTemporaireClient
where ordre > 20 and ordre <= 30 /* la table temporaire permet d'utiliser ordre dans le where */


/********************************************RANK********************************************/
/*	
rank	:	permet d'assigner un rang s�quentiel � chaque ligne d'une requ�te 
			le num�ro part � 1
			Une ligne du groupe qui a la m�me valeur recevra le m�me rang, ainsi les num�ros peuvent ne pas �tre cons�cutifs.
			instruction int�ressante pour top-N ou bottom-N tel qu'utilis� dans les pages Web par exemple.
syntaxe : 	RANK() OVER (
			[PARTITION BY partition_expression, ... ]
			ORDER BY sort_expression [ASC | DESC], ...
			)	
			
partition by :	divise le resultat en groupe de ligne. 
				Le nombre entier est assign� � chaque groupe et r�initialis� pour chaque groupe
				optionnel, si on l'omet, il traite toutes les lignes au complet comme un seul groupe
order by :		obligatoire car les nombres sont assign�s selon le tri choisi.
*/
/*	exemple sans partition, il y a des trous dans le rang car plusieurs produits ont le m�me prix */
SELECT ProductID, Name, ListPrice, 
	RANK () OVER ( ORDER BY ListPrice DESC) 'rang des prix '
FROM     Production.Product
/* Si on voudrais avoir les top 2 des produits les plus cher, les neuf premiers produits s'afficherais puisque les */
/*			5 premiers ont le m�me prix (prix plus cher) et les 4 suivant on le m�me prix (deuxi�me prix plus cher) */ 


/*	exemple avec partition, cr�ant des sous groupes, il y a des trous dans le rang
	donne le rang des prix par sous cat�gorie, sur changement de valeur de la cat�gorie, recommence � 1 */
SELECT	ProductID, Name, ListPrice, ProductSubcategoryID,
		RANK () OVER ( PARTITION BY ProductSubcategoryID ORDER BY ListPrice DESC) 'rang des prix '
FROM     Production.Product
where ProductSubcategoryID is not null

/* donne le rang des prix par sous cat�gorie mais seulement les rangs de prix <= 3, s'il y a  lieu : utilisation de table d�riv�e */
select * 
from (
		SELECT	ProductID, Name, ListPrice, ProductSubcategoryID,
				RANK () OVER ( PARTITION BY ProductSubcategoryID ORDER BY ListPrice DESC) 'rang des prix'
		FROM     Production.Product
		where ProductSubcategoryID is not null) tableTemporairePrixProduit
where [rang des prix] <= 3


/********************************************NEWID********************************************/

/* newid : g�n�re un num�ro unique, soit un uniqueidentifier */
/* exemple : afficher 5 lignes au hasard � partir de notre table person
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

	use LT_biblio /* Pour les m�mess r�sultats que les exercices */ 
	GO

/*  1-	affichez la liste de classe (no_da, nom, prenom ) en ordre alphab�tique de nom et pr�nom pour un cours 
	donn�e et une session donn�e, avec le rang avant les noms. pour 4204A2BA, H2025
	Chaque rang doit �tre unique donc (ROW_NUMBER ou rank ?) (9 lignes ) */ 
SELECT tbl_etudiant.no_da, nom, prenom, 
	ROW_NUMBER() OVER (ORDER BY nom, prenom DESC)
FROM tbl_etudiant 
	INNER JOIN tbl_inscription 
	ON tbl_etudiant.no_da = tbl_inscription.no_da
	INNER JOIN tbl_offreCours
	ON tbl_offreCours.no_offreCours = tbl_inscription.no_offreCours
WHERE tbl_offreCours.no_cours = '4204A2BA' AND tbl_offreCours.no_session = 'H2025' 
		
/*	2- affichez la liste des �tudiants (no_da, nom, prenom , no_cours, session et note) 
	en ordre de note (desc) selon le no_cours, session 
	et indiquer le rang selon la note. 
	Si 2 �tudiants ont une m�me note, il auront le m�me rang, cr�ant ainsi un trou dans les rangs.
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
/*	Remarquez qui a le m�me rang. (Cracium et Thibaudeau, Laszlo et Dudenhoefer) */

/* 3- Pour une bourse, affichez seulement les �tudiants au 1e ou 2e rang de note et ce par cours/ session 
	Placez les r�sultats en ordre de cours et session (6 lignes )
	truc : table d�riv�e ou with(DTE) 
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

/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 

/* Ajout de LT_bilbio � Glg_bd */ 

USE [master]
GO
/****** Object:  Database [LT_biblio]    Script Date: 2025-02-04 10:31:16 ******/
/* choix 1 (PC C�gep) : ajouter dans votre bd scolaire sur le serveur bd-tinfo. Changer le use apr�s le commentaire pour votre bd scolaire */
/* choix 2 (PC Perso) : ajouter sur votre serveur personnel. D�commenter le create et les alter database qui sont en commentaire */


/*
CREATE DATABASE [LT_biblio]
GO
ALTER DATABASE [LT_biblio] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LT_biblio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LT_biblio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LT_biblio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LT_biblio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LT_biblio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LT_biblio] SET ARITHABORT OFF 
GO
ALTER DATABASE [LT_biblio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LT_biblio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LT_biblio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LT_biblio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LT_biblio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LT_biblio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LT_biblio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LT_biblio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LT_biblio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LT_biblio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LT_biblio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LT_biblio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LT_biblio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LT_biblio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LT_biblio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LT_biblio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LT_biblio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LT_biblio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LT_biblio] SET  MULTI_USER 
GO
ALTER DATABASE [LT_biblio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LT_biblio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LT_biblio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LT_biblio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LT_biblio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LT_biblio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LT_biblio', N'ON'
GO
ALTER DATABASE [LT_biblio] SET QUERY_STORE = OFF
GO
*/

USE Glg_bd
GO

/****** Object:  Table [dbo].[LIVRES_AUTEURS]    Script Date: 2025-02-04 10:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVRES_AUTEURS](
	[ID_LIVRE] [int] NOT NULL,
	[ID_AUTEUR] [int] NOT NULL,
 CONSTRAINT [PK_LIVRES_AUTEURS] PRIMARY KEY CLUSTERED 
(
	[ID_LIVRE] ASC,
	[ID_AUTEUR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVRES]    Script Date: 2025-02-04 10:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVRES](
	[ID_LIVRE] [int] NOT NULL,
	[TITRE] [nvarchar](100) NULL,
	[ISBN] [nvarchar](50) NULL,
	[RESUME] [nvarchar](255) NULL,
	[ID_CATEGORIE] [int] NULL,
	[PRIX] [money] NULL,
 CONSTRAINT [PK_LIVRES] PRIMARY KEY CLUSTERED 
(
	[ID_LIVRE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUTEURS]    Script Date: 2025-02-04 10:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTEURS](
	[ID_AUTEUR] [int] NOT NULL,
	[NOM] [nvarchar](50) NULL,
	[PRENOM] [nvarchar](50) NULL,
	[DATE_NAISSANCE] [datetime] NULL,
	[DATE_DECES] [datetime] NULL,
	[NATIONALITE] [nvarchar](50) NULL,
 CONSTRAINT [PK_AUTEURS] PRIMARY KEY CLUSTERED 
(
	[ID_AUTEUR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[SommePrixLivrePArAuteur]    Script Date: 2025-02-04 10:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[SommePrixLivrePArAuteur]
(@id_auteur int)
returns table 
as
return
SELECT AUTEURS.ID_AUTEUR, AUTEURS.NOM, AUTEURS.PRENOM, sum( LIVRES.PRIX) as 'prix total'
FROM     AUTEURS INNER JOIN
                  LIVRES_AUTEURS ON AUTEURS.ID_AUTEUR = LIVRES_AUTEURS.ID_AUTEUR INNER JOIN
                  LIVRES ON LIVRES_AUTEURS.ID_LIVRE = LIVRES.ID_LIVRE
				  where AUTEURS.ID_AUTEUR = @id_auteur
				  group by AUTEURS.ID_AUTEUR, AUTEURS.NOM, AUTEURS.PRENOM
GO
/****** Object:  Table [dbo].[CATEGORIES]    Script Date: 2025-02-04 10:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIES](
	[ID_CATEGORIE] [int] NOT NULL,
	[LIB_CATEGORIE] [nvarchar](50) NULL,
 CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED 
(
	[ID_CATEGORIE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AUTEURS] ([ID_AUTEUR], [NOM], [PRENOM], [DATE_NAISSANCE], [DATE_DECES], [NATIONALITE]) VALUES (1, N'Arthus-Bertrand', N'Yann', NULL, NULL, N'Fran�aise')
INSERT [dbo].[AUTEURS] ([ID_AUTEUR], [NOM], [PRENOM], [DATE_NAISSANCE], [DATE_DECES], [NATIONALITE]) VALUES (2, N'Neret', N'Gilles', NULL, NULL, NULL)
INSERT [dbo].[AUTEURS] ([ID_AUTEUR], [NOM], [PRENOM], [DATE_NAISSANCE], [DATE_DECES], [NATIONALITE]) VALUES (3, N'Vance', N'William', NULL, NULL, NULL)
INSERT [dbo].[AUTEURS] ([ID_AUTEUR], [NOM], [PRENOM], [DATE_NAISSANCE], [DATE_DECES], [NATIONALITE]) VALUES (4, N'Van Hamme', N'Jean', NULL, NULL, NULL)
INSERT [dbo].[AUTEURS] ([ID_AUTEUR], [NOM], [PRENOM], [DATE_NAISSANCE], [DATE_DECES], [NATIONALITE]) VALUES (5, N'Goscinny', N'Ren�', NULL, NULL, NULL)
INSERT [dbo].[AUTEURS] ([ID_AUTEUR], [NOM], [PRENOM], [DATE_NAISSANCE], [DATE_DECES], [NATIONALITE]) VALUES (6, N'Uderzo', N'Albert', NULL, NULL, NULL)
INSERT [dbo].[AUTEURS] ([ID_AUTEUR], [NOM], [PRENOM], [DATE_NAISSANCE], [DATE_DECES], [NATIONALITE]) VALUES (7, N'Herg�', NULL, NULL, NULL, NULL)
INSERT [dbo].[AUTEURS] ([ID_AUTEUR], [NOM], [PRENOM], [DATE_NAISSANCE], [DATE_DECES], [NATIONALITE]) VALUES (8, N'Balzac', N'Honor� de', NULL, NULL, NULL)
INSERT [dbo].[AUTEURS] ([ID_AUTEUR], [NOM], [PRENOM], [DATE_NAISSANCE], [DATE_DECES], [NATIONALITE]) VALUES (9, N'Baudelaire', N'Charles', NULL, NULL, NULL)
INSERT [dbo].[AUTEURS] ([ID_AUTEUR], [NOM], [PRENOM], [DATE_NAISSANCE], [DATE_DECES], [NATIONALITE]) VALUES (10, N'Fuseau', N'Sandrine', NULL, NULL, NULL)
INSERT [dbo].[AUTEURS] ([ID_AUTEUR], [NOM], [PRENOM], [DATE_NAISSANCE], [DATE_DECES], [NATIONALITE]) VALUES (11, N'Giordano', N'Louis', NULL, NULL, NULL)
GO
INSERT [dbo].[CATEGORIES] ([ID_CATEGORIE], [LIB_CATEGORIE]) VALUES (1, N'ART')
INSERT [dbo].[CATEGORIES] ([ID_CATEGORIE], [LIB_CATEGORIE]) VALUES (2, N'BANDE DESSINEE')
INSERT [dbo].[CATEGORIES] ([ID_CATEGORIE], [LIB_CATEGORIE]) VALUES (3, N'HISTOIRE')
INSERT [dbo].[CATEGORIES] ([ID_CATEGORIE], [LIB_CATEGORIE]) VALUES (4, N'INTERNET ET NOUVELLES TECHNOLOGIES')
INSERT [dbo].[CATEGORIES] ([ID_CATEGORIE], [LIB_CATEGORIE]) VALUES (5, N'JEUNESSE')
INSERT [dbo].[CATEGORIES] ([ID_CATEGORIE], [LIB_CATEGORIE]) VALUES (6, N'LITTERATURE')
INSERT [dbo].[CATEGORIES] ([ID_CATEGORIE], [LIB_CATEGORIE]) VALUES (7, N'LOISIRS')
INSERT [dbo].[CATEGORIES] ([ID_CATEGORIE], [LIB_CATEGORIE]) VALUES (8, N'POLICIER')
INSERT [dbo].[CATEGORIES] ([ID_CATEGORIE], [LIB_CATEGORIE]) VALUES (9, N'SCIENCE')
INSERT [dbo].[CATEGORIES] ([ID_CATEGORIE], [LIB_CATEGORIE]) VALUES (10, N'VOYAGE')
INSERT [dbo].[CATEGORIES] ([ID_CATEGORIE], [LIB_CATEGORIE]) VALUES (11, N'LITTERATURE FRANCAISE')
GO
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (1, N'La Terre vue du ciel', N'2732425230', N'Les plus belles photos de la Terre.', 10, 60.9900)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (2, N'Auguste Rodin, sculptures et dessins', N'3822887439', N'A l''aide de glaise, de bronze et de marbre, Rodin a cr�� l''�tre humain, chant� les femmes, �veill� les passions, les joies et les vices.', 1, 42.5200)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (3, N'Toulouse-Lautrec', N'3822807915', N'Reproduction de nombreuses peitures et lithographies de Toulouse-Lautrec pr�sent�es dans un ordre chronologique illustrant les diverses �tapes de sa carri�re.', 1, 22.9900)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (4, N'XIII, tome 1 : le jour du soleil noir', N'2871290008', NULL, 2, 45.3800)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (5, N'XIII, tome 3 : toutes les larmes de l''enfer', N'2871290083', NULL, 2, 45.3800)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (6, N'XIII, tome 14 : secret d�fense', N'2871292973', NULL, 2, 45.3800)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (7, N'XIII, tome 15 : l�chez les chiens !', N'2871294526', NULL, 2, 56.2500)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (8, N'Ast�rix et Cl�op�tre', N'2012101119', N'Les aventures d''Ast�rix', 2, 18.9900)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (9, N'Ast�rx et Latraviata', N'2864971437', N'Ast�rix et Ob�lix f�tet leurs anniversaires. Et les habitants du village leur ont r�serv� une surprise.', 2, 20.2200)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (11, N'Le secret de la Licorne', N'2203001100', N'Les aventures de Tintin', 2, 22.1500)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (12, N'Le tr�sor de Rackam le Rouge', N'2203001119', N'Les aventures de Tintin', 2, 22.9900)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (18, N'Calligraphie : de nombreux ab�c�daires � broder', N'2842703014', N'V�ritable canet de croquis � emporter partout avec soi, ce livre facile � manipuler fourmille de suggestions pour broder ses propres cr�ations.', 7, 55.3200)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (19, N'500 conseils et astuces aux jardiniers d�butants', N'229007215X', N'Tous au jardin� oui, mais fute d''exp�rience, perdu dans le choix des vari�t�s, le jardinier d�butant se retrouve souvent fort d�pit� face � de pi�tres r�sultats.', 6, 12.2400)
INSERT [dbo].[LIVRES] ([ID_LIVRE], [TITRE], [ISBN], [RESUME], [ID_CATEGORIE], [PRIX]) VALUES (20, N'Le bisantin', N'152524222', NULL, 1, 14.2500)
GO
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (1, 1)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (2, 2)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (3, 2)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (4, 3)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (4, 4)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (5, 3)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (5, 4)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (6, 3)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (6, 4)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (7, 3)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (7, 4)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (8, 5)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (8, 6)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (9, 5)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (9, 6)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (11, 7)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (12, 7)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (18, 10)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (19, 11)
INSERT [dbo].[LIVRES_AUTEURS] ([ID_LIVRE], [ID_AUTEUR]) VALUES (20, 1)
GO
ALTER TABLE [dbo].[LIVRES]  WITH CHECK ADD  CONSTRAINT [FK_LIVRES_CATEGORIES] FOREIGN KEY([ID_CATEGORIE])
REFERENCES [dbo].[CATEGORIES] ([ID_CATEGORIE])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LIVRES] CHECK CONSTRAINT [FK_LIVRES_CATEGORIES]
GO
ALTER TABLE [dbo].[LIVRES_AUTEURS]  WITH CHECK ADD  CONSTRAINT [FK_LIVRES_AUTEURS_AUTEURS] FOREIGN KEY([ID_AUTEUR])
REFERENCES [dbo].[AUTEURS] ([ID_AUTEUR])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LIVRES_AUTEURS] CHECK CONSTRAINT [FK_LIVRES_AUTEURS_AUTEURS]
GO
ALTER TABLE [dbo].[LIVRES_AUTEURS]  WITH CHECK ADD  CONSTRAINT [FK_LIVRES_AUTEURS_LIVRES] FOREIGN KEY([ID_LIVRE])
REFERENCES [dbo].[LIVRES] ([ID_LIVRE])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LIVRES_AUTEURS] CHECK CONSTRAINT [FK_LIVRES_AUTEURS_LIVRES]
GO
USE [master]
GO
ALTER DATABASE [LT_biblio] SET  READ_WRITE 
GO

/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 

/******************************************** CROSS APPLY ********************************************/
/* 
cross apply et outer apply 
*/

/*
diff�rence entre un cross apply et un outer apply :
cross apply :	permet de joindre le resultat d'une fonction pour chaque ligne retourn�e par le select � gauche.
				Il retourne seulement les lignes du select � gauche qui produisent un resultat avec la fonction � droite.
				C'est pourquoi on le compare avec un inner join

outer apply :	Il retourne toutes les lignes du select � gauche qu'ils produisent un resultat ou non avec la fonction � droite.
				C'est pourquoi on le compare avec un outer join 


utilisation :	cross apply permet d'utiliser le r�sultat d'une table join � une function. 
				La table est premi�rement �valu�e et pour chaque ligne, il y a association avec la fonction
					
				sert souvent dans les cas d'un select li� � une fonction qui utilise un top
				exemple : afficher pour chaque auteur, leurs 2 livres les moins chers
		
*/

/* Les functions
*/

/* difference entre procedure stock�e et function 
	https://www.dotnettricks.com/learn/sqlserver/difference-between-stored-procedure-and-function-in-sql-server#:~:text=The%20function%20must%20return%20a,be%20called%20from%20a%20Function.
	fonction doit retourner un resultat, c'est optionnel pour la procedure stock�e
	fonction peut avoir seulement des param�tres input
	fonction peut �tre appel� dans un procedure mais une procedure ne peut �tre appel� par une fonction
	dans function (pas de insert update delete)
	function peut �tre utilis�e dans le where d'une requ�te (pas dans une proc�dure)
	function qui retourne une table peut �tre utilis�e dans un join 
	try catch ne peut �tre utilis� dans une function contrairement � la proc�dure stock�e
	les transactions peuvent �tre utilis� dans une procedure stock�e mais pas dans une fonction
*/
/* exemple de function qui retourne une table temporaire donnant les employ�s d'un d�partement donn� */

use Glg_bd /* ou pour toi ta bd scolaire dans laquelle tu as ajout� le cas Cie, tu auras les droits en cr�ation pour les fonctions  */
GO

SELECT * from tbl_employe
GO

CREATE FUNCTION GetEmployesParDepartement (@no_departement int) 
RETURNS @EMPLOYEES TABLE ( 
  nom   nvarchar(30), 
  prenom nvarchar(30),
  no_departement int) 
AS 
  BEGIN 
      INSERT INTO @EMPLOYEES 
      SELECT nom, 
             prenom, 
             no_departement
      FROM   tbl_employe  
      WHERE  no_departement = @no_departement
      RETURN 
  END
 GO
 /* N.B. @employees est une variable table , c'est une type special pour une variable locale, elle est temporaire. 
	elle est enregistr�e dans tempDb
	sa dur�e de vie se termine � la fin de la batch 
	permet l'utilisation de PK, unique, null, check */

 /* appel de la function */
	SELECT * FROM GetEmployesParDepartement(1)
  
 /* On peut sp�cifier certaines colonnes de la fonction*/
	SELECT nom,prenom FROM GetEmployesParDepartement(1)

 /*ou on peut ajouter un order by par exemple */
	SELECT * FROM GetEmployesParDepartement(1) ORDER BY prenom

/* Nous allons utiliser cette fonction pour nous donner pour chaque d�partement, les employ�s de celui-ci */

/* cross apply prend chaque ligne du select et le join � la fonction en passant en param�tre le no_departement  */ 
	SELECT * FROM tbl_departement d CROSS APPLY GetEmployesParDepartement(d.no_departement)

 /* si on veut qu'il retourne TOUS les d�partements, et pour chacun nous retourne les employ�s qu'ils y en ait ou pas
	on utilisera outer apply --> M�me principe que OUTER JOIN */ 
	 SELECT * FROM tbl_departement d OUTER APPLY GetEmployesParDepartement(d.no_departement) 

/* autre fa�on de faire la function, sans table temporaire */ 
CREATE FUNCTION GetEmployesParDepartement2 (@no_departement int) 
RETURNS TABLE
AS 
RETURN(
      SELECT nom, prenom, no_departement
      FROM   tbl_employe 
      WHERE  no_departement = @no_departement
)
GO

/* retourne pour chaque d�partement,  les employ�s */ 
 SELECT * FROM tbl_departement d CROSS APPLY GetEmployesParDepartement2(d.no_departement)

 /* Exemple, sans utiliser de function mais plut�t une table d�riv�e
 */
 SELECT * FROM tbl_departement d CROSS APPLY (	
	SELECT *
	FROM   tbl_employe 
	WHERE  tbl_employe.no_departement = d.no_departement) e

/*	Mais attention au pi�ge, si on utilise pas de fonction, et qu'on peut le faire avec un inner join, 
	c'est mieux avec un inner join, le cross apply est pas n�cessaire ...
*/
	SELECT * 
	FROM tbl_departement INNER JOIN  tbl_employe
	ON  tbl_employe.no_departement = tbl_departement.no_departement 

/*	Voici un exemple classique d'utilisation int�ressante avec un cross apply */
/*	function qui me retourne les 2 livres les moins chers d'un auteur 
	(donc l'utilisation d'un top qui servira pour toutes les lignes d'une requ�te )*/
use Glg_bd
GO
ALTER FUNCTION SommePrixLivreParAuteur(@id_auteur int)
RETURNS TABLE
AS
RETURN
	( 
	SELECT  TOP 2 livres.id_livre,titre ,prix
	FROM LIVRES INNER JOIN livres_auteurs
	ON LIVRES.id_livre = livres_auteurs.id_livre
	WHERE id_auteur = @id_auteur
	ORDER BY prix 
	)
GO

/* exemple d' appel */
SELECT * FROM SommePrixLivreParAuteur(1)
GO

/* Demande  : pour chaque auteur, faire afficher leur 2 livres les moins chers */
SELECT * 
FROM auteurs A CROSS APPLY SommePrixLivreParAuteur(A.id_auteur)
ORDER BY nom,prenom

/* on aurait aussi pu le faire avec une table d�riv�e au lieu d'une function */
SELECT * 
FROM auteurs A CROSS APPLY ( 
							SELECT  TOP 2 livres.id_livre,titre ,prix
							FROM LIVRES INNER JOIN livres_auteurs
							ON LIVRES.id_livre = livres_auteurs.id_livre
							WHERE A.id_auteur = livres_auteurs.id_auteur
							ORDER BY prix 
							) L
ORDER BY nom,prenom

/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 
/* ************************************************************************************************************************* */ 

/*Exercice #4 */

use Glg_bd /* si ta BD n'est pas complete, prend le script que je te fournis */
GO
/*	1- Lister pour chaque cours/session, les �tudiants qui ont les 2 meilleurs notes.
	on veut : no_session,no_cours,note,no_da,nom,prenom  */

/*1- a) Pour diviser en partie, commencer par faire une fonction qui me donne les �tudiants 
		qui ont les 2 meilleurs notes pour un cours et une session donn�e
		param�tre : no_cours et no_session */
CREATE FUNCTION GetStudentsByBestNote (@nomCours nvarchar, @no_session nvarchar)
RETURNS TABLE 
AS
RETURN (
	SELECT TOP 2 tbl_cours.nom, no_session, tbl_etudiant.nom, tbl_etudiant.prenom, note,
	RANK () OVER (ORDER BY note DESC) 'Meilleur Note'
	FROM tbl_etudiant 
	INNER JOIN tbl_inscription 
	ON tbl_etudiant.no_da = tbl_inscription.no_da
	INNER JOIN tbl_offreCours
	ON tbl_offreCours.no_offreCours = tbl_inscription.no_offreCours
	INNER JOIN tbl_cours
	ON tbl_cours.no_cours = tbl_offreCours.no_cours
	WHERE tbl_cours.nom = @nomCours AND no_session = @no_session )
GO
	

/* appel� votre fonction  */
	

/*	1- b) Servez-vous de votre fonction et de la commande cross apply, pour r�pondre � la question */
	
	
/* 1- c) Faites-le sans votre fonction avec cross apply et une table d�riv�e*/
		


 /* quelques r�f�rences pour ce d�mo
	https://codingsight.com/advanced-sql-cross-apply-and-outer-apply/
	https://sqlhints.com/tag/examples-of-cross-apply/
	https://towardsdatascience.com/probably-the-best-introduction-about-join-cross-apply-union-cross-joins-and-more-in-sql-server-f2ee8f8af957
 */

/*
/*
/*
/*
/* ************************************************************ */ 
/*
/* NOTES : */
/*
/* ***** ENREGISTRER UN SCRIPT ***** */
/* Click droite sur la BD */
/* T�ches */
/* G�n�rer des scripts... */
/* Suivant */
/* Suivant */
/* Avanc� */
/* Types de donn�es � inclure dans le script : Sch�ma et donn�es */
/* Ok */
/* Enregistrer comme fichier de script */
/* Suivant */
/* Suivant */
/* Terminer */
/* ************************************************************ */ 