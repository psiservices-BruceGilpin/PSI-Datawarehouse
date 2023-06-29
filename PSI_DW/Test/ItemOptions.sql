CREATE TABLE [Test].[ItemOptions](
	[ItemOptionId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemItemOptionsKey] [varchar](20) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[ItemKey] [int] NOT NULL,
	[OptionOrder] [tinyint] NOT NULL,
	[OptionText] [varchar](5000) NOT NULL,
	[Weightage] [decimal](10, 6) NOT NULL,
	[CheckSum] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Currentflag] [bit] NOT NULL,
	[ItemOptionsDBID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemOptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[ItemOptions]  WITH CHECK ADD  CONSTRAINT [FK_ItemOptions_ItemBank] FOREIGN KEY([ItemKey])
REFERENCES [Test].[ItemBank] ([ItemBankId])
GO

ALTER TABLE [Test].[ItemOptions] CHECK CONSTRAINT [FK_ItemOptions_ItemBank]
GO
ALTER TABLE [Test].[ItemOptions] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [Test].[ItemOptions] ADD  DEFAULT ((0)) FOR [Currentflag]
GO
CREATE NONCLUSTERED INDEX [IX_ItemOptions_ItemKey] ON [Test].[ItemOptions]
(
	[ItemKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemOptions_ItemOptionsDBID] ON [Test].[ItemOptions]
(
	[ItemOptionsDBID] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ItemOptions_SourceSystemItemOptionsKey] ON [Test].[ItemOptions]
(
	[SourceSystemItemOptionsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE INDEX [IX_ItemOptions_CurrentFlag] ON [Test].[ItemOptions] ([CurrentFlag],[Weightage])
