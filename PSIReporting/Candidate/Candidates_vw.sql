﻿/****** Object:  View [Candidate].[Candidates_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Candidate].[Candidates_vw]
	AS SELECT 
	CandidateDBId,
	a.CandidateAltKey,
	try_cast(a.SourceCandidateKey as numeric) TestRegn_ID,
	a.FirstName,
	a.LastName,
	a.RegistrationDate,
	a.ExpirationDate,
	a.RegistrationTypeKey,
	a.StatusCode,
	e.CandidateIDType,
	a.sourceCandidatekey,
	case 
	when a.SchoolKey = 0 then 'No School Provided'
	else d.SchoolName
	end SchoolName,
	c.TestName,
	b.SourceSystemName
	FROM [$(PSI_DW)].Candidate.Candidates a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemKey = b.SourceSystemId  and
		a.currentflag = 0  join
	[$(PSI_DW)].Test.Tests c with (nolock) on
		a.TestKey = c.TestDBKey and
		c.currentflag = 0 left join
	[$(PSI_DW)].Account.AccountSchool d with (nolock) on
		a.SchoolKey = d.AccountSchoolDBId and
		d.CurrentFlag = 0 join
	[$(PSI_DW)].dbo.DimCandidateIDType e with (nolock)  on
		a.CandidateTypeKey = e.CandidateTypeId