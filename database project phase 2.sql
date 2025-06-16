create database heartdisease ;
use heartdisease ;
CREATE TABLE Users (
    UsernationalID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(255) UNIQUE,
    HashedPassword VARCHAR(255), 
    Email VARCHAR(255),
    CreateDate DATETIME,
    LastLogin DATETIME
);
show tables;
describe Users;
INSERT INTO Users (Username, HashedPassword, Email, CreateDate)
VALUES ('newUser', 'hashed_password_here', 'user@example.com', NOW());
SELECT UsernationalID FROM Users
WHERE Username = 'existingUser' AND HashedPassword = 'hashed_password_here';

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DOB DATE,
    Gender CHAR(1),
    ContactNumber VARCHAR(15)
);
show tables;
describe patients;
CREATE TABLE Diagnoses (
    DiagnosisID INT PRIMARY KEY,
    PatientID INT,
    DiagnosisDate DATE,
    HeartDiseaseType VARCHAR(100),
    Severity VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);
show tables;
describe Diagnoses;
CREATE TABLE Treatments (
    TreatmentID INT PRIMARY KEY,
    DiagnosisID INT,
    TreatmentType VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Outcome VARCHAR(100),
    FOREIGN KEY (DiagnosisID) REFERENCES Diagnoses(DiagnosisID)
);
show tables;
describe Treatments;
CREATE TABLE Results (
    ResultID INT PRIMARY KEY AUTO_INCREMENT,
    TreatmentID INT,
    Measurement VARCHAR(100),
    Value VARCHAR(100),
    ResultDate DATE,
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
);
show tables;
describe results;
