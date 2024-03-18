CREATE PROCEDURE [dbo].[uspKeyCrossReferenceMaint]

AS
	Begin Try
		truncate table KeyCrossReference
		Insert into KeyCrossReference ( Studentkey, StudentScoreKey, testdate, TestPackageKey, 
										PackageTitle, SummaryTestName, DimensionsTestKey )

		SELECT   a.StudentKey, b.StudentScoreDBID, b.StartDate, d.TestPackageDBID, 
				 d.PackageTitle,  g.summarytestname, g.DimensionsTestKey
  
		  FROM 
			psi_dw.dimensions.StudentLists_vw a 
			join
			psi_dw.dimensions.StudentScores_vw b on
				a.StudentListDBID = b.StudentListKey
			join
				psi_dw.dimensions.TestSchedules_vw c on
					b.TestScheduleKey = c.TestScheduleDBID and
					cast(b.StartDate as date) = cast(c.schedulestart as date)
			join
				psi_dw.dimensions.TestPackages_vw d on
					c.TestPackageKey = d.TestPackageDBID 
			join
				psi_dw.dimensions.testlists_vw f on
					d.testpackagedbid = f.TestPackageKey 
			join
				DW_SummaryTables.Tests.SummaryTestNames g on
					f.TestKey = g.DimensionsTestKey
		where b.StartDate >= '1/1/2022' and b.PFA in ('P','F') 
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
