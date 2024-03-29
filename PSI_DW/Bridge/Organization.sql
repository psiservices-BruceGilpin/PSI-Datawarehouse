﻿CREATE TABLE [Bridge].[Organization](
	[OrganizationId] [int] IDENTITY(1,1) NOT NULL,
	[OrgFriendlyName] [varchar](266) NOT NULL,
	[RpassOrg] [varchar](50) NOT NULL,
	[Rundate] [datetime] NOT NULL,
	[RunID] [int] NOT NULL,
 CONSTRAINT [PKOrganizationId] PRIMARY KEY CLUSTERED 
(
	[OrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Organization_RpassOrg] ON [Bridge].[Organization]
(
	[RpassOrg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]