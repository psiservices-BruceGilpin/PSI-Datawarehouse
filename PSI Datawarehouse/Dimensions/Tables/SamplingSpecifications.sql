CREATE TABLE [Dimensions].[SamplingSpecifications] (
    [SamplingSpecId]   INT           IDENTITY (1, 1) NOT NULL,
    [SamplingSpecDBId] INT           NOT NULL,
    [CurrentFlag]      BIT           DEFAULT ((0)) NOT NULL,
    [SourceSystemKey]  SMALLINT      NOT NULL,
    [SourceSystemID]   VARCHAR (20)  NOT NULL,
    [CreateDate]       DATETIME      DEFAULT (getdate()) NOT NULL,
    [ResultKey]        INT           NULL,
    [BankKey]          INT           NOT NULL,
    [Topic]            VARCHAR (128) NULL,
    [SpecDescription]  VARCHAR (512) NULL,
    PRIMARY KEY CLUSTERED ([SamplingSpecId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_SamplingSpecifications_CurrentFlag]
    ON [Dimensions].[SamplingSpecifications]([CurrentFlag] ASC)
    INCLUDE([SamplingSpecDBId]);

