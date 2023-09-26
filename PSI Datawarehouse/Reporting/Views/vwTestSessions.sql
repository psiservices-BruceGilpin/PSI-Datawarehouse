CREATE VIEW [Reporting].[vwTestSessions]
	AS 
	Select
		a.OrgFriendlyName 'Account',
		b.Account 'RPaas Code',
		b.DossierKey 'Dossier Key',
		b.SessionKey 'Session Key',
		b.Testdate 'Test Date',
		b.TestSessionID
	from
		Bridge.Organization a join
		Bridge.TestSession b on
			a.RpassOrg = b.Account
	where Testdate is not null