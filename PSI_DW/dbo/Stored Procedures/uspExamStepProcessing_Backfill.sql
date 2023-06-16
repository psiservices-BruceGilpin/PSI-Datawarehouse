CREATE PROC [dbo].[uspExamStepProcessing_Backfill]
	@startdate date,
	@enddate date

AS
Begin
	Declare @runerror int = 0, @runerrormsg varchar(1000), @storedproc varchar(30) = 'uspExamStepProcessing_Backfill', @errornum int
	Create table #StepTable (
		TestSessionID		Int,
		StepState			varchar(50),
		StartTime			datetime,
		EndTime				datetime,
		StepOrder			int,
		Duration			decimal(10,2),
		Starttimestamp		datetime,
		Note				varchar(max),
		Rundate				date,
		RunID				int )
	create clustered index idx1 on #Steptable (TestSessionID, StepOrder)

	Create table #PDiddys ( PidddyKey varchar(100) )
	declare @flag int
	Begin try
		Insert #PDiddys (PidddyKey)
		Select distinct a.PDiddy
		from psi_Staging.Staging.ExamState a left join
			 Bridge.TestSession b on
			a.pdiddy =  b.dossierKey + '::' + b.SessionKey 
		where a.timestamp between @startdate and @enddate and
								  b.TestDate is null and
								  b.DossierKey is not null

		if @@ROWCOUNT = 0
		begin
			Insert Logging.SQLErrors (
				ErrorLIne,
				ErrorMessage,
				ErrorNumber,
				ErrorProcedure,
				ErrorSeverity,
				ErrorDateTime )
			Values (
				ERROR_LINE(),
				'No unprocessed exam sessions found within the date range supplied.',
				50001,
				'USPExamStepProcessing_backfill',
				15,
				getdate() )

		end
		else
		begin
			Truncate table Staging.StagingTestSessionStep
				
			Insert into #StepTable (
				TestSessionID,
				StepState,
				EndTime,
				RunDate,
				RunID,
				Note,
				StepOrder)
			select  
				a.TestSessionId
				, b.state
				, b.timeStamp
				, b.rundate
				, b.RunId 
				, b.note
				,  row_number() Over(partition by a.TestSessionID order by timestamp  ) steporder
			FROM [PSI_DW].[Bridge].[TestSession] a join
				  PSI_Staging.Staging.ExamState  b on
					a.DossierKey + '::' + a.SessionKey = b.pDiddy join
				 #PDiddys c on
					b.pdiddy = c.PidddyKey
			order by a.TestSessionId, steporder 
	
			Insert into DimExamSteps (StepName)
			select distinct StepState 
			from #StepTable a left join
			DimExamSteps b on
				a.StepState = b.StepName
			where b.StepName is null
			


		Declare @SessionID int, @StepOrder int, @StartTime datetime, @Endtime datetime, @RefSessionID int, @duration decimal(11,3)
		Declare c1 cursor for
			Select
				TestSessionID,
				EndTime,
				StepOrder
			from #StepTable
			order by TestSessionID, StepOrder desc
		Open c1
		Fetch Next from C1 into
			@SessionID,
			@EndTime,
			@StepOrder
		set @RefSessionID = @SessionID

		While @@FETCH_STATUS = 0
		Begin
			Set @duration = 0
			Select 
				@Starttime = EndTime
			from #StepTable
			where 
				TestSessionID = @RefSessionID and
				StepOrder = @StepOrder - 1
			if @@ROWCOUNT > 0
			Begin

				Update #StepTable
				Set
					StartTime = @StartTime
				where
					TestSessionID	= @SessionID and
					StepOrder		= @StepOrder
			end

			Fetch Next from C1 into
			@SessionID,
			@StartTime,
			@StepOrder
			IF @RefSessionID <> @SessionID
			Begin
				set
					@RefSessionID = @SessionID
			end
	
		end

		Update #StepTable
				set Duration =	iif(datediff(ss,StartTime, EndTime) = 0,0.1,datediff(ss,StartTime, EndTime))
	


		Insert Staging.StagingTestSessionStep (
			SessionID, StepKey, StepOrder, note, StartDate, StartTime, EndDate, EndTime, Duration, RunDate )
		select
			TestSessionID,
			b.ExamStepId,
			StepOrder,
			note,
			isnull(cast(starttime as date), cast(endtime as date)),
			isnull(cast(starttime as time),cast(EndTime as time)),
			cast(Endtime as date),
			cast(endtime as time),
			Duration,
			Rundate
		From #StepTable a join
			DimExamSteps b on
			a.StepState = b.StepName

		Insert Bridge.TestSessionStep
		( TestSessionKey, StepKey, StepOrder,StartDate, StartTime,Enddate,EndTime,Duration, RunDate )
		select
		  a.SessionID,
		  a.stepkey,
		  a.StepOrder, 
		  a.StartDate,
		  a.StartTime, 
		  a.EndDate,
		  a.EndTime,
		  a.Duration,
		  a.RunDate
		from Staging.StagingTestSessionStep a 

		Update Bridge.TestSession 
			set TestDate = startdate
		from
				(select SessionID, min(startdate) startdate
				  from Staging.StagingTestSessionStep
				  group by sessionid ) a join
				  Bridge.TestSession b on
					a.SessionID = b.TestSessionId
		Update Bridge.TestSession
			set TestDuration = a.TestDurationCalc
		from
		( Select a.TestSessionKey, Sum(Duration / 60.0) testdurationCalc
		  From Bridge.TestSessionStep a
		  group by a.TestSessionKey) a join
		  Bridge.TestSession b on
			a.TestSessionKey = b.TestSessionid
		where b.TestDuration is null or b.TestDuration = 0
	end
		
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

end