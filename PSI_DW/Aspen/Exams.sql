CREATE TABLE [Aspen].[Exams](
	[ExamId] [int] IDENTITY(1,1) NOT NULL,
	[ExamDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ExamCode] [varchar](12) NOT NULL,
	[ClientCode] [varchar](10) NOT NULL,
	[BufferDays] [int] NULL,
	[RefBooks] [char](1) NULL,
	[DefaultDeliveryMethod] [varchar](10) NULL,
	[ExamCategory] [varchar](12) NULL,
	[RequireSchool] [char](1) NULL,
	[PortionsPerSession] [int] NULL,
	[SuAvail] [char](1) NULL,
	[PortionsPerApp] [char](1) NULL,
	[RetakeBuffer] [int] NULL,
	[FuAvail] [char](1) NULL,
	[TuAvail] [char](1) NULL,
	[WeAvail] [char](1) NULL,
	[ThAvail] [char](1) NULL,
	[MoAvail] [char](1) NULL,
	[FingerPrint] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Aspen].[Exams] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_Exams_CurrentFlag] ON [Aspen].[Exams]
(
	[CurrentFlag] ASC
)
INCLUDE([ExamDBID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]