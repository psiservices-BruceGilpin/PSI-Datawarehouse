﻿CREATE VIEW [Dimensions].[StudentScores_vw]
	AS SELECT 
		StudentScoreDBID,
		SourceStudentScoreID,
		StudentListKey,
		TestScheduleKey,
		TestListKey,
		TestCenterKey,
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
		ScaledScore
	from
	[$(PSI_DW)].Dimensions.StudentScores (nolock)
	where
		CurrentFlag = 0
