CREATE TABLE [Candidate].[Demographics] (
    [DemographicId]      INT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]    INT           NOT NULL,
    [CreateDate]         DATETIME      DEFAULT (getdate()) NOT NULL,
    [DemographicTypeKey] SMALLINT      NOT NULL,
    [DemographicValue]   VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([DemographicId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Demographics_DemographicValue]
    ON [Candidate].[Demographics]([DemographicValue] ASC);

