CREATE VIEW [Candidate].[TestTopicScore_vw]
	AS 
	select 
		TestAssignmentKey,
		TestTopicScoreDbID,
		TopicName,
		CorrectItemCount,
		TotalScore,
		TotalItemCount,
		ItemWeight
	From
	[$(PSI_DW)].Candidate.TestTopicScore
	where CurrentFlag = 0
