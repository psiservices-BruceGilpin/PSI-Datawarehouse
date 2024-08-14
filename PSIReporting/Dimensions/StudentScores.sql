CREATE VIEW [Dimensions].[StudentScores_vw]
	AS SELECT 
		StudentScoreDBID,
		SourceStudentScoreID,
		StudentListKey,
		TestScheduleKey,
		TestListKey,
		TestCenterKey,
		AmpFormKey,
		ScoreStatus,
		StartDate,
		Enddate,
		ScorePoints,
		Restarts,
		Version,
		OrderSeed,
		HowLong,
		Warn,
		Retake,
		ExtraTime,
		ExtraTimeUsed,
		ReportDate,
		Reports,
		Sim,
		PFA,
		AdaTime,
		ExtraStatus,
		ExtraStart,
		ExtraEnd,
		Proctored,
		NewSchedEnd,
		FinalPoints,
		ScaledScore,
		IGPoints,
		DmPoints
	from
	[$(PSI_DW)].Dimensions.StudentScores (nolock)
	where
		CurrentFlag = 0
