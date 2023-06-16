CREATE FUNCTION [Test].[pBIS_Corrected]
(
	@sigmaSqX		float,
	@sigmaX			float,
	@nT				float,
	@nY				float,
	@sigmaY			float
)  
RETURNS  float
AS  
BEGIN 

    declare		@mP 	float,
		        @mT 	float,
		        @rowT 	float,
		        @p 	    float,
		        @rPB 	float,
		        @rPBC	float,
		        @swapV	float
    if @ny = 0 or @nT = 0 
        return 0
    select 	@mP 	= 		@sigmaY/@nY,
		    @mT 	= 		@sigmaX/@nT,
		    @p 	    = 		@nY/@nT,
		    @rowT	=		power(((@sigmaSqX/@nT) - square(@sigmaX/@nT)),0.5)

    if @p = 1 				-- avoid divide by 0
	    return 0
    if @rowT = 0 
	    return 0
    select @rPB = ((@mP - @mT)/(@rowT))--* (power( (@p/(`+) ,0.5))
    select @rPB = @rPB * power(@p /(1 - @p),0.5)
    select @swapV = 2* (@rPB*@rowT*power(@p*(1-@p) ,0.5))
    select @swapV =  (square(@rowT) + @p*(1 - @p)) - @swapV

    if @swapV < 0 
        return 0-- Changed by Satish
    select @swapV = power(@swapV,0.5)
    select @rPBC =  ((@rPB * @rowT) - power(@p * ( 1 - @p),0.5))

    if @swapV = 0 
	    return 0	
    Select   @rPBC= (@rPBC  /@swapV)

	return @rPBC
 

END