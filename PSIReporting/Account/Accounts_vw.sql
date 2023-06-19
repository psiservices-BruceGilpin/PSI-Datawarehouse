/****** Object:  View [Account].[Accounts_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [Account].[Accounts_vw]
	
	
	AS SELECT 
	a.AccountDBID ,
	b.SourceSystemName,
	a.SourceAccountID,
	a.AccountName,
	c.RpassOrg,
	a.AccountType,
	a.Status,
	a.AccountPrefix,
	a.TerminationDate,
	a.PreviousStatus,
	a.IsDeleted,
	a.AliasName,
	a.ClientCode,
	a.GlobalAccountID
	FROM [$(PSI_DW)].Account.Accounts a with (nolock) join
	[$(PSI_DW)].dbo.SourceSystems b with (nolock) on
		a.SourceSystemKey = b.SourceSystemId left join
		[$(PSI_DW)].bridge.Organization c with (nolock) on
		a.BridgeOrganizationKey = c.OrganizationId
	Where a.CurrentFlag = 0