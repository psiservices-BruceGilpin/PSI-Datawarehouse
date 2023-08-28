CREATE TABLE [Dimensions].[Tests](
	[TestId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceTestID] [uniqueidentifier] NOT NULL,
	[TestDBId] [bigint] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[TestTitle] [varchar](50) NOT NULL,
	[TestDesc] [varchar](2000) NULL,
	[TestStatus] [tinyint] NOT NULL,
	[TestResultKey] [bigint] NULL,
	[TestBankKey] [bigint] NULL,
	[TestSim] [bit] NULL,
	[TotalPoints] [int] NULL,
	[TotalItems] [int] NULL,
	[TestRefx] [int] NULL,
	[TestRefy] [int] NULL,
	[TestRefh] [int] NULL,
	[TestRefw] [int] NULL,
	[TestState] [int] NOT NULL,
	[TestClass] [int] NOT NULL,
	[TestLocked] [int] NOT NULL,
	[TestVersnum] [int] NOT NULL,
	[CheckSum] [bigint] NULL,
	[LoadDate] [datetime] NOT NULL,
	[AreaKey] INT NULL, 
    PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Dimensions].[Tests] ADD  DEFAULT ((0)) FOR [CurrentFlag]
GO
ALTER TABLE [Dimensions].[Tests] ADD  DEFAULT (getdate()) FOR [LoadDate]
GO
CREATE NONCLUSTERED INDEX [IX_Tests_TestBankKey] ON [Dimensions].[Tests]
(
	[TestBankKey] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Tests_TestDBId] ON [Dimensions].[Tests]
(
	[TestDBId] ASC
)
WHERE ([CurrentFlag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Tests_TestResultKey] ON [Dimensions].[Tests]
(
	[TestResultKey] ASC
)
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Tests_TestTitle] ON [Dimensions].[Tests]
(
	[TestTitle] ASC
)
INCLUDE([TestDBId]) 
WHERE ([Currentflag]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]