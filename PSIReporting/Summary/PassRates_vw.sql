/****** Object:  View [Summary].[PassRates_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Summary].[PassRates_vw]
	AS SELECT 
	a.TestName, b.PortionName, c.AsOfDate, c.AllCandidateN, c.AllCandidatePass, 
	c.AllCandidatePassRate, c.FirstTimeN, c.FirstTimePass, c.FirstTimePassRate,
	a.SourceTestKey 'SourceTestKey', b.SourcePortionKey 'SourcePortionKey'
	FROM [$(PSI_DW)].Test.tests a join
	[$(PSI_DW)].test.Portion b on
		a.TestDBKey = b.TestKey join
	[$(PSI_DW)].Summary.PortionMeasures c on
		b.PortionDBID = c.TestPortionKey
	where
		a.CurrentFlag = 0 and b.CurrentFlag = 0