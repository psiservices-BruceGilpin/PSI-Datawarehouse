CREATE VIEW [Bridge].[vwTestSectionDefinitions]
	AS SELECT Distinct
		a.DurationName,
		a.OneStepFlag,
		b.stepname StartStep,
		c.stepname CompleteStep
	from
	DimDurationDefinitions a join
	DimExamSteps b on
		a.StartStepKey = b.ExamStepId join
	DimExamSteps c on
		a.CompleteStepKey = c.ExamStepId