create or alter view viewTommEmoloyees
as 
select Employeename 
from Employee 
where EmployeeId in (select EmployeeId from DeskBooking where DeskBookingDate = cast(GETDATE()+1as date));
