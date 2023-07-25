CREATE VIEW [Candidate].[Demographics_vw]
	AS 
	select 
  a.candidatedbid, 
  a.TestRegn_ID, 
  a.birthdate,
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
      a.TestRegn_ID,
	  a.birthdate
    from 
      Candidate.Candidates_VW a 
    where 
      a.GenderCode is not null 
      and a.LanguageCode is not null 
      and a.RaceCode is not null 
      and a.EthnicityCode is not null 
      and a.EducationCode is not null 
      and a.AgeRangeCode is not null
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
      Candidate.Candidates_VW a 
      join  [$(PSI_DW)].Candidate.demographics b on a.GenderCode = b.demographicid 
      join  [$(PSI_DW)].Candidate.DemographicTypes c on b.DemographicTypeKey = c.SourceAttributeID 
    where 
      c.Demographic = 'Gender' 
      and DemographicValue not like '%I decline%' 
      and DemographicValue not like '%I prefer%' 
      and DemographicValue != 'UNSPECIFIED'
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
      Candidate.Candidates_VW a 
      join  [$(PSI_DW)].Candidate.demographics b on a.racecode = b.demographicid 
      join  [$(PSI_DW)].Candidate.DemographicTypes c on b.DemographicTypeKey = c.SourceAttributeID 
    where 
      c.Demographic = 'race' 
      and DemographicValue not like '%I decline%' 
      and DemographicValue not like '%I prefer%' 
      and DemographicValue != 'UNSPECIFIED'
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
      Candidate.Candidates_VW a 
      join  [$(PSI_DW)].Candidate.demographics b on a.AgeRangeCode = b.demographicid 
      join  [$(PSI_DW)].Candidate.DemographicTypes c on b.DemographicTypeKey = c.SourceAttributeID 
    where 
      c.Demographic = 'age' 
      and DemographicValue not like '%I decline%' 
      and DemographicValue not like '%I prefer%' 
      and DemographicValue != 'UNSPECIFIED'
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
      join  [$(PSI_DW)].Candidate.demographics b on a.educationcode = b.demographicid 
      join  [$(PSI_DW)].Candidate.DemographicTypes c on b.DemographicTypeKey = c.SourceAttributeID 
    where 
      c.Demographic = 'Education' 
      and DemographicValue not like '%I decline%' 
      and DemographicValue not like '%I prefer%' 
      and DemographicValue != 'UNSPECIFIED'
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
      join  [$(PSI_DW)].Candidate.demographics b on a.languagecode = b.demographicid 
      join  [$(PSI_DW)].Candidate.DemographicTypes c on b.DemographicTypeKey = c.SourceAttributeID 
    where 
      c.Demographic = 'language' 
      and DemographicValue not like '%I decline%' 
      and DemographicValue not like '%I prefer%' 
      and DemographicValue != 'UNSPECIFIED'
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
      join  [$(PSI_DW)].Candidate.demographics b on a.ethnicitycode = b.demographicid 
      join  [$(PSI_DW)].Candidate.DemographicTypes c on b.DemographicTypeKey = c.SourceAttributeID 
    where 
      c.Demographic = 'ethnicity' 
      and DemographicValue not like '%I decline%' 
      and DemographicValue not like '%I prefer%' 
      and DemographicValue != 'UNSPECIFIED'
  ) g on a.CandidateDBId = g.CandidateDBId
