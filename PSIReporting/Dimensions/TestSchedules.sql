CREATE VIEW [Dimensions].[TestSchedules_vw]
	AS SELECT 
		TestScheduleDBID,
		SourceTestScheduleID,
		TestPackageKey,
		TestScheduleTitle,
		TestScheduleDesc,
		WebTitle,
		ScheduleStart,
		ScheduleEnd,
		Preview,
		ToStudent,
		ToInstructor,
		CaptureImage,
		CaptureBiometric,
		DisplayImage,
		LoginTimeLimit,
		Logoff,
		AltLogoff,
		ToAdditonal,
		Class,
		Locked,
		Status TestStatus,
		RedirectToExit,
		Culture
	from
		[$(PSI_DW)].Dimensions.TestSchedules (nolock)
	where
		CurrentFlag = 0
