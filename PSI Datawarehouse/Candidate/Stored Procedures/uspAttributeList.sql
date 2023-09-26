CREATE PROC [Candidate].[uspAttributeList]
	
AS
BEGIN
	declare @value varchar(5), @valueslist varchar(1000)
	declare CU1 cursor for
		select cast(SourceAttributeID as varchar(5))
			from Candidate.DemographicTypes
	Open CU1
	set @valueslist = '('
	Fetch Next from CU1 into @value
	While @@FETCH_STATUS = 0
	Begin
		set @valueslist = @valueslist + @value 
		Fetch Next from CU1 into @value
		if @@FETCH_STATUS = 0
			set @valueslist = @valueslist + ','
	end
	select @valueslist + ')'
		
	
END