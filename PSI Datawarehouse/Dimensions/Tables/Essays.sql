CREATE TABLE [Dimensions].[Essays] (
    [EssayId]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [StudentResponseKey] BIGINT        NOT NULL,
    [Essay]              VARCHAR (MAX) NOT NULL,
    [CurrentFlag]        BIT           DEFAULT ((0)) NOT NULL,
    [LoadDate]           DATETIME      DEFAULT (getdate()) NOT NULL,
    [Checksum]           BIGINT        NOT NULL,
    [EssayDBID]          BIGINT        NOT NULL,
    PRIMARY KEY CLUSTERED ([EssayId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Essays_CurrentFlag]
    ON [Dimensions].[Essays]([CurrentFlag] ASC)
    INCLUDE([StudentResponseKey]);

