/* script de création de la bdScolaire*/


/* ******************************************************************************** */
/**/
/*	CRÉATION DE LA BASE DE DONNÉE : */
/**/
/* no 1-2 création de la base de données si la database existe la détruire */
use master
go
DROP DATABASE IF EXISTS Glg_bd
go
CREATE DATABASE Glg_bd
go


/*no 3 création de tbl_session  */
use Glg_bd /* pour utiliser la table dans laquelle on veux créer une table */
go

CREATE TABLE tbl_session (
    no_session nchar (5) NOT NULL primary key,
) 
GO


/*no 4 tbl_cours */
CREATE TABLE tbl_cours (
    no_cours nchar (8) NOT NULL primary key,
	nom nvarchar (100)  NOT NULL,
	ponderation nchar (5) NOT NULL,
) 
GO

ALTER TABLE tbl_cours 
ADD CONSTRAINT DF_pondCours DEFAULT '1-1-1' FOR ponderation 
GO


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


/* no 6 tbl_etudiant */
CREATE TABLE tbl_etudiant (
	no_da nchar (7) NOT NULL PRIMARY KEY,
	nom nvarchar (100) NOT NULL,
	prenom nvarchar (100) NOT NULL,
	email nvarchar (100) NULL
)
GO


/* no 7 table tbl_inscription, */
CREATE TABLE tbl_inscription (
	no_da nchar (7) NOT NULL,
	no_offreCours int NOT NULL,
	note decimal (5,2) NULL
)
GO


/* no 8 modification tbl_inscription */
ALTER TABLE tbl_inscription
ADD CONSTRAINT FK_inscription_da FOREIGN KEY (no_da) REFERENCES tbl_etudiant (no_da),
CONSTRAINT FK_inscription_offreCours FOREIGN KEY (no_offreCours) REFERENCES tbl_offreCours (no_offreCours),
CONSTRAINT PK_inscription PRIMARY KEY (no_da, no_offreCours),
CONSTRAINT CK_note CHECK (note >=0  AND note <=100)
GO


/* no 9 check sur session A H E*/
ALTER TABLE tbl_session
ADD CONSTRAINT CK_session CHECK (no_session LIKE '[A,H,E]%')
GO


/* pour afficher les contraintes */
/*
sp_help tbl_session
*/
go
/* affiche le détail de la contrainte */
/*
sp_helptext CK_tbl_session
*/


/* ******************************************************************************** */ 
/**/
/*	 EXERCICE 1 : */
/**/
/* exercice sur SQL : insert update delete*/
/* placez cet exercice dans le même fichier .sql de votre création de schéma. enregistrer sur votre github */


/* no 1 */
INSERT INTO tbl_etudiant (no_da, nom, prenom, email)
VALUES ('1234567', 'Bloom', 'Rose', '1234567@hotmail.ca')

SELECT * FROM tbl_etudiant 

/* no 2 */
INSERT INTO tbl_cours (no_cours, nom, ponderation)
VALUES ('4204B2BA', 'Base de données 2', '2-3-2'), ('4203B1BA', 'Base de données 1', '2-2-1')

SELECT * FROM tbl_cours
go

/* no 3 */
UPDATE tbl_cours
SET no_cours = '4203B2BA'
WHERE no_cours = '4203B1BA'

SELECT * FROM tbl_cours

/* no 4 */
/* A. */
INSERT INTO tbl_session (no_session) 
VALUES ('H2025')

SELECT * FROM tbl_session

INSERT INTO tbl_offreCours (no_session, no_cours)
VALUES ('H2025', '4203B2BA')

SELECT * FROM tbl_offreCours

/* B. */
INSERT INTO tbl_inscription (no_da, no_offreCours)
VALUES ('1234567',(SELECT no_offreCours 
					FROM tbl_offreCours
					WHERE no_cours = '4203B2BA' AND no_session = 'H2025'))

SELECT * FROM tbl_inscription

/* VOIR PARTIE B POUR FAIRE SELECT */

/* no 5 */
CREATE TABLE tbl_prealable
(no_coursBase int IDENTITY NOT NULL PRIMARY KEY, 
no_coursPrealable int IDENTITY NOT NULL PRIMARY KEY)

/* 
select * from tbl_prealable 
select * from tbl_cours
select * from tbl_inscription
*/


/* no 6 */



/* 
select * from AdventureWorks2022.Person.person 
select * from tbl_etudiant 
*/


/* no 7 */

/* 
select * from tbl_cours
select * from tbl_offreCours
select * from tbl_inscription

*/

/* no 8 */


/*
select * from tbl_etudiant where prenom = 'Kevin' and nom = 'Brown'
select * from tbl_inscription 
select * from tbl_etudiant
*/


/*  no 9 */
/* select * from tbl_cours */

/* si vous avez enlevé une contrainte, n'oubliez pas de la remettre */


/*	Faire générer un gros select (concevoir une requête dans l’éditeur) sur toutes vos tables 
	pour bien voir le resultat final. */








/* *************************************** */ 
/*
/* NOTES :
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
/* *************************************** */ 