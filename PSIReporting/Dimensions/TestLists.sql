CREATE VIEW [Dimensions].[TestLists_vw]
	AS SELECT 
		TestListDbId,
		SourceTestListID,
		TestPackageKey,
		TestKey,
		TestSeq TestListSequence,
		TestTitle TestListTitle,
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
