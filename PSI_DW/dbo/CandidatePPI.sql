﻿CREATE TABLE [dbo].[CandidatePPI](
	[PPIID] [bigint] IDENTITY(1,1) NOT NULL,
	[CandidateKey] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CandidateTypeKey] [smallint] NOT NULL,
	[DwSourceTable] [varchar](50) NOT NULL,
	[IdentityValue] [varchar](256) NULL,
	[CreateDate] [datetime] NOT NULL,
	[PPIDbId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PPIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CandidatePPI] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [dbo].[CandidatePPI] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
CREATE NONCLUSTERED INDEX [IX_CandidateIDXref_DWSourceCandidateKey] ON [dbo].[CandidatePPI]
(
	[IdentityValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CandidatePPI_CurrentFlag] ON [dbo].[CandidatePPI]
(
	[CurrentFlag] ASC
)
INCLUDE([PPIDbId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE INDEX [IX_CandidatePPI_CandidateTypeKey] ON  [dbo].[CandidatePPI] ([CandidateKey])
INCLUDE ([CandidateTypeKey],[IdentityValue])
