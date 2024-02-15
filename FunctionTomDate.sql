create or alter function TomorrowDate
returns date
as
Begin
	declare @tomDate date
	select @tomDate = cast(GETDATE()+1 as date);
	return @tomDate
End

--select dbo.TomorrowDate();