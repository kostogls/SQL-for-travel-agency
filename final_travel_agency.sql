CREATE TABLE Εταιρία (
  κωδικός INTEGER  NOT NULL  ,
  όνομα VARCHAR(30)    ,
  διεύθυνση VARCHAR(30)    ,
  τηλέφωνα VARCHAR(30)    ,
  email VARCHAR(30)      ,
PRIMARY KEY(κωδικός));



CREATE TABLE Κράτηση (
  πράκτορας VARCHAR(50)  NOT NULL  ,
  τρόπος_πληρωμής VARCHAR(30)    ,
  κατάσταση_κράτησης VARCHAR(30)      ,
PRIMARY KEY(πράκτορας));



CREATE TABLE Επιβάτης (
  κωδικός INTEGER  NOT NULL  ,
  ονοματεπώνυμο VARCHAR(50)    ,
  διεύθυνση VARCHAR(30)    ,
  τηλέφωνο INTEGER    ,
  τρόπος_πληρωμής VARCHAR(30)    ,
  θέση_αεροπλάνου VARCHAR(30)    ,
  παράθυρο_ή_διάδρομος VARCHAR(30)    ,
  διατροφή VARCHAR(30)      ,
PRIMARY KEY(κωδικός));



CREATE TABLE Αεροδρόμιο (
  κωδικός VARCHAR(30)  NOT NULL  ,
  χώρα VARCHAR(50)    ,
  πόλη VARCHAR(50)    ,
  όνομα VARCHAR(30)    ,
  τηλέφωνο INTEGER      ,
PRIMARY KEY(κωδικός));



CREATE TABLE Αεροσκάφος (
  κωδικός INTEGER  NOT NULL  ,
  μοντέλο VARCHAR(50)    ,
  χωριτικότητα INTEGER    ,
  ημερομηνία_κατασκευής DATE      ,
PRIMARY KEY(κωδικός));



CREATE TABLE συχνές_συνδρομές (
  Επιβάτης_κωδικός INTEGER  NOT NULL  ,
  Εταιρία_κωδικός INTEGER  NOT NULL  ,
  όνομα_εταιρίας VARCHAR(30)      ,
PRIMARY KEY(Επιβάτης_κωδικός, Εταιρία_κωδικός)    ,
  FOREIGN KEY(Επιβάτης_κωδικός)
    REFERENCES Επιβάτης(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Εταιρία_κωδικός)
    REFERENCES Εταιρία(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX Επιβάτης_has_Εταιρία_FKIndex1 ON συχνές_συνδρομές (Επιβάτης_κωδικός);
CREATE INDEX Επιβάτης_has_Εταιρία_FKIndex2 ON συχνές_συνδρομές (Εταιρία_κωδικός);



CREATE TABLE Πτήση (
  κωδικός INTEGER  NOT NULL  ,
  Εταιρία_κωδικός INTEGER  NOT NULL  ,
  Αεροσκάφος_κωδικός INTEGER  NOT NULL  ,
  ημερομηνία_κ_ώρα_αναχώρησης DATETIME  NOT NULL  ,
  ημερομηνία_κ_ώρα_άφιξης DATETIME  NOT NULL    ,
PRIMARY KEY(κωδικός)    ,
  FOREIGN KEY(Αεροσκάφος_κωδικός)
    REFERENCES Αεροσκάφος(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Εταιρία_κωδικός)
    REFERENCES Εταιρία(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ΠΤΗΣΗ_FKIndex1 ON Πτήση (Αεροσκάφος_κωδικός);
CREATE INDEX ΠΤΗΣΗ_FKIndex2 ON Πτήση (Εταιρία_κωδικός);



CREATE TABLE κράτηση_δημιουργείταi_για_επιβάτη (
  Κράτηση_πράκτορας VARCHAR(50)  NOT NULL  ,
  Επιβάτης_κωδικός INTEGER  NOT NULL    ,
PRIMARY KEY(Κράτηση_πράκτορας, Επιβάτης_κωδικός)    ,
  FOREIGN KEY(Κράτηση_πράκτορας)
    REFERENCES Κράτηση(πράκτορας)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Επιβάτης_κωδικός)
    REFERENCES Επιβάτης(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX Κράτηση_has_Επιβάτης_FKIndex1 ON κράτηση_δημιουργείταi_για_επιβάτη (Κράτηση_πράκτορας);
CREATE INDEX Κράτηση_has_Επιβάτης_FKIndex2 ON κράτηση_δημιουργείταi_για_επιβάτη (Επιβάτης_κωδικός);



CREATE TABLE πτήση_συμμετέχει_σε_κράτηση (
  Πτήση_κωδικός INTEGER  NOT NULL  ,
  Κράτηση_πράκτορας VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(Πτήση_κωδικός, Κράτηση_πράκτορας)    ,
  FOREIGN KEY(Πτήση_κωδικός)
    REFERENCES Πτήση(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Κράτηση_πράκτορας)
    REFERENCES Κράτηση(πράκτορας)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ΠΤΗΣΗ_has_Κράτηση_FKIndex1 ON πτήση_συμμετέχει_σε_κράτηση (Πτήση_κωδικός);
CREATE INDEX ΠΤΗΣΗ_has_Κράτηση_FKIndex2 ON πτήση_συμμετέχει_σε_κράτηση (Κράτηση_πράκτορας);



CREATE TABLE πραγματοποίηση_πτήσης (
  Πτήση_κωδικός INTEGER  NOT NULL  ,
  Αεροδρόμιο_κωδικός VARCHAR(30)  NOT NULL  ,
  αεροδρόμιο_αναχώρησης VARCHAR(30)    ,
  αεροδρόμιο_άφιξης VARCHAR(30)      ,
PRIMARY KEY(Πτήση_κωδικός, Αεροδρόμιο_κωδικός)    ,
  FOREIGN KEY(Πτήση_κωδικός)
    REFERENCES Πτήση(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Αεροδρόμιο_κωδικός)
    REFERENCES Αεροδρόμιο(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ΠΤΗΣΗ_has_Αεροδρόμιο_FKIndex1 ON πραγματοποίηση_πτήσης (Πτήση_κωδικός);
CREATE INDEX ΠΤΗΣΗ_has_Αεροδρόμιο_FKIndex2 ON πραγματοποίηση_πτήσης (Αεροδρόμιο_κωδικός);




