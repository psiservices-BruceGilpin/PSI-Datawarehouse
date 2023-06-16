CREATE TABLE [Aspen].[ExamPortions](
	[ExamPortionId] [int] IDENTITY(1,1) NOT NULL,
	[ExamPortionDBId] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SouceSystemId] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[PortionName] [varchar](75) NULL,
	[ExamLength] [decimal](5, 2) NULL,
	[BeginEffectiveDt] [date] NULL,
	[EndEffectiveDt] [date] NULL,
	[ComboExam] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamPortionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Aspen].[ExamPortions] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Aspen].[ExamPortions] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
CREATE NONCLUSTERED INDEX [IX_ExamPortions_CurrentFlag] ON [Aspen].[ExamPortions]
(
	[CurrentFlag] ASC
)
INCLUDE([ExamPortionDBId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]