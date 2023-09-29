CREATE TABLE [Bridge].[Proctors] (
    [ProctorId]  INT          IDENTITY (1, 1) NOT NULL,
    [AgentLogin] VARCHAR (50) NOT NULL,
    [AgentRole]  VARCHAR (25) NULL,
    [CreateDate] DATETIME     DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ProctorId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Proctors_AgentLogin]
    ON [Bridge].[Proctors]([AgentLogin] ASC)
    INCLUDE([AgentRole]);

