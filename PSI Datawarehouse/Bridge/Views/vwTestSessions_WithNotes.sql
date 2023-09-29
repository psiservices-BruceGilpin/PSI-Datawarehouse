CREATE VIEW [Bridge].[vwTestSessions_WithNotes] as
select distinct
  e.OrgFriendlyName Account, 
  a.TestSessionId,
  a.SessionKey,
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
  b.Duration / 60.0 DurationMinutes, 
  d.NoteType, 
  d.NoteText 
from 
  Bridge.TestSession a 
  join bridge.TestSessionStep b on a.TestSessionId = b.TestSessionKey 
  join DimExamSteps c on b.StepKey = c.ExamStepId 
  left join Bridge.TestSessionNotes d on b.TestSessionStepId = d.TestSessionStepKey 
  join Bridge.Organization e on a.account = e.RpassOrg