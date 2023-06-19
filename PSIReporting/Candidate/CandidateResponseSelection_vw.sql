/****** Object:  View [Candidate].[CandidateResponseSelection_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Candidate].[CandidateResponseSelection_vw]
	AS 
		Select
			CandidateResponseKey,
			ItemBankKey,
			ItemOptionKey
			
		from [$(PSI_DW)].Candidate.ResponseSelections