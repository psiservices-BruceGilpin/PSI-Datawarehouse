CREATE PROCEDURE [dbo].[uspStepOrderDurationSummary]
	
AS
	Begin Try
		Truncate Table Reporting.StepOrderSummary
		Insert into Reporting.StepOrderSummary
		(
			[Account],
		StepOrder,
		[Less Than 1 Minute],
		[One to 5 minutes],
		[Five To 7.5 Minutes],
		[7.501 To 10 Minutes],
		[10.001 To 12.5 Minutes],
		[12.5001 to 15 Minutes],
		[15.001 to 17.5 Minutes],
		[17.501 to 20 Minutes],
		[Greater Than 20 Minutes] )
		select 
			a.account,
			a.steporder,
			sum([less than 1 minute]) 'less than 1 minute', 
			sum([1 to 5 Minutes]) '1 to 5 Minutes',
			sum([5 to 7.5 minutes]) '5 to 7.5 minutes',
			sum([7.501 to 10 minutes]) '7.501 to 10 minutes',
			sum([10.001 to 12.5 Minutes]) '10.001 to 12.5 Minutes',
			sum([12.5001 to 15 minutes]) '12.5001 to 15 minutes',
			sum([15 to 17.5 minutes]) '15 to 17.5 minutes',
			sum([17.5001 to 20 minutes]) '17.5001 to 20 minutes',
			sum([Greater than 20 minutes]) 'Greater than 20 minutes'
			from
			(
			select TestSessionId, account, steporder,
			 case 
			  when StepDuration < 1 or StepDuration is null then 1 else 0
			 end  'Less than 1 minute',
			 case 
			  when StepDuration between 1.000001 and 5.0 then 1 else 0
			 end '1 to 5 Minutes',
			 case
			  when StepDuration between 5.0001 and 7.5 then 1 else 0
			 end '5 to 7.5 minutes',
			 case
			  when StepDuration between 7.5001 and 10.0 then 1 else 0
			 end '7.501 to 10 minutes',
			 case
			  when StepDuration between 10.0001 and 12.50 then 1 else 0
			 end '10.001 to 12.5 Minutes',
			 case
			  when StepDuration between 12.501 and 15.0 then 1 else 0
			 end '12.5001 to 15 minutes',
			 case
			  when StepDuration between 15.001 and 17.5 then 1 else 0
			 end '15 to 17.5 minutes',
			 case
			  when StepDuration between 17.5001 and 20.0 then 1 else 0
			 end '17.5001 to 20 minutes',
			 case
			  when StepDuration > 20.001 then 1 else 0
			 end 'Greater than 20 minutes'
			 from Bridge.vwTestSessions_NoNotes
			 ) a
			 group by  a.Account, a.StepOrder

			 Update Reporting.StepOrderSummary
			 set [Total For Order Position] = 
				[Less Than 1 Minute] +
				[One to 5 minutes] +
				[Five To 7.5 Minutes] +
				[7.501 To 10 Minutes] +
				[10.001 To 12.5 Minutes] +
				[12.5001 to 15 Minutes] +
				[15.001 to 17.5 Minutes] +
				[17.501 to 20 Minutes] +
				[Greater Than 20 Minutes] 
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