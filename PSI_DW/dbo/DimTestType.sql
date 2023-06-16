CREATE TABLE [dbo].[DimTestType](
	[TestTypeId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [tinyint] NOT NULL,
	[TestType] [varchar](20) NOT NULL,
	[TestTypeDescription] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TestTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]