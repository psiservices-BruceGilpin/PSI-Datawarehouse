﻿CREATE TABLE [Staging].[DimensionsCandidates](
	[SRPT-TestCenterId] [varchar](200) NULL,
	[SRPT-ExamId] [varchar](200) NULL,
	[SRPT-COL1] [varchar](200) NULL,
	[SRPT-COL2] [varchar](200) NULL,
	[SRPT-COL3] [varchar](200) NULL,
	[SRPT-COL4] [varchar](200) NULL,
	[SRPT-COL5] [varchar](200) NULL,
	[SRPT-COL6] [varchar](200) NULL,
	[SRPT-COL7] [varchar](200) NULL,
	[SRPT-COL8] [varchar](200) NULL,
	[SRPT-COL9] [varchar](200) NULL,
	[SRPT-COL10] [varchar](200) NULL,
	[SRPT-COL11] [varchar](200) NULL,
	[SRPT-COL12] [varchar](200) NULL,
	[SRPT-COL13] [varchar](200) NULL,
	[SRPT-COL14] [varchar](200) NULL,
	[SRPT-COL15] [varchar](200) NULL,
	[SRPT-COL16] [varchar](200) NULL,
	[SRPT-COL17] [varchar](200) NULL,
	[SRPT-COL18] [varchar](200) NULL,
	[SRPT-COL19] [varchar](200) NULL,
	[SRPT-COL20] [varchar](200) NULL,
	[SRPT-COL21] [varchar](200) NULL,
	[SRPT-COL22] [varchar](200) NULL,
	[SRPT-COL23] [varchar](200) NULL,
	[SRPT-COL24] [varchar](200) NULL,
	[SRPT-COL25] [varchar](200) NULL,
	[SRPT-COL26] [varchar](200) NULL,
	[SRPT-COL27] [varchar](200) NULL,
	[SRPT-COL28] [varchar](200) NULL,
	[SRPT-COL29] [varchar](200) NULL,
	[SRPT-COL30] [varchar](200) NULL,
	[SRPT-COL31] [varchar](200) NULL,
	[SRPT-COL32] [varchar](200) NULL,
	[SRPT-COL33] [varchar](200) NULL,
	[SRPT-COL34] [varchar](200) NULL,
	[SRPT-COL35] [varchar](200) NULL,
	[SRPT-COL36] [varchar](200) NULL,
	[SRPT-COL37] [varchar](200) NULL,
	[SRPT-COL38] [varchar](200) NULL,
	[SRPT-COL39] [varchar](200) NULL,
	[SRPT-COL40] [varchar](200) NULL,
	[SRPT-COL41] [varchar](200) NULL,
	[SRPT-COL42] [varchar](200) NULL,
	[SRPT-COL43] [varchar](200) NULL,
	[SRPT-COL44] [varchar](200) NULL,
	[SRPT-COL45] [varchar](200) NULL,
	[SRPT-COL46] [varchar](200) NULL,
	[SRPT-COL47] [varchar](200) NULL,
	[SRPT-COL48] [varchar](200) NULL,
	[SRPT-COL49] [varchar](200) NULL,
	[SRPT-COL50] [varchar](200) NULL,
	[SRPT-COL51] [varchar](200) NULL,
	[SRPT-COL52] [varchar](200) NULL,
	[SRPT-COL53] [varchar](200) NULL,
	[SRPT-COL54] [varchar](200) NULL,
	[SRPT-COL55] [varchar](200) NULL,
	[SRPT-COL56] [varchar](200) NULL,
	[SRPT-COL57] [varchar](200) NULL,
	[SRPT-COL58] [varchar](200) NULL,
	[SRPT-COL59] [varchar](200) NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_altid] ON [Staging].[DimensionsCandidates]
(
	[SRPT-COL6] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]