/****** Object:  View [Test].[TestPortionTopicArea_vw]    Script Date: 6/16/2023 1:44:53 PM ******/

CREATE VIEW [Test].[TestPortionTopicArea_vw]
	AS 

SELECT [PortionTopicAreaDBId]
      ,[SourceSystemKey]
      ,[SourceTopicAreaID]
      ,[PortionKey]
      ,[TopicName]
      ,[TopicAreaDescription]
      ,[ItemCount]
      ,[PublicationStatus]
      ,[ItemWeight]
      ,[SequenceNo]
      ,[AllOrNothingFlag]
      ,[CreateDate]
      
  FROM [$(PSI_DW)].[Test].[PortionTopicArea] with (nolock)
  where CurrentFlag = 0