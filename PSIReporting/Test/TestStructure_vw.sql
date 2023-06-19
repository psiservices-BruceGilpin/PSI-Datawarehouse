CREATE VIEW [Test].[TestStructure_vw]
	AS SELECT 
			a.TestName,
			a.TestDBKey 'TestDBID',
			a.SourceTestKey 'SourceTestKey',
			a.AccountKey,
			b.PortionName,
			b.[Description],
			b.TestOrder,
			b.PortionDBID,
			b.SourcePortionKey,
			b.PassingScore,
			b.RawCut,
			b.ScaledCut,
			b.Duration,
			b.ItemCount,
			c.FormName,
			c.FixedFormDBID,
			c.SourceFixedFormID,
			c.PassingScore 'FormPassingScore',
			d.Description 'FormStatus'
	   from
			[$(PSI_DW)].Test.Tests a join
			[$(PSI_DW)].Test.Portion b on
				a.TestDBKey = b.TestKey and
				a.CurrentFlag = 0 and b.CurrentFlag = 0 join
			[$(PSI_DW)].Test.FixedForm c on
				b.PortionDBID = c.PortionKey and
				c.CurrentFlag = 0 join
			[$(PSI_DW)].dbo.DimTestFixedFormItemStatus d on
				c.StatusKey = d.TestFixedFormItemStatusID