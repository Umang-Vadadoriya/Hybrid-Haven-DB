--liquibase formatted sql

--changeset HybridHavenMigrate:1 labels:CreatingTable
CREATE TABLE [Employee] (
  [EmployeeId] integer IDENTITY(1,1) PRIMARY KEY,
  [EmployeeName] varchar(50) NOT NULL,
  [EmployeeEmail] varchar(50) NOT NULL
)
GO
-- rollback DROP TABLE Employee;