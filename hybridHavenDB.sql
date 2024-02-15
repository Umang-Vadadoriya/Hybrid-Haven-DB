CREATE TABLE [Employee] (
  [EmployeeId] integer IDENTITY(1,1) PRIMARY KEY,
  [EmployeeName] varchar(30),
  [EmployeeEmail] varchar(30)
)
GO

CREATE TABLE [DeskBooking] (
  [DeskBookingId]  integer IDENTITY(1,1) PRIMARY KEY,
  [EmployeeId] integer,
  [NeighbourId] integer,
  [DeskBookingDate] date
)
GO

CREATE TABLE [Vacation] (
  [VacationId] integer IDENTITY(1,1) PRIMARY KEY,
  [EmployeeId] integer,
  [VacationStartDate] date,
  [VacationEndDate] date
)
GO

CREATE TABLE [Events] (
  [EventID] integer IDENTITY(1,1) PRIMARY KEY,
  [EventName] varchar(20),
  [EventDescription] varchar(max),
  [EventDate] datetime
)
GO

CREATE TABLE [NeighbourHood] (
  [NeighbourId] integer IDENTITY(1,1) PRIMARY KEY,
  [NeighbourName] varchar(20),
  [NeighbourNumberOfDesk] integer
)
GO

CREATE TABLE [Status] (
  [StatusId] integer IDENTITY(1,1) PRIMARY KEY,
  [StatusName] varchar(20)
)
GO

CREATE TABLE [Gathering] (
  [GatheringId] integer IDENTITY(1,1) PRIMARY KEY,
  [GatheringName] varchar(20),
  [GatheringDateTime] datetime,
  [GatheringCreatedBy] integer
)
GO

CREATE TABLE [GatheringEmployees] (
  [GatheringId] integer,
  [EmployeeId] integer
)
GO

CREATE TABLE [EventsEmployees] (
  [EventId] integer,
  [EmployeeId] integer
)
GO

CREATE TABLE [EmployeeReportsTo] (
  [EmployeeId] integer,
  [EmployeeReportsTo] integer
)
GO

ALTER TABLE [Gathering] ADD FOREIGN KEY ([GatheringCreatedBy]) REFERENCES [Employee] ([EmployeeId])
GO

ALTER TABLE [EmployeeReportsTo] ADD FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
GO

ALTER TABLE [DeskBooking] ADD FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
GO

ALTER TABLE [Vacation] ADD FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
GO

ALTER TABLE [EventsEmployees] ADD FOREIGN KEY ([EmployeeId]) REFERENCES [Employee] ([EmployeeId])
GO

ALTER TABLE [EventsEmployees] ADD FOREIGN KEY ([EventId]) REFERENCES [Events] ([EventID])
GO


