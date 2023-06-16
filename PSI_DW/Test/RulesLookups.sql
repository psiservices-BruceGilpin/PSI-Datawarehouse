CREATE TABLE [Test].[RulesLookups](
	[RuleLookUpId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[KeyGroup] [varchar](50) NOT NULL,
	[KeyValue] [varchar](10) NOT NULL,
	[KeyDescription] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RuleLookUpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]