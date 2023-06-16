CREATE TABLE [Dimensions].[ExamPortions](
	[ExamPortionId] [int] IDENTITY(1,1) NOT NULL,
	[ExamPortionDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Code] [varchar](16) NOT NULL,
	[Description] [varchar](256) NOT NULL,
	[CalculatorEn] [bit] NOT NULL,
	[RefEn] [bit] NOT NULL,
	[LOFTEn] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamPortionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[ExamPortions] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[ExamPortions] ADD  DEFAULT (getdate()) FOR [CreateDate]