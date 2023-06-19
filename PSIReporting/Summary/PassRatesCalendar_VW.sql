/****** Object:  View [Summary].[PassRatesCalendar_VW]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Summary].[PassRatesCalendar_VW]
	AS SELECT 
	e.AccountName 'Account Name', a.TestName 'Test Name', b.PortionName 'Portion Name', c.asOfDate 'As of Date', d.[Calendar Year], d.[Calendar Quarter], c.AllCandidateN 'All Candidate N', c.AllCandidatePass 'All Candidate Passed', 
	c.AllCandidatePassRate 'All Candidate Pass Rate', c.FirstTimeN 'First Time Candidates', c.FirstTimePass 'First Time Passed', c.FirstTimePassRate 'First Time Pass Rate', 
	a.SourceTestKey, b.SourcePortionKey
	FROM [$(PSI_DW)].Test.tests a join
	[$(PSI_DW)].test.Portion b on
		a.TestDBKey = b.TestKey join
	[$(PSI_DW)].Summary.PortionMeasures c on
		b.PortionDBID = c.TestPortionKey join
	LookupTables.Calendar_vw d on
		c.AsOfDate = d.[Calendar Date] join
	[$(PSI_DW)].Account.Accounts e on
		a.AccountKey = e.AccountDBID
	where
		a.CurrentFlag = 0 and b.CurrentFlag = 0