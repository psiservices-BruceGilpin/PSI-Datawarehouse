CREATE VIEW [Reporting].[vwTestSessions_NoNotes]
	AS
	select 
  e.OrgFriendlyName Account, 
  e.OrganizationId,
  a.TestSessionId,
  a.DossierKey,
  a.SessionKey,
  a.fname, 
  a.lname, 
  a.email, 
  a.TestDate,
  a.TestKey,
  b.StepOrder, 
  c.StepName, 
  b.StartDate, 
  b.StartTime, 
  b.Enddate, 
  b.EndTime, 
  a.TestDuration TotalDuration,
  b.Duration StepDuration,
  b.TestSessionStepId
from 
  Bridge.TestSession a 
  join bridge.TestSessionStep b on a.TestSessionId = b.TestSessionKey 
  join DimExamSteps c on b.StepKey = c.ExamStepId
  join Bridge.Organization e on a.account = e.RpassOrg