CREATE VIEW [Dimensions].[Students_vw]
	AS SELECT 
		StudentDBID,
		SourceStudentID,
		PoolKey,
		StudentAltID,
		FirstName,
		LastName,
		StudentEmail,
		Phone,
		AltPhone,
		ADA,
		Gender,
		Birthdate,
		MadienName

	from
	[$(PSI_DW)].Dimensions.Students (nolock)
	where
		CurrentFlag = 0
