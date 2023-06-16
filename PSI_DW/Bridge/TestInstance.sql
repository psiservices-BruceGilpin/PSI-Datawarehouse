CREATE TABLE [Bridge].[TestInstance](
	[TestInstanceId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[TestKey] [int] NULL,
	[ExamSessionKey] [int] NOT NULL,
	[TestDate] [int] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LoadKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestInstanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]