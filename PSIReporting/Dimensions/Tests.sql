CREATE VIEW [Dimensions].[Tests_vw]
	AS SELECT 
		TestDbID,
		SourceTestID,
		TestTitle,
		TestDesc,
		TestStatus,
		TestResultKey,
		TestBankKey,
		TestSim,
		TotalPoints,
		TotalItems,
		TestRefx,
		TestRefh,
		TestRefw,
		TestState,
		TestClass,
		TestLocked,
		TestVersnum,
		AreaKey

	from
		[$(PSI_DW)].Dimensions.Tests (nolock)
	where
		CurrentFlag = 0
