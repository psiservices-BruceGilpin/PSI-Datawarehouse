﻿--CREATE VIEW [Dimensions].[TestPassRates_vw]
--	AS SELECT 
--	a.AccountName,
--	a.testtitle,
--	count(*) CandidateN
--from
--[$(PSI_DW)].Account.Accounts a
--join
--[$(PSI_DW)].Dimensions.Clients b on
--	a.GlobalAccountID = b.AtlasAccountCode
--join
--[$(PSI_DW)].Dimensions.TestPackages c on
--	b.PoolKey = c

