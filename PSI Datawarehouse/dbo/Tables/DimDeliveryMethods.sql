CREATE TABLE [dbo].[DimDeliveryMethods] (
    [DeliveryMethodId]   INT          IDENTITY (1, 1) NOT NULL,
    [DeliveryCode]       VARCHAR (20) NOT NULL,
    [DeliveryDescripton] VARCHAR (70) NOT NULL,
    [SourceSystemKey]    TINYINT      NOT NULL,
    [SourceDeliveryID]   VARCHAR (20) NOT NULL,
    [SessionUser]        VARCHAR (50) DEFAULT (suser_sname()) NOT NULL,
    PRIMARY KEY CLUSTERED ([DeliveryMethodId] ASC)
);

