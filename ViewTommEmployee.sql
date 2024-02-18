create or alter view viewTommEmployees
as 
select Employeename 
from Employee 
where EmployeeId in (select EmployeeId from DeskBooking where DeskBookingDate = dbo.TomorrowDate());

-- select * from viewTommEmployees
