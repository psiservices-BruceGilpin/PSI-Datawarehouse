CREATE TABLE [Dimensions].[SamplingGroups]
(
	[SamplingGroupId] [int] IDENTITY(1,1) NOT NULL,
	[SamplingGroupDBID] [int] NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Checksum] [bigint] NOT NULL,
	[SourceSystemKey] [uniqueidentifier] NOT NULL,
	[PublicationPoolKey] [int] NOT NULL,
	[SamplingGroupName] [varchar](100) NOT NULL,
	[DateAdded] [datetime] NOT NULL DEFAULT getdate(),
	[IsScored] [bit] NOT NULL,
	[CastCount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SamplingGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE INDEX [IX_SamplingGroups_CurrentFlag] ON [Dimensions].[SamplingGroups] ([CurrentFlag])
