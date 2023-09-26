CREATE TABLE [Test].[FixedForm] (
    [FixedFormId]       INT             IDENTITY (1, 1) NOT NULL,
    [FixedFormDBID]     INT             NOT NULL,
    [SourceSystemKey]   INT             NOT NULL,
    [SourceFixedFormID] VARCHAR (20)    NOT NULL,
    [PortionKey]        INT             NOT NULL,
    [FormName]          VARCHAR (50)    NOT NULL,
    [StatusKey]         INT             NOT NULL,
    [PassingScore]      DECIMAL (10, 6) NULL,
    [DateGenerated]     DATETIME        NOT NULL,
    [CreateDate]        DATETIME        DEFAULT (getdate()) NOT NULL,
    [CurrentFlag]       BIT             DEFAULT ((0)) NOT NULL,
    [Checksum]          INT             NULL,
    [FixedFormNmDBD]    INT             NULL,
    [ItemCount]         INT             NULL,
    PRIMARY KEY CLUSTERED ([FixedFormId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_FixedForm_PortionKey]
    ON [Test].[FixedForm]([PortionKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FixedForm_FixedFormDBID]
    ON [Test].[FixedForm]([FixedFormDBID] ASC) WHERE ([Currentflag]=(0));

