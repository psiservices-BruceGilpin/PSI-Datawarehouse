/****** Object:  View [Reporting].[vwTestSessions_NoNotes]    Script Date: 6/16/2023 1:44:54 PM ******/

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
  [$(PSI_DW)].Bridge.TestSession a 
  join [$(PSI_DW)].bridge.TestSessionStep b on a.TestSessionId = b.TestSessionKey 
  join [$(PSI_DW)].dbo.DimExamSteps c on b.StepKey = c.ExamStepId
  join [$(PSI_DW)].Bridge.Organization e on a.account = e.RpassOrg