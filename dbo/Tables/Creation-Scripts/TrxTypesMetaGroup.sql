CREATE TABLE [dbo].[TrxTypesMetaGroup] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (20) NOT NULL,
    [SystemID]    INT          NULL
);


GO

ALTER TABLE [dbo].[TrxTypesMetaGroup]
    ADD CONSTRAINT [DF_TrxTypesMetaGroup_SystemID] DEFAULT ((0)) FOR [SystemID];


GO



CREATE NONCLUSTERED INDEX [ndxTrxMetaGroupId]
    ON [dbo].[TrxTypesMetaGroup]([Id] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



