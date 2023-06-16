CREATE TABLE [dbo].[PPIIdentification](
	[PPIId] [int] IDENTITY(1,1) NOT NULL,
	[PPIDBID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[SourceSystemKey] [smallint] NOT NULL,
	[SourceSystemID] [varchar](25) NOT NULL,
	[CandidateKey] [bigint] NOT NULL,
	[PppIIdType] [nchar](10) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PPIId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PPIIdentification] ADD  DEFAULT ((0)) FOR [CurrentFlag]