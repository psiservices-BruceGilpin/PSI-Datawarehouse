CREATE PROCEDURE [dbo].[uspStepCountUpdate]
	
AS
	Declare @refdate date
	Select @refdate = max(stepdate)
	from DataAnalysis.DailyStepCount
	If @refdate is null 
	begin 
		set @refdate = '12/17/2021'
	end
	Begin try
		Insert DataAnalysis.DailyStepCount (StepDate, OrgName, StepKey, StepCount)
		select StartDate, c.OrgFriendlyName, StepKey, count(*)
		from Bridge.TestSessionStep a join
			 Bridge.TestSession b on
				a.TestSessionKey = b.TestSessionId join
			 Bridge.Organization c on
				b.Account = c.RpassOrg
		where StartDate > @refdate
		group by a.StartDate,c.OrgFriendlyName, b.account, a.StepKey;

		Insert DataAnalysis.DailyStepCount (StepDate, OrgName, StepKey, StepCount)
		Select StartDate, c.orgFriendlyName, 0, Count(*)
		from Bridge.TestSessionStep a join
			 Bridge.TestSession b on
				a.TestSessionKey = b.TestSessionId join
			 Bridge.Organization c on
				b.Account = c.RpassOrg		where StartDate > @refdate
		group by StartDate, c.OrgFriendlyName;
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