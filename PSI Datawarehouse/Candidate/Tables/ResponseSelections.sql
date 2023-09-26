CREATE TABLE [Candidate].[ResponseSelections] (
    [ResponseSelectionId]    INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]        SMALLINT     NOT NULL,
    [SourceTestAssignmentID] VARCHAR (25) NOT NULL,
    [CandidateResponseKey]   BIGINT       NOT NULL,
    [ItemBankKey]            BIGINT       NOT NULL,
    [ItemOptionKey]          BIGINT       NOT NULL,
    [LoadDate]               DATETIME     NOT NULL,
    [PartitionValue]         INT          NULL,
    [CheckSum]               BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([ResponseSelectionId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ResponseSelections_AssignmentPortion]
    ON [Candidate].[ResponseSelections]([CandidateResponseKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ResponseSelections_ItemBank]
    ON [Candidate].[ResponseSelections]([ItemBankKey] ASC)
    INCLUDE([ItemOptionKey]);


GO
CREATE NONCLUSTERED INDEX [IX_ResponseSelections_ItemOptionKey]
    ON [Candidate].[ResponseSelections]([ItemOptionKey] ASC)
    INCLUDE([ItemBankKey]);

