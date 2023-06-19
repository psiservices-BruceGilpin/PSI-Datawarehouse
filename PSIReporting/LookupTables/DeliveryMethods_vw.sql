/****** Object:  View [LookupTables].[DeliveryMethods_vw]    Script Date: 6/16/2023 1:44:54 PM ******/

CREATE VIEW [LookupTables].[DeliveryMethods_vw]
	AS SELECT 
	a.DeliveryCode,
	a.DeliveryDescripton,
	a.SourceDeliveryID,
	b.SourceSystemName
	FROM 
	[$(PSI_DW)]..DimDeliveryMethods a with (nolock) join
	[$(PSI_DW)]..SourceSystems b with (nolock) on
		a.SourceSystemKey = b.SourceSystemId