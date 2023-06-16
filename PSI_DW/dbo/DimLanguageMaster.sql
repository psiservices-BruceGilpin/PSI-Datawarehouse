CREATE TABLE [dbo].[DimLanguageMaster](
	[LanguageMasterId] [int] IDENTITY(1,1) NOT NULL,
	[SourceSystemKey] [int] NOT NULL,
	[SourceSystemLanguageKey] [varchar](20) NOT NULL,
	[LanguageName] [varchar](100) NOT NULL,
	[NativeName] [varchar](100) NULL,
	[LanguageCode] [varchar](20) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LanguageMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimLanguageMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DimLanguageMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]