CREATE VIEW [Bridge].[vwDurationDefinitions]
	AS 
	select distinct
	a.durationname, a.DurationDefId, b.StepName startstep, a.OneStepFlag, c.StepName completionstep, EffectiveFrom, EffectiveTo
from DimDurationDefinitions a join
	DimExamSteps b on
		a.StartStepKey = b.ExamStepId join
	DimExamSteps c on
		a.CompleteStepKey = c.ExamStepId