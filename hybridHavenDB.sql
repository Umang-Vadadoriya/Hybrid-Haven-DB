-- Table Creation

CREATE TABLE [Employee] (
  [EmployeeId] integer IDENTITY(1,1) PRIMARY KEY,
  [EmployeeName] varchar(50) NOT NULL,
  [EmployeeEmail] varchar(50) NOT NULL
)
GO

CREATE TABLE [DeskBooking] (
  [DeskBookingId] integer IDENTITY(1,1) PRIMARY KEY,
  [EmployeeId] integer NOT NULL,
  [NeighbourId] integer NOT NULL,
  [DeskBookingDate] date NOT NULL
)
GO

CREATE TABLE [Vacation] (
  [VacationId] integer IDENTITY(1,1) PRIMARY KEY,
  [EmployeeId] integer NOT NULL,
  [VacationStartDate] date NOT NULL,
  [VacationEndDate] date NOT NULL
)
GO

CREATE TABLE [Events] (
  [EventID] integer IDENTITY(1,1) PRIMARY KEY,
  [EventName] varchar(50) NOT NULL,
  [EventDescription] varchar(300),
  [EventDate] datetime NOT NULL
)
GO

CREATE TABLE [NeighbourHood] (
  [NeighbourId] integer IDENTITY(1,1) PRIMARY KEY,
  [NeighbourName] varchar(30) NOT NULL,
  [NeighbourNumberOfDesk] integer NOT NULL
)
GO

CREATE TABLE [EmployeeReportsTo] (
  [EmployeeId] integer NOT NULL,
  [EmpReportsTo] integer NOT NULL
)
GO

CREATE TABLE [TodayStatus] (
  [StatusId] integer IDENTITY(1,1) PRIMARY KEY,
  [StatusName] varchar(20) NOT NULL,
  [EmployeeId] integer NOT NULL
)
GO

CREATE TABLE [EventsEmployees] (
  [EventId] integer NOT NULL,
  [EmployeeId] integer NOT NULL
)
GO

ALTER TABLE [EmployeeReportsTo] ADD CONSTRAINT FK_EmpRep_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId]) 
ON UPDATE CASCADE
GO

ALTER TABLE [EmployeeReportsTo] ADD CONSTRAINT FK_EmpRep_Empr_Empid 
FOREIGN KEY ([EmpReportsTo]) REFERENCES [Employee] ([EmployeeId])
GO


ALTER TABLE [DeskBooking] ADD CONSTRAINT FK_Deskbook_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
ON UPDATE CASCADE
GO

ALTER TABLE [Vacation] ADD CONSTRAINT FK_Vacation_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
ON UPDATE CASCADE
GO

ALTER TABLE [EventsEmployees] ADD CONSTRAINT FK_EventsEmp_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
ON UPDATE CASCADE
GO

ALTER TABLE [EventsEmployees] ADD CONSTRAINT FK_EventsEmp_Eventid_Eventid 
FOREIGN KEY ([EventId]) REFERENCES [Events] ([EventID])
ON UPDATE CASCADE
GO

ALTER TABLE [TodayStatus] ADD CONSTRAINT FK_TodayStatus_Empid_Empid 
FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
ON UPDATE CASCADE
GO

ALTER TABLE [DeskBooking] ADD CONSTRAINT FK_NeighbourHood_Neighid_Neighid 
FOREIGN KEY ([NeighbourId]) REFERENCES [NeighbourHood] ([NeighbourId])
ON UPDATE CASCADE
GO
