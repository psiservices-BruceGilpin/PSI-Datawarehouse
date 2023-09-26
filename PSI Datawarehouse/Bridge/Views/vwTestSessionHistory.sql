CREATE VIEW [Bridge].[vwTestSessionHistory] as
select 
  e.OrgFriendlyName Account, 
  a.DossierKey,
  a.fname, 
  a.lname, 
  a.email, 
  a.TestDate,
  b.StepOrder, 
  c.StepName, 
  b.StartDate, 
  b.StartTime, 
  b.Enddate, 
  b.EndTime, 
  b.Duration, 
  d.NoteType, 
  d.NoteText 
from 
  Bridge.TestSession a 
  join bridge.TestSessionStep b on a.TestSessionId = b.TestSessionKey 
  join DimExamSteps c on b.StepKey = c.ExamStepId 
  left join Bridge.TestSessionNotes d on b.TestSessionStepId = d.TestSessionStepKey 
  join Bridge.Organization e on a.account = e.RpassOrg