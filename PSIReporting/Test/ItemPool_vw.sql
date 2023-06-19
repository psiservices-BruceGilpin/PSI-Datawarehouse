/****** Object:  View [Test].[ItemPool_vw]    Script Date: 6/16/2023 1:44:54 PM ******/


CREATE VIEW [Test].[ItemPool_vw]
as

SELECT [ItemPoolDBId]
      ,[SourceSystemKey]
      ,[PortionKey]
      ,[ItemKey]
      ,[MinWeightage]
      ,[ItemWeightage]
      ,[Pvalue]
      ,[Pbis]
      ,[AngoffValue]
      ,[IsRecorded]
      ,[IsTimed]
      ,[IsScored]
      ,[ItemPoolStatusKey]
      ,[IsFromQorNQ]
      ,[ActiveIsg]
      ,[Subtopic]
      ,[CreatedDate]
      
  FROM [$(PSI_DW)].[Test].[ItemPool] with (nolock)
  Where [CurentFlag] = 0