CREATE PROCEDURE [dbo].[uspDeleteExamHistory]
	@startdate date,
	@enddate date
AS
	Begin Try
		delete from Bridge.TestSessionNotes
			from
				Bridge.TestSessionNotes a join
			(select 
			  a.TestInstanceNoteId
			  from Bridge.TestSessionNotes a join
			  bridge.TestSessionStep b on
				a.TestSessionStepKey = b.TestSessionStepId join
			 Bridge.TestSession c on
				b.TestSessionKey = c.TestSessionId
			where c.TestDate between @startdate and enddate) b on
			a.TestInstanceNoteId = b.TestInstanceNoteId

		delete from Bridge.TestSessionStep
		from
		 Bridge.TestSessionStep a join
		 Bridge.TestSession b on
			a.TestSessionKey = b.TestSessionId
		 where b.TestDate between @startdate and @enddate
	end try
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