CREATE TABLE [Bridge].[TestSessionNotes](
	[TestInstanceNoteId] [bigint] IDENTITY(1,1) NOT NULL,
	[TestSessionStepKey] [bigint] NOT NULL,
	[NoteType] [varchar](50) NOT NULL,
	[NoteText] [varchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestInstanceNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Bridge].[TestSessionNotes]  WITH CHECK ADD  CONSTRAINT [FK_TestInstanceNotes_ToTestInstance] FOREIGN KEY([TestSessionStepKey])
REFERENCES [Bridge].[TestSessionStep] ([TestSessionStepId])
GO

ALTER TABLE [Bridge].[TestSessionNotes] CHECK CONSTRAINT [FK_TestInstanceNotes_ToTestInstance]
GO
CREATE NONCLUSTERED INDEX [IX_TestInstanceNotes_TestIntanceKey] ON [Bridge].[TestSessionNotes]
(
	[TestSessionStepKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]