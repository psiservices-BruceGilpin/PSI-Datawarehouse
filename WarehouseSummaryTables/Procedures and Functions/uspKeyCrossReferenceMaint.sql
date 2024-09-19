CREATE PROCEDURE [dbo].[uspKeyCrossReferenceMaint]

AS
	Begin Try
		truncate table KeyCrossReference
		Insert into KeyCrossReference ( Studentkey, StudentScoreKey, testdate,  
										 SummaryTestName, DimensionsTestKey, PackageKey, StudentGroupKey )

		SELECT distinct  a.StudentDBID, d.StudentScoreDBID, d.StartDate,  
				   i.summarytestname, i.DimensionsTestKey, e.TestPackageKey, c.StudentGroupKey
  
		  FROM 
			[$(PSIReporting)].Dimensions.Students_vw a 
			join
			[$(PSIReporting)].Dimensions.StudentLists_vw c on
				a.StudentDBID = c.StudentKey
			join
			[$(PSIReporting)].Dimensions.StudentScores_vw d on
				c.StudentListDBID = d.StudentListKey
			Left join
			[$(PSIReporting)].dimensions.TestSchedules_vw e on
				d.TestScheduleKey = e.TestScheduleDBID 
			join
			[$(PSIReporting)].Dimensions.TestLists_vw f on
				d.TestListKey = f.TestListDbId
			join
			[$(PSIReporting)].Dimensions.Tests_vw g on
				f.TestKey = g.TestDbID and
				g.testtitle not like '%survey%' and g.testtitle not like '%practice%'
			join dw_summarytables.tests.SummaryTestNames  i on
					g.TestDbID = i.dimensionstestkey 
--comment

		where d.StartDate >= '1/1/2022'
	End Try
	Begin catch
		Insert [PSI_DW].Logging.SQLErrors (
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
