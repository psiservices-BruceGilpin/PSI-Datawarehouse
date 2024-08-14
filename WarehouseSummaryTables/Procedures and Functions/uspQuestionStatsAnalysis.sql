CREATE PROCEDURE [dbo].[uspQuestionStatsAnalysis]
	@ClientTitle	varchar(50),
	@startyear		varchar(4),
	@startmonth		varchar(2),
	@endyear		varchar(4),
	@endmonth		varchar(2)
AS
	create table #ItemResults (
	ClientCode					Varchar(12),
	QuestionTitle				Varchar(50),
	VerisionNum					smallint,
	Firstdate					date,
	lastdate					date,
	Nt							int,
	Ny							int,
	SigmaX						int,
	SigmaY						int,
	SigmaSQX					bigint,
	PassingCnt					int,
	PassingRate					decimal(7,2),
	Firstattempt				int,
	FirstTimePass				int,
	FirstTimePassRate			decimal(7,2),
	RPB							decimal(6,4)
	)


	Insert into #itemResults (
		ClientCode,
		QuestionTitle,50
		FirstDate,
		lastdate,
		Nt,
		Ny,
		SigmaX,
		SigmaSQX,
		SigmaY,
		PassingCnt,
		PassingRate,
		Firstattempt,
		FirstTimePass,
		FirstTimePassRate

	)
	select
	h.areatitle,
	c.questiontitle,
	min(f.testdate) firstdate,
	max(f.testdate) lastdate,
	count(*) Nt,																									--Nt
	sum(case when k.Points > 0 then 1 else 0 end) Ny,																--Ny
	sum(f.finalpoints) TotalScore,																					--SigmaX
	cast(sum(square(f.finalpoints)) as bigint) SquareScore,																			--SigmaSQX
	sum(case when k.points > 0 then f.finalpoints else 0 end),																	--SigmaY
	sum(case when f.passfail = 'P' then 1 else 0 end) PassingCount,
	cast(sum(case when f.passfail = 'P' then 1 else 0 end) * 1.0 / count(*) as decimal(5,2)) PassingRate,
	sum(case when f.computedattempt# = 1 then 1 else 0 end) FirstAttempt,
	sum(case when f.ComputedAttempt# = 1 and f.PassFail = 'P' then 1 else 0 end) FirstTimePass,
	case when sum(case when f.computedattempt# = 1 then 1 else 0 end) > 0 then
		cast(sum(case when f.computedattempt# = 1 and f.passfail = 'P' then 1 else 0 end) * 1.0 
			/ sum(case when f.computedattempt# = 1 then 1 else 0 end) as decimal(5,2)) 
		end FirstTimePassRate

	from
	[$(PSI_DW)].dimensions.testquestions_vw b 
	join
	[$(PSI_DW)].dimensions.questions_vw c on
		b.questionkey = c.questiondbid

	join
	[$(PSI_DW)].dimensions.testsegments_vw d on
		b.TestSegmentsKey = d.testsegmentdbid
	join
	Dw_SummaryTables..KeyCrossReference e on
		d.testkey = e.dimensionstestkey
	join
	dw_summarytables.students.studenttestsummary f on
		e.studentscorekey = f.dwTestScoreKey
	join
	[$(PSI_DW)].dimensions.tests_vw g on
		d.testkey = g.testdbid
	join
	[$(PSI_DW)].dimensions.Areas_vw h on
		g.AreaKey = h.AreaDBID
	join
	[$(PSI_DW)].Dimensions.StudentItems_vw j on
		b.testquestiondbid = j.testquestionkey
	join
	[$(PSI_DW)].Dimensions.StudentResponses_vw k on
		j.StudentItemDBID = k.StudentItemKey
	where 	
	h.AreaTitle = @ClientTitle and
	e.testdate between @startdate and @enddate


	group by
	h.areatitle,
	c.QuestionTitle,
	c.VersionNum



	UPdate #ItemResults
		set RPB = PSI_DW.Test.pBIS(SigmaSQX,SigmaX,Nt,Ny,SigmaY )


		select * from #ItemResults 
		
RETURN 0
