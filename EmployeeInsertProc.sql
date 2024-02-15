CREATE OR ALTER PROC proc_InsertEmployee
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

EXEC proc_InsertEmployee 'Umang Vadadoriya', 'umang.vadadoriya@bbd.co.za'
EXEC proc_InsertEmployee 'Krunal Rana', 'krunal.rana@bbd.co.za'
EXEC proc_InsertEmployee 'Dinesh Saw', 'dinesh.saw@bbd.co.za'

EXEC proc_InsertEmployee 'Nishant Taletiya', 'nishant.taletiya@bbd.co.za'
EXEC proc_InsertEmployee 'Parth Vaghela', 'parth.vaghela@bbd.co.za'
EXEC proc_InsertEmployee 'Vinayak Tiwari', 'vinayak.tiwari@bbd.co.za'