CREATE TABLE [Staging].[stagingdossier] (
    [id]                    INT            IDENTITY (1, 1) NOT NULL,
    [other_given_name]      NVARCHAR (92)  NULL,
    [family_name]           NVARCHAR (94)  NULL,
    [candidate_email]       NVARCHAR (255) NULL,
    [dossier_id]            NVARCHAR (72)  NULL,
    [proctored_exam_id]     NVARCHAR (104) NULL,
    [proctor_request_id]    NVARCHAR (96)  NULL,
    [exam_config]           NVARCHAR (144) NULL,
    [org_candidate]         NVARCHAR (68)  NULL,
    [exam_state_service_id] NVARCHAR (104) NULL,
    [requestorcandidateid]  NVARCHAR (255) NULL,
    [requestorexamid]       NVARCHAR (255) NULL,
    [CheckSum]              BIGINT         NULL,
    [Rundate]               DATE           NOT NULL,
    [RunId]                 INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_stagingdossier_Dossier]
    ON [Staging].[stagingdossier]([dossier_id] ASC, [proctored_exam_id] ASC);

