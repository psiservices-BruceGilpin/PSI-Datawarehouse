CREATE TABLE [Nice].[Campaign]
(
	[CampaignId] INT NOT NULL PRIMARY KEY, 
    [CampaignName] VARCHAR(254) NOT NULL, 
    [CampaignDirection] INT NOT NULL, 
    [CampaignTier] VARCHAR(8) NOT NULL , 
    [CampaignRole] VARCHAR(7) NOT NULL , 
    [campaignClient] VARCHAR(18) NOT NULL, 
    [campaignFocus] VARCHAR(19) NOT NULL, 
    [campaginChannel] VARCHAR(9) NOT NULL, 
    [CampaignLanguage] VARCHAR(7) NOT NULL
)
