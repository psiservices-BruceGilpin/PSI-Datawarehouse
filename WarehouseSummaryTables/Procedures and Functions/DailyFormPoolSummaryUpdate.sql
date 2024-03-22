CREATE PROCEDURE [FormPools].[DailyFormPoolSummaryUpdate]

AS
	Declare @processdate date, @count int
	Begin Try
		Select @processdate = getdate()
		Select 
			@count = count(*)
		from
			FormPools.DailyFormPoolSummary
		where
			AsOfDate >= @processdate

		If @count > 0
			Return 100
		insert into FormPools.DailyFormPoolSummary (
			FormPoolKey, 
			FormPoolTopic, 
			FormPoolDescription, 
			AsOfDate, 
			TotalN,
			TotalPass,
			TotalFirstTimePass,
			MeanFinalScore,
			StdDev,
			ReliablityEst )
		select
		a.FormPoolSpecDBId,
		a.topic,
		a.PoolDescription,
		cast(getdate() as date) asofdate,
		count(*) totalN,
		sum(case when k.pfa = 'P' then 1 else 0 end) totalPasss,
		sum(case when k.pfa = 'P' and l.computedattempt# = 1 then 1 else 0 end) FirstTimePass,
		avg(cast(k.finalpoints as bigint)) TopicAvgScore,
		stdev(cast(k.finalpoints as bigint)) STDDev,
		var(cast(k.finalpoints as bigint)) Variance
		from
		[$(PSI_DW)].dimensions.formpoolspecs_vw a 
		join
		[$(PSI_DW)].dimensions.formpools_vw b on
			a.formpoolspecdbid = b.formpoolspeckey
		join
		[$(PSI_DW)].dimensions.formPoolItems_vw c on
			b.formpooldbid = c.formpoolkey
		join
		[$(PSI_DW)].dimensions.testquestions_vw d on
			c.questionkey = d.questionkey
		join
		[$(PSI_DW)].dimensions.testsegments_vw e on
			d.testsegmentskey = e.testsegmentdbid
		join
		[$(PSI_DW)].dimensions.tests_vw f on
			e.TestKey = f.TestDbID
		join
		[$(PSI_DW)].dimensions.studentitems_vw g on
			d.TestQuestionDBID = g.TestQuestionKey
		join
		[$(PSI_DW)].dimensions.Questions_vw h on
			c.QuestionKey = h.QuestionDBID
		join
		[$(PSI_DW)].dimensions.QuestionStatus_vw i on
			h.QuestionStatus = i.QuestionStatusDBID
		join
		[$(PSI_DW)].dimensions.StudentScores_vw k on
			g.StudentScoreKey = k.StudentScoreDBID
		join
			Dw_SummaryTables.students.studenttestsummary l on
				g.studentscorekey = l.DWTestScoreKey
		where
			k.startdate <= @processdate and
			i.QuestionStatusTitle = 'Approved'

		group by
			a.FormPoolSpecDBId,
			a.topic,
			a.PoolDescription	

		update FormPools.DailyFormPoolSummary
		 set PassRate = TotalPass * 1.0 / TotalN,
			 FirstTimePassRate = TotalFirstTimePass * 1.0 / Totaln
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

return 0