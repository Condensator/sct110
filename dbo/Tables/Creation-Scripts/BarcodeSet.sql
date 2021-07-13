CREATE TABLE [dbo].[BarcodeSet] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (255) NOT NULL,
    [IsDeleted]   BIT            NOT NULL
);


GO

ALTER TABLE [dbo].[BarcodeSet]
    ADD CONSTRAINT [DF_BarcodeSet_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[BarcodeSet]
    ADD CONSTRAINT [PK_BarcodeSet] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



