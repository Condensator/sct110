CREATE TABLE [dbo].[VASRebateStructure] (
    [Id]           INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description]  VARCHAR (100) NULL,
    [EntityTypeId] INT           NOT NULL,
    [IsDeleted]    BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[VASRebateStructure]
    ADD CONSTRAINT [DF__VASRebate__Entit__19F97615] DEFAULT ((1)) FOR [EntityTypeId];


GO



ALTER TABLE [dbo].[VASRebateStructure]
    ADD CONSTRAINT [DF__VASRebate__IsDel__1AED9A4E] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[VASRebateStructure]
    ADD CONSTRAINT [FK_VASRebateStructure_EntityType] FOREIGN KEY ([EntityTypeId]) REFERENCES [dbo].[EntityType] ([EntTypeId]);


GO



ALTER TABLE [dbo].[VASRebateStructure]
    ADD CONSTRAINT [PK_VASRebateStructure] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



