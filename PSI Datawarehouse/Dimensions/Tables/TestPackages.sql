CREATE TABLE [Dimensions].[TestPackages] (
    [TestPackageId]      INT              IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]    SMALLINT         NOT NULL,
    [SourceSystemId]     UNIQUEIDENTIFIER NOT NULL,
    [TestPackageDBID]    INT              NOT NULL,
    [CurrentFlag]        BIT              DEFAULT ((0)) NOT NULL,
    [LoadDate]           DATE             DEFAULT (getdate()) NOT NULL,
    [AreaKey]            INT              NOT NULL,
    [PackageTitle]       VARCHAR (100)    NOT NULL,
    [PackageDescription] VARCHAR (300)    NULL,
    [Checksum]           BIGINT           NOT NULL,
    PRIMARY KEY CLUSTERED ([TestPackageId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TestPackages_AreaKey]
    ON [Dimensions].[TestPackages]([AreaKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestPackages_Currentflag]
    ON [Dimensions].[TestPackages]([CurrentFlag] ASC)
    INCLUDE([TestPackageDBID]);


GO
CREATE NONCLUSTERED INDEX [IX_TestPackages_PackageTitle]
    ON [Dimensions].[TestPackages]([PackageTitle] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IX_TestPackages_TestPackageDBID]
    ON [Dimensions].[TestPackages]([TestPackageDBID] ASC) WHERE ([CurrentFlag]=(0));


GO
CREATE NONCLUSTERED INDEX [IXTestPackagesSourceSystemId]
    ON [Dimensions].[TestPackages]([SourceSystemId] ASC)
    INCLUDE([TestPackageDBID], [CurrentFlag], [LoadDate]);

