CREATE TABLE [Test].[Exhibit](
	[ExhibitId] [int] IDENTITY(1,1) NOT NULL,
	[ExhibitDBID] [int] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[ItemBankKey] [int] NOT NULL,
	[IsDefault] [bit] NULL,
	[DisplayWithItem] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CheckSum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExhibitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[Exhibit]  WITH CHECK ADD  CONSTRAINT [FK_Exhibit_ItemBank] FOREIGN KEY([ItemBankKey])
REFERENCES [Test].[ItemBank] ([ItemBankId])
GO

ALTER TABLE [Test].[Exhibit] CHECK CONSTRAINT [FK_Exhibit_ItemBank]
GO
ALTER TABLE [Test].[Exhibit] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [Test].[Exhibit] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_Exhibit_ExhibitDBID] ON [Test].[Exhibit]
(
	[ExhibitDBID] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Exhibit_ItemKey] ON [Test].[Exhibit]
(
	[ItemBankKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]