CREATE VIEW [Dimensions].[TestSegments_vw]
	AS SELECT 
		TestSegmentDBID,
		SourceTestSegmentID,
		TestKey,
		SegmentTitle,
		SegmentSeq,
		SegmentCount,
		SegmentSection,
		SegmentType,
		BankObjectivesKey
	from
	[$(PSI_DW)].Dimensions.TestSegments (nolock)
	Where
		CurrentFlag = 0
