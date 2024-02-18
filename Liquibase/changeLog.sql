--liquibase formatted sql

--changeset HybridHavenMigrate:1 labels:CreatingTable
CREATE TABLE [Employee] (
  [EmployeeId] integer IDENTITY(1,1) PRIMARY KEY,
  [EmployeeName] varchar(50) NOT NULL,
  [EmployeeEmail] varchar(50) NOT NULL
)
GO
-- rollback DROP TABLE Employee;

--changeset HybridHavenMigrate:2 labels:CreatingTableDeskBooking
CREATE TABLE [DeskBooking] (
  [DeskBookingId] integer IDENTITY(1,1) PRIMARY KEY,
  [EmployeeId] integer NOT NULL,
  [NeighbourId] integer NOT NULL,
  [DeskBookingDate] date NOT NULL
)
GO
-- rollback DROP TABLE DeskBooking;

--changeset HybridHavenMigrate:3 labels:CreatingTableVacation
CREATE TABLE [Vacation] (
  [VacationId] integer IDENTITY(1,1) PRIMARY KEY,
  [EmployeeId] integer NOT NULL,
  [VacationStartDate] date NOT NULL,
  [VacationEndDate] date NOT NULL
)
GO
-- rollback DROP TABLE Vacation;

--changeset HybridHavenMigrate:4 labels:CreatingTableEvents
CREATE TABLE [Events] (
  [EventID] integer IDENTITY(1,1) PRIMARY KEY,
  [EventName] varchar(50) NOT NULL,
  [EventDescription] varchar(300),
  [EventDate] datetime NOT NULL
)
GO
-- rollback DROP TABLE Events;

--changeset HybridHavenMigrate:5 labels:CreatingTableNeighbourHood
CREATE TABLE [NeighbourHood] (
  [NeighbourId] integer IDENTITY(1,1) PRIMARY KEY,
  [NeighbourName] varchar(30) NOT NULL,
  [NeighbourNumberOfDesk] integer NOT NULL
)
GO
-- rollback DROP TABLE NeighbourHood;

--changeset HybridHavenMigrate:6 labels:CreatingTableEmployeeReportsTo
CREATE TABLE [EmployeeReportsTo] (
  [EmployeeId] integer NOT NULL,
  [EmpReportsTo] integer NOT NULL
)
GO
-- rollback DROP TABLE EmployeeReportsTo;

--changeset HybridHavenMigrate:7 labels:CreatingTableEventsEmployees
CREATE TABLE [EventsEmployees] (
  [EventId] integer NOT NULL,
  [EmployeeId] integer NOT NULL
)
GO
-- rollback DROP TABLE EventsEmployees;

--changeset HybridHavenMigrate:8 labels:CreatingFK_EmpRep_Empid_Empid
ALTER TABLE [EmployeeReportsTo] ADD CONSTRAINT FK_EmpRep_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId]) 
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE EmployeeReportsTo DROP CONSTRAINT FK_EmpRep_Empid_Empid;

--changeset HybridHavenMigrate:9 labels:CreatingFK_EmpRep_Empr_Empid
ALTER TABLE [EmployeeReportsTo] ADD CONSTRAINT FK_EmpRep_Empr_Empid 
FOREIGN KEY ([EmpReportsTo]) REFERENCES [Employee] ([EmployeeId])
GO
-- rollback ALTER TABLE EmployeeReportsTo DROP CONSTRAINT FK_EmpRep_Empr_Empid;

--changeset HybridHavenMigrate:10 labels:CreatingFK_Deskbook_Empid_Empid
ALTER TABLE [DeskBooking] ADD CONSTRAINT FK_Deskbook_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE DeskBooking DROP CONSTRAINT FK_Deskbook_Empid_Empid;

--changeset HybridHavenMigrate:11 labels:CreatingFK_Vacation_Empid_Empid
ALTER TABLE [Vacation] ADD CONSTRAINT FK_Vacation_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE Vacation DROP CONSTRAINT FK_Vacation_Empid_Empid;

--changeset HybridHavenMigrate:12 labels:CreatingFK_EventsEmp_Empid_Empid
ALTER TABLE [EventsEmployees] ADD CONSTRAINT FK_EventsEmp_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE EventsEmployees DROP CONSTRAINT FK_EventsEmp_Empid_Empid;

--changeset HybridHavenMigrate:13 labels:CreatingFK_EventsEmp_Eventid_Eventid
ALTER TABLE [EventsEmployees] ADD CONSTRAINT FK_EventsEmp_Eventid_Eventid 
FOREIGN KEY ([EventId]) REFERENCES [Events] ([EventID])
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE EventsEmployees DROP CONSTRAINT FK_EventsEmp_Eventid_Eventid;

--changeset HybridHavenMigrate:14 labels:CreatingFK_NeighbourHood_Neighid_Neighid
ALTER TABLE [DeskBooking] ADD CONSTRAINT FK_NeighbourHood_Neighid_Neighid 
FOREIGN KEY ([NeighbourId]) REFERENCES [NeighbourHood] ([NeighbourId])
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE DeskBooking DROP CONSTRAINT FK_NeighbourHood_Neighid_Neighid;


--  >>>>>>>>>>>>>>
--  Insert Queries
--  <<<<<<<<<<<<<<

--changeset HybridHavenMigrate:15 labels:InsertingDataEmployee
INSERT INTO Employee (EmployeeName,EmployeeEmail)
VALUES 
('Umang Vadadoriya', 'umang.vadadoriya@bbd.co.za'),
('Krunal Rana', 'krunal.rana@bbd.co.za'),
('Dinesh Saw', 'dinesh.saw@bbd.co.za'),
('Nishant Taletiya', 'nishant.taletiya@bbd.co.za'),
('Parth Vaghela', 'parth.vaghela@bbd.co.za'),
('Vinayak Tiwari', 'vinayak.tiwari@bbd.co.za');
GO
-- rollback DELETE FROM Employee;

--changeset HybridHavenMigrate:16 labels:InsertingDataVacation
INSERT INTO Vacation (EmployeeId,VacationStartDate,VacationEndDate)
VALUES 
(5,'2023-02-15','2023-02-17'),
(5,'2023-02-25','2023-02-27'),
(6,'2023-02-15','2023-02-17'),
(6,'2023-02-25','2023-02-27');
GO
-- rollback DELETE FROM Vacation;

--changeset HybridHavenMigrate:17 labels:InsertingDataEmployeeReportsTo
INSERT INTO EmployeeReportsTo (EmployeeId,EmpReportsTo)
VALUES 
(3,1),
(4,1),
(5,2),
(6,2);
GO
-- rollback DELETE FROM EmployeeReportsTo;

--changeset HybridHavenMigrate:18 labels:InsertingDataEvents
INSERT INTO Events (EventName,EventDescription,EventDate)
VALUES 
('Lunch','At Absolute Barbeque','2024-01-12 12:00:00'),
('Dinner','At Absolute Barbeque','2024-01-12 12:00:00');
GO
-- rollback DELETE FROM Events;

--changeset HybridHavenMigrate:19 labels:InsertingDataEventsEmployees
INSERT INTO EventsEmployees (EventID,EmployeeId)
VALUES 
(1,1),
(1,2),
(1,3),
(1,4),
(1,6),
(2,1),
(2,2),
(2,3),
(2,4),
(2,5);
GO
-- rollback DELETE FROM EventsEmployees;

--changeset HybridHavenMigrate:20 labels:InsertingDataEventsNeighbourHood
INSERT INTO NeighbourHood (NeighbourName,NeighbourNumberOfDesk)
VALUES 
('Meeting',20),
('Hot Desk',20),
('Collab',32);
GO
-- rollback DELETE FROM NeighbourHood;

--changeset HybridHavenMigrate:21 labels:InsertingDataEventsDeskBooking
INSERT INTO DeskBooking (EmployeeId,NeighbourId,DeskBookingDate)
VALUES 
(1,2,'2024-02-13'),
(1,3,'2024-02-14'),
(1,1,'2024-02-15'),
(2,2,'2024-02-13'),
(2,3,'2024-02-14'),
(2,1,'2024-02-15'),
(4,2,'2024-02-13'),
(4,3,'2024-02-14'),
(4,1,'2024-02-15');
GO
-- rollback DELETE FROM DeskBooking;


--  >>>>>>>>>>>>>>
--  Extras
--  <<<<<<<<<<<<<<

--changeset HybridHavenMigrate:22 labels:CreatingPROC
CREATE OR ALTER PROC PROC_InsertEmployee
@EmployeeName VARCHAR(30),
@EmployeeEmail VARCHAR(20)
AS
	BEGIN TRY
		BEGIN TRAN TransInsert;
			INSERT INTO Employee(EmployeeName,EmployeeEmail)
			VALUES ( @EmployeeName,@EmployeeEmail);
		COMMIT;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE();
		ROLLBACK;
	END CATCH
GO
--rollback DROP PROC IF EXISTS PROC_InsertEmployee

--changeset HybridHavenMigrate:23 labels:CreatingFunction
CREATE OR ALTER FUNCTION FUNC_TomorrowDate
RETURNS DATE
AS
BEIGN
	DECLARE @tomDate DATE
	SELECT @tomDate = CAST(GETDATE()+1 AS DATE);
	RETURN @tomDate
END
GO
--rollback DROP FUNCTION IF EXISTS FUNC_TomorrowDate;

--changeset HybridHavenMigrate:24 labels:CreatingView
CREATE OR ALTER VIEW VIEW_TommEmployees
AS
SELECT Employeename 
FROM Employee 
WHERE EmployeeId IN 
    (SELECT EmployeeId 
    FROM DeskBooking 
    WHERE DeskBookingDate = dbo.FUNC_TomorrowDate());
GO
--rollback DROP VIEW IF EXISTS VIEW_TommEmployees;