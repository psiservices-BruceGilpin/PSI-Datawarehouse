CREATE TABLE [Test].[ItemStatus](
	[ItemStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ItemStatusCode] [varchar](10) NOT NULL,
	[ItemStatus] [varchar](25) NOT NULL,
	[SourceSystemKey] [tinyint] NOT NULL,
	[SourceStatusID] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]