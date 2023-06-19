/****** Object:  View [LookupTables].[CandidateIDType_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[CandidateIDType_vw]
	AS 
	SELECT 
	CandidateTypeId,
	CandidateIDType CandidateType
	FROM [$(PSI_DW)]..DimCandidateIDType with (nolock)