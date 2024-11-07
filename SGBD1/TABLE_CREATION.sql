CREATE TABLE Enseignant (
    ID NUMBER(6) NOT NULL,
    Date_entree DATE,
    Nom CHAR(20) NOT NULL,
    Prenom CHAR(20) NOT NULL,
    Email CHAR(50) NOT NULL UNIQUE,
    CONSTRAINT Enseign_id_pk PRIMARY KEY (ID)
);
CREATE TABLE Matiere (
    Nom CHAR(20) NOT NULL,
    CONSTRAINT Matiere_name_pk PRIMARY KEY (Nom)
);
CREATE TABLE Promo (
    Nom CHAR(20) NOT NULL,
    Annee NUMBER(4) NOT NULL,
    CONSTRAINT promo_id_pk PRIMARY KEY (Nom, Annee)
);
CREATE TABLE Etudiant (
    ID NUMBER(6) NOT NULL,
    Nom CHAR(20) NOT NULL,
    Prenom CHAR(20) NOT NULL,
    Email CHAR(50) NOT NULL UNIQUE,
    Promo_Nom CHAR(20),
    Promo_Annee NUMBER(4),
    CONSTRAINT Etudiant_id_pk PRIMARY KEY (ID),
    CONSTRAINT promo_fk FOREIGN KEY (Promo_Nom, Promo_Annee)
        REFERENCES Promo(Nom, Annee)
);
CREATE TABLE Enseignant_Matiere (
    Enseignant_ID NUMBER(6) NOT NULL,
    Matiere_Nom CHAR(20) NOT NULL,
    CONSTRAINT Enseign_matiere_pk PRIMARY KEY (Enseignant_ID, Matiere_Nom),
    CONSTRAINT enseign_fk FOREIGN KEY (Enseignant_ID)
        REFERENCES Enseignant(ID),
    CONSTRAINT matiere_fk FOREIGN KEY (Matiere_Nom)
        REFERENCES Matiere(Nom)
);
CREATE TABLE Retard (
    ID NUMBER(6) NOT NULL,
    Etudiant_ID NUMBER(6) NOT NULL,
    Date_retard DATE NOT NULL,
    Retard INTERVAL DAY TO SECOND NOT NULL,
    Justification CHAR(100),
    CONSTRAINT Retard_id_pk PRIMARY KEY (ID),
    CONSTRAINT etudiant_fk FOREIGN KEY (Etudiant_ID)
        REFERENCES Etudiant(ID)
);
CREATE TABLE Etudiant_Promo (
    Etudiant_ID NUMBER(6) NOT NULL,
    Promo_Nom CHAR(20) NOT NULL,
    Promo_Annee NUMBER(4) NOT NULL,
    CONSTRAINT EtuProm_id_pk PRIMARY KEY (Etudiant_ID, Promo_Nom, Promo_Annee),
    CONSTRAINT etudiant2_fk FOREIGN KEY (Etudiant_ID)
        REFERENCES Etudiant(ID),
    CONSTRAINT promo2_fk FOREIGN KEY (Promo_Nom, Promo_Annee)
        REFERENCES Promo(Nom, Annee)
);

CREATE TABLE Note (
    ID NUMBER(6) NOT NULL,
    Enseignant_ID NUMBER(6) NOT NULL,
    Matiere_Nom CHAR(20) NOT NULL,
    Etudiant_ID NUMBER(6) NOT NULL,
    Date_Note DATE NOT NULL,
    Note NUMBER(2) NOT NULL CHECK (Note BETWEEN 0 AND 20),
    CONSTRAINT Note_id_pk PRIMARY KEY (ID),
    CONSTRAINT enseign2_fk FOREIGN KEY (Enseignant_ID)
        REFERENCES Enseignant(ID),
    CONSTRAINT matiere2_fk FOREIGN KEY (Matiere_Nom)
        REFERENCES Matiere(Nom),
    CONSTRAINT etudiant3_fk FOREIGN KEY (Etudiant_ID)
        REFERENCES Etudiant(ID)
);