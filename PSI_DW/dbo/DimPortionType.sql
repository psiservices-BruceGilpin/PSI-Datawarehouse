CREATE TABLE [dbo].[DimPortionType](
	[PortionIDId] [smallint] IDENTITY(1,1) NOT NULL,
	[PortionTypeID] [varchar](8) NOT NULL,
	[PortionName] [varchar](20) NOT NULL,
	[PortionDescription] [nchar](10) NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourcePortionType] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PortionIDId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]