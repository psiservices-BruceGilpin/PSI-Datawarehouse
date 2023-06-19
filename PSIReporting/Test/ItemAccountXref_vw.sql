/****** Object:  View [Test].[ItemAccountXref_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[ItemAccountXref_vw]
	AS SELECT 
		AccountKey, ItemKey
	From [$(PSI_DW)].Test.ItemAccountXRef