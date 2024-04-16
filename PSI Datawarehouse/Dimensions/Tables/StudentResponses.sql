CREATE TABLE [Dimensions].[StudentResponses] (
    [StudentResponseId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [StudentItemKey]      BIGINT         NOT NULL,
    [NumericChoice]       SMALLINT       NULL,
    [StringChoice]        VARCHAR (5)    NULL,
    [ResponseIndex]       INT            NULL,
    [Points]              DECIMAL (6, 2) NULL,
    [StudentResponseDBID] BIGINT         NULL,
    [CurrentFlag]         BIT            DEFAULT ((0)) NOT NULL,
    [Checksum]            BIGINT         NULL,
    [LoadDate]            DATETIME       DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([StudentResponseId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_StudentResponses_CurrentFlag]
    ON [Dimensions].[StudentResponses]([CurrentFlag] ASC)
    INCLUDE([StudentResponsedbid], [StudentItemKey],[points],[ResponseIndex],[StringChoice]);


GO




CREATE INDEX [IX_StudentResponses_ResponseID] ON [Dimensions].[StudentResponses] ([StudentResponsedbid],[CurrentFlag])

GO

CREATE INDEX [IX_StudentResponses_StudentItemKey] ON [Dimensions].[StudentResponses] ([StudentItemKey], [CurrentFlag])
Include ([Points])
