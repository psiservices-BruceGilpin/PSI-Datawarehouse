CREATE VIEW [dbo].[SummaryTestNames_vw]
	AS 
	select
 a.SummaryTestName 'Summary Test Name'
 , a.Crossrefkey 'Cross Reference Key'
 , a.AccountCode 'Dimensions Account Code'
 , b.TestDbID 'DW Test Key'
 , b.TestTitle 'Dimensions Test Name'
 , b.TestDesc 'Dimensions Test Description'
from
tests.SummaryTestNames a
join
[$(PSIReporting)].Dimensions.Tests_vw b on
a.dimensionstestkey = b.testdbid
