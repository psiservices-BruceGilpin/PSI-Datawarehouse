CREATE TABLE [Test].[PortionFormulaParameters] (
    [FormulaParametersId]     INT              IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]         SMALLINT         NOT NULL,
    [SourceFormulaParmeterID] VARCHAR (20)     NOT NULL,
    [FormulaParametersDBID]   INT              NOT NULL,
    [CurrentFlag]             BIT              DEFAULT ((0)) NOT NULL,
    [CheckSum]                BIGINT           NOT NULL,
    [LoadDate]                DATETIME         DEFAULT (getdate()) NOT NULL,
    [PortionKey]              BIGINT           NOT NULL,
    [scaling]                 BIT              NOT NULL,
    [scalex]                  NUMERIC (16, 12) NULL,
    [scaley]                  NUMERIC (16, 12) NULL,
    [Mean_Min_PValue]         NUMERIC (7, 4)   NULL,
    [Mean_Max_PValue]         NUMERIC (7, 4)   NULL,
    [StdDev_Min_PValue]       NUMERIC (7, 4)   NULL,
    [StdDev_Max_PValue]       NUMERIC (7, 4)   NULL,
    [Mean_Min_TValue]         NUMERIC (8, 4)   NULL,
    [Mean_Max_TValue]         NUMERIC (8, 4)   NULL,
    [StdDev_Min_TValue]       NUMERIC (8, 4)   NULL,
    [StdDev_Max_TValue]       NUMERIC (8, 4)   NULL,
    [Min_Target_Reliability]  NUMERIC (7, 4)   NULL,
    [Max_Target_Reliability]  NUMERIC (18)     NULL,
    [PValue_N_cut]            NUMERIC (5)      NULL,
    [Pbis_N_cut]              NUMERIC (5)      NULL,
    [Date]                    DATETIME         NULL,
    [Mean]                    NUMERIC (15, 4)  NULL,
    [StdDev]                  NUMERIC (15, 4)  NULL,
    [Reliability]             NUMERIC (15, 4)  NULL,
    PRIMARY KEY CLUSTERED ([FormulaParametersId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_PortionFormulaParameters_PortionKey]
    ON [Test].[PortionFormulaParameters]([PortionKey] ASC);

