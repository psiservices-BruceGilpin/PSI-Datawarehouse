CREATE TABLE [Reporting].[StepDurationSummary] (
    [SDSId]                   INT           IDENTITY (1, 1) NOT NULL,
    [Account]                 VARCHAR (200) NULL,
    [StepName]                VARCHAR (50)  NOT NULL,
    [Less Than 1 Minute]      INT           NOT NULL,
    [One to 5 minutes]        INT           NOT NULL,
    [Five To 7.5 Minutes]     INT           NOT NULL,
    [7.501 To 10 Minutes]     INT           NOT NULL,
    [10.001 To 12.5 Minutes]  INT           NOT NULL,
    [12.5001 to 15 Minutes]   INT           NOT NULL,
    [15.001 to 17.5 Minutes]  INT           NOT NULL,
    [17.501 to 20 Minutes]    INT           NOT NULL,
    [Greater Than 20 Minutes] INT           NOT NULL,
    [Total For Step]          INT           NULL,
    PRIMARY KEY CLUSTERED ([SDSId] ASC)
);

