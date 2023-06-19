/****** Object:  View [Test].[FixedFormItem_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[FixedFormItem_vw]
	AS 

SELECT [FixedFormItemDBID]
      ,[SourceFixedFormKey]
      ,[SourceItemID]
      ,[FixedFormKey]
      ,[ItemKey]
      ,[Status]
      ,[CreatedDate]
      ,[DisplayOrder]
      ,[ISGType]
  FROM [$(PSI_DW)].[Test].[FixedFormItem] with (nolock)
  Where       [CurrentFlag] = 0