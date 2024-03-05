-- Table Creation

CREATE TABLE [Employee] (
  [EmployeeId] integer PRIMARY KEY IDENTITY(1, 1),
  [EmployeeName] varchar(50) NOT NULL,
  [EmployeeReportsTo] integer NOT NULL
)
GO

CREATE TABLE [EmployeeContact] (
  [EmployeeContactId] integer PRIMARY KEY IDENTITY(1, 1),
  [EmployeeId] integer NOT NULL,
  [EmployeeEmail] varchar(50) NOT NULL,
  [EmployeeContact] varchar(13) NOT NULL
)
GO

CREATE TABLE [DeskBooking] (
  [DeskBookingId] integer PRIMARY KEY IDENTITY(1, 1),
  [EmployeeId] integer NOT NULL,
  [NeighbourId] integer NOT NULL,
  [DeskBookingDate] date NOT NULL
)
GO

CREATE TABLE [Vacation] (
  [VacationId] integer PRIMARY KEY IDENTITY(1, 1),
  [EmployeeId] integer NOT NULL,
  [VacationStartDate] date NOT NULL,
  [VacationEndDate] date NOT NULL
)
GO

CREATE TABLE [Events] (
  [EventID] integer PRIMARY KEY IDENTITY(1, 1),
  [EventName] varchar(50) NOT NULL,
  [EventDescription] varchar(300),
  [EventDate] datetime NOT NULL
)
GO

CREATE TABLE [NeighbourHood] (
  [NeighbourId] integer PRIMARY KEY IDENTITY(1, 1),
  [NeighbourName] varchar(30) NOT NULL,
  [NeighbourNumberOfDesk] integer NOT NULL
)
GO

CREATE TABLE [EventsEmployees] (
  [EventId] integer NOT NULL,
  [EmployeeId] integer NOT NULL
)
GO

ALTER TABLE [DeskBooking] ADD CONSTRAINT [FK_Deskbook_Empid_Empid] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId]) ON UPDATE CASCADE
GO

ALTER TABLE [Vacation] ADD CONSTRAINT [FK_Vacation_Empid_Empid] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId]) ON UPDATE CASCADE
GO

ALTER TABLE [EventsEmployees] ADD CONSTRAINT [FK_EventsEmp_Empid_Empid] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId]) ON UPDATE CASCADE
GO

ALTER TABLE [EventsEmployees] ADD CONSTRAINT [FK_EventsEmp_Eventid_Eventid] FOREIGN KEY ([EventId]) REFERENCES [Events] ([EventID]) ON UPDATE CASCADE
GO

ALTER TABLE [DeskBooking] ADD CONSTRAINT [FK_NeighbourHood_Neighid_Neighid] FOREIGN KEY ([NeighbourId]) REFERENCES [NeighbourHood] ([NeighbourId]) ON UPDATE CASCADE
GO

ALTER TABLE [EmployeeContact] ADD CONSTRAINT [FK_Employee_Empid_EmpContact] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId]) on UPDATE CASCADE
GO
