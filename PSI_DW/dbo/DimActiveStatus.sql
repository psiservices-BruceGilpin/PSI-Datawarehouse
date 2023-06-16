CREATE TABLE [dbo].[DimActiveStatus](
	[ActiveStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ActiveStatusCode] [varchar](25) NOT NULL,
	[ActiveStatusSTate] [varchar](35) NOT NULL,
	[SourceSystemID] [tinyint] NOT NULL,
	[SourceStatusKey] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActiveStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]