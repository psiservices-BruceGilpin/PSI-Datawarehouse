CREATE PROCEDURE [dimensions].[uspSummaryTestNamesMaint]

AS
	Begin Try
		create table #testnames(namekey int not null identity(10000,1), dimensionstestkey bigint, 
								testname varchar(2000), crossrefkey bigint, loaddate date, 
								AccountCode varchar(12), ScaleCut int, RawCut int, formlength int )

/*
	There are three ways of formating the consolidated test name.
		1. If the test description contains the acronym "LOFT" then use the Test Description as title, stripping out the 
		   everything before the first quotation mark.
		2. If the test description does not contain the acronym "Loft" and the test title is contained within the Test
		   description, use the test description for the title.
		3. If the test descripton does not contain the acronym "Loft" and the title is not contained in the description, use the title.

*/

		insert into #testnames (testname,dimensionstestkey, loaddate)
		select 
		  distinct replace(
					substring(Testdesc,charindex('"', Testdesc) + 1, 99), '"', ''), 
		  TestDBId, 
		  LoadDate 
		FROM 
		  PSI_DW.[Dimensions].[Tests] 
		where 
		  testdesc like '% LOFT %' 
		  and CurrentFlag = 0 
		union 
		select 
		  distinct isnull(testdesc, testtitle) testdesc, 
		  TestDbID, 
		  loaddate 
		from 
		  PSI_DW.dimensions.tests 
		where 
		  testdesc not like '% LOFT %' 
		  and CHARINDEX(testtitle, testdesc) > 0 
		  and CurrentFlag = 0 
		union 
		select 
		  distinct testtitle, 
		  TestDbID, 
		  LoadDate 
		from 
		  PSI_DW.dimensions.tests 
		where 
		  testdesc not like '% LOFT %' 
		  and CHARINDEX(testtitle, testdesc) = 0 
		  and CurrentFlag = 0 
		Update 
		  #testnames
		set 
		  crossrefkey = b.xrefkey 
		from 
		  #testnames a join
		  (
			select 
			  testname, 
			  min(namekey) xrefkey 
			from 
			  #testnames
			group by 
			  testname
		  ) b on a.testname = b.testname 
		update 
		  #testnames
		set 
		  AccountCode = c.ClientCode 
		from 
		  [PSI_DW].Dimensions.StudentScores_vw a 
		  join [PSI_DW].Dimensions.StudentLists_vw b on a.StudentListKey = b.StudentListDBID 
		  join [PSI_DW].dimensions.StudentTestAttributes_vw c on b.StudentKey = c.StudentKey 
		  join [PSI_DW].Dimensions.TestLists_vw d on a.TestListKey = d.TestListDbId 
		  join #testnames e on  
		  d.TestKey = e.dimensionstestkey 
		  
		  insert into Dw_SummaryTables.tests.SummaryTestNames (
			CrossRefKey, Dimensionstestkey, SummaryTestName, 
			accountcode, Loaddate
		  ) 
		select 
		  a.crossrefkey, 
		  a.dimensionstestkey, 
		  a.testname, 
		  a.AccountCode, 
		  a.loaddate 
		from 
		  #testnames a 
		  left join Dw_SummaryTables.tests.SummaryTestNames b on a.testname = b.SummaryTestName 
		  and a.dimensionstestkey = b.DimensionsTestKey 
		where 
		  b.SummaryTestName is null 

		update #testnames
		 set scalecut = b.scalecut,
			 rawcut = b.rawcut,
			 formlength = c.segmentcount
		from
			#testnames a join
			psi_dw.Dimensions.ampforms_vw b on
				a.dimensionsTestKey = b.formtestkey join
			psi_dw.Dimensions.testsegments_vw c on
				a.dimensionstestkey = c.testkey

-- No updates allowed a different test title and/or description means a new record

		insert into Dw_SummaryTables.tests.SummaryTestNames 
			(CrossRefKey, Dimensionstestkey, SummaryTestName, accountcode, Loaddate, ScaleCut, RawCut, ItemCount)
		select
		a.crossrefkey, a.dimensionstestkey, a.testname, a.AccountCode, a.loaddate, a.ScaleCut, a.RawCut, a.formlength
		from
		#testnames a 
		left join 
		 Dw_SummaryTables.tests.SummaryTestNames b on
			a.testname = b.SummaryTestName and
			a.dimensionstestkey = b.DimensionsTestKey
		where 
			b.SummaryTestName is null


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
