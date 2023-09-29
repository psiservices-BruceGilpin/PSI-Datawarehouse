CREATE VIEW [Reporting].[vwDailyStepCount]
	AS SELECT 
	a.OrgName, b.stepname, a.stepdate, a.stepcount
	from
		DataAnalysis.DailyStepCount a join
		dbo.DimExamSteps b on
			a.StepKey = b.ExamStepId