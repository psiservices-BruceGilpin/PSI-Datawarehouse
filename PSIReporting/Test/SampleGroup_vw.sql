/****** Object:  View [Test].[SampleGroup_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[SampleGroup_vw]
As
SELECT [SampleGroupDBID]
      ,[SourceSystemKey]
      ,[SourceSampleGroupID]
      ,[TopicAreaKey]
      ,[SampleGroupName]
      ,[ItemCount]
      ,[Selectedcount]
  FROM [$(PSI_DW)].[Test].[TopicAreaSampleGroup] with (nolock)
  where [CurrentFlag] = 0