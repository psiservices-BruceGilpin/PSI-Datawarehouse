CREATE TABLE [Bridge].[MajorIncidentReason](
	[MajorIncidentReasonId] [int] IDENTITY(1,1) NOT NULL,
	[SystemSourceKey] [varchar](50) NOT NULL,
	[Reason] [varchar](1000) NOT NULL,
	[Type] [varchar](22) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MajorIncidentReasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]