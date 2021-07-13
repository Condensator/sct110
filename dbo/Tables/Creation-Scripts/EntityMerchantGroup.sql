CREATE TABLE [dbo].[EntityMerchantGroup] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [EntId]             INT           NOT NULL,
    [MerchantGroupCode] NVARCHAR (50) NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxEntityMerchantGroupEntId]
    ON [dbo].[EntityMerchantGroup]([EntId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxEntMerchGroupCode]
    ON [dbo].[EntityMerchantGroup]([MerchantGroupCode] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[EntityMerchantGroup]
    ADD CONSTRAINT [PK_EntityMerchantGroup] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



