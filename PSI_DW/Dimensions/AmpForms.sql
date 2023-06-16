CREATE TABLE [Dimensions].[AmpForms](
	[AmpFormsId] [int] IDENTITY(1,1) NOT NULL,
	[AmpFormsDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[FormPortionKey] [int] NOT NULL,
	[FormName] [varchar](100) NOT NULL,
	[Rawcut] [int] NULL,
	[ScaleCut] [int] NULL,
	[TimeLimit] [int] NULL,
	[FormAdminType] [varchar](4) NULL,
	[EffectiveFromDate] [datetime] NULL,
	[EffectiveToDate] [datetime] NULL,
	[ProvisionalFromDate] [datetime] NULL,
	[ProvisionalToDate] [datetime] NULL,
	[ScrambleOptions] [char](1) NULL,
	[ScrambleQuestions] [char](1) NULL,
	[Culture] [varchar](50) NULL,
	[Rawcut2] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AmpFormsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[AmpForms] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[AmpForms] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
CREATE NONCLUSTERED INDEX [IX_AmpForms_AmpFormsDBID] ON [Dimensions].[AmpForms]
(
	[AmpFormsDBID] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AmpForms_CurrentFlag] ON [Dimensions].[AmpForms]
(
	[CurrentFlag] ASC
)
INCLUDE([AmpFormsDBID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AmpForms_FormName] ON [Dimensions].[AmpForms]
(
	[FormName] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AmpForms_PortionKey] ON [Dimensions].[AmpForms]
(
	[FormPortionKey] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]