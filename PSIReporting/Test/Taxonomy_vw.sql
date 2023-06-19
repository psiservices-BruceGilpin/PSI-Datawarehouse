/****** Object:  View [Test].[Taxonomy_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[Taxonomy_vw]
	AS SELECT 
		TaxonomyDBID,
		AccountKey,
		TaxonomyName,
		Code,
		ParentTaxonomyKey
	FROM [$(PSI_DW)].Test.Taxonomy
	where CurrentFlag = 0