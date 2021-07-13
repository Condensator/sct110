CREATE TABLE [dbo].[EntityType] (
    [EntTypeId]  INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Decription] VARCHAR (250) NOT NULL,
    [IsDeleted]  BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[EntityType]
    ADD CONSTRAINT [DF_EntityType_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[EntityType]
    ADD CONSTRAINT [PK_EntityType] PRIMARY KEY CLUSTERED ([EntTypeId] ASC) WITH (FILLFACTOR = 90);


GO



