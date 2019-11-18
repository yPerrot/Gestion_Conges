
##CREATE DATABASE Conges;

##USE Conges;
##DROP TABLE Authentification,Fiche,Employe,Ref_Equipes,Ref_Etat_Conges,Ref_Type_Conges,Ref_Fonction,Ref_Motif_Conges,Agenda;

CREATE TABLE Ref_Fonction (
    nom_fonction varchar(30) NOT NULL,
	PRIMARY KEY (nom_fonction)
);

INSERT into Ref_Fonction VALUES ("Chef d'équipe");
INSERT into Ref_Fonction VALUES ("Membre d'équipe");


CREATE TABLE Ref_Equipes (
    nom_equipe varchar(30) NOT NULL,
	PRIMARY KEY (nom_equipe)
);

INSERT into Ref_Equipes VALUES ("RH");
INSERT into Ref_Equipes VALUES ("Comptabilité");
INSERT into Ref_Equipes VALUES ("Informatique");


CREATE TABLE Ref_Etat_Conges (
    etat varchar(30) NOT NULL,
	PRIMARY KEY (etat)
);

INSERT into Ref_Etat_Conges VALUES ("En attente");
INSERT into Ref_Etat_Conges VALUES ("Validé");
INSERT into Ref_Etat_Conges VALUES ("Refusé");


CREATE TABLE Ref_Type_Conges (
    type_conges varchar(30) NOT NULL,
	PRIMARY KEY (type_conges)
);


INSERT into Ref_Type_Conges VALUES ("RTT");
INSERT into Ref_Type_Conges VALUES ("CP");
INSERT into Ref_Type_Conges VALUES ("Formation");


CREATE TABLE Ref_Motif_Conges (
    motif_conges varchar(30) NOT NULL,
	PRIMARY KEY (motif_conges)
);


INSERT into Ref_Motif_Conges VALUES ("Maladie");
INSERT into Ref_Motif_Conges VALUES ("Famille");
INSERT into Ref_Motif_Conges VALUES ("Enfants malades");
INSERT into Ref_Motif_Conges VALUES ("Raisons personnelles");

CREATE TABLE Employe (
    login varchar(30) NOT NULL,
	pnom varchar(30) NOT NULL,
	nom varchar(30) NOT NULL,
	adresse varchar(60) NOT NULL,
	ville varchar(30) NOT NULL,
	code_postal varchar(30) NOT NULL,
	equipe varchar(30) NOT NULL,
	fonction varchar(30) NOT NULL,
	mail varchar(30) NOT NULL,
	solde_congés INT,
	PRIMARY KEY (login),
	FOREIGN KEY (equipe)
		REFERENCES Ref_Equipes (nom_equipe),
	FOREIGN KEY (fonction)
		REFERENCES Ref_Fonction (nom_fonction)
);


INSERT into Employe VALUES ("nguzzo","Nicolas","GUZZO","4 rue de verte","Lannion","22300","RH","Chef d'équipe","nguzzo@enssat.fr",10);
INSERT into Employe VALUES ("cyoudec","Clement","YOUDEC","4 rue de rouge","Lannion","22300","RH","Membre d'équipe","cyoudec@enssat.fr",20);
INSERT into Employe VALUES ("yperrot","Yohan","PERROT","4 rue de bleu","Lannion","22300","Informatique","Chef d'équipe","yperrot@enssat.fr",3);
INSERT into Employe VALUES ("lgagnant","Laurre","GAGNANT","4 rue de orange","Lannion","22300","Informatique","Membre d'équipe","lgagnant@enssat.fr",3);
INSERT into Employe VALUES ("mboue","Martin","BOUE","4 rue de violet","Lannion","22300","Comptabilité","Chef d'équipe","mboue@enssat.fr",1);

INSERT into Employe VALUES ("tlegoff","Thomas","LE GOFF","4 rue de jaune","Lannion","22300","Comptabilité","Membre d'équipe","tlegoff@enssat.fr",50);

CREATE TABLE Fiche (
    login varchar(30) NOT NULL,
	date_debut date NOT NULL,
	date_fin date NOT NULL,
	duree int NOT NULL,
	motif varchar(30) NOT NULL,
	type_conges varchar(30) NOT NULL,
	etat varchar(30) NOT NULL DEFAULT "En attente",
	date_validation date DEFAULT NULL,
	commentaire varchar(150),
	PRIMARY KEY (login,date_debut),
	FOREIGN KEY (login)
		REFERENCES Employe (login),
	FOREIGN KEY (type_conges)
		REFERENCES Ref_Type_Conges (type_conges),
	FOREIGN KEY (motif)
		REFERENCES Ref_Motif_Conges (motif_conges),
	FOREIGN KEY (etat)
		REFERENCES Ref_Etat_Conges (etat)
);

INSERT INTO Fiche VALUES ("nguzzo","2019-11-22","2019-11-24",2,"Maladie","CP",DEFAULT,DEFAULT,NULL);
INSERT INTO Fiche VALUES ("nguzzo","2019-12-22","2019-12-27",5,"Maladie","CP",DEFAULT,DEFAULT,NULL);
INSERT INTO Fiche VALUES ("mboue","2019-11-15","2019-11-17",2,"Enfants malades","CP",DEFAULT,DEFAULT,NULL);


CREATE TABLE Authentification (
    login varchar(30) NOT NULL,
	password varchar(70) NOT NULL,
	PRIMARY KEY (login),
	FOREIGN KEY (login)
		REFERENCES Employe (login)
);


CREATE TABLE Agenda (
    login varchar(30) NOT NULL,
	date_rdv date NOT NULL,
	libelle varchar(60) NOT NULL,
	PRIMARY KEY (login,date_rdv,libelle),
	FOREIGN KEY (login)
		REFERENCES Employe (login)
);
