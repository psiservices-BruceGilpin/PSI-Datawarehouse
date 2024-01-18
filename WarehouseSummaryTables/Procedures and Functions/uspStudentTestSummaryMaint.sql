CREATE PROCEDURE [dbo].[uspStudentTestSummaryMaint]
AS
	Set Nocount On;
	Create table #testdelta (
		[DWTestScoreKey] [bigint] NOT NULL,
		[DWTestKey] [bigint] NOT NULL,
		[DWTestCenterKey] [bigint] NULL,
		[DWPackageKey] [bigint] NOT NULL,
		[DWStudentKey] [bigint] NOT NULL,
		[StudentAltID] [varchar](128) NULL,
		[FirstName] [varchar](30) NULL,
		[LastName] [varchar](30) NULL,
		[MaidenName] [varchar](25) NULL,
		[Degree] [varchar](50) NULL,
		[License] [varchar](40) NULL,
		[TestTitle] [varchar](50) NOT NULL,
		[ExamCode] [varchar](15) NULL,
		[ExamPortionCode] [varchar](15) NULL,
		[FormName] [varchar](100) NULL,
		[DateSched] [date] NULL,
		[GlobalTestCenterKey] [varchar](20) NULL,
		[TestDate] [date] NOT NULL,
		[ElapsedTime] [int] NULL,
		[PassFail] [char](1) NULL,
		[FinalPoints] [int] NULL,
		[ExtraPoints] [int] NULL,
		[ScaledScore] [int] NULL,
		[ScorePoints] [int] NULL,
		[Attempt#] [int] NULL,
		[ComputedAttempt#] [int] NULL,
		[ADATime] [int] NULL,
		[ExtraTime] [int] NULL,
		[ExtraTimeUsed] [int] NULL,
		[ExtraStart] [datetime] NULL,
		[ExtraEnd] [datetime] NULL,
		[Proctored] [bit] NULL,
		[Restarts] [int] NULL,
		[TestVersion] [int] NULL,
		[LoadDateTime] [datetime] NULL,
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
		TestVersion ,
		LoadDateTime ,
		PassFail,
		SummaryStudentkey 

		)
	select 
	d.StudentScoreDBID
	,g.TestDbID
	,d.TestCenterKey
	,e.TestPackageKey
	,a.StudentDBID
	,a.StudentAltID
	,a.FirstName
	,a.LastName
	,a.MaidenName
	,b.Degree
	,b.License
	,g.TestTitle
	,b.ExamCode
	,b.ExamPortionCode
	,h.FormName
	,e.ScheduleStart
	,i.GlobalTestCenterKey
	,isnull(d.StartDate, '1/1/2000')
	,d.HowLong
	,case 
		when d.PFA = 'P' then d.pfa
		when d.PFA = 'F' then d.pfa
		when d.PFA = 'A' then d.pfa
		when d.PFA = 'G' then d.pfa
		else '  '
	end PFA 
    ,d.FinalPoints
	,d.ScaledScore 
	,d.ScorePoints
	,d.Retake
	,d.AdaTime
	,d.ExtraTime
	,d.ExtraTimeUsed
	,d.ExtraStart
	,d.ExtraEnd
	,d.Proctored
	,d.Restarts
	,g.TestVersnum

from 
  [$(PSIReporting)].dimensions.Students_vw a 
  join [$(PSIReporting)].dimensions.StudentTestAttributes_vw b on a.studentdbid = b.studentkey 
  join [$(PSIReporting)].dimensions.studentlists_vw c on a.studentdbid = c.studentkey 
  join [$(PSIReporting)].dimensions.StudentScores_vw d on c.studentlistdbid = d.studentlistkey 
  join [$(PSIReporting)].dimensions.TestSchedules_vw e on d.TestScheduleKey = e.TestScheduleDBID 
  and b.datesched between cast(e.schedulestart as date) 
  and cast(e.scheduleEnd as date) 
  join [$(PSIReporting)].dimensions.testlists_vw f on d.testlistkey = f.testlistdbid 
  join [$(PSIReporting)].Dimensions.Tests_vw g on f.testkey = g.testdbid 
  left join [(PSIReporting)].Dimensions.AmpForms_vw h on g.TestDbID = h.FormTestKey
  join [$(PSIReporting)].test.TestCenter_vw i on b.TestCenterKey = i.TestCenterDBID	
  left join DW_SummaryTables.Students.StudentTestSummary j on d.StudentScoreDBID = j.
	

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
