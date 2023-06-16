CREATE TABLE [Cisco].[AgentSkillGroupInterval](
	[AgentSkillGroupIntervalId] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[AgentsKey] [int] NULL,
	[PrecisionQueueKey] [int] NULL,
	[SkillGroupSkillTargetID] [int] NULL,
	[SourceSystemKey] [int] NULL,
	[TimeZone] [int] NULL,
	[AbandonRingCalls] [int] NULL,
	[AbandonRingTime] [int] NULL,
	[AbandonHoldCalls] [int] NULL,
	[AgentOutCallsTime] [int] NULL,
	[AgentOutCallsTalkTime] [int] NULL,
	[AgentOutCalls] [int] NULL,
	[AgentOutCallsOnHold] [int] NULL,
	[AgentOutCallsOnHoldTime] [int] NULL,
	[AgentTerminatedCalls] [int] NULL,
	[AnswerWaitTime] [int] NULL,
	[AvailTime] [int] NULL,
	[BusyOtherTime] [int] NULL,
	[CallbackMessagesTime] [int] NULL,
	[CallbackMessages] [int] NULL,
	[CallsAnswered] [int] NULL,
	[CallsHandled] [int] NULL,
	[ConsultativeCalls] [int] NULL,
	[ConsultativeCallsTime] [int] NULL,
	[ConferencedInCalls] [int] NULL,
	[ConferencedInCallsTime] [int] NULL,
	[ConferencedOutCalls] [int] NULL,
	[ConferencedOutCallsTime] [int] NULL,
	[HandledCallsTalkTime] [int] NULL,
	[HandledCallsTime] [int] NULL,
	[HoldTime] [int] NULL,
	[IncomingCallsOnHoldTime] [int] NULL,
	[IncomingCallsOnHold] [int] NULL,
	[InternalCallsOnHoldTime] [int] NULL,
	[InternalCallsOnHold] [int] NULL,
	[InternalCallsRcvdTime] [int] NULL,
	[InternalCallsRcvd] [int] NULL,
	[InternalCallsTime] [int] NULL,
	[InternalCalls] [int] NULL,
	[LoggedOnTime] [int] NULL,
	[NotReadyTime] [int] NULL,
	[RedirectNoAnsCalls] [int] NULL,
	[RedirectNoAnsCallsTime] [int] NULL,
	[ReservedStateTime] [int] NULL,
	[ShortCalls] [int] NULL,
	[TalkInTime] [int] NULL,
	[TalkOtherTime] [int] NULL,
	[TalkOutTime] [int] NULL,
	[TransferredInCallsTime] [int] NULL,
	[TransferredInCalls] [int] NULL,
	[TransferredOutCalls] [int] NULL,
	[WorkNotReadyTime] [int] NULL,
	[WorkReadyTime] [int] NULL,
	[PreviewCallsOnHold] [int] NULL,
	[BargeInCalls] [int] NULL,
	[MonitorCalls] [int] NULL,
	[InterruptedTime] [int] NULL,
	[AbandonHoldOutCalls] [int] NULL,
	[ReportingHalfHour] [int] NULL,
	[ReportingInterval] [int] NULL,
	[AttributeID1] [int] NULL,
	[AttributeID2] [int] NULL,
	[RunID] [int] NULL,
	[EffectiveFrom] [datetime] NULL,
	[CheckSum] [int] NULL,
	[EffectiveTo] [datetime] NULL,
 CONSTRAINT [PKAgentSkillGroupIntervalId] PRIMARY KEY NONCLUSTERED 
(
	[AgentSkillGroupIntervalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cisco].[AgentSkillGroupInterval] ADD  CONSTRAINT [dfAgentSkillGroupIntervalEffectiveTo]  DEFAULT ('2999-12-31') FOR [EffectiveTo]
GO
CREATE CLUSTERED INDEX [CX_AgentSkillGroupInterval] ON [Cisco].[AgentSkillGroupInterval]
(
	[Date] ASC,
	[Time] ASC,
	[AgentsKey] ASC,
	[PrecisionQueueKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AgentSkillGroupInterval_Column_1] ON [Cisco].[AgentSkillGroupInterval]
(
	[SkillGroupSkillTargetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]