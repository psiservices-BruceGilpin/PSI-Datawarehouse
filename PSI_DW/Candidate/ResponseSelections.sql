CREATE TABLE [Candidate].[ResponseSelections](
	[ResponseSelectionId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceTestAssignmentID] [varchar](25) NOT NULL,
	[CandidateResponseKey] [bigint] NOT NULL,
	[ItemBankKey] [bigint] NOT NULL,
	[ItemOptionKey] [bigint] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[PartitionValue] [int] NULL,
	[CheckSum] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ResponseSelectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ResponseSelections_AssignmentPortion] ON [Candidate].[ResponseSelections]
(
	[CandidateResponseKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ResponseSelections_ItemBank] ON [Candidate].[ResponseSelections]
(
	[ItemBankKey] ASC
)
INCLUDE([ItemOptionKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ResponseSelections_ItemOptionKey] ON [Candidate].[ResponseSelections]
(
	[ItemOptionKey] ASC
)
INCLUDE([ItemBankKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]