﻿/****** Object:  View [Candidate].[CompositeTest_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Candidate].[CompositeTest_vw]
	AS SELECT 
		m.SourceSystemName 'Data Source',
		i.AccountName,
		c.FirstName,
		c.LastName,
		h.TestName,
		b.TestDate 'TestAssignmentDate',
		l.PortionName,
		ISNULL(k.FormName, 'N/A') FixedFormName,
		j.DisplayOrder,
		j.TimeAllowed,
		j.TimeElapsed,
		j.IsCorrect,
		j.IsMarked,
		d.Result,
		d.RawScore,
		d.ScaledScore,
		j.TimesChanged,
		j.ISGFlag,
		j.TotalWeightage,
		j.Weightage,
		a.CandidateTestScheduleDBID 'Candidate Test Schedule DBID',
		a.CountryKey 'Test Schedule Country Key',
		a.DeliveryMethodKey 'Test Schedule Delivery Method Key',
		a.SourceTestScheduleKey 'TestRegn_Id',
		b.ProctorLanguageKey 'Test Assignment Proctor Language Key',
		b.CheckinLanguageKey 'Test Assignment Checkin Language Key',
		b.TestAssignmentDBID 'Test Assignment DBID',
		b.SourceTestAssignKey 'Source Test Assignment Key',
		c.CandidateDBId 'Candidate DB ID',
		c.CandidateTypeKey 'Candidate Type Key',
		c.CandidateAltKey 'Candidate Alternate Key',
		c.RegistrationTypeKey 'Registration Type Key',
		c.SourceCandidateKey 'Source Candidate ID',
		c.SchoolKey 'Candidate School Key',
		h.CategoryKey 'Test Category Key',
		h.TestStatusKey 'Test Status Key',
		h.TestTypeKey 'Test Type Key',
		h.SourceTestKey 'Source Test ID',
		l.CastingTypeKey 'Portion Casting Type Key',
		l.PortionTypeKey 'Portion Type Key',
		d.TestAssignPortionDBId 'Test Assignment Portion DB ID',
		d.LanguageKey 'Test Assginment Portion Language Key',
		i.AccountDBID 'Account DBID',
		i.SourceAccountID  'Source Account ID',
		c.CandidateDBId 'Candidate DBID',
		c.SourceCandidateKey 'Source Candidate Key',
		h.TestDBKey 'Test DB ID',
		h.SourceTestKey 'Source Test Key',
		l.PortionDBID 'Test Portion DB ID',
		l.SourcePortionKey 'Source Portion Key',
		k.FixedFormDBID 'Fixed Form DB ID',
		k.SourceFixedFormID 'Source Fixed Form ID',
		e.ItemPoolDBID 'Item Pool DB ID',
		e.ItemPoolStatusKey 'Item Pool Status Key',
		f.ItemBankDBID 'Item Bank DB ID',
		f.SourceItemID 'Source Item ID',
		f.ItemOwnershipKey 'Item Ownership Key',
		j.CandidateResponseDBId 'Candidate Response DB ID'
		
from 
  [$(PSI_DW)].Candidate.TestSchedule a with (nolock) 
  join [$(PSI_DW)].Candidate.TestAssignments b with (nolock) on 
	a.CandidateTestScheduleDBID = b.TestScheduleKey 
	and b.CurrentFlag = 0 
  join [$(PSI_DW)].candidate.candidates c with (nolock) on 
	b.candidatekey = c.candidatedbid 
	and c.CurrentFlag = 0 
  join [$(PSI_DW)].Candidate.TestAssignmentPortions d with (nolock) on 
	b.TestAssignmentDBID = d.TestAssignKey 
	and d.CurrentFlag = 0 
  join [$(PSI_DW)].test.ItemPool e with (nolock) on 
	d.TestPortionKey = e.PortionKey 
	and e.CurentFlag = 0 
  right join [$(PSI_DW)].test.ItemBank f with (nolock) on 
	e.itemkey = f.ItemBankDBID 
	and f.currentflag = 0 
  join [$(PSI_DW)].test.tests h with (nolock) on 
	h.TestDBKey = b.TestKey 
	and h.currentflag = 0 
  join [$(PSI_DW)].Account.Accounts i with (nolock) on 
	h.AccountKey = i.AccountDBID 
	and i.CurrentFlag = 0 
  left join [$(PSI_DW)].Candidate.Responses j with (nolock) on 
	j.TestAssignPortionKey = d.TestAssignPortionDBId 
	and j.ItemBankKey = f.ItemBankDBID 
	and j.CurrentFlag = 0 
  left join [$(PSI_DW)].test.FixedForm k with (nolock) on 
	j.FixedFormKey = k.FixedFormDBID 
	and k.CurrentFlag = 0 join
  [$(PSI_DW)].test.Portion l with (nolock) on
	d.TestPortionKey = l.PortionDBID 
  join [$(PSI_DW)]..SourceSystems m with (nolock) on
	a.sourcesystemkey = m.sourcesystemid 
   

	where a.CurrentFlag = 0