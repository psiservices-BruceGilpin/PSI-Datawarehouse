ALTER ROLE [db_owner] ADD MEMBER [PBUser];


GO
ALTER ROLE [db_owner] ADD MEMBER [PowerBI];


GO
ALTER ROLE [db_owner] ADD MEMBER [Visio];


GO
ALTER ROLE [db_datareader] ADD MEMBER [PBUser];


GO
ALTER ROLE [db_datareader] ADD MEMBER [svc_PowerBI];


GO
ALTER ROLE [db_datareader] ADD MEMBER [CORP\Thomas.Holzhauer];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [PBUser];

