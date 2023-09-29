CREATE TABLE [Cisco].[RouteCallDetail] (
    [RouteCallDetailId]           BIGINT       IDENTITY (1, 1) NOT NULL,
    [DialedNumberID]              INT          NULL,
    [SourceSystemKey]             INT          NULL,
    [RouterCallKeyDay]            INT          NULL,
    [RouterCallKey]               INT          NULL,
    [Date]                        DATE         NULL,
    [Time]                        TIME (7)     NULL,
    [BeganRoutingDate]            DATE         NULL,
    [BeganCallTypeDate]           TIME (7)     NULL,
    [BeganRoutingTime]            DATE         NULL,
    [BeganCallTypeTime]           TIME (7)     NULL,
    [RequestType]                 SMALLINT     NULL,
    [RoutingClientID]             SMALLINT     NULL,
    [OriginatorType]              SMALLINT     NULL,
    [RoutingClientCallKey]        INT          NULL,
    [MsgOrigin]                   SMALLINT     NULL,
    [Variable1]                   VARCHAR (40) NULL,
    [Variable2]                   VARCHAR (40) NULL,
    [Variable3]                   VARCHAR (40) NULL,
    [Variable4]                   VARCHAR (40) NULL,
    [Variable5]                   VARCHAR (40) NULL,
    [ANI]                         VARCHAR (32) NULL,
    [CED]                         VARCHAR (30) NULL,
    [CallSegmentTime]             INT          NULL,
    [CallTypeKey]                 INT          NULL,
    [RouterErrorCode]             SMALLINT     NULL,
    [RecoveryDay]                 INT          NULL,
    [TimeZone]                    INT          NULL,
    [Originator]                  VARCHAR (8)  NULL,
    [Variable6]                   VARCHAR (40) NULL,
    [Variable7]                   VARCHAR (40) NULL,
    [Variable8]                   VARCHAR (40) NULL,
    [Variable9]                   VARCHAR (40) NULL,
    [Variable10]                  VARCHAR (40) NULL,
    [RouterCallKeySequenceNumber] INT          NULL,
    [RouterQueueTime]             INT          NULL,
    [VruScripts]                  INT          NULL,
    [Label]                       VARCHAR (32) NULL,
    [TargetLabel]                 VARCHAR (32) NULL,
    [DialedNumberString]          VARCHAR (32) NULL,
    [TargetType]                  INT          NULL,
    [MRDomainKey]                 BIGINT       NULL,
    [RequeryResult]               INT          NULL,
    [RunID]                       INT          NULL,
    [EffectiveFrom]               DATETIME     NULL,
    [CheckSum]                    INT          NULL,
    [EffectiveTo]                 DATETIME     CONSTRAINT [dfRouteCallDetailEffectiveTo] DEFAULT ('2999-12-31') NULL,
    CONSTRAINT [PKRouteCallDetailId] PRIMARY KEY NONCLUSTERED ([RouteCallDetailId] ASC)
);


GO
CREATE CLUSTERED INDEX [CX_RouteCallDetail]
    ON [Cisco].[RouteCallDetail]([RouterCallKey] ASC, [Date] ASC, [Time] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RouteCallDetail_CallTypeKey]
    ON [Cisco].[RouteCallDetail]([CallTypeKey] ASC);

