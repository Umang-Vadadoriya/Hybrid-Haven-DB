-- Insert Queries

-- Vacation table

INSERT INTO Vacation (EmployeeId,VacationStartDate,VacationEndDate)
VALUES 
(5,'2023-02-15','2023-02-17'),
(5,'2023-02-25','2023-02-27'),
(6,'2023-02-15','2023-02-17'),
(6,'2023-02-25','2023-02-27');

-- EmployeeReportsTo Table

INSERT INTO EmployeeReportsTo (EmployeeId,EmpReportsTo)
VALUES 
(3,1),
(4,1),
(5,2),
(6,2);

-- Events Table

INSERT INTO Events (EventName,EventDescription,EventDate)
VALUES 
('Lunch','At Absolute Barbeque','2024-01-12 12:00:00'),
('Dinner','At Absolute Barbeque','2024-01-12 12:00:00');

-- EventsEmployees Table

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

-- NeighbourHood Table

INSERT INTO NeighbourHood (NeighbourName,NeighbourNumberOfDesk)
VALUES 
('Meeting',20),
('Hot Desk',20),
('Collab',32);

-- DeskBooking Table

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

-- TodayStatus Table

INSERT INTO TodayStatus(StatusName,EmployeeId) 
VALUES 
('Home',1),
('Office',2),
('Vacation',3),
('Office',5),
('Office',6);
