CREATE TABLE [Dimensions].[SamplingGroupItems]
(
	[SamplingGroupItemId] [int] IDENTITY(1,1) NOT NULL,
	[SamplingGroupItemDBID] [int] NOT NULL,
	[SourceSystemID] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ActiveFlag] [bit] NOT NULL,
	[QuestionKey] Int Not null,
	[DeActiveationDate] [datetime] NULL,
	[Difficulty] [decimal](8, 7) NOT NULL,
	[PointBiserial] [decimal](8, 7) NOT NULL,
	[AngoffRating] [decimal](8, 7) NULL,
	[EnemyDBID] [int] NULL,
	[AllyBDID] [int] NULL,
	[AllySequence] [int] NULL,
	[FriendlyName] [varchar](128) NULL,
	[PTheta] [decimal](8, 7) NULL,
	[InfTheta] [decimal](8, 7) NULL,
PRIMARY KEY CLUSTERED 
(
	[SamplingGroupItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE INDEX [IX_SamplingGroupItems_Currentflag] ON [Dimensions].[SamplingGroupItems] ([CurrentFlag])
include(SamplingGroupItemDBID, QuestionKey)
