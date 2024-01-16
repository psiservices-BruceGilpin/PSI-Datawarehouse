CREATE PROCEDURE [dbo].[uspStudentTestSummaryMaint]
AS
	Set Nocount On;
	Create table #testdelta (
		DWStudentkey int,
		DWTestscorekey int,
		DWPackagekey int,
		DWTestKey int,
		TestTitle varchar(100),
		TestDate date,
		ElapsedTime int,
		FinalPoints int,
		ScaledScore int,
		ScorePoints int,
		Attempt# smallint,
		ComputedAttempts smallint,
		ADATime int,
		ExtraTime int,
		ExtraTimeused int,
		ExtraStart datetime,
		ExtraEnd   datetime,
		Proctored bit,
		Retake int,
		TestVersion int,
		PFA Char(1),
		LoadDateTime datetime,
		SummaryStudentkey int
		);

	Begin Try
		declare @maxloaddate datetime
		select @maxloaddate = max(loaddatetime)
		from Students.StudentTestSummary
		
		Insert #testdelta (
		DWStudentkey,
		DWTestscorekey,
		DWPackagekey,
		DWTestKey,
		TestTitle,
		TestDate,
		ElapsedTime,
		FinalPoints,
		ScaledScore,
		ScorePoints,
		Attempt#,
		ADATime ,
		ExtraTime ,
		ExtraTimeused ,
		ExtraStart ,
		ExtraEnd   ,
		Proctored ,
		Retake ,
		TestVersion ,
		LoadDateTime ,
		PFA,
		SummaryStudentkey 

		)
		select distinct
		 e.StudentDBID 
		 , a.StudentScoreDBID
		 , c.TestDbID
		 , b.TestPackageKey
		 , c.TestTitle
		 , a.StartDate
		 , a.HowLong
		 , a.FinalPoints
		 , a.ScaledScore
		 , a.ScorePoints
		 , a.Retake
		 , a.AdaTime
		 , a.ExtraTime
		 , a.ExtraTimeUsed
		 , a.ExtraStart
		 , a.ExtraEnd
		 , a.Proctored
		 , a.Retake
		 , c.TestVersnum
		 , a.LoadDate
		 , a.pfa
		 , i.StudentTestSumaryDBId

		from
		 PSI_DW.Dimensions.StudentScores a 
		join
		PSI_Reporting.[dimensions].[Testlists_vw] b on
			a.TestListKey = b.testlistdbid
		join
		PSI_Reporting.dimensions.Tests_vw c on
			b.TestKey = c.TestDbID
		join
		psi_reporting.dimensions.Studentlists_vw d on
			a.StudentListKey = d.StudentListDBID
		join
		psi_reporting.dimensions.Students_vw e on
			d.StudentKey = e.StudentDBID 
		join 
		psi_reporting.Dimensions.StudentTestAttributes_vw f on
			e.StudentDBID = f.StudentKey
		join
		psi_reporting.dimensions.TestSchedules_vw h on
			a.TestScheduleKey = h.TestScheduleDBID and
			 f.DateSched between cast(h.schedulestart as date) and cast(h.scheduleend as date) 
		Left Join
		Students.StudentTestSummary i on
			a.StudentScoreDBID = i.DWTestScoreKey
		where 
			i.DWTestScoreKey is null and
			a.CurrentFlag = 0 and
			a.pfa is not null
		and i.DWStudentKey is null or a.loaddate > @Maxloaddate
	
		create index idx1 on #TestDelta (dwStudentKey, DWTestKey, TestDate asc);
			
		declare @dwstudentkey int, @dwTestKey int, @dwtestdate date, @testcount int
		
-- Populate the ComputedAttempts column
	
	declare cu1 cursor for
			Select dwStudentKey, DWTestScoreKey, Testdate
			from #testdelta
			where SummaryStudentkey is null
		open cu1
		fetch next from cu1 into @dwstudentkey, @dwTestKey, @dwtestdate
		while @@FETCH_STATUS = 0
		begin
			select @testcount = count(*) + 1
			from
				Students.StudentTestSummary
			where
				DWStudentKey = @dwstudentkey and
				DWTestKey = @dwTestkey
			update #testdelta
				set ComputedAttempts = @testcount
			where
				DWStudentkey = @dwstudentkey and
				DWTestKey = @dwTestKey and
				TestDate = @dwtestdate
			fetch next from cu1 into @dwstudentkey, @dwTestKey, @dwtestdate
		end


	Merge  Students.StudentTestSummary t
	Using #testdelta s on
		t.dwTestScoreKey = s.dwtestscorekey
	when not matched then
		insert ( 
		      [DWStudentKey]
			  ,[DWTestScoreKey]
			  ,[DWTestKey]
			  ,[DWPackageKey]
			  ,[TestTitle]
			  ,[TestDate]
			  ,[ElapsedTime]
			  ,[FinalPoints]
			  ,[ScaledScore]
			  ,[ScorePoints]
			  ,[Attempt#]
			  ,[ADATime]
			  ,[ExtraTime]
			  ,[ExtraTimeUsed]
			  ,[ExtraStart]
			  ,[ExtraEnd]
			  ,[Proctored]
			  ,[retake]
			  ,[TestVersion]
			  ,[LoadDateTime]
			  ,[PassFail] )
		values (
		      s.[DWStudentKey]
			  ,s.[DWTestScoreKey]
			  ,s.[DWTestKey]
			  ,s.[DWPackageKey]
			  ,s.[TestTitle]
			  ,isnull(s.[TestDate], '1/1/2000')
			  ,s.[ElapsedTime]
			  ,s.[FinalPoints]
			  ,s.[ScaledScore]
			  ,s.[ScorePoints]
			  ,s.[Attempt#]
			  ,s.[ADATime]
			  ,s.[ExtraTime]
			  ,s.[ExtraTimeUsed]
			  ,s.[ExtraStart]
			  ,s.[ExtraEnd]
			  ,s.[Proctored]
			  ,s.[retake]
			  ,s.[TestVersion]
			  ,s.[LoadDateTime]
			  ,s.[pfa]  )
	
	when matched then
			update
			set
			   [DWStudentKey]		= s.DWStudentKey
			  ,[DWTestScoreKey]		= s.DWTestScoreKey
			  ,[DWTestKey]			= s.DWTestKey
			  ,[DWPackageKey]		= s.dwpackagekey
			  ,[TestTitle]			= s.testtitle
			  ,[TestDate]			= isnull(s.TestDate, '1/1/2000')
			  ,[ElapsedTime]		= s.ElapsedTime
			  ,[FinalPoints]		= s.FinalPoints
			  ,[ScaledScore]		= s.ScaledScore
			  ,[ScorePoints]		= s.ScorePoints
			  ,[Attempt#]			= s.Attempt#
			  ,[ADATime]			= s.ADATime
			  ,[ExtraTime]			= s.ExtraTime
			  ,[ExtraTimeUsed]		= s.ExtraTimeUsed
			  ,[ExtraStart]			= s.ExtraStart
			  ,[ExtraEnd]			= s.ExtraEnd
			  ,[Proctored]			= s.Proctored
			  ,[retake]				= s.retake
			  ,[TestVersion]		= s.TestVersion
			  ,[LoadDateTime]		= s.LoadDateTime
			  ,[PassFail]			= s.pfa	;
	
		Select @@ROWCOUNT 'Rows Affected'
	End Try
	Begin catch
	Insert psi_dw.Logging.SQLErrors (
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
