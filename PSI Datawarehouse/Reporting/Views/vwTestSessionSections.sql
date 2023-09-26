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
  Bridge.TestSession a 
  join Reporting.SectionDurations b on a.TestSessionId = b.TestSessionKey 
  join DimDurationDefinitions c on b.DurationDefKey = c.DurationDefId 
  and c.EffectiveTo = '2999/12/31' 
  join DimExamSteps d on c.StartStepKey = d.examstepid 
  join DimExamSteps e on c.CompleteStepKey = e.ExamStepId 
  join DimDurationTypes f on b.DurationType = f.DurationTypeId