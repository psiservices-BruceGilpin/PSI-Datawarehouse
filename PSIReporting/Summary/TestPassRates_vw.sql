/****** Object:  View [Summary].[TestPassRates_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

--CREATE VIEW [Summary].[TestPassRates_vw]
--	AS 
--	select d.AccountName, c.TestName, b.PortionName, a.TestDate,a.FirstTimePassRate, a.FirstTimeN, a.AllCandidatePassRate, a.AllCandidateN,
--	b.PortionDBID, c.TestDBKey TestDBID, d.AccountDBID
--	from
--	[$(PSI_DW)].Summary.PassRates a join
--	[$(PSI_DW)].Test.Portion b on
--		a.TestPortionKey = b.PortionDBID and
--		b.CurrentFlag = 0 join
--	[$(PSI_DW)].Test.Tests c on
--		c.TestDBKey = b.TestKey 
--		and c.currentflag = 0 join
--	[$(PSI_DW)].Account.Accounts d on
--		d.AccountDBID = c.AccountKey and
--		d.CurrentFlag = 0