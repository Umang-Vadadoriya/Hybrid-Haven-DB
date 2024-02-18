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