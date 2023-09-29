CREATE VIEW [Reporting].[vwExamSteps]
	AS SELECT 
		ExamStepId,
		StepName

	from dbo.DimExamSteps