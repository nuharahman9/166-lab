DROP TABLE IF EXISTS Professor CASCADE; 
DROP TABLE IF EXISTS Project CASCADE; 
DROP TABLE IF EXISTS Graduate CASCADE; 
DROP TABLE IF EXISTS Department CASCADE; 
DROP TABLE IF EXISTS Work_dept; 
DROP TABLE IF EXISTS Work_in; 
DROP TABLE IF EXISTS Work_proj; 
DROP TABLE IF EXISTS Supervise; 
DROP TABLE IF EXISTS Musician CASCADE; 
DROP TABLE IF EXISTS Instrument CASCADE; 
DROP TABLE IF EXISTS Album CASCADE; 
DROP TABLE IF EXISTS Song CASCADE; 
DROP TABLE IF EXISTS Plays CASCADE; 
DROP TABLE IF EXISTS Performs CASCADE; 
DROP TABLE IF EXISTS Place CASCADE; 
DROP TABLE IF EXISTS Lives; 
DROP TABLE IF EXISTS Telephone; 


CREATE TABLE Professor(
    Name text, 
    Specialty text, 
    SSN int NOT NULL, 
    Age int, 
    Rank int,
    Pno int, 
    PRIMARY KEY(SSN)
); 

CREATE TABLE Department(
    Dno int NOT NULL, 
    Dname text, 
    Office text, 
    Runs_SSN int NOT NULL, 
    PRIMARY KEY(Dno), 
    FOREIGN KEY(Runs_SSN) REFERENCES Professor(SSN)  
); 
CREATE TABLE Graduate(
    SSN int NOT NULL, 
    Senior_SSN int NOT NULL, 
    Name text, 
    Age int, 
    Degree_prog text, 
    Major_Dno int NOT NULL,
    PRIMARY KEY(SSN), 
    FOREIGN KEY(Major_Dno) REFERENCES Department(Dno), 
    FOREIGN KEY(Senior_SSN) REFERENCES Graduate(SSN) 
); 

CREATE TABLE Project(
    Pno int, 
    Sponsor text, 
    Start_date date, 
    End_date date, 
    Budget float, 
    Manage_SSN int NOT NULL, 
    PRIMARY KEY(Pno), 
    FOREIGN KEY(Manage_SSN) REFERENCES Professor(SSN) 
); 
CREATE TABLE Work_dept(
    Time_pc time, 
    SSN int NOT NULL, 
    Dno int, 
    PRIMARY KEY(SSN, Dno), 
    FOREIGN KEY(SSN) REFERENCES Professor(SSN), 
    FOREIGN KEY(Dno) REFERENCES Department(Dno)
); 
CREATE TABLE Work_in(
    Pno int NOT NULL, 
    SSN int, 
    PRIMARY KEY(Pno, SSN), 
    FOREIGN KEY(SSN) REFERENCES Professor(SSN), 
    FOREIGN KEY(Pno) REFERENCES Project(Pno)

); 
CREATE TABLE Work_proj(
    Since date, 
    Pno int, 
    Grad_ssn int, 
    PRIMARY KEY(Pno, Grad_ssn), 
    FOREIGN KEY(Pno) REFERENCES Project(Pno), 
    FOREIGN KEY(Grad_ssn) REFERENCES Graduate(SSN)
); 
CREATE TABLE Supervise(
    Professor_SSN int, 
    Pno int NOT NULL, 
    Graduate_SSN int NOT NULL, 
    PRIMARY KEY(Professor_SSN, Pno, Graduate_SSN), 
    FOREIGN KEY(Professor_SSN) REFERENCES Professor(SSN), 
    FOREIGN KEY(Pno) REFERENCES Project(Pno), 
    FOREIGN KEY(Graduate_SSN) REFERENCES Graduate(SSN) 
); 




CREATE TABLE Musician(
    SSN int NOT NULL, 
    Name text, 
    PRIMARY KEY(SSN)
); 
CREATE TABLE Instrument(
    Instrid text NOT NULL, 
    Dname text, 
    Key text, 
    PRIMARY KEY(Instrid)
); 
CREATE TABLE Album(
    Albumidentifier text NOT NULL, 
    Producer_SSN int NOT NULL,
    Copyrightdate date,
    Speed float, 
    Title text, 
    PRIMARY KEY(Albumidentifier), 
    FOREIGN KEY(Producer_SSN) REFERENCES Musician(SSN)
); 
CREATE TABLE Song(
    Songid text NOT NULL, 
    Albumidentifier text NOT NULL, 
    Title text, 
    Author text, 
    PRIMARY KEY(Songid), 
    FOREIGN KEY(Albumidentifier) REFERENCES Album(Albumidentifier)
); 

CREATE TABLE Plays(
    Musician_SSN int, 
    Instrid text, 
    PRIMARY KEY(Musician_SSN, Instrid), 
    FOREIGN KEY(Musician_SSN) REFERENCES Musician(SSN), 
    FOREIGN KEY(Instrid) REFERENCES Instrument(Instrid)
); 
CREATE TABLE Performs(
    Musician_SSN int NOT NULL, 
    Songid text NOT NULL, 
    PRIMARY KEY(Musician_SSN, Songid), 
    FOREIGN KEY(Musician_SSN) REFERENCES Musician(SSN), 
    FOREIGN KEY(Songid) REFERENCES Song(Songid)
); 
CREATE TABLE Place(
    Address text NOT NULL, 
    PRIMARY KEY(Address)
); 
CREATE TABLE Telephone(
    Phone_no int UNIQUE, 
    Home_address text NOT NULL, 
    PRIMARY KEY(Home_address), 
    FOREIGN KEY(Home_address) REFERENCES Place(Address)
); 
CREATE TABLE Lives(
    Telephone_address text NOT NULL, 
    Phone_no int, 
    Musician_SSN int NOT NULL, 
    PRIMARY KEY(Telephone_address, Musician_SSN), 
    FOREIGN KEY(Telephone_address) REFERENCES Place(Address), 
    FOREIGN KEY(Phone_no) REFERENCES Telephone(Phone_no), 
    FOREIGN KEY(Musician_SSN) REFERENCES Musician(SSN)
); 


