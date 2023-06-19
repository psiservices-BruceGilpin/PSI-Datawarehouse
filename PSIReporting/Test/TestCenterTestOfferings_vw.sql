/****** Object:  View [Test].[TestCenterTestOfferings_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Test].[TestCenterTestOfferings_vw]
	AS 

Select 
	a.TestCenterName,
	a.City,
	c.testName,
	a.TestCenterDBID,
	c.TestDBKey TestDBID
From
	[$(PSI_DW)].Test.TestCenter a with (nolock) join
	[$(PSI_DW)].Test.TestCenterTestXref b with (nolock) on
		a.TestCenterDBID = b.TestCenterKey join
	[$(PSI_DW)].Test.Tests c with (nolock) on
		b.TestKey = c.TestDBKey