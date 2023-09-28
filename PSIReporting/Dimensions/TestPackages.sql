CREATE VIEW [Dimensions].[TestPackages_vw]
	AS SELECT 
		TestPackageDBID,
		AreaKey,
		PackageTitle,
		PackageDescription

	from
		[$(PSI_DW)].Dimensions.TestPackages (nolock)
	where
		CurrentFlag = 0