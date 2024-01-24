CREATE PROCEDURE [Dimensions].[uspLoadBankGroupSummary]

AS
	Begin Try
	 
	 Declare @maxdate datetime
	 select @maxdate = max(loaddatetime)
	 from dw_summarytables.students.BankGroupSummary



	 Create table #delta (StudentSummaryID bigint, BankGroupTitle varchar(50), BankGroupDesc varchar(600), pretest bit, testcount int, loaddatetime datetime )
	 Insert into #delta (StudentSummaryID, BankGroupTitle,BankGroupDesc, pretest,  loaddatetime, testcount )
	 Select a.StudentTestSumaryDBID, 
				   e.BankCatGroupTitle,
				   e.BankCatGroupDesc,
				   e.Pretest,
				   a.loaddatetime,
				   count(*)
	from
				DW_SummaryTables.Students.StudentTestSummary a 
				join
				Dimensions.TestSegments_vw b on
					a.dwTestKey = b.Testkey
				join
				Dimensions.TestQuestions c on
					b.TestSegmentDBID = c.TestSegmentsKey
				join
				Dimensions.Questions_vw d on
					c.QuestionKey = d.Questiondbid
				join
				Dimensions.BankCategoryGroups_vw e on
					d.BankCategoryGroupKey = e.BankCategoryGroupDBID
				left join
				DW_Summarytables.Students.BankGroupSummary f on
					a.StudentTestSumaryDBID = f.StudentTestSummarykey
	where f.StudentTestSummaryKey is null or a.loaddatetime > @maxdate
	group by a.studenttestSumaryDBID, e.BankCatGroupTitle, e.BankCatGroupDesc, e.Pretest, a.loaddatetime


		update DW_SummaryTables.[Students].[BankGroupSummary]
			set testcount		= a.testcount,
				loaddatetime	= a.loaddatetime
		from #delta a 
		join
		DW_SummaryTables.Students.BankGroupSummary b on
			a.StudentSummaryID = b.studenttestsummaryKey and
			a.BankGroupTitle = b.bankgrouptitle
			

		insert DW_Summarytables.[Students].[BankGroupSummary] (StudentTestSummarykey, BankGroupTitle, BankGroupDesc, PreTest, Testcount, loaddatetime)
		select a.StudentSummaryID, a.BankGroupTitle, a.BankGroupDesc, a.PreTest, a.Testcount, a.loaddatetime
		from 
		#delta a 
		left join
		DW_Summarytables.[Students].[BankGroupSummary] b on
			a.StudentSummaryID =  b.StudentTestSummarykey and
			a.BankGroupTitle = b.bankgrouptitle
		where b.StudentTestSummarykey is null


	


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
