CREATE PROCEDURE [Dimensions].[uspLoadCategorySummary]

AS
	 Declare @maxdate datetime
	 select @maxdate = max(loaddatetime)
	 from dw_summarytables.students.BankCategorySummary

	Create table #BankCategory (BankCategoryKey bigint, BankGroupKey bigint, StudentTestSummaryKey bigint, BankCategoryTitle varchar(50), 
								BankCategoryDescription varchar(1000), BankCatgoryStatus tinyint, CategoryCount int, LoadDateTime datetime)

	Begin Try
		Insert #BankCategory (StudentTestSummaryKey, BankCategoryKey, BankGroupKey, BankCategoryTitle, 
								BankCategoryDescription,BankCatgoryStatus,LoadDateTime,CategoryCount )
		Select		   a.StudentTestSumaryDBID, 
					   e.BankCategoryDBID,
					   e.BankGroupKey,
					   e.BankCategoryTitle,
					   e.BankCategoryDescription,
					   e.bankCategoryStatus,
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
					Dimensions.BankCategories_vw e on
						d.BankCategoryGroupKey = e.BankCategoryDBID
					left join
						dw_summarytables.students.BankCategorySummary f on
							a.StudentTestSumaryDBID = f.StudentTestSummaryKey
					where f.StudentTestSummaryKey is null or a.loaddatetime > @maxdate
		Group by
					   a.StudentTestSumaryDBID, 
					   e.BankCategoryDBID,
					   e.BankGroupKey,
					   e.BankCategoryTitle,
					   e.BankCategoryDescription,
					   e.bankCategoryStatus,
					   a.loaddatetime
			
			
			
			
			update DW_SummaryTables.[Students].[BankCategorySummary]
				set categorycount		= a.Categorycount,
					loaddatetime		= a.loaddatetime
			from #BankCategory a 
			join
			DW_SummaryTables.Students.BankCategorySummary b on
				a.StudentTestSummaryKey = b.studenttestsummaryKey and
				a.BankCategoryTitle		= b.bankCategorytitle

			insert DW_SummaryTables.Students.BankCategorySummary (	BankCategoryKey, BankGroupKey, StudentTestSummaryKey, BankCategoryTitle, 
																	BankCategoryDescription, BankCategoryStatus, CategoryCount, LoadDateTime )
			select a.BankCategoryKey, a.BankGroupKey, a.StudentTestSummaryKey, a.BankCategoryTitle, 
				   a.BankCategoryDescription, a.BankCatgoryStatus, a.CategoryCount, a.LoadDateTime
			from #BankCategory a 
				left join
				DW_SummaryTables.Students.BankCategorySummary b on
					a.StudentTestSummaryKey = b.studentTestSummaryKey
			where b.StudentTestSummaryKey is null
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
