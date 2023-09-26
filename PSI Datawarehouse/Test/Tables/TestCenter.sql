CREATE TABLE [Test].[TestCenter] (
    [TestCenterId]        INT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemKey]     INT           NOT NULL,
    [SourceTestCenterKey] VARCHAR (100) NOT NULL,
    [TestCenterName]      VARCHAR (100) NOT NULL,
    [Address1]            VARCHAR (50)  NULL,
    [Address2]            VARCHAR (50)  NULL,
    [City]                VARCHAR (30)  NULL,
    [State]               VARCHAR (30)  NULL,
    [Zip]                 VARCHAR (10)  NULL,
    [Checksum]            INT           NOT NULL,
    [CreatedDate]         DATETIME      CONSTRAINT [dfTestCenterCreatedDate] DEFAULT (getdate()) NOT NULL,
    [RunID]               INT           NOT NULL,
    [CountryKey]          INT           NULL,
    [PropertyType]        VARCHAR (10)  NULL,
    [TestCenterDBID]      INT           NOT NULL,
    [CurrentFlag]         BIT           CONSTRAINT [dfTestCenterCurrentFlag] DEFAULT ((0)) NOT NULL,
    [NetSuiteKey]         VARCHAR (20)  NULL,
    [ActiveStatusKey]     INT           NULL,
    [GlobalTestCenterKey] VARCHAR (20)  NULL,
    PRIMARY KEY CLUSTERED ([TestCenterId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TestCenter_TestCenterDBID]
    ON [Test].[TestCenter]([TestCenterDBID] ASC) WHERE ([CurrentFlag]=(0));

