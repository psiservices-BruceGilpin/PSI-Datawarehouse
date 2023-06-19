/****** Object:  View [Test].[GroupInfo_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[GroupInfo_vw]
	AS SELECT 
		GroupInfoDBID,
		PortionKey,
		GroupName,
		NumberOfItems
	FROM [$(PSI_DW)].Test.GroupInfo
	Where CurrentFlag = 0