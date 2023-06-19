/****** Object:  View [Reporting].[vw_TestSessions_NoNotes]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Reporting].[vw_TestSessions_NoNotes]
as
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
  b.StepOrder, 
  c.StepName, 
  b.StartDate, 
  b.StartTime, 
  b.Enddate, 
  b.EndTime, 
  b.Duration / 60.0 DurationMinutes
from 
  [$(PSI_DW)].Bridge.TestSession a 
  join [$(PSI_DW)].bridge.TestSessionStep b on a.TestSessionId = b.TestSessionKey 
  join [$(PSI_DW)].dbo.DimExamSteps c on b.StepKey = c.ExamStepId 
  join [$(PSI_DW)].Bridge.Organization e on a.account = e.RpassOrg