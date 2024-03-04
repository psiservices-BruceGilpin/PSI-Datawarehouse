CREATE TABLE [Dimensions].[TestSegments] (
    [TestSegmentId]       BIGINT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]     SMALLINT         NOT NULL,
    [SourceTestSegmentID] UNIQUEIDENTIFIER NOT NULL,
    [TestSegmentDBID]     BIGINT           NOT NULL,
    [CurrentFlag]         BIT              DEFAULT ((0)) NOT NULL,
    [TestKey]             BIGINT           NOT NULL,
    [SegmentTitle]        VARCHAR (50)     NOT NULL,
    [SegmentSeq]          INT              NOT NULL,
    [SegmentCount]        INT              NOT NULL,
    [SegmentSection]      INT              NOT NULL,
    [SegmentType]         INT              NOT NULL,
    [BankObjectivesKey]   BIGINT           NULL,
    [CheckSum]            BIGINT           NOT NULL,
    [LoadDate]            DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([TestSegmentId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TestSegments_SegmentTitle]
    ON [Dimensions].[TestSegments]([SegmentTitle] ASC)
    INCLUDE([TestSegmentDBID]) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_TestSegments_TestKey]
    ON [Dimensions].[TestSegments]([TestKey] ASC) WHERE ([Currentflag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_TestSegments_TestSegmentDBID]
    ON [Dimensions].[TestSegments]([TestSegmentDBID] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IXTestSegmentsSourceTestSegmentID]
    ON [Dimensions].[TestSegments]([SourceTestSegmentID] ASC)
    INCLUDE([TestSegmentDBID], [CurrentFlag], [LoadDate]);


GO

CREATE INDEX [IX_TestSegments_currentflag] ON [Dimensions].[TestSegments] ([CurrentFlag])
include ([TestSegmentdbid],[TestKey], [SegmentCount])
