CREATE TABLE [Test].[Enumeration](
	[EnumerationId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[EnumType] [int] NOT NULL,
	[EnumDescription] [varchar](70) NULL,
	[EnumName] [varchar](100) NULL,
	[EnumerationDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EnumerationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Test].[Enumeration] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Test].[Enumeration] ADD  DEFAULT (getdate()) FOR [CreateDate]