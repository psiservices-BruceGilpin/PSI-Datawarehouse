﻿CREATE VIEW [Reporting].[vwTestsByAccountWeek]
as	select
a.Account,
b.testname,
datepart(year,a.testdate) TestYear,
datepart(week,a.testdate) testweek,
count(*) teststaken
from
Reporting.vwTestSessions_NoNotes a join
test.tests b on
	a.testkey = b.testid
group by a.Account, b.TestName,datepart(year,a.testdate), datepart(week,a.testdate)