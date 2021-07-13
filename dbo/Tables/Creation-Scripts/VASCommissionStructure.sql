CREATE TABLE [dbo].[VASCommissionStructure] (
    [Id]          INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description] VARCHAR (250) NULL,
    [IsDeleted]   BIT           NULL
);


GO

ALTER TABLE [dbo].[VASCommissionStructure]
    ADD CONSTRAINT [DF_VASCommissionStructure_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[VASCommissionStructure]
    ADD CONSTRAINT [PK_VASCommissionStructure] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



