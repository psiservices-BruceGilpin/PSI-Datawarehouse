CREATE TABLE [Dimensions].[ScoreReportConfig](
	[ScoreConfigId] [int] IDENTITY(1,1) NOT NULL,
	[ScoreConfigDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[FormKey] [int] NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Class] [varchar](100) NOT NULL,
	[ReportPath] [varchar](1000) NULL,
	[PublishDate] [datetime] NOT NULL,
	[Provisional] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScoreConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[ScoreReportConfig] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[ScoreReportConfig] ADD  DEFAULT (getdate()) FOR [CreateDate]