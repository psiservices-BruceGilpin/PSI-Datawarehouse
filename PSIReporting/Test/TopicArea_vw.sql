CREATE VIEW [Test].[TopicArea_vw]
	AS 
	Select
		TopicAreaDBID,
		PortionKey,
		TopicName,
		TopicDescription,
		TopicItemCount,
		TopicStatus,
		SourceTAID,
		ItemWeight,
		TotalItemWeight,
		AllorNothing
	From
		[$(PSI_DW)].Test.TopicArea
	Where CurrentFlag = 0
