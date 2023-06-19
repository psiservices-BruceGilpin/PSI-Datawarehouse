/****** Object:  View [Summary].[TestItemsWithMeasures]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Summary].[TestItemsWithMeasures]
	AS SELECT Distinct
	h.Stem, i.StatusState, c.TopicName, d.SampleGroupName, a.AngoffValue, a.Pvalue, a.Pbis
	from 
		
		test.ItemPool_vw a join
		Test.Portion_vw  b on
			a.PortionKey = b.PortionDBID join
		Test.TestPortionTopicArea_vw c on
			b.PortionDBID = c.PortionKey join
		Test.TopicAreaSampleGroup_vw d on
			c.PortionTopicAreaDBID = d.TopicAreaKey join
		Test.GroupInfo_vw e on
			e.PortionKey = b.PortionDBID join
		Test.tests_vw f on
			b.TestKey = f.TestDBID join
		Test.Taxonomy_vw g on
			g.AccountKey = f.AccountKey join
		Test.ItemBank_vw h on
			a.ItemKey = h.ItemBankDBID join
		Test.ItemPoolStatus_vw i on
			a.ItemPoolStatusKey = i.ItemPoolStatusId