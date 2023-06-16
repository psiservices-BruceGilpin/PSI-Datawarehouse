CREATE TABLE [Aspen].[Clients](
	[AspenClientId] [int] IDENTITY(1,1) NOT NULL,
	[AspenClientDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](20) NOT NULL,
	[ClientName] [varchar](200) NOT NULL,
	[ClientNumber] [varchar](2) NULL,
	[ExamWaitFlag] [bit] NULL,
	[ExamWaitDays] [smallint] NULL,
	[EnforceExamOrder] [bit] NULL,
	[Category] [varchar](30) NULL,
	[GlobalAccountID] [varchar](10) NULL,
	[AffiliationGUID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[AspenClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Aspen].[Clients] ADD  DEFAULT ((0)) FOR [CurrentFlag]