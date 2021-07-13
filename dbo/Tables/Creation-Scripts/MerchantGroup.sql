CREATE TABLE [dbo].[MerchantGroup] (
    [Id]                INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [MerchantGroupCode] NVARCHAR (50) NOT NULL,
    [MerchantGroupName] NVARCHAR (50) NOT NULL,
    [IsDeleted]         BIT           NOT NULL,
    [SystemCode]        VARCHAR (20)  NOT NULL
);


GO

ALTER TABLE [dbo].[MerchantGroup]
    ADD CONSTRAINT [DF__MerchantG__Syste__2D860BB0] DEFAULT ('') FOR [SystemCode];


GO



ALTER TABLE [dbo].[MerchantGroup]
    ADD CONSTRAINT [DF_MerchantGroup_IsDeleleted] DEFAULT ((0)) FOR [IsDeleted];


GO



CREATE NONCLUSTERED INDEX [ndxIsDeleted]
    ON [dbo].[MerchantGroup]([IsDeleted] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxMerchantGroupCode]
    ON [dbo].[MerchantGroup]([MerchantGroupCode] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[MerchantGroup]
    ADD CONSTRAINT [PK_MerchantGroup] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



