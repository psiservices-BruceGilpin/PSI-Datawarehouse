--CREATE PROCEDURE [Dimensions].[uspDailyTestSummaryMaint]
--	@ReloadFrom		date,
--	@ReloadTo		date 
--AS
--	create table #loadkeys (SummaryTestNamesDBID bigint, TestDBID bigint, TestDate date, DailyN int)

--		create table #Reference( 						
--								  SummaryTestNamesDBID int
--								, testdate date
--								, [DailyCandidateN] INT NULL 
--								, [DailyCandidatePass] INT NULL 
--								, [DailyCandidateOther] INT NULL 
--								, [DailyCandidatePassRate] DECIMAL(5, 2) NULL 
--								, [DailyFirstTimeN] INT NULL 
--								, [DailyFirstTimePass] INT NULL 
--								, [DailyFirstTimePassRate] DECIMAL(5,2) NULL 
--								, [FormLength] INT NULL 
--								, [TotalCandidateN] INT NULL 
--								, [TotalCandidatePass] INT NULL 
--								, [TotalCandidateOther] INT NULL 
--								, [TotalPassRate] DECIMAL(7,2) NULL 
--								, [TotalFirstTimeN] INT NULL 
--								, [TotalFirstTimePass] INT NULL 
--								, [TotalFirstTimePassRate] DECIMAL(7, 2) NULL 
--								, [TotalMeanRawScore] DECIMAL(7, 2) NULL 
--								, [TotalStdDev] DECIMAL(6, 3) NULL 
--								, [TotalReliabilityEst] DECIMAL(7, 3) NULL
--								, [YTDCandidateN] INT NULL 
--								, [YTDCandidatePass] INT NULL 
--								, [YTDCandidateOther] INT NULL 
--								, [YTDPassRate] DECIMAL(7, 2) NULL 
--								, [YTDFirstTimeN] INT NULL 
--								, [YTDFirstTimePass] INT NULL 
--								, [YTDFirstTimePassRate] DECIMAL(7, 2) NULL 
--								, [YTDMeanRawScore] DECIMAL(7, 2) NULL 
--								, [YTDStdDev] DECIMAL(6, 3) NULL 
--								, [YTDReliabilityEst] DECIMAL(7, 3) NULL
--								)

--	create table #dailyresults(	  SummaryTestNamesDBID int
--								, AsOfDate date
--								, FormLength int
--								, [DailyCandidateN] INT NULL 
--								, [DailyCandidatePass] INT NULL 
--								, [DailyCandidateOther] INT NULL 
--								, [DailyCandidatePassRate] DECIMAL(5, 2) NULL 
--								, [DailyFirstTimeN] INT NULL 
--								, [DailyFirstTimePass] INT NULL 
--								, [DailyFirstTimePassRate] DECIMAL(5,2) NULL 

--								)
--)
--	create table #YTDresults (
--								  SummaryTestNamesDBID	int
--								, AsofDate				date
--								, YTDN					int
--								, YtdFirstTimeN			int
--								, YtdPassRate			decimal(5,2)
--								, YTDFirstTimeRate		decimal(5,2)
--								, YTDMeanRawScore		decimal(7,2)
--								, YTDStdDev				decimal(7,2)
--								, YTDReliabiityEst		decimal(7,2) )
--	create table #Totalresults (
--								  SummaryTestNamesDBID	int
--								, AsofDate				date
--								, TotalN				int
--								, TotalFirstTimeN		int
--								, TotalPassRate			decimal(5,2)
--								, TotalFirstTimeRate	decimal(5,2)
--								, TotalMeanRawScore		decimal(7,2)
--								, TotalStdDev			decimal(7,2)
--								, TodalReliabiityEst	decimal(7,2) )
--	 if @ReloadTo is null 
--	 	set @ReloadTo = getdate()

--declare @cudate date = '12/31/2022',
--		@refyear int = datepart(yyyy,@ReloadFrom),
--		@refdate  date = @reloadfrom


--begin try


--	delete from Test.dailytestsummary 
--		where Testdate >= @Refdate



--	Insert into #Reference (
--								  SummaryTestNamesDBID 
--								, testdate 
--								, [DailyCandidateN] 
--								, [DailyCandidatePass] 
--								, [DailyCandidateOther] 
--								, [DailyCandidatePassRate] 
--								, [DailyFirstTimeN] 
--								, [DailyFirstTimePass] 
--								, [DailyFirstTimePassRate] 
--								, [FormLength] 
--								, [TotalCandidateN] 
--								, [TotalCandidatePass] 
--								, [TotalCandidateOther] 
--								, [TotalPassRate] 
--								, [TotalFirstTimeN] 
--								, [TotalFirstTimePass] 
--								, [TotalFirstTimePassRate] 
--								, [TotalMeanRawScore] 
--								, [TotalStdDev]  
--								, [TotalReliabilityEst] 
--								, [YTDCandidateN] 
--								, [YTDCandidatePass] 
--								, [YTDCandidateOther] 
--								, [YTDPassRate] 
--								, [YTDFirstTimeN] 
--								, [YTDFirstTimePass] 
--								, [YTDFirstTimePassRate] 
--								, [YTDMeanRawScore]  
--								, [YTDStdDev] 
--								, [YTDReliabilityEst] 


--					)
--	Select 
--								  SummaryTestNamesDBID 
--								, testdate 
--								, [DailyCandidateN] 
--								, [DailyCandidatePass] 
--								, [DailyCandidateOther] 
--								, [DailyCandidatePassRate] 
--								, [DailyFirstTimeN] 
--								, [DailyFirstTimePass] 
--								, [DailyFirstTimePassRate] 
--								, [FormLength] 
--								, [TotalCandidateN] 
--								, [TotalCandidatePass] 
--								, [TotalCandidateOther] 
--								, [TotalPassRate] 
--								, [TotalFirstTimeN] 
--								, [TotalFirstTimePass] 
--								, [TotalFirstTimePassRate] 
--								, [TotalMeanRawScore] 
--								, [TotalStdDev]  
--								, [TotalReliabilityEst] 
--								, [YTDCandidateN] 
--								, [YTDCandidatePass] 
--								, [YTDCandidateOther] 
--								, [YTDPassRate] 
--								, [YTDFirstTimeN] 
--								, [YTDFirstTimePass] 
--								, [YTDFirstTimePassRate] 
--								, [YTDMeanRawScore]  
--								, [YTDStdDev] 
--								, [YTDReliabilityEst] 


		
--	from Tests.DailyTestSummary
--	where TestDate = @refdate

--	Insert into #dailyresults (	SummaryTestNamesDBID, AsOfDate, FormLength, DailyCandidateN, 
--								DailyCandidatePass, DailyCandidatePassRate, DailyFirstTimeN,
--								DailyFirstTimePass, DailyFirstTimePassRate )
--				select
					



--	Insert into #loadkeys (SummaryTestNamesDBID, TestDBID, TestDate, DailyN)
--	select d.SummaryTestNamesdbid, a.TestDbID, cast(c.StartDate as date) testdate, count(*) dailyN
--		from
--		dimensions.Tests_vw a 
--		join
--		dimensions.TestLists_vw b on
--			a.TestDbID = b.TestKey
--		join
--		Dimensions.StudentScores_vw c on
--			b.TestListDbId = c.TestListKey
--		join
--		DW_SummaryTables.Tests.SummaryTestNames d on
--			a.TestDbID = d.dimensionstestkey
--		where
--			c.StartDate >= @refdate
--		group by d.SummaryTestNamesdbid, a.TestDbID, cast(c.StartDate as date)
--		order by 
--		d.SummaryTestNamesdbid, a.TestDbID, cast(c.StartDate as date)

--	Declare @SummaryTestNamesDBID bigint, @testdbid bigint, @TestDate date, @dailyN int

--	insert into #dailyresults
--		( 



		

	
--end try
--	Begin catch
--		Insert Logging.SQLErrors (
--			ErrorLIne,
--			ErrorMessage,
--			ErrorNumber,
--			ErrorProcedure,
--			ErrorSeverity,
--			ErrorState,
--			ErrorDateTime )
--		Values (
--			ERROR_LINE(),
--			ERROR_MESSAGE(),
--			ERROR_NUMBER(),
--			ERROR_PROCEDURE(),
--			ERROR_SEVERITY(),
--			ERROR_STATE(),
--			getdate() )
--	end catch


--RETURN 0
