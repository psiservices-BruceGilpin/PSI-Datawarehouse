﻿CREATE TABLE [Bridge].[ProctorSupportXref](
	[ProctorSupportXrefId] [bigint] IDENTITY(1,1) NOT NULL,
	[TestSessionKey] [bigint] NOT NULL,
	[ProctorKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProctorSupportXrefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ProctorSupportXref_ProctorKey] ON [Bridge].[ProctorSupportXref]
(
	[ProctorKey] ASC
)
INCLUDE([TestSessionKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ProctorSupportXref_SessionStep] ON [Bridge].[ProctorSupportXref]
(
	[TestSessionKey] ASC
)
INCLUDE([ProctorKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]