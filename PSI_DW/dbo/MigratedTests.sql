CREATE TABLE [dbo].[MigratedTests](
	[MigrationId] [int] IDENTITY(1,1) NOT NULL,
	[AccountKey] [int] NOT NULL,
	[AccountName] [varchar](100) NOT NULL,
	[TestKey] [int] NOT NULL,
	[TestName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]