CREATE TABLE [Test].[CastedForm] (
    [CastedFormId]       BIGINT       IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]    SMALLINT     NOT NULL,
    [SourceCastedFormID] VARCHAR (20) NOT NULL,
    [PortionKey]         INT          NOT NULL,
    [TestCenterKey]      INT          NOT NULL,
    [CastingType]        INT          NULL,
    [CastingTrials]      INT          NULL,
    [TestingDate]        DATETIME     NULL,
    [Status]             TINYINT      NULL,
    [CastedOn]           NCHAR (10)   NULL,
    [PartitionValue]     INT          NOT NULL,
    [CastedFormDBID]     BIGINT       NULL,
    CONSTRAINT [PK_CastedForm] PRIMARY KEY CLUSTERED ([PartitionValue] ASC, [CastedFormId] ASC) ON [CastedForm] ([PartitionValue])
) ON [CastedForm] ([PartitionValue]);


GO
CREATE NONCLUSTERED INDEX [IX_CastedForm_PortionID]
    ON [Test].[CastedForm]([PortionKey] ASC)
    ON [CastedForm] ([PartitionValue]);


GO
CREATE NONCLUSTERED INDEX [IX_CastedForm_TestCenter]
    ON [Test].[CastedForm]([TestCenterKey] ASC)
    ON [CastedForm] ([PartitionValue]);

