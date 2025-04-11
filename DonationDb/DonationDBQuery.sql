USE master;
go
Create Database Donation;
go 
Use Donation;
go
-- User Table
CREATE TABLE [User] (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(100),
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(20),
    Password NVARCHAR(100),
    CreatedAt DATETIME,
    LastLogout DATETIME,
    DateOfBirth DATE,
    UserType NVARCHAR(10) CHECK (UserType IN ('donor', 'admin')) NOT NULL
);

-- Notification Table
CREATE TABLE [Notification] (
    NotificationId INT IDENTITY(1,1) PRIMARY KEY,
    DonorId INT,
    Title NVARCHAR(200),
    Description NVARCHAR(MAX),
    FOREIGN KEY (DonorId) REFERENCES [User](UserId)
);

-- Payments Table
CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    PaymentMethod NVARCHAR(50)
);

-- Reports Table
CREATE TABLE Reports (
    ReportID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200),
    Description NVARCHAR(MAX)
);

-- Activities Table
CREATE TABLE Activities (
    ActivityID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200),
    Description NVARCHAR(MAX),
    Category NVARCHAR(100),
    TargetAmount DECIMAL(18,2),
    CollectedAmount DECIMAL(18,2),
    StartDate DATE,
    EndDate DATE,
    Status NVARCHAR(50),
    ReportID INT,
    FOREIGN KEY (ReportID) REFERENCES Reports(ReportID)
);

-- Donations Table
CREATE TABLE Donations (
    DonationID INT IDENTITY(1,1) PRIMARY KEY,
    DonorID INT,
    PaymentID INT,
    ActivityID INT,
    Amount DECIMAL(18,2),
    DonationDate DATE,
    Status NVARCHAR(50),
    FOREIGN KEY (DonorID) REFERENCES [User](UserId),
    FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID),
    FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID)
);

go 

-- Insert Admin Users (UserId auto-generated)
INSERT INTO [User] (UserName, Email, Phone, Password, CreatedAt, LastLogout, DateOfBirth, UserType)
VALUES 
('Fares Elawady', 'fares.elawady@example.com', '01234567890', 'SecurePass123', GETDATE(), NULL, '1990-01-01', 'admin'),
('Abdalrahman Elegail', 'abdalrahman.elegail@example.com', '01234567891', 'SecurePass123', GETDATE(), NULL, '1991-02-02', 'admin'),
('Ammar Yasser', 'ammar.yasser@example.com', '01234567892', 'SecurePass123', GETDATE(), NULL, '1992-03-03', 'admin'),
('Ahmed Salah', 'ahmed.salah@example.com', '01234567893', 'SecurePass123', GETDATE(), NULL, '1993-04-04', 'admin'),
('Abdelrahman Emad', 'abdelrahman.emad@example.com', '01234567894', 'SecurePass123', GETDATE(), NULL, '1994-05-05', 'admin');

go 

-- Insert Donor Users (UserType = 'donor')
INSERT INTO [User] (UserName, Email, Phone, Password, CreatedAt, LastLogout, DateOfBirth, UserType)
VALUES
('Lina Khaled', 'lina.khaled@example.com', '01112345670', 'DonorPass1', GETDATE(), NULL, '1996-07-12', 'donor'),
('Omar Tarek', 'omar.tarek@example.com', '01098765432', 'DonorPass2', GETDATE(), NULL, '1990-03-05', 'donor'),
('Sara Mohamed', 'sara.mohamed@example.com', '01234567899', 'DonorPass3', GETDATE(), NULL, '1994-11-21', 'donor'),
('Youssef Adel', 'youssef.adel@example.com', '01123456789', 'DonorPass4', GETDATE(), NULL, '1988-06-30', 'donor'),
('Nour Hassan', 'nour.hassan@example.com', '01011223344', 'DonorPass5', GETDATE(), NULL, '1992-09-10', 'donor'),
('Mina Samir', 'mina.samir@example.com', '01212341234', 'DonorPass6', GETDATE(), NULL, '1985-12-01', 'donor'),
('Jana Mahmoud', 'jana.mahmoud@example.com', '01199887766', 'DonorPass7', GETDATE(), NULL, '2000-01-15', 'donor'),
('Karim Nabil', 'karim.nabil@example.com', '01077665544', 'DonorPass8', GETDATE(), NULL, '1997-05-25', 'donor'),
('Salma Younis', 'salma.younis@example.com', '01233445566', 'DonorPass9', GETDATE(), NULL, '1993-04-09', 'donor'),
('Tamer Fathy', 'tamer.fathy@example.com', '01155667788', 'DonorPass10', GETDATE(), NULL, '1989-10-20', 'donor');

go

INSERT INTO Reports (Title, Description)
VALUES 
('Annual Impact Report', 'Detailed overview of donations and distributions in 2024.'),
('Quarterly Financial Summary', 'Breakdown of spending across Q1.'),
('Health Initiative Report', 'Updates on funded health programs.'),
('Education Project Summary', 'Overview of scholarship activities.'),
('Emergency Relief Report', 'Coverage of urgent aid missions.');

go 

INSERT INTO Activities (Title, Description, Category, TargetAmount, CollectedAmount, StartDate, EndDate, Status, ReportID)
VALUES
('Clean Water Project', 'Build wells in rural villages.', 'Health', 50000, 27000, '2025-01-01', '2025-06-30', 'Ongoing', 1),
('Back to School Campaign', 'Supply backpacks and materials.', 'Education', 30000, 30000, '2025-02-01', '2025-03-15', 'Completed', 4),
('Medical Aid Drive', 'Send medical kits to clinics.', 'Health', 40000, 15000, '2025-03-01', '2025-09-01', 'Ongoing', 3),
('Food Basket Delivery', 'Distribute food for families.', 'Relief', 25000, 22000, '2025-01-15', '2025-04-01', 'Completed', 5),
('Emergency Shelter Setup', 'Setup tents for disaster victims.', 'Relief', 45000, 12000, '2025-04-01', '2025-08-01', 'Ongoing', 5);


go

INSERT INTO Payments (PaymentMethod)
VALUES 
('Credit Card'),
('Bank Transfer'),
('PayPal'),
('Cash'),
('Mobile Wallet');

go

INSERT INTO Donations (DonorID, PaymentID, ActivityID, Amount, DonationDate, Status)
VALUES
(6, 1, 1, 1000, '2025-01-10', 'Confirmed'),
(7, 3, 2, 2500, '2025-02-05', 'Confirmed'),
(8, 2, 3, 3000, '2025-03-12', 'Pending'),
(9, 4, 4, 500, '2025-01-20', 'Confirmed'),
(10, 1, 5, 1200, '2025-04-01', 'Confirmed'),
(11, 5, 1, 2000, '2025-02-25', 'Confirmed'),
(12, 2, 2, 1500, '2025-02-15', 'Pending'),
(13, 3, 3, 3500, '2025-03-20', 'Confirmed'),
(14, 4, 4, 1000, '2025-03-10', 'Failed'),
(15, 1, 5, 2200, '2025-04-05', 'Confirmed');

go 

INSERT INTO Notification (DonorId, Title, Description)
VALUES
(6, 'Thank You!', 'We appreciate your donation to the Clean Water Project.'),
(7, 'Activity Update', 'Back to School campaign has been completed!'),
(8, 'New Opportunity', 'Help us launch the Medical Aid Drive.'),
(9, 'Receipt Available', 'Download your receipt for the Food Basket Donation.'),
(10, 'Impact Report Ready', 'See how your donation helped in Q1 2025.'),
(11, 'Join Again', 'Shelter setup needs your support.'),
(12, 'Campaign Success', 'We met our goal thanks to you!'),
(13, 'Action Needed', 'Please confirm your recent donation.'),
(14, 'Survey', 'Tell us how we’re doing.'),
(15, 'Upcoming Event', 'Join our donor webinar this month.');
