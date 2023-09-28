CREATE VIEW [Dimensions].[Banks_vw]
	AS SELECT 
		BankDBID,
		AreaKey,
		BankTitle,
		BankDescription,
		BankSim,
		BankCopyright,
		EnforceOutline,
		BankSequenceLenth BankSequenceLength,
		isDeleted
	From
		[$(PSI_DW)].Dimensions.Banks (nolock)
	where
		CurrentFlag = 0
