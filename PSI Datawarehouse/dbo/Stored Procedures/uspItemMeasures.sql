CREATE PROCEDURE [dbo].[uspItemMeasures]

AS
	    declare @minloaddate datetime, @maxLoaddate datetime, @newrows int, @createdate datetime
	Begin try
        Select  @maxLoaddate = MaxLoadDate
        from Logging.SummaryTableLoadHistory
        where TableName = 'Summary.ItemMeasures'
    if @@ROWCOUNT = 0
        Return 100
    Select @newrows = count(*) from
     Candidate.TestAssignments where
    CreateDate > @maxLoaddate and
    StartTime is not null and StartTime <> '1/1/1900'
    if @newrows = 0
        Return 110
    End Try
    Begin catch
		Insert Logging.SQLErrors (
			ErrorLIne,
			ErrorMessage,
			ErrorNumber,
			ErrorProcedure,
			ErrorSeverity,
			ErrorState,
			ErrorDateTime )
		Values (
			ERROR_LINE(),
			ERROR_MESSAGE(),
			ERROR_NUMBER(),
			ERROR_PROCEDURE(),
			ERROR_SEVERITY(),
			ERROR_STATE(),
			getdate() )
	end catch

RETURN 0