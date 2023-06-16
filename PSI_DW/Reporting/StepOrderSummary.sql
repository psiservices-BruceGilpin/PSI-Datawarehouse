CREATE TABLE [Reporting].[StepOrderSummary](
	[SDSId] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](200) NULL,
	[StepOrder] [int] NOT NULL,
	[Total For Order Position] [int] NULL,
	[Less Than 1 Minute] [int] NOT NULL,
	[One to 5 minutes] [int] NOT NULL,
	[Five To 7.5 Minutes] [int] NOT NULL,
	[7.501 To 10 Minutes] [int] NOT NULL,
	[10.001 To 12.5 Minutes] [int] NOT NULL,
	[12.5001 to 15 Minutes] [int] NOT NULL,
	[15.001 to 17.5 Minutes] [int] NOT NULL,
	[17.501 to 20 Minutes] [int] NOT NULL,
	[Greater Than 20 Minutes] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SDSId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]