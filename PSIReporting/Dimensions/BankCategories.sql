CREATE VIEW [Dimensions].[BankCategories_vw]
	AS 
	SELECT 
		BankCategoryDBID,
		SourceBankCategoryID,
		BankGroupKey,
		BankCategoryTitle,
		BankCategoryDescription,
		BankCategoryReference,
		BankCategorySequence,
		BanckCategoryStatus BankCategoryStatus
	From
		[$(PSI_DW)].Dimensions.BankCategories (nolock)
	Where CurrentFlag = 0
