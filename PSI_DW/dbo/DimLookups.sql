CREATE TABLE [dbo].[DimLookups](
	[LookupsId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourceLookupValue] [varchar](50) NOT NULL,
	[LookupName] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[CurrentFlag] [smallint] NULL,
 CONSTRAINT [PKLookupsId] PRIMARY KEY CLUSTERED 
(
	[LookupsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimLookups] ADD  CONSTRAINT [dfCreateDateLookups]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[DimLookups] ADD  CONSTRAINT [dfCurrentFlagLookups]  DEFAULT ((0)) FOR [CurrentFlag]
GO
CREATE NONCLUSTERED INDEX [IX_DimLookups_SourceLookupValue] ON [dbo].[DimLookups]
(
	[SourceLookupValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]