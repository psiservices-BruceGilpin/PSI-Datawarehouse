CREATE TABLE [Candidate].[DemographicTypes] (
    [DemoGraphicTypeId]   INT          IDENTITY (1, 1) NOT NULL,
    [Demographic]         VARCHAR (50) NOT NULL,
    [SourceAttributeID]   INT          NOT NULL,
    [CreateDate]          DATETIME     DEFAULT (getdate()) NOT NULL,
    [ClientKey]           INT          DEFAULT ((0)) NOT NULL,
    [DemographicTypeDBId] INT          NOT NULL,
    [CandidateColumnName] VARCHAR (40) NULL,
    PRIMARY KEY CLUSTERED ([DemoGraphicTypeId] ASC)
);

