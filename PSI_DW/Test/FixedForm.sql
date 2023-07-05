CREATE TABLE [Test].[FixedForm](
	[FixedFormId] [int] IDENTITY(1,1) NOT NULL,
	[FixedFormDBID] [int] NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourceFixedFormID] [varchar](20) NOT NULL,
	[PortionKey] [int] NOT NULL,
	[FormName] [varchar](50) NOT NULL,
	[StatusKey] [int] NOT NULL,
	[PassingScore] [decimal](10, 6) NULL,
	[DateGenerated] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[Checksum] [int] NULL,
	[FixedFormNmDBD] [int] NULL,
	[ItemCount] INT NULL, 
    PRIMARY KEY CLUSTERED 
(
	[FixedFormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[FixedForm] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [Test].[FixedForm] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_FixedForm_FixedFormDBID] ON [Test].[FixedForm]
(
	[FixedFormDBID] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FixedForm_PortionKey] ON [Test].[FixedForm]
(
	[PortionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]