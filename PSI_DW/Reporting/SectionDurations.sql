CREATE TABLE [Reporting].[SectionDurations](
	[DurationIDId] [bigint] IDENTITY(1,1) NOT NULL,
	[DurationDefKey] [int] NOT NULL,
	[TestSessionKey] [bigint] NOT NULL,
	[DurationType] [smallint] NOT NULL,
	[StartStep] [int] NOT NULL,
	[EndStep] [int] NOT NULL,
	[Duration] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[DurationIDId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Reporting].[SectionDurations]  WITH CHECK ADD  CONSTRAINT [FK_Reporting_TestSession1] FOREIGN KEY([TestSessionKey])
REFERENCES [Bridge].[TestSession] ([TestSessionId])
GO

ALTER TABLE [Reporting].[SectionDurations] CHECK CONSTRAINT [FK_Reporting_TestSession1]
GO
CREATE NONCLUSTERED INDEX [IX_SectionDurations_TestSessionKey2] ON [Reporting].[SectionDurations]
(
	[TestSessionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]