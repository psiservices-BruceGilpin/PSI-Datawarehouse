CREATE TABLE [Candidate].[Responses] (
    [CandidateResponseId]   INT             IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]       INT             NOT NULL,
    [TestAssignPortionKey]  INT             NULL,
    [FixedFormKey]          INT             NULL,
    [ItemBankKey]           INT             NOT NULL,
    [DisplayOrder]          INT             NOT NULL,
    [TimeAllowed]           INT             NULL,
    [TimeElapsed]           INT             NULL,
    [IsCorrect]             BIT             NULL,
    [IsMarked]              BIT             NULL,
    [TimesChanged]          TINYINT         NULL,
    [ISGFlag]               TINYINT         NULL,
    [TotalWeightage]        DECIMAL (10, 6) NULL,
    [Weightage]             DECIMAL (10, 6) NULL,
    [DateCreated]           DATETIME        DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]           BIT             DEFAULT ((0)) NOT NULL,
    [CandidateResponseDBId] INT             NULL,
    [Checksum]              INT             NULL,
    [PartitionValue]        INT             NOT NULL,
    [ResponseChoiceKey]     BIGINT          NULL,
    [Comments]              VARCHAR (1500)  NULL,
    [TopicAreaKey] INT NULL, 
    CONSTRAINT [PK_CandidateResponse] PRIMARY KEY CLUSTERED ([PartitionValue] ASC, [CandidateResponseId] ASC) ON [CandidateResponse] ([PartitionValue])
) ON [CandidateResponse] ([PartitionValue]);


GO
CREATE NONCLUSTERED INDEX [IX_Responses_PortionKey]
    ON [Candidate].[Responses]([TestAssignPortionKey] ASC)
    


GO
CREATE NONCLUSTERED INDEX [IX_Responses_ItemBankKey]
    ON [Candidate].[Responses]([ItemBankKey] ASC)
    


GO
CREATE NONCLUSTERED INDEX [IX_Responses_CandidateResponseDBID]
    ON [Candidate].[Responses]([CandidateResponseDBId] ASC) WHERE ([CurrentFlag]=(0))
    


GO
CREATE NONCLUSTERED INDEX [IX_Responses_CurrentFlag]
    ON [Candidate].[Responses]([CurrentFlag] ASC)
    INCLUDE([TestAssignPortionKey],  [FixedFormKey])
    

