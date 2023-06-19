/****** Object:  View [Test].[TestDefinition_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[TestDefinition_vw]
	AS 
	select 
	f.AccountName, f.SourceAccountID, a.TestName, a.SourceTestKey, b.PortionName, b.SourcePortionKey, b.description 'Portion Description', d.Stem, e.OptionOrder, e.OptionText
	from
		[$(PSI_DW)].Test.Tests a with (nolock) join
		[$(PSI_DW)].Test.Portion b with (nolock) on
			a.TestDBKey = b.TestKey and
			b.CurrentFlag = 0 join
		[$(PSI_DW)].test.ItemPool c with (nolock) on
			b.PortionDBID = c.PortionKey and
			c.CurentFlag = 0 join
		[$(PSI_DW)].test.ItemBank d with (nolock) on
			c.ItemKey = d.ItemBankDBID and
			d.currentflag = 0 join
		[$(PSI_DW)].test.ItemOptions e with (nolock) on
			d.ItemBankDBID = e.ItemKey and
			e.Currentflag = 0 join
		[$(PSI_DW)].Account.Accounts f on
			a.AccountKey = f.AccountDBID and
			f.CurrentFlag = 0
	where a.CurrentFlag = 0