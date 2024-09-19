CREATE PROCEDURE [dimensions].[uspSummaryTestNamesMaint]

AS
	Begin Try
		Insert into Tests.SummaryTestNames
		(DimensionsTestKey, SummaryTestName, AccountCode, Scalecut, RawCut)
		select 
			a.testdbid, b.testdesc, a.AreaKey, c.ScaleCut, c.Rawcut
		from
			psi_reporting.dimensions.tests_vw a
		Join
			(
			select
			distinct
			testdesc
			from
			psi_reporting.dimensions.tests_vw ) b
			on 
			a.TestDesc = b.TestDesc

		left join
			psi_reporting.dimensions.ampforms_vw c on
		 		a.TestDbID = c.FormTestKey
		left join
			dw_summarytables.tests.summarytestnames d on
			a.testdbid = d.DimensionsTestKey
		where
			d.DimensionsTestKey is null



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
