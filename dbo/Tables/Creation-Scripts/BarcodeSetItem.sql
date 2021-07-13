CREATE TABLE [dbo].[BarcodeSetItem] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [BarcodeSetId] INT           NOT NULL,
    [TrxTypeId]    INT           NOT NULL,
    [ProductId]    INT           NULL,
    [Barcode]      NVARCHAR (50) NOT NULL,
    [IsDeleted]    BIT           NOT NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [IDX_BarcodeSetItem_BarcodeSetId_TrxTypeId_ProductId]
    ON [dbo].[BarcodeSetItem]([BarcodeSetId] ASC, [TrxTypeId] ASC, [ProductId] ASC) WHERE ([IsDeleted]=(0));


GO



ALTER TABLE [dbo].[BarcodeSetItem]
    ADD CONSTRAINT [DF_BarcodeSetItem_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[BarcodeSetItem]
    ADD CONSTRAINT [FK_BarcodeSetItem_Id_BarcodeSet] FOREIGN KEY ([BarcodeSetId]) REFERENCES [dbo].[BarcodeSet] ([Id]);


GO



ALTER TABLE [dbo].[BarcodeSetItem]
    ADD CONSTRAINT [FK_BarcodeSetItem_ProductId_VASProduct] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[VASProduct] ([Id]);


GO



ALTER TABLE [dbo].[BarcodeSetItem]
    ADD CONSTRAINT [FK_BarcodeSetItem_TrxType_TrxTypes] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[BarcodeSetItem]
    ADD CONSTRAINT [PK_BarcodeSetItem] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



