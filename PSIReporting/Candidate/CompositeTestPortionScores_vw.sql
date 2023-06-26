/****** Object:  View [Candidate].[CompositeTestPortionScores_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Candidate].[CompositeTestPortionScores_vw]
	AS 
	

select 
i.AccountName
, n.CandidateIDType 'Alt Candidate ID Type'
, case 
	when n.CandidateIDType <> 'SSN' then m.IdentityValue 
	else '999-99-9999'
	end TestRegn_ID
, a.firstname
, a.LastName
,f.TestName
,l.DeliveryDescripton
,f.SourceTestKey AtlasLCTestID
,c.SourceAccountSchoolKey AtlasLCSchoolID
,c.SchoolName
,b.TestDate
,e.PortionName
,o.FormName
,isnull(d.Take#,0) attempt
,d.ComputedAttempt#
,e.Duration 'Time Allowed'
,d.ElapsedTime
,d.ExtendedTimeAllowed
,k.ExAccDescription 'Extended Time Reason'
,g.PortionTypeID
,d.Result
,d.RawScore
,d.ScaledScore
,e.RawCut
,e.ScaledCut


from
	[$(PSI_DW)].Account.Accounts i with (nolock) join
	[$(PSI_DW)].test.Tests f with (nolock) on
			i.AccountDBID = f.AccountKey and
			f.CurrentFlag = 0 join
	[$(PSI_DW)].test.Portion e with (nolock) on
		f.TestDBKey = e.TestKey  and
		e.CurrentFlag = 0 join
	[$(PSI_DW)].candidate.TestAssignments b with (nolock) on
		f.TestDBKey = b.TestKey and 
		b.CurrentFlag = 0 join
	[$(PSI_DW)].Candidate.TestAssignmentPortions d with (nolock) on
		b.TestAssignmentDBID = d.TestAssignKey and
		e.PortionDBID = d.TestPortionKey and
		d.CurrentFlag = 0 join
	[$(PSI_DW)].candidate.Candidates a with (nolock) on
		b.CandidateKey = a.CandidateDBId and
		a.CurrentFlag = 0 join
	[$(PSI_DW)]..DimCandidateIDType h with (nolock) on
		a.CandidateTypeKey = h.CandidateTypeId join
	[$(PSI_DW)].Account.AccountSchool c with (nolock) on
		a.SchoolKey = c.AccountSchoolDBId and
		c.CurrentFlag = 0		join
	[$(PSI_DW)]..DimPortionType g with (nolock) on
		e.PortionTypeKey = g.PortionIDid join
	[$(PSI_DW)]..DimExtendedAccomodations k on
		d.ExtendedAccomodationsKey = k.ExtendedAccomodationId join
	[$(PSI_DW)]..DimDeliveryMethods l on
		b.DeleiveryMethodKey = l.DeliveryMethodId join
	[$(PSI_DW)].dbo.CandidatePPI m on 
		a.CandidateDBId = m.CandidateKey join
	[$(PSI_DW)].dbo.DimCandidateIDType n on
		m.CandidateTypeKey = n.CandidateTypeId left join
	[$(PSI_DW)].Test.FixedForm o on
		d.FixedFormKey = o.FixedFormDBID and
		o.CurrentFlag = 0
		

where i.CurrentFlag = 0