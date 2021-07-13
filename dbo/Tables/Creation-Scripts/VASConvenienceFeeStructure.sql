CREATE TABLE [dbo].[VASConvenienceFeeStructure] (
    [Id]          INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description] VARCHAR (100) NULL,
    [IsDeleted]   BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[VASConvenienceFeeStructure]
    ADD CONSTRAINT [DF_VASConvenienceFeeStructure] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[VASConvenienceFeeStructure]
    ADD CONSTRAINT [PK_VASConvenienceFeeStructure] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



