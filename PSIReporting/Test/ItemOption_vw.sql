/****** Object:  View [Test].[ItemOption_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[ItemOption_vw]
	AS SELECT [ItemOptionsDBId]
      ,[SourceSystemItemOptionsKey]
      ,[SourceSystemKey]
      ,[ItemKey]
      ,[OptionOrder]
      ,[OptionText]
      ,[Weightage]
      
  FROM [$(PSI_DW)].[Test].[ItemOptions] with (nolock)
  Where [Currentflag] = 0