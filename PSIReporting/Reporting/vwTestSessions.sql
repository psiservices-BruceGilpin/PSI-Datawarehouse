/****** Object:  View [Reporting].[vwTestSessions]    Script Date: 6/16/2023 1:44:54 PM ******/

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
		[$(PSI_DW)].Bridge.Organization a join
		[$(PSI_DW)].Bridge.TestSession b on
			a.RpassOrg = b.Account
	where Testdate is not null