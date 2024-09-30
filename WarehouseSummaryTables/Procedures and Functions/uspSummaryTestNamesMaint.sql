CREATE PROCEDURE [dimensions].[uspSummaryTestNamesMaint]

AS
	Begin Try
		Insert into Tests.SummaryTestNames
(DimensionsTestKey, SummaryTestName, AccountCode, Scalecut, RawCut)
select 
	a.testdbid, isnull(a.testdesc,a.testtitle), a.AreaKey, c.ScaleCut, c.Rawcut
from
	
	(
	select distinct
	TestDbID,
	testdesc,
	TestTitle,
	AreaKey
	from
	psi_reporting.dimensions.tests_vw ) a

left join
	psi_reporting.dimensions.ampforms_vw c on
 		a.TestDbID = c.FormTestKey
left join
	dw_summarytables.tests.summarytestnames d on
	a.testdbid = d.DimensionsTestKey
join
	PSI_Reporting.dimensions.areas_vw e on
	 a.AreaKey = e.AreaDBID
where
	d.summarytestnamesdbid is null
	



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
