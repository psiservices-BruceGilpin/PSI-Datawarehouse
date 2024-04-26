CREATE PROCEDURE [dbo].[uspKeyCrossReferenceMaint]

AS
	Begin Try
		truncate table KeyCrossReference
		Insert into KeyCrossReference ( Studentkey, StudentScoreKey, testdate,  
										 SummaryTestName, DimensionsTestKey, PackageKey )

		SELECT   a.StudentDBID, d.StudentScoreDBID, d.StartDate,  
				   i.summarytestname, i.DimensionsTestKey, e.TestPackageKey
  
		  FROM 
			[$(PSIReporting)].Dimensions.Students_vw a 
			join
			[$(PSIReporting)].Dimensions.StudentTestAttributes_vw b on
				a.StudentDBID = b.StudentKey
			join
			[$(PSIReporting)].Dimensions.StudentLists_vw c on
				a.StudentDBID = c.StudentKey
			join
			[$(PSIReporting)].Dimensions.StudentScores_vw d on
				c.StudentListDBID = d.StudentListKey
			join
			[$(PSIReporting)].dimensions.TestSchedules_vw e on
				d.TestScheduleKey = e.TestScheduleDBID and b.TestScheduleKey = e.TestScheduleDBID
			join
			[$(PSIReporting)].Dimensions.TestLists_vw f on
				d.TestListKey = f.TestListDbId
			join
			[$(PSIReporting)].Dimensions.Tests_vw g on
				f.TestKey = g.TestDbID
			join dw_summarytables.tests.SummaryTestNames  i on
					g.TestDbID = i.dimensionstestkey 


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
