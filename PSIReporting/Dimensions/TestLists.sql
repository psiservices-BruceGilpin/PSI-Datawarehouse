CREATE VIEW [Dimensions].[TestLists_vw]
	AS SELECT 
		TestListDbId,
		SourceTestListID,
		TestPackageKey,
		TestKey,
		TestSeq,
		TestTitle,
		Scramble,
		Randomize,
		GradeType,
		WholeTime,
		WarnTime,
		Feedback,
		Comment

	from
		[$(PSI_DW)].Dimensions.TestLists (nolock)
	where
		CurrentFlag = 0
