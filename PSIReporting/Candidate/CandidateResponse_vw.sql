/****** Object:  View [Candidate].[CandidateResponse_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Candidate].[CandidateResponse_vw]
	AS 
		select
		isCorrect,
		isMarked, 
		DisplayOrder,
		TimeElapsed,
		TimeAllowed
		TotalWeightage,
		Weightage,
		CandidateResponseDBId,
		FixedFormKey,
		TestAssignPortionKey,
		ItemBankKey,
		ISGFlag,
		Comments
		from [$(PSI_DW)].Candidate.Responses
		where CurrentFlag = 0