CREATE VIEW [Tests].[TestKeys_vw]
as
select distinct b.AreaTitle Account, d.SummaryTestName TestName
from [$(PSIReporting)].dimensions.TestPackages_vw a join
[$(PSIReporting)].dimensions.areas_vw b on
	a.Areakey = b.areadbid
join
[$(PSIReporting)].dimensions.TestLists_vw c on
	a.TestPackageDBID = c.TestPackageKey 
join
tests.summarytestnames d on
	c.testkey = d.dimensionstestkey
