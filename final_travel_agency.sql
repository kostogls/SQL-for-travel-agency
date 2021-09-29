CREATE TABLE ������� (
  ������� INTEGER  NOT NULL  ,
  ����� VARCHAR(30)    ,
  ��������� VARCHAR(30)    ,
  �������� VARCHAR(30)    ,
  email VARCHAR(30)      ,
PRIMARY KEY(�������));



CREATE TABLE ������� (
  ��������� VARCHAR(50)  NOT NULL  ,
  ������_�������� VARCHAR(30)    ,
  ���������_�������� VARCHAR(30)      ,
PRIMARY KEY(���������));



CREATE TABLE �������� (
  ������� INTEGER  NOT NULL  ,
  ������������� VARCHAR(50)    ,
  ��������� VARCHAR(30)    ,
  �������� INTEGER    ,
  ������_�������� VARCHAR(30)    ,
  ����_���������� VARCHAR(30)    ,
  ��������_�_��������� VARCHAR(30)    ,
  �������� VARCHAR(30)      ,
PRIMARY KEY(�������));



CREATE TABLE ���������� (
  ������� VARCHAR(30)  NOT NULL  ,
  ���� VARCHAR(50)    ,
  ���� VARCHAR(50)    ,
  ����� VARCHAR(30)    ,
  �������� INTEGER      ,
PRIMARY KEY(�������));



CREATE TABLE ���������� (
  ������� INTEGER  NOT NULL  ,
  ������� VARCHAR(50)    ,
  ������������ INTEGER    ,
  ����������_���������� DATE      ,
PRIMARY KEY(�������));



CREATE TABLE ������_��������� (
  ��������_������� INTEGER  NOT NULL  ,
  �������_������� INTEGER  NOT NULL  ,
  �����_�������� VARCHAR(30)      ,
PRIMARY KEY(��������_�������, �������_�������)    ,
  FOREIGN KEY(��������_�������)
    REFERENCES ��������(�������)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(�������_�������)
    REFERENCES �������(�������)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ��������_has_�������_FKIndex1 ON ������_��������� (��������_�������);
CREATE INDEX ��������_has_�������_FKIndex2 ON ������_��������� (�������_�������);



CREATE TABLE ����� (
  ������� INTEGER  NOT NULL  ,
  �������_������� INTEGER  NOT NULL  ,
  ����������_������� INTEGER  NOT NULL  ,
  ����������_�_���_���������� DATETIME  NOT NULL  ,
  ����������_�_���_������ DATETIME  NOT NULL    ,
PRIMARY KEY(�������)    ,
  FOREIGN KEY(����������_�������)
    REFERENCES ����������(�������)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(�������_�������)
    REFERENCES �������(�������)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX �����_FKIndex1 ON ����� (����������_�������);
CREATE INDEX �����_FKIndex2 ON ����� (�������_�������);



CREATE TABLE �������_������������i_���_������� (
  �������_��������� VARCHAR(50)  NOT NULL  ,
  ��������_������� INTEGER  NOT NULL    ,
PRIMARY KEY(�������_���������, ��������_�������)    ,
  FOREIGN KEY(�������_���������)
    REFERENCES �������(���������)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(��������_�������)
    REFERENCES ��������(�������)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX �������_has_��������_FKIndex1 ON �������_������������i_���_������� (�������_���������);
CREATE INDEX �������_has_��������_FKIndex2 ON �������_������������i_���_������� (��������_�������);



CREATE TABLE �����_����������_��_������� (
  �����_������� INTEGER  NOT NULL  ,
  �������_��������� VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(�����_�������, �������_���������)    ,
  FOREIGN KEY(�����_�������)
    REFERENCES �����(�������)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(�������_���������)
    REFERENCES �������(���������)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX �����_has_�������_FKIndex1 ON �����_����������_��_������� (�����_�������);
CREATE INDEX �����_has_�������_FKIndex2 ON �����_����������_��_������� (�������_���������);



CREATE TABLE ��������������_������ (
  �����_������� INTEGER  NOT NULL  ,
  ����������_������� VARCHAR(30)  NOT NULL  ,
  ����������_���������� VARCHAR(30)    ,
  ����������_������ VARCHAR(30)      ,
PRIMARY KEY(�����_�������, ����������_�������)    ,
  FOREIGN KEY(�����_�������)
    REFERENCES �����(�������)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(����������_�������)
    REFERENCES ����������(�������)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX �����_has_����������_FKIndex1 ON ��������������_������ (�����_�������);
CREATE INDEX �����_has_����������_FKIndex2 ON ��������������_������ (����������_�������);




