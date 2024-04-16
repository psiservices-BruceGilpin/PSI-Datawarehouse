CREATE PROCEDURE [Tests].[uspDailySummaryInsert]

AS
	


	if object_id('tempdb..#results') is not null
		drop table #results	
	if object_id('tempdb..#daily') is not null
		drop table #daily
	if object_id('tempdb..#ytd') is not null
	drop table #ytd
	if object_id('tempdb..#total') is not null
	drop table #total


	create table #results(	  CrossRefKey					int
								, AsOfDate					date
								, FormLength				int
								, [DailyN]					INT NULL 
								, [DailyPass]				INT NULL 
								, [DailyPassRate]			DECIMAL(5, 2) NULL 
								, [DailyFirstTimeN]			INT NULL 
								, [DailyFirstTimePass]		INT NULL 
								, [DailyScoreTotal]			INT Null
								, [DailyFirstTimePassRate]	DECIMAL(5,2) NULL
								, [DailyMeanRawScore]		Decimal(8,3)
								, [DailyVariance]			Decimal(8,3)
								, [DailySTD]				Decimal(8,3)
								, [DailyStDErrMean]			Decimal(8,3)
								, [YTDN]					int
								, [YtdFirstTimeN]			int
								, [YTDFirstTimePass]		int
								, [YTDPass]					int
								, [YTDScoreTotal]			int
								, [YTDTotalScore]			int
								, [YtdPassRate]				decimal(5,2)
								, [YTDMeanRawScore]			Decimal(8,3)
								, [YTDVariance]				Decimal(8,3)
								, [YTDSTD]					Decimal(8,3)
								, [YTDStdErrmean]			decimal(8,3)
								, [YTDFirstTimeRate]		decimal(5,2)
								, [TotalN]					int
								, [TotalPass]				int
								, [TotalScore]				int
								, [TotalFirstTimeN]			int
								, [TotalFirstTimePass]		int
								, [TotalPassRate]			decimal(5,2)
								, [TotalOtherPass]			int
								, [TotalFirstTimeRate]		decimal(5,2)
								, [TotalMeanRawScore]		decimal(8,3)
								, [TotalStdDev]				decimal(8,3)
								, [TotalStdErrMean]			decimal(8,3)
								, [TotalVariance]			decimal(8,3) 
								, [TotalAllScores]			int
								, [TotalSQRAllScores]		int
								)
	create table #Daily (		Crossrefkey					int,
								asofdate					date,
								Dailyn						int,
								DailyPass					int,
								DailyFirstTime				int,
								DailyFirstimePass			int,
								DailyScoreTotal				int,
								Dailyavg						decimal(8,3),
								DailyVar						decimal(8,3),
								DailySTD						decimal(8,3)

							)
		create table #ytd (		Crossrefkey					int,
								asofdate					date,
								ytdn						int,
								ytdPass						int,
								ytdFirstTime				int,
								ytdFirstimePass				int,
								ytdScoreTotal				int,
								ytdavg						decimal(8,3),
								ytdVar						decimal(8,3),
								ytdSTD						decimal(8,3)

							)
	create table #Total (		Crossrefkey					int,
								asofdate					date,
								Totaln						int,
								TotalPass					int,
								TotalFirstTime				int,
								TotalFirstimePass			int,
								Totalavg					decimal(8,3),
								TotalVar					decimal(8,3),
								TotalSTD					decimal(8,3),
								TotalAllScores				int,
								TotalSQRAllScores			int

							)
--Declare @cuxrefkey int, @cutestdate date


begin try

		declare @start date = cast(dateadd(year, -1, getdate()) as date), @end date = getdate()

		delete from tests.DailyTestSummary
		where TestDate >= @start


		Insert into #Daily (CrossRefKey, AsOfDate,DailyN, DailyPass, DailyFirstTime, DailyFirstimePass, DailyScoreTotal, DailyAvg, DailyVar, DailySTD)
		 select
			b.CrossRefKey,
			a.testdate,
			count(*) DailyCandidateN,
			sum(case when a.passfail = 'P' then 1 else 0 end) DailyCandidatePass,
			sum(case when a.computedattempt# = 1 then 1 else 0 end) DailyfirstTime,
			sum(case when a.passfail= 'P' and a.computedattempt# = 1 then 1 else 0 end) FirstimePass,
			sum(a.finalpoints) DailyScoreTotal,
			avg(a.finalpoints) DailyAvg,
			var(a.FinalPoints) DailyVariance,
			STDEV(a.FinalPoints) DailySTD
			from
			students.studenttestsummary a join
			tests.SummaryTestNames b on
				a.DWTestKey = b.DimensionsTestKey
			where 
				  a.TestDate  between @start and @end 
			group by
			b.CrossRefKey, a.TestDate

		  Insert into #ytd (CrossRefKey, asofDate, YTDN, YTDPass, YTDFirstTime,  ytdFirstimePass, ytdScoreTotal, YTDAvg, YTDVar, YTDStd)
		  
			select
			b.CrossRefKey,
			c.asofdate,
				count(*) YTDCandidateN,
				sum(case when a.passfail = 'P' then 1 else 0 end) YTDCandidatePass,
				sum(case when a.computedattempt# = 1 then 1 else 0 end) YTDfirstTime,
				sum(case when a.passfail= 'P' and a.computedattempt# = 1 then 1 else 0 end) YTDFirstimePass,
				sum(a.finalpoints) YTDSCoreTotal,
				avg(a.finalpoints) YTDAvg,
				var(a.finalPoints) YTDVariance,
				stdev(a.finalpoints) YTDStd
			from
				students.studenttestsummary a join
				tests.SummaryTestNames b on
					a.DWTestKey = b.DimensionsTestKey join
				#Daily c on
					b.CrossRefKey = c.Crossrefkey 
			where   a.TestDate <= c.asofdate and year(a.testdate) = year(c.asofdate) 
			group by
				b.CrossRefKey, c.asofdate
			order by b.CrossRefKey, c.asofdate
		  
			insert into #total (CrossRefKey, asofdate, TotalN, TotalPass, TotalFirstTime,  TotalFirstimePass,
								TotalAvg, TotalVar, TotalStd, TotalAllScores, TotalSQRAllScores)
		  
			select
			b.CrossRefKey,
			c.asofdate,
				count(*) TotalCandidateN,
				sum(case when a.passfail = 'P' then 1 else 0 end) TotalCandidatePass,
				sum(case when a.computedattempt# = 1 then 1 else 0 end) TotalfirstTime,
				sum(case when a.passfail= 'P' and a.computedattempt# = 1 then 1 else 0 end) TotalFirstimePass,
				avg(a.FinalPoints) Totalavg,
				var(a.FinalPoints) TotalVariance,
				stdev(a.FinalPoints) TotalStd,
				sum(a.finalpoints) TotalAllscores,
				sum(SQUARE(a.finalpoints))
			from
				students.studenttestsummary a join
				tests.SummaryTestNames b on
					a.DWTestKey = b.DimensionsTestKey join
				#Daily c on
					b.CrossRefKey = c.Crossrefkey 
			where  a.TestDate <= c.asofdate 
			group by
				b.CrossRefKey, c.asofdate  
		  insert into #results
		  (CrossRefKey, AsOfDate,			DailyN,			DailyPass,		DailyFirstTimeN, DailyScoreTotal,	DailyFirstTimePass, DailyMeanRawScore, DailyVariance, DailySTd,
											YTDN,			Ytdpass,		YTDScoreTotal,		 YtdFirstTimeN,	YTDFirstTimePass,	YTDMeanRawScore,   YTDVariance,   YTDStd,
											TotalN,			 TotalPass,		TotalAllScores,	TotalFirstTimeN,	TotalFirstTimePass, TotalMeanRawScore, TotalVariance, TotalStdDev,  TotalSQRAllScores )

		  Select
			a.CrossRefKey ,		a.asofdate ,	a.[DailyN],		a.[DailyPass], a.[DailyFirstTime],	a.[DailyScoreTotal],		a.[DailyFirstimePass],	a.[DailyAvg],	a.[DailyVar],	a.[DailySTD],
												b.YTDN,			b.YTDPass,		b.ytdScoreTotal,		b.YTDFirstTime,	 b.YTDFirstimePass,		b.YTDAvg,		b.YTDVar,		b.YTDStd,
												c.TotalN,		c.TotalPass,	c.TotalAllScores,	c.TotalFirstTime,	c.TotalFirstimePass,	c.TotalAvg,		c.TotalVar,		c.TotalStd, c.TotalSQRAllScores
		  from
			#daily a
			join
			#ytd b on
				a.CrossRefKey = b.CrossRefKey	and a.AsOfDate = b.asofdate			
			join
			#total c on
				a.CrossRefKey = C.CrossRefKey  and a.AsOfDate = c.asofdate ;
			

	 Update #results
	 set
		DailyPassRate = Case when DailyN > 0 then DailyPass * 1.0 / DailyN end,
		DailyFirstTimePassRate = Case when DailyFirstTimeN > 0 then DailyFirstTimePass * 1.0 / DailyFirstTimeN end,
		YtdPassRate = case when YTDN > 0 then YTDPass * 1.0 / YTDN end,
		YTDFirstTimeRate = case when YTDFirstTimen > 0 then YTDFirstTimePass * 1.0 / YtdFirstTimeN end,
		TotalPassRate = case when TotalN > 0 then TotalPass * 1.0 / TotalN end,
		TotalFirstTimeRate = case when TotalFirstTimeN > 0 then TotalFirstTimePass * 1.0 / TotalFirstTimeN end,
		DailyStDErrMean = case when DailyN > 0 then
							DailySTD / SQRT(DailyN)
						  end,
		YTDStdErrmean = case when ytdn > 0 then
							YTDSTD / sqrt(YTDN)
						end,
		TotalStdErrMean = case when TotalN > 0 then
							TotalStdDev / sqrt(Totaln)
						end


	if object_id('tempdb..#daily') is not null
		drop table #daily
	if object_id('tempdb..#ytd') is not null
	drop table #ytd
	if object_id('tempdb..#total') is not null
	drop table #total
	
	Insert into Tests.DailyTestSummary (
		ClientCode,
		TestTitle,
		TestDate,
		ScaleCut,
		RawCut,
		ItemCount,
		DailyN,
		DailyPass,
		DailyPassRate,
		DailyFirstTimeN,
		DailyFirstTimePass,
		DailyFirstTimePassRate,
		DailyMeanRawScore,
		DailyStdDev,
		DailyReliabilityEst,
		DailyScoreTotal,
		DailyStdErrMean,
		TotalN,
		TotalPass,
		TotalPassRate,
		TotalFirstTimeN,
		TotalFirstTimePass,
		TotalFirstTimePassRate,
		TotalMeanRawScore,
		TotalStdDev,
		TotalReliabilityEst,
		totalscore,
		TotalSqrAllScores,
		TotalStdErrMean,
		YTDN,
		YTDPass,
		YTDPassRate,
		YTDFirstTimeN,
		YTDFirstTimePass,
		YTDFirstTimePassRate,
		YTDMeanRawScore,
		YTDStdDev,
		YTDReliabilityEst,
		YTDTotalScore,
		YTDStdErrMean,
		CrossRefKey)
	select distinct
		a.AccountCode,
		a.SummaryTestName,
		b.asofdate,
		a.ScaleCut,
		a.RawCut,
		a.itemcount,
		b.dailyn,  b.DailyPass, b.DailyPassRate, b.DailyFirstTimeN, b.DailyFirstTimePass, b.DailyFirstTimePassRate, b.DailyMeanRawScore, b.DailySTD, b.DailyVariance, b.DailyScoreTotal, b.DailyStDErrMean,
		b.TotalN,  b.TotalPass, b.TotalPassRate, b.TotalFirstTimeN, b.TotalFirstTimePass, b.TotalFirstTimeRate, b.TotalMeanRawScore, b.TotalStdDev, b.TotalVariance, b.TotalAllScores, b.TotalSQRAllScores, YTDStdErrmean,
		b.YTDN,	   b.ytdpass,   b.YtdPassRate,   b.YtdFirstTimeN,   b.YTDFirstTimePass,   b.YTDFirstTimeRate,   b.YTDMeanRawScore,   b.YTDSTD,      b.YTDVariance, b.YTDScoreTotal, YTDStdErrMean, b.CrossRefKey
	from
		(select distinct SummaryTestName, Crossrefkey, AccountCode, Scalecut, max(RawCut) RawCut, ItemCount from Tests.SummaryTestNames
				group by SummaryTestName, Crossrefkey, AccountCode, Scalecut, ItemCount) a  join
		#results b on
			a.CrossRefKey = b.crossrefkey
	where a.AccountCode is not null
	
end try
	Begin catch
		Insert PSI_DW.Logging.SQLErrors (
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
