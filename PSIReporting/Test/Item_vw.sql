/****** Object:  View [Test].[Item_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[Item_vw]
	AS 
select 
a.ItemBankDBID,
a.AllowPartialScoring,
a.ItemOwnershipKey,
a.MaxOptionsSelectable,
a.MinWeightToConsider,
a.Stem,
a.PracticeItem,
a.SourceItemID 'Source ItemDB Key',
a.SourceItemKey,
b.SourceSystemName 'Source System'
from [$(PSI_DW)].Test.ItemBank a with (nolock) join
[$(PSI_DW)]..SourceSystems b with (nolock) on
	a.SourceSystemKey = b.SourceSystemId 
where a.CurrentFlag = 0