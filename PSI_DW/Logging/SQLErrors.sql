CREATE TABLE [Logging].[SQLErrors](
	[ErrorId] [int] IDENTITY(1,1) NOT NULL,
	[ErrorLIne] [int] NULL,
	[ErrorMessage] [nvarchar](4000) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorProcedure] [nvarchar](128) NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorDateTime] [datetime] NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_SQLErrors_AsofDate] ON [Logging].[SQLErrors]
(
	[ErrorDateTime] DESC,
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]