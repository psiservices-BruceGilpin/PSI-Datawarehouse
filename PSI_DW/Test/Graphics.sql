CREATE TABLE [Test].[Graphics](
	[GraphisId] [int] IDENTITY(1,1) NOT NULL,
	[GraphicsDBID] [int] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[AccountKey] [int] NOT NULL,
	[FileExtension] [varchar](10) NULL,
	[FileName] [varchar](100) NULL,
	[ExhibitName] [varchar](100) NULL,
	[ExhibitTypeKey] [int] NOT NULL,
	[ExhibitCategoryKey] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[Checksum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GraphisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[Graphics] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [Test].[Graphics] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_Graphics_GraphicsDBKey] ON [Test].[Graphics]
(
	[GraphicsDBID] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]