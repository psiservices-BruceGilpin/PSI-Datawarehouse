CREATE VIEW [Candidate].[candidatesWithDemographics_vw]
	AS SELECT 

  a.candidatedbid, 
  a.TestRegn_ID, 
  a.Birthdate,
  b.DemographicValue 'Gender Code', 
  c.DemographicValue 'Race Code', 
  d.DemographicValue 'Age Range', 
  e.DemographicValue 'Education', 
  f.DemographicValue 'Language', 
  g.DemographicValue 'Ethnicity' 
from 
  (
    select 
      a.candidatedbid, 
      try_cast(a.SourceCandidateKey as numeric) TestRegn_ID,
      a.Birthdate
    from 
     [$(PSI_DW)].Candidate.Candidates a 
    where 
      (a.GenderCode is not null 
      or a.LanguageCode is not null 
      or a.RaceCode is not null 
      or a.EthnicityCode is not null 
      or a.EducationCode is not null 
      or a.AgeRangeCode is not null )
      and a.CurrentFlag = 0
  ) a 
  left join -- Gender
  (
    select 
      a.CandidateDBId, 
      a.FirstName, 
      a.LastName, 
      b.DemographicValue, 
      b.DemographicTypeKey, 
      c.Demographic 
    from 
      [$(PSI_DW)].Candidate.Candidates a 
      join [$(PSI_DW)].Candidate.demographics b on a.GenderCode = b.demographicid 
      join [$(PSI_DW)].Candidate.DemographicTypes c on b.DemographicTypeKey = c.SourceAttributeID 
    where 
      c.Demographic = 'Gender' 
      and DemographicValue not like '%I decline%' 
      and DemographicValue not like '%I prefer%' 
      and DemographicValue != 'UNSPECIFIED'
      and a.CurrentFlag = 0
  ) b on a.CandidateDBId = b.CandidateDBId 
  Left join -- Race
  (
    select 
      a.CandidateDBId, 
      a.FirstName, 
      a.LastName, 
      b.DemographicValue, 
      b.DemographicTypeKey, 
      c.Demographic 
    from 
      [$(PSI_DW)].Candidate.Candidates a 
      join [$(PSI_DW)].Candidate.demographics b on a.racecode = b.demographicid 
      join [$(PSI_DW)].Candidate.DemographicTypes c on b.DemographicTypeKey = c.SourceAttributeID 
    where 
      c.Demographic = 'race' 
      and DemographicValue not like '%I decline%' 
      and DemographicValue not like '%I prefer%' 
      and DemographicValue != 'UNSPECIFIED'
      and a.currentflag = 0
  ) c on a.CandidateDBId = c.CandidateDBId 
  Left Join -- Age Range
  (
    select 
      a.CandidateDBId, 
      a.FirstName, 
      a.LastName, 
      b.DemographicValue, 
      b.DemographicTypeKey, 
      c.Demographic 
    from 
      [$(PSI_DW)].Candidate.Candidates a 
      join [$(PSI_DW)].Candidate.demographics b on a.AgeRangeCode = b.demographicid 
      join [$(PSI_DW)].Candidate.DemographicTypes c on b.DemographicTypeKey = c.SourceAttributeID 
    where 
      c.Demographic = 'age' 
      and DemographicValue not like '%I decline%' 
      and DemographicValue not like '%I prefer%' 
      and DemographicValue != 'UNSPECIFIED'
      and a.CurrentFlag = 0
  ) d on a.CandidateDBId = d.candidateDBID 
  Left Join -- Education
  (
    select 
      a.CandidateDBId, 
      a.FirstName, 
      a.LastName, 
      b.DemographicValue, 
      b.DemographicTypeKey, 
      c.Demographic 
    from 
      [$(PSI_DW)].Candidate.Candidates a 
      join [$(PSI_DW)].Candidate.demographics b on a.educationcode = b.demographicid 
      join [$(PSI_DW)].Candidate.DemographicTypes c on b.DemographicTypeKey = c.SourceAttributeID 
    where 
      c.Demographic = 'Education' 
      and DemographicValue not like '%I decline%' 
      and DemographicValue not like '%I prefer%' 
      and DemographicValue != 'UNSPECIFIED'
      and a.CurrentFlag = 0
  ) e on a.CandidateDBId = e.CandidateDBId 
  Left Join -- Language
  (
    select 
      a.CandidateDBId, 
      a.FirstName, 
      a.LastName, 
      b.DemographicValue, 
      b.DemographicTypeKey, 
      c.Demographic 
    from 
      [$(PSI_DW)].Candidate.Candidates a 
      join [$(PSI_DW)].Candidate.demographics b on a.languagecode = b.demographicid 
      join [$(PSI_DW)].Candidate.DemographicTypes c on b.DemographicTypeKey = c.SourceAttributeID 
    where 
      c.Demographic = 'language' 
      and DemographicValue not like '%I decline%' 
      and DemographicValue not like '%I prefer%' 
      and DemographicValue != 'UNSPECIFIED'
      and a.CurrentFlag = 0
  ) f on a.CandidateDBId = f.CandidateDBId 
  Left Join -- Ethnicity
  (
    select 
      a.CandidateDBId, 
      a.FirstName, 
      a.LastName, 
      b.DemographicValue, 
      b.DemographicTypeKey, 
      c.Demographic 
    from 
      [$(PSI_DW)].Candidate.Candidates a 
      join [$(PSI_DW)].Candidate.demographics b on a.ethnicitycode = b.demographicid 
      join [$(PSI_DW)].Candidate.DemographicTypes c on b.DemographicTypeKey = c.SourceAttributeID 
    where 
      c.Demographic = 'ethnicity' 
      and DemographicValue not like '%I decline%' 
      and DemographicValue not like '%I prefer%' 
      and DemographicValue != 'UNSPECIFIED'
      and a.CurrentFlag = 0
  ) g on a.CandidateDBId = g.CandidateDBId
