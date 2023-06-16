CREATE TABLE [QATesting].[PassRates](
	[TestAssignment_ID] [int] NOT NULL,
	[Portion_ID] [int] NOT NULL,
	[scaled_score] [decimal](10, 6) NULL,
	[raw_score] [decimal](10, 6) NULL,
	[Portion_Name] [varchar](100) NOT NULL,
	[Date] [datetime2](3) NULL,
	[result] [varchar](20) NULL
) ON [PRIMARY]