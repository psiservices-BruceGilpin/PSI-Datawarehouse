CREATE TABLE [dbo].[DimLanguageMaster] (
    [LanguageMasterId]        INT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]         INT           NOT NULL,
    [SourceSystemLanguageKey] VARCHAR (20)  NOT NULL,
    [LanguageName]            VARCHAR (100) NOT NULL,
    [NativeName]              VARCHAR (100) NULL,
    [LanguageCode]            VARCHAR (20)  NULL,
    [IsDeleted]               BIT           DEFAULT ((0)) NOT NULL,
    [CreatedDate]             DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([LanguageMasterId] ASC)
);

