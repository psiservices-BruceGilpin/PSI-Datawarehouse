/****** Object:  View [Test].[ItemBank_vw]    Script Date: 6/16/2023 1:44:54 PM ******/


CREATE VIEW [Test].[ItemBank_vw]
	AS 

SELECT [ItemBankDBId]
      ,[SourceSystemKey]
      ,[SourceItemKey]
      ,[TaxonomyKey]
      ,[SourceItemID]
      ,[Stem]
      ,[ItemOwnershipKey]
      ,[MinWeightToConsider]
      ,[MaxOptionsSelectable]
      ,[AllowPartialScoring]
      ,[CreatedDate]
  FROM [$(PSI_DW)].[Test].[ItemBank] with (nolock)
  where [CurrentFlag] = 0