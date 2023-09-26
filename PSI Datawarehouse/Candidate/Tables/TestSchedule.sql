CREATE TABLE [Candidate].[TestSchedule] (
    [CandidateTestScheduleId]   INT            IDENTITY (1, 1) NOT NULL,
    [SourceTestScheduleKey]     VARCHAR (20)   NOT NULL,
    [SourceSystemKey]           INT            NOT NULL,
    [CandidateKey]              INT            NOT NULL,
    [TestCenterScheduleKey]     INT            NOT NULL,
    [ScheduleDate]              DATETIME       NOT NULL,
    [CountryKey]                INT            NOT NULL,
    [TimeZoneKey]               INT            NOT NULL,
    [CreatedDate]               DATETIME       DEFAULT (getdate()) NOT NULL,
    [runid]                     INT            NOT NULL,
    [Checksum]                  INT            NOT NULL,
    [IsReschedule]              BIT            NULL,
    [Status]                    VARCHAR (10)   NULL,
    [CandidateTestScheduleDBID] INT            NULL,
    [CurrentFlag]               BIT            DEFAULT ((0)) NOT NULL,
    [PDiddyID]                  VARCHAR (100)  NULL,
    [ResultsExported]           BIT            NULL,
    [PDiddyTimeStamp]           DATETIME       NULL,
    [MultiMediaReady]           BIT            NULL,
    [PriorDeliveryMethod]       VARCHAR (20)   NULL,
    [SecureBrowserURL]          VARCHAR (1000) NULL,
    [DeliveryMethodKey]         INT            NULL,
    PRIMARY KEY CLUSTERED ([CandidateTestScheduleId] ASC),
    CONSTRAINT [FK_TestSchedule_Candidates] FOREIGN KEY ([CandidateKey]) REFERENCES [Candidate].[Candidates] ([CandidateId]),
    CONSTRAINT [FK_TestSchedule_DimCountries] FOREIGN KEY ([CountryKey]) REFERENCES [dbo].[DimCountries] ([CountryID]),
    CONSTRAINT [FK_TestSchedule_DimTimeZones] FOREIGN KEY ([TimeZoneKey]) REFERENCES [dbo].[DimTimeZones] ([TimeZoneId]),
    CONSTRAINT [FK_TestSchedule_TestCenterSchedule] FOREIGN KEY ([TestCenterScheduleKey]) REFERENCES [Test].[TestCenterSchedule] ([TestCenterScheduleId])
);


GO
CREATE NONCLUSTERED INDEX [IX_TestSchedule_PDiddy]
    ON [Candidate].[TestSchedule]([PDiddyID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestSchedule_CandidateKey]
    ON [Candidate].[TestSchedule]([CandidateKey] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TestSchedule_CandidateTestScheduleDBID]
    ON [Candidate].[TestSchedule]([CandidateTestScheduleDBID] ASC) WHERE ([CurrentFlag]=(0));

