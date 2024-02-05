--CREATE PROCEDURE [Dimensions].[uspDailyTestSummaryMaint]
--	@ReloadFrom		date,
--	@ReloadTo		date 
--AS
--	create table #loadkeys (studentscorekey bigint not null, testdate date not null)
--	create table #dailyresults(clientcode varchar(16)							
--								, SummaryTestNamesDBID int
--								, testdate date
--								, CandidateN int
--								, [DailyCandidateN] INT NULL 
--								, [DailyCandidatePass] INT NULL 
--								, [DailyCandidateOther] INT NULL 
--								, [DailyCandidatePassRate] DECIMAL(5, 2) NULL 
--								, [DailyFirstTimeN] INT NULL 
--								, [DailyFirstTimePass] INT NULL 
--								, [DailyFirstTimePassRate] DECIMAL(5, 2) NULL 
--								, FormLength int )
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
--		@refdate  date = @reloadfrom,


--begin try
--	delete from Dw_SummaryTables.Tests.DailyTestSummary where testdate >= @ReloadFrom
--	Insert into #loadkeys (studentscorekey, testdate)
--	Select studentscoredbid, testdate from psi_dw.dimensions.studentscores_vw
--		   where testdate between @ReloadFrom and @ReloadTo

--	If @@ROWCOUNT = 0 return -1
--	declare c1 cursor for 
--		select Studenscorekey, testdate from #loadkeys order by testdate

--	Insert into #dailyresults (clientcode,TestTitle, 
--	CandidateN, AllcandidatePass, AllCandidateFail, AllCandidatePF, FirstTimeN, FirstTimePass, testdate, TestKey)
--	select 
--	g.Code, 
--	i.SummaryTestName
--	, count(*) 'CandidateN'
--	, sum(case
--		when b.PassFail = 'P' then 1 else 0
--	  end ) AllCandidatePass
--	, sum(case
--		when b.PassFail = 'F' then 1 else 0
--	  end) AllCandidateFail
--	, sum(case
--		when b.PassFail != 'P' and b.PassFail != 'F' then 1 else 0
--	   end ) AllCandidateOtherPF
--	, sum(case
--		when b.computedattempt# = 1 then 1 else 0
--		end ) FirstTimeN
--	, sum(case
--		when b.computedattempt# = 1 and b.PassFail = 'P' then 1 else 0
--		end) FirstTimePass
--	, b.TestDate
--	, e.testdbid

--	from
--	dw_summarytables.students.StudentTestSummary b join
--	dimensions.StudentTestAttributes_vw c on
--		b.DWStudentKey = c.Studentkey
--	join
--	dimensions.Tests_vw e on
--		b.DWTestKey = e.TestDbID
--	join
--	dimensions.students_vw f on
--		b.DWStudentKey = f.studentdbid
--	join
--	dimensions.Clients_vw g on
--		f.PoolKey = g.PoolKey
--	join
--	dimensions.Areas_vw h on
--		e.AreaKey = h.AreaDBID
--	join
--	Dw_SummaryTables.Tests.SummaryTestNames i on
--		i.DimensionsTestKey = e.TestDBID
--	group by b.testdate, g.Code, e.testdbid, i.summarytestname

--	Update #dailyresults
--	set AllcandidatePassRate = AllcandidatePass * 1.0 / CandidateN * 1.0
--	where CandidateN is not null and CandidateN > 0

--	Update #dailyresults
--		set FirstTimePassRate = FirstTimePass * 1.0 / FirstTimeN * 1.0
--	where FirstTimeN is not null and FirstTimeN > 0

---- Form length count
--	create table #itemcount (SummaryTestName varchar(2000), DimensionsTestKey int);

--	with t1 as (SELECT 
--		  SummaryTestName, DimensionsTestKey,
--		  row_number() over (partition by summarytestname order by summarytestname) as rownum
--	  FROM [Dw_SummaryTables].[Tests].[SummaryTestNames] )

--	  insert into #itemcount (SummaryTestName, DimensionsTestKey)
--	  select SummaryTestName, DimensionsTestKey from t1
--	  where rownum = 1;

--	 with t2 as (select SummaryTestName, DimensionsTestKey, count(*) cnt
--			from
--		#itemcount a 
--		join
--		Dimensions.TestSegments_vw b on
--			a.DimensionsTestKey = b.testkey
--		join
--		Dimensions.TestQuestions_vw c on
--			b.testsegmentdbid = c.testsegmentskey

--		group by SummaryTestName, DimensionsTestKey)
--	 update #dailyresults
--		set formlength = cnt
--	 from t2 join
--	 #dailyresults b on
--		b.TestTitle = t2.SummaryTestName;

--	create cursor Cumtotal for
--		Select DWTestKey





	 
	  
		


--	If
--		 month(@cudate) = 1 and day(@cudate) = 1 begin
--			select @refyear = year(@cudate)
--	end
--	insert into Dw_SummaryTables.Tests.DailyTestSummary (
--				ClientCode, TestTitle, TestDate, AllCandidateN, AllCandidatePass, AllCandidateOther, AllCandidatePassRate, FirstTimeN, FirstTimePass, FirstTimePassRate)
--	select ClientCode, TestTitle, TestDate, CandidateN, AllCandidatePass, AllCandidatePF, AllCandidatePassRate, FirstTimeN, FirstTimePass, FirstTimePassRate
--	from #dailyresults
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
