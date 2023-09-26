CREATE TABLE [Bridge].[MajorIncidentReason] (
    [MajorIncidentReasonId] INT            IDENTITY (1, 1) NOT NULL,
    [SystemSourceKey]       VARCHAR (50)   NOT NULL,
    [Reason]                VARCHAR (1000) NOT NULL,
    [Type]                  VARCHAR (22)   NOT NULL,
    PRIMARY KEY CLUSTERED ([MajorIncidentReasonId] ASC)
);

