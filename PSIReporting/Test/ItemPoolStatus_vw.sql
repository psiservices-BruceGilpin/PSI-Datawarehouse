/****** Object:  View [Test].[ItemPoolStatus_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[ItemPoolStatus_vw]
	AS SELECT 
		ItemPoolStatusId,
		StatusState
	FROM [$(PSI_DW)].Test.ItemPoolStatus