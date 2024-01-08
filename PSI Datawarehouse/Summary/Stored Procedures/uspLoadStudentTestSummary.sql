CREATE PROCEDURE [Summary].[uspLoadStudentTestSummary]

AS
	create table #StudentTests (
		DWStudentKey			bigint,
		DWTestScoreKey			bigint,
		DWTestKey				bigint,
		DWPackagekey			bigint,
		TestTitle				varchar(50),
		GlobalTestCenterId		Varchar(20),
		TestDate				date,
		PFA						varchar(2),
		ElapsedTime				int,
		FinalPoints				int,
		ScaledScore				int,
		ScorePoints				int,
		Attempt#				int,
		ComputedAttempt#		int,
		ADATime					int,
		ExtraTime				int,
		ExtraTimeUsed			int,
		ExtraStart				datetime,
		ExtraEnd				datetime,
		Proctored				bit,
		Restarts				int,
		TestVersion				int, 
		Retake					int,
		loadDate				datetime);

begin try

	with testdelta (	DWStudentKey, DWTestScoreKey, DWTestKey,
						DWPackagekey, TestTitle, GlobalTestCenterId,
						TestDate, ElapsedTime, FinalPoints, 
						ScaledScore, ScorePoints, Attempt#, ADATime,
						ExtraTime, ExtraTimeUsed, ExtraStart,ExtraEnd,
						Proctored, Retake, Restarts, TestVersion, loaddate  ) as
		( 
			select 
			 e.StudentDBID 
			 , a.StudentScoreDBID
			 , c.TestDbID
			 , b.TestPackageKey
			 , c.TestTitle
			 , g.GlobalTestCenterKey
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
			 , a.Restarts
			 , c.TestVersnum
			 , a.LoadDate
			from
			Dimensions.StudentScores a 
			join
			dimensions.Testlists_vw b on
				a.TestListKey = b.testlistdbid
			join
			dimensions.Tests_vw c on
				b.TestKey = c.TestDbID
			join
			dimensions.Studentlists_vw d on
				a.StudentListKey = d.StudentListDBID
			join
			dimensions.Students_vw e on
				d.StudentKey = e.StudentDBID 
			join 
			Dimensions.StudentTestAttributes_vw f on
				e.StudentDBID = f.StudentKey
			join
			test.TestCenter_vw g on
				f.TestCenterKey = g.TestCenterDBID
			join
			dimensions.TestSchedules_vw h on
				a.TestScheduleKey = h.TestScheduleDBID 
			Left Join
			Summary.StudentTestSummary i on
				a.StudentScoreDBID = i.DWTestScoreKey
			where 
				i.DWTestScoreKey is null and
				a.CurrentFlag = 0

			and i.DWStudentKey is null or i.LoadDateTime < a.LoadDate)

			insert #StudentTests
		(

		  [DWStudentKey]
		  ,[DWTestScoreKey]
		  ,[DWTestKey]
		  ,[DWPackageKey]
		  ,[TestTitle]
		  ,[GlobalTestCenterID]
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
		  ,[Retake]
		  ,[Restarts]
		  ,[TestVersion]
		  ,[LoadDate]
		)

		SELECT 
		  a.[DWStudentKey]
		  ,a.[DWTestScoreKey]
		  ,a.[DWTestKey]
		  ,a.[DWPackageKey]
		  ,a.[TestTitle]
		  ,a.[GlobalTestCenterID]
		  ,a.[TestDate]
		  ,a.[ElapsedTime]
		  ,a.[FinalPoints]
		  ,a.[ScaledScore]
		  ,a.[ScorePoints]
		  ,a.[Attempt#]
		  ,a.[ADATime]
		  ,a.[ExtraTime]
		  ,a.[ExtraTimeUsed]
		  ,a.[ExtraStart]
		  ,a.[ExtraEnd]
		  ,a.[Proctored]
		  ,a.[retake]
		  ,a.[Restarts]
		  ,a.[TestVersion]
		  ,a.[LoadDate]
		from testdelta a 
		left join
			Summary.StudentTestSummary b on
		a.DWTestScoreKey = b.DWTestScoreKey
		where 
		b.DWTestScoreKey is null or a.loaddate > b.LoadDateTime;

		UPDATE [Summary].[StudentTestSummary]
	   SET [DWStudentKey] = a.DWStudentKey
		  ,[DWTestScoreKey] = a.DWTestScoreKey
		  ,[DWTestKey] = a.DWTestKey
		  ,[DWPackageKey] = a.DWPackageKey
		  ,[TestTitle] = a.TestTitle
		  ,[GlobalTestCenterID] = a.GlobalTestCenterID
		  ,[TestDate] = a.TestDate
		  ,[ElapsedTime] = a.ElapsedTime
		  ,[FinalPoints] = a.FinalPoints
		  ,[ScaledScore] = a.ScaledScore
		  ,[ScorePoints] = a.ScorePoints
		  ,[Attempt#] = a.Attempt#
		  ,[ComputedAttempt#] = a.ComputedAttempt#
		  ,[ADATime] = a.ADATime
		  ,[ExtraTime] = a.ExtraTime
		  ,[ExtraTimeUsed] = a.ExtraTimeUsed
		  ,[ExtraStart] = a.ExtraStart
		  ,[ExtraEnd] = a.ExtraEnd
		  ,[Proctored] = a.Proctored
		  ,[Retake] = a.Retake
		  ,[Restarts] = a.Restarts
		  ,[TestVersion] = a.TestVersion
		  ,[LoadDateTime] = a.LoadDate
		from
			#StudentTests a join
			summary.StudentTestSummary b on
				a.DWTestScoreKey = b.DWTestScoreKey


		insert Summary.StudentTestSummary
			(

			  [DWStudentKey]
			  ,[DWTestScoreKey]
			  ,[DWTestKey]
			  ,[DWPackageKey]
			  ,[TestTitle]
			  ,[GlobalTestCenterID]
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
			  ,[Retake]
			  ,[Restarts]
			  ,[TestVersion]
			  ,[LoadDateTime]
			)

			SELECT 
			  a.[DWStudentKey]
			  ,a.[DWTestScoreKey]
			  ,a.[DWTestKey]
			  ,a.[DWPackageKey]
			  ,a.[TestTitle]
			  ,a.[GlobalTestCenterID]
			  ,a.[TestDate]
			  ,a.[ElapsedTime]
			  ,a.[FinalPoints]
			  ,a.[ScaledScore]
			  ,a.[ScorePoints]
			  ,a.[Attempt#]
			  ,a.[ADATime]
			  ,a.[ExtraTime]
			  ,a.[ExtraTimeUsed]
			  ,a.[ExtraStart]
			  ,a.[ExtraEnd]
			  ,a.[Proctored]
			  ,a.[retake]
			  ,a.[Restarts]
			  ,a.[TestVersion]
			  ,a.[LoadDate]
			from #StudentTests a 
			left join
				Summary.StudentTestSummary b on
			a.DWTestScoreKey = b.DWTestScoreKey
			where b.DWTestScoreKey is null

		update Summary.StudentTestSummary
		set ComputedAttempt# = cnt
		from
		(
		select dwstudentkey, dwtestkey, count(*) cnt
		from Summary.StudentTestSummary
		group by dwstudentkey, dwtestkey ) a join
		Summary.StudentTestSummary b on
			a.DWStudentKey = b.DWStudentKey and
			a.DWTestKey = b.DWTestKey
		where b.ComputedAttempt# is null
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
