CREATE Function [Test].[pBIS]
(
	@sigmaSqX			float,
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
		        @rPB 	float

            If @nY = 0 or @nt = 0 
                return 0

           
           select 	@mP 	= 		@sigmaY/@nY,
			        @mT 	= 		@sigmaX/@nT,
			        @p 	    = 		@nY/@nT,
			        @rowT	=		power(((@sigmaSqX/@nT) - square(@sigmaX/@nT)),0.5)


    if @rowT = 0 or @p = 1
	    return 0

        select @rPB = ((@mP - @mT)/(@rowT))
        select @rPB = @rPB * power(@p /(1 - @p),0.5)			-- raw pbis ends here
 
    return @rPB		

	


END