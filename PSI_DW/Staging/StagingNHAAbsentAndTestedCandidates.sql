﻿CREATE TABLE [Staging].[StagingNHAAbsentAndTestedCandidates](
	[BookingCode] [varchar](20) NULL,
	[TestedStatus] [varchar](70) NULL,
	[TestDate] [varchar](30) NULL,
	[TestName] [varchar](100) NULL,
	[TestCenterName] [varchar](100) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](30) NULL,
	[Country] [varchar](100) NULL,
	[RunID] [int] NULL,
	[RunDate] [datetime] NULL,
	[CheckSum] [int] NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [CX_StagingNHAAbsentAndTestedCandidates] ON [Staging].[StagingNHAAbsentAndTestedCandidates]
(
	[BookingCode] ASC,
	[TestDate] ASC,
	[TestName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]