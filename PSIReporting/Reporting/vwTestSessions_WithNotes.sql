/****** Object:  View [Reporting].[vwTestSessions_WithNotes]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Reporting].[vwTestSessions_WithNotes]
	AS select distinct
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
  a.TestDuration TotalDuration, 
  cast(b.Duration / 60.0 as decimal(10,2)) StepDuration,
  d.NoteType, 
  d.NoteText,
  a.PDiddy
from 
  [$(PSI_DW)].Bridge.TestSession a 
  join [$(PSI_DW)].bridge.TestSessionStep b on a.TestSessionId = b.TestSessionKey 
  join [$(PSI_DW)].dbo.DimExamSteps c on b.StepKey = c.ExamStepId 
  left join [$(PSI_DW)].Bridge.TestSessionNotes d on b.TestSessionStepId = d.TestSessionStepKey 
  join [$(PSI_DW)].Bridge.Organization e on a.account = e.RpassOrg