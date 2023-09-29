CREATE PROCEDURE [dbo].[uspExamStepProcessing]

AS
	Create table #StepTable (
		TestSessionID		Int,
		StepState			varchar(50),
		StartTime			datetime,
		EndTime				datetime,
		StepOrder			int,
		Duration			decimal(10,2),
		StepTimeStamp		timestamp,
		Note				varchar(max),
		Rundate				date,
		RunID				int )
	create clustered index idx1 on #Steptable (TestSessionID, StepOrder)

	Truncate table Staging.StagingTestSessionStep
	Begin Try
		Insert into #StepTable (
			TestSessionID,
			StepState,
			StartTime,
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
			,  row_number() Over(partition by a.TestSessionID order by cast(timestamp as datetime) ) steporder
		FROM [PSI_DW].[Bridge].[TestSession] a join
			 PSI_Staging.Staging.ExamState b on
				a.DossierKey + '::' + a.SessionKey = b.pDiddy left join
			 Bridge.TestSessionStep c on
				a.TestSessionId = c.TestSessionKey
		where c.TestSessionKey is null
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
			StartTime,
			StepOrder
		from #StepTable
	Open c1
	Fetch Next from C1 into
		@SessionID,
		@StartTime,
		@StepOrder
	set @RefSessionID = @SessionID

	While @@FETCH_STATUS = 0
	Begin
		Set @duration = 0
		Select 
			@Endtime = StartTime
		from #StepTable
		where 
			TestSessionID = @RefSessionID and
			StepOrder = @StepOrder + 1
		if @@ROWCOUNT > 0
		Begin
			set @duration = DATEDIFF(ss,@starttime, @EndTime) 
			if @duration < .01
				set @duration = .01
			Update #StepTable
			Set
				Duration	= @duration,
				Endtime		= @Endtime
			where
				TestSessionID = @SessionID and
				StepOrder = @StepOrder
		end
		else
		Begin
			Update #StepTable
				set
					EndTime = @StartTime
			where
				TestSessionID = @SessionID and
				StepOrder = @StepOrder
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
	Insert Staging.StagingTestSessionStep (
		SessionID, Stepkey, StepOrder, note, StartDate, StartTime, EndDate, EndTime, Duration, RunDate )
	select
		a.TestSessionID,
		b.ExamStepId,
		StepOrder,
		note,
		cast(starttime as date),
		cast(starttime as time),
		cast(Endtime as date),
		cast(endtime as time),
		Duration,
		Rundate
	From #StepTable a join
	DimExamSteps b on
		a.StepState = b.StepName

	Update Bridge.TestSession 
		set TestDate = a.startdate,
			StartTime = a.StartTime
	from
			(select SessionID,  startdate, StartTime
			  from Staging.StagingTestSessionStep
			  where StepOrder = 1 ) a join
			  Bridge.TestSession b on
				a.SessionID = b.TestSessionId

	--Insert Bridge.TestSessionStep
	--( TestSessionKey, StepName, StepOrder,StartDate, StartTime,Enddate,EndTime,Duration, RunDate )
	--select
	--  SessionID,
	--  StepName,
	--  StepOrder, 
	--  StartDate, 
	--  StartTime, 
	--  EndDate,
	--  EndTime,
	--  Duration,
	--  RunDate
	--from Staging.StagingTestSessionStep
		
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