CREATE TABLE [dbo].[DimTimeZones] (
    [TimeZoneId]      INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemID]  INT            NOT NULL,
    [SSTimeZoneKey]   VARCHAR (20)   NOT NULL,
    [TimeZoneDesc]    VARCHAR (200)  NOT NULL,
    [RawUTCOffset]    VARCHAR (6)    NOT NULL,
    [OffsetInHours]   DECIMAL (4, 2) NOT NULL,
    [OffsetInMinutes] SMALLINT       NOT NULL,
    [CountryKey]      INT            NULL,
    [CreateDate]      DATETIME       NOT NULL,
    [UpdateDate]      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([TimeZoneId] ASC)
);

