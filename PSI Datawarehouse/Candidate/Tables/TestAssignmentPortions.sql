CREATE TABLE [Candidate].[TestAssignmentPortions] (
    [TestAssgnPortionId]       INT             IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]          INT             NOT NULL,
    [TestPortionKey]           INT             NOT NULL,
    [TestAssignKey]            INT             NOT NULL,
    [Score]                    DECIMAL (10, 6) NULL,
    [Result]                   VARCHAR (20)    NULL,
    [Attempt#]                 TINYINT         NULL,
    [StartTime]                DATETIME        NULL,
    [EndTime]                  DATETIME        NULL,
    [ElapsedTime]              INT             NULL,
    [TestedPortionOrder]       TINYINT         NULL,
    [AnsweredItemCount]        INT             NULL,
    [MarkedItemCount]          INT             NULL,
    [RawScore]                 DECIMAL (10, 6) NULL,
    [ScaledScore]              DECIMAL (10, 6) NULL,
    [CreateDate]               DATETIME        DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]              BIT             DEFAULT ((0)) NOT NULL,
    [RunID]                    INT             NOT NULL,
    [TestAssignPortionDBId]    INT             NULL,
    [CastedForm]               BIGINT          NULL,
    [ExtendedTimeAllowed]      INT             NULL,
    [Take#]                    TINYINT         NULL,
    [ExtendedAccomodationsKey] INT             NULL,
    [LanguageKey]              INT             NULL,
    [ComputedAttempt#]         TINYINT         NULL,
    [FixedFormKey]             BIGINT          NULL,
    [ItemCount]                INT             NULL,
    PRIMARY KEY CLUSTERED ([TestAssgnPortionId] ASC),
    CONSTRAINT [FK_TestAssignmentPortions_TestAssignments] FOREIGN KEY ([TestAssignKey]) REFERENCES [Candidate].[TestAssignments] ([TestAssignmentId])
);


GO
CREATE NONCLUSTERED INDEX [IX_TestAssignmentPortions_TestAssignmentKey]
    ON [Candidate].[TestAssignmentPortions]([TestAssignKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestAssignmentPortions_TestAssmentPortionsDBID]
    ON [Candidate].[TestAssignmentPortions]([TestAssignPortionDBId] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_TestAssignmentPortions_CurrentFlag]
    ON [Candidate].[TestAssignmentPortions]([CurrentFlag] ASC)
    INCLUDE([TestPortionKey], [TestAssignKey], [Result], [ElapsedTime], [RawScore], [ScaledScore], [TestAssignPortionDBId], [ExtendedTimeAllowed], [Take#], [ExtendedAccomodationsKey], [ComputedAttempt#]);

