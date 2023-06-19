/****** Object:  View [Reporting].[vwTestSectionDefinitions]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Reporting].[vwTestSectionDefinitions]
	AS SELECT Distinct
		a.DurationName,
		a.OneStepFlag,
		b.stepname StartStep,
		c.stepname CompleteStep
	from
	[$(PSI_DW)].dbo.DimDurationDefinitions a join
	[$(PSI_DW)].dbo.DimExamSteps b on
		a.StartStepKey = b.ExamStepId join
	[$(PSI_DW)].dbo.DimExamSteps c on
		a.CompleteStepKey = c.ExamStepId