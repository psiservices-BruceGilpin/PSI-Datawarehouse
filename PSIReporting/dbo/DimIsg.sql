CREATE VIEW [dbo].[DimIsg_vw]
	AS 
Select
	ISGKey,
	isgid
from [$(PSI_DW)].dbo.DimISG
