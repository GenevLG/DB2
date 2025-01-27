/* script de création de la bdScolaire*/


/* no 1-2 création de la base de données si la database existe la détruire*/
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
	no_da nchar (8) NOT NULL PRIMARY KEY,
	nom nvarchar (100) NOT NULL,
	prenom nvarchar (100) NOT NULL,
	email nvarchar (100)
)
GO


/* no 7 table tbl_inscription, */
CREATE TABLE tbl_inscription (
	no_da nchar (8) NOT NULL,
	no_offreCours int NOT NULL,
	note decimal (5,2)	
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