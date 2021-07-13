CREATE TABLE [dbo].[EntityStatus] (
    [StId]        INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description] VARCHAR (100) NULL,
    [IsDeleted]   BIT           NULL
);


GO

ALTER TABLE [dbo].[EntityStatus]
    ADD CONSTRAINT [DF_EntityStatus_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[EntityStatus]
    ADD CONSTRAINT [PK_EntityStatus] PRIMARY KEY CLUSTERED ([StId] ASC) WITH (FILLFACTOR = 90);


GO



