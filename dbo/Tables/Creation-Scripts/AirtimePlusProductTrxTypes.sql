CREATE TABLE [dbo].[AirtimePlusProductTrxTypes] (
    [Id]           INT IDENTITY (1, 1) NOT NULL,
    [VasProductId] INT NOT NULL,
    [TrxTypeId]    INT NOT NULL
);


GO

ALTER TABLE [dbo].[AirtimePlusProductTrxTypes]
    ADD CONSTRAINT [FK_AirtimePlusProducts_TrxTypes] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[AirtimePlusProductTrxTypes]
    ADD CONSTRAINT [FK_AirtimePlusProducts_VASProduct] FOREIGN KEY ([VasProductId]) REFERENCES [dbo].[VASProduct] ([Id]);


GO



ALTER TABLE [dbo].[AirtimePlusProductTrxTypes]
    ADD CONSTRAINT [IX_AirtimePlusProductTrxTypes] UNIQUE NONCLUSTERED ([VasProductId] ASC, [TrxTypeId] ASC);


GO



ALTER TABLE [dbo].[AirtimePlusProductTrxTypes]
    ADD CONSTRAINT [PK_AirtimePlusProducts] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



