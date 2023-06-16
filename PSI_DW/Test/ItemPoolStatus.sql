CREATE TABLE [Test].[ItemPoolStatus](
	[ItemPoolStatusId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourcSystemStatusKey] [varchar](20) NOT NULL,
	[StatusState] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemPoolStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]