CREATE TABLE [Test].[RulesLookups] (
    [RuleLookUpId]    INT          IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey] SMALLINT     NOT NULL,
    [KeyGroup]        VARCHAR (50) NOT NULL,
    [KeyValue]        VARCHAR (10) NOT NULL,
    [KeyDescription]  VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([RuleLookUpId] ASC)
);

