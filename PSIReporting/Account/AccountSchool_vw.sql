/****** Object:  View [Account].[AccountSchool_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Account].[AccountSchool_vw] as
select	
	a.AccountSchoolDBID,
	b.SourceSystemName,
	a.SourceAccountSchoolKey,
	c.AccountName,
	a.SchoolCode,
	a.SchoolName,
	a.Description 'Desc',
	a.City,
	a.state St,
	a.status
	FROM [$(PSI_DW)].Account.AccountSchool a with (nolock) join
	[$(PSI_DW)].dbo.SourceSystems b with (nolock) on
		a.sourcesystemkey = b.sourceSystemID join
	[$(PSI_DW)].Account.Accounts c with (nolock) on
		a.AccountKey = c.AccountDBID and
		c.CurrentFlag = 0
	where a.CurrentFlag = 0