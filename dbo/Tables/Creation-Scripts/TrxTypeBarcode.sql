CREATE TABLE [dbo].[TrxTypeBarcode] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [TrxTypeId]    INT           NOT NULL,
    [PrintBarcode] BIT           NOT NULL,
    [Barcode]      NVARCHAR (50) NULL
);


GO

ALTER TABLE [dbo].[TrxTypeBarcode]
    ADD CONSTRAINT [FK_TrxType_Barcode_TrxTypes] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[TrxTypeBarcode]
    ADD CONSTRAINT [PK_TrxType_Barcode] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



ALTER TABLE [dbo].[TrxTypeBarcode]
    ADD CONSTRAINT [UQ__TrxTypeB__8849642007DFC221] UNIQUE NONCLUSTERED ([TrxTypeId] ASC);


GO



