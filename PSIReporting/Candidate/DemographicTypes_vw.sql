﻿CREATE VIEW [Candidate].[DemographicTypes_vw]
	AS 
	Select 
		SourceAttributeID,
		Demographic,
		DemographicTypeDBId,
		CandidateColumnName
	from
		[$(PSI_DW)].Candidate.DemographicTypes
