CREATE VIEW [Dimensions].[AmpForms_vw]
	AS 
	SELECT 
		AmpFormsDBID,
		FormName,
		FormTestKey,
		Rawcut,
		ScaleCut,
		TimeLimit,
		FormAdminType,
		EffectiveFromDate,
		EffectiveToDate,
		ProvisionalFromDate,
		ProvisionalToDate,
		ScrambleOptions,
		ScrambleQuestions,
		Culture,
		Rawcut2
	From
		[$(PSI_DW)].Dimensions.AmpForms (nolock)
	Where CurrentFlag = 0
	

