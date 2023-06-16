CREATE TABLE [dbo].[DimTestStatus](
	[TestStatusId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[TestStatus] [varchar](20) NOT NULL,
	[TestStatusDescription] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TestStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]