/****** Object:  View [LookupTables].[ExtendedAccomodations_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[ExtendedAccomodations_vw]
	AS SELECT 
	a.EnumKey,
	a.ExAccDescription 'AccomdationDescription',
	a.ExtAccValue,
	a.raid,
	b.SourceSystemName
	FROM [$(PSI_DW)]..DimExtendedAccomodations a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemID = b.SourceSystemId