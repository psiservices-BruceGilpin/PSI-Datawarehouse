CREATE TABLE [Staging].[stagingdossier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[other_given_name] [nvarchar](92) NULL,
	[family_name] [nvarchar](94) NULL,
	[candidate_email] [nvarchar](255) NULL,
	[dossier_id] [nvarchar](72) NULL,
	[proctored_exam_id] [nvarchar](104) NULL,
	[proctor_request_id] [nvarchar](96) NULL,
	[exam_config] [nvarchar](144) NULL,
	[org_candidate] [nvarchar](68) NULL,
	[exam_state_service_id] [nvarchar](104) NULL,
	[requestorcandidateid] [nvarchar](255) NULL,
	[requestorexamid] [nvarchar](255) NULL,
	[CheckSum] [bigint] NULL,
	[Rundate] [date] NOT NULL,
	[RunId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_stagingdossier_Dossier] ON [Staging].[stagingdossier]
(
	[dossier_id] ASC,
	[proctored_exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]