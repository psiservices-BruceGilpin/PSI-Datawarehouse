CREATE TABLE [Staging].[StagingTestSessionNotes](
	[StepID] [bigint] NOT NULL,
	[NoteType] [varchar](50) NOT NULL,
	[NoteText] [varchar](1000) NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_StagingTestSessionNotes] ON [Staging].[StagingTestSessionNotes]
(
	[StepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]