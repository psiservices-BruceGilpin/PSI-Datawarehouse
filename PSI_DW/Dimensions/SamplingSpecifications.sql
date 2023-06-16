CREATE TABLE [Dimensions].[SamplingSpecifications](
	[SamplingSpecId] [int] IDENTITY(1,1) NOT NULL,
	[SamplingSpecDBId] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ResultKey] [int] NULL,
	[BankKey] [int] NOT NULL,
	[Topic] [varchar](128) NULL,
	[SpecDescription] [varchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[SamplingSpecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[SamplingSpecifications] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[SamplingSpecifications] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
CREATE NONCLUSTERED INDEX [IX_SamplingSpecifications_CurrentFlag] ON [Dimensions].[SamplingSpecifications]
(
	[CurrentFlag] ASC
)
INCLUDE([SamplingSpecDBId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]