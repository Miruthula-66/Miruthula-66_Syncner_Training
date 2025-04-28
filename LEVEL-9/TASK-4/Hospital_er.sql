CREATE DATABASE HospitalDB;
GO
USE HospitalDB;
GO
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    ContactNumber VARCHAR(15)
);
GO
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialization VARCHAR(100),
    ContactNumber VARCHAR(15)
);
GO
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);
GO
CREATE TABLE Room (
    RoomNumber INT PRIMARY KEY,
    RoomType VARCHAR(50),
    Status VARCHAR(20) 
);
GO
CREATE TABLE Admission (
    AdmissionID INT PRIMARY KEY,
    PatientID INT,
    RoomNumber INT,
    AdmissionDate DATE,
    DischargeDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber)
);
GO
CREATE TABLE Bill (
    BillID INT PRIMARY KEY,
    AdmissionID INT,
    TotalAmount DECIMAL(10, 2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (AdmissionID) REFERENCES Admission(AdmissionID)
);
GO
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    ContactNumber VARCHAR(15)
);
GO
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    StaffID INT UNIQUE,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
GO
CREATE TABLE Cashier (
    CashierID INT PRIMARY KEY,
    StaffID INT UNIQUE,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
GO
INSERT INTO Patient VALUES 
(1, 'John Doe', 30, 'Male', '123 Main St', '9876543210'),
(2, 'Jane Smith', 45, 'Female', '456 Oak Ave', '9123456789'),
(3, 'Amit Kumar', 28, 'Male', '789 Elm St', '9988776655');

INSERT INTO Doctor VALUES 
(1, 'Dr. Arjun Singh', 'Cardiology', '9001122334'),
(2, 'Dr. Riya Mehta', 'Neurology', '9002233445');

INSERT INTO Appointment VALUES 
(1, 1, 1, '2025-04-15', '10:00'),
(2, 2, 2, '2025-04-16', '11:30'),
(3, 1, 2, '2025-04-17', '09:00');


INSERT INTO Room VALUES 
(101, 'Single', 'Available'),
(102, 'Double', 'Occupied');

INSERT INTO Admission VALUES 
(1, 1, 102, '2025-04-10', '2025-04-13'),
(2, 2, 101, '2025-04-12', NULL); 

INSERT INTO Bill VALUES 
(1, 1, 15000.00, 'Paid'),
(2, 2, 10000.00, 'Pending');

INSERT INTO Staff VALUES 
(1, 'Rakesh Sharma', 'Admin', '9876540000'),
(2, 'Priya Verma', 'Cashier', '9765432100'),
(3, 'Meena Das', 'Nurse', '9456123789');

INSERT INTO Admin VALUES 
(1, 1);

INSERT INTO Cashier VALUES 
(1, 2);

SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Appointment;
SELECT * FROM Room;
SELECT * FROM Admission;
SELECT * FROM Bill;
SELECT * FROM Staff;
SELECT * FROM Admin;
SELECT * FROM Cashier;

