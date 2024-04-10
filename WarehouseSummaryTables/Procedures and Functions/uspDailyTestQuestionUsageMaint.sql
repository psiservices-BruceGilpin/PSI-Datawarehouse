CREATE PROCEDURE [dbo].[uspDailyTestQuestionUsageMaint]

AS
	Begin try
		Truncate table tests.TestQuestionUsagecnt
		Insert into tests.TestQuestionUsageCnt  (ClientCode, SummaryTestName, questiontitle, CandidateN)
		select f.ClientCode, h.SummaryTestName, a.questiontitle,  count(*)
	from
	[$(PSIReporting)].dimensions.questions_vw a 
	join
	[$(PSIReporting)].dimensions.TestQuestions_vw b on
		a.QuestionDBID = QuestionKey
	join
	[$(PSIReporting)].Dimensions.TestSegments_vw c on
		b.TestSegmentsKey = c.TestSegmentDBID
	join
	[$(PSIReporting)].Dimensions.Tests_vw d on
		c.TestKey = d.TestDbID
	join
	[$(PSIReporting)].dimensions.Areas_vw e on
		d.AreaKey = e.AreaDBID
	join
	[$(PSIReporting)].account.Accounts_vw f on
		e.AreaTitle = f.ClientCode
	join
	[$(PSIReporting)].dimensions.StudentItems_vw g on
		b.TestQuestionDBID = g.TestQuestionKey
	join
	Dw_SummaryTables.tests.summarytestnames h on
		d.TestDbID = h.DimensionsTestKey
	group by f.ClientCode, h.SummaryTestName, a.questiontitle
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
