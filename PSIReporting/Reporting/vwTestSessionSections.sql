/****** Object:  View [Reporting].[vwTestSessionSections]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Reporting].[vwTestSessionSections]
as
select 
  a.Account,
  a.TestSessionId,
  a.DossierKey, 
  a.SessionKey, 
  a.TestDate,
  c.DurationName,
  f.TypeDescription DurationType, 
  d.StepName startstep, 
  e.StepName endstep, 
  b.Duration,
  a.LoadDate
from 
  [$(PSI_DW)].Bridge.TestSession a 
  join [$(PSI_DW)].Reporting.SectionDurations b on a.TestSessionId = b.TestSessionKey 
  join [$(PSI_DW)].dbo.DimDurationDefinitions c on b.DurationDefKey = c.DurationDefId 
  and c.EffectiveTo = '2999/12/31' 
  join [$(PSI_DW)].dbo.DimExamSteps d on c.StartStepKey = d.examstepid 
  join [$(PSI_DW)].dbo.DimExamSteps e on c.CompleteStepKey = e.ExamStepId 
  join [$(PSI_DW)].dbo.DimDurationTypes f on b.DurationType = f.DurationTypeId