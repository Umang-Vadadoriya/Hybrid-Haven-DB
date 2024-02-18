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

--changeset HybridHavenMigrate:7 labels:CreatingTableTodayStatus
CREATE TABLE [TodayStatus] (
  [StatusId] integer IDENTITY(1,1) PRIMARY KEY,
  [StatusName] varchar(20) NOT NULL,
  [EmployeeId] integer NOT NULL
)
GO
-- rollback DROP TABLE TodayStatus;

--changeset HybridHavenMigrate:8 labels:CreatingTableEventsEmployees
CREATE TABLE [EventsEmployees] (
  [EventId] integer NOT NULL,
  [EmployeeId] integer NOT NULL
)
GO
-- rollback DROP TABLE EventsEmployees;

--changeset HybridHavenMigrate:9 labels:CreatingFK_EmpRep_Empid_Empid
ALTER TABLE [EmployeeReportsTo] ADD CONSTRAINT FK_EmpRep_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId]) 
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE EmployeeReportsTo DROP CONSTRAINT FK_EmpRep_Empid_Empid;

--changeset HybridHavenMigrate:10 labels:CreatingFK_EmpRep_Empr_Empid
ALTER TABLE [EmployeeReportsTo] ADD CONSTRAINT FK_EmpRep_Empr_Empid 
FOREIGN KEY ([EmpReportsTo]) REFERENCES [Employee] ([EmployeeId])
GO
-- rollback ALTER TABLE EmployeeReportsTo DROP CONSTRAINT FK_EmpRep_Empr_Empid;

--changeset HybridHavenMigrate:11 labels:CreatingFK_Deskbook_Empid_Empid
ALTER TABLE [DeskBooking] ADD CONSTRAINT FK_Deskbook_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE DeskBooking DROP CONSTRAINT FK_Deskbook_Empid_Empid;

--changeset HybridHavenMigrate:12 labels:CreatingFK_Vacation_Empid_Empid
ALTER TABLE [Vacation] ADD CONSTRAINT FK_Vacation_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE Vacation DROP CONSTRAINT FK_Vacation_Empid_Empid;

--changeset HybridHavenMigrate:13 labels:CreatingFK_EventsEmp_Empid_Empid
ALTER TABLE [EventsEmployees] ADD CONSTRAINT FK_EventsEmp_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE EventsEmployees DROP CONSTRAINT FK_EventsEmp_Empid_Empid;

--changeset HybridHavenMigrate:14 labels:CreatingFK_EventsEmp_Eventid_Eventid
ALTER TABLE [EventsEmployees] ADD CONSTRAINT FK_EventsEmp_Eventid_Eventid 
FOREIGN KEY ([EventId]) REFERENCES [Events] ([EventID])
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE EventsEmployees DROP CONSTRAINT FK_EventsEmp_Eventid_Eventid;

--changeset HybridHavenMigrate:15 labels:CreatingFK_TodayStatus_Empid_Empid
ALTER TABLE [TodayStatus] ADD CONSTRAINT FK_TodayStatus_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE TodayStatus DROP CONSTRAINT FK_TodayStatus_Empid_Empid;

--changeset HybridHavenMigrate:16 labels:CreatingFK_NeighbourHood_Neighid_Neighid
ALTER TABLE [DeskBooking] ADD CONSTRAINT FK_NeighbourHood_Neighid_Neighid 
FOREIGN KEY ([NeighbourId]) REFERENCES [NeighbourHood] ([NeighbourId])
ON UPDATE CASCADE
GO
-- rollback ALTER TABLE DeskBooking DROP CONSTRAINT FK_NeighbourHood_Neighid_Neighid;
