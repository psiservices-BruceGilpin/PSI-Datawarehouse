CREATE VIEW [Dimensions].[BankCategoryGroups_vw]
	AS SELECT 
		BankCategoryGroupDBID,
		SourceBankCatGroupID,
		BankKey,
		BankCatGroupTitle,
		BankCatGroupDesc,
		GroupTag,
		PreTest,
		BankCatGroupSequence,
		BankCatStatus
	From
		[$(PSI_DW)].Dimensions.BankCategoryGroups (nolock)
	Where
		CurrentFlag = 0
