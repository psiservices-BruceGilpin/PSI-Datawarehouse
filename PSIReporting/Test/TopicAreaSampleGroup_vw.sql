/****** Object:  View [Test].[TopicAreaSampleGroup_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[TopicAreaSampleGroup_vw]
	AS 
	SELECT 
	SampleGroupDBID,
	TopicAreaKey,
	SampleGroupName,
	ItemCount,
	Selectedcount
	FROM [$(PSI_DW)].Test.TopicAreaSampleGroup
	where CurrentFlag = 0