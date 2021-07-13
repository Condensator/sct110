CREATE TABLE [dbo].[TrxTypeElectricityVendChannel] (
    [VendChannelId] INT NOT NULL,
    [TrxTypeId]     INT NOT NULL
);


GO

ALTER TABLE [dbo].[TrxTypeElectricityVendChannel]
    ADD CONSTRAINT [FK_TrxTypeElectricityVendChannel_TrxTypesId] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[TrxTypeElectricityVendChannel]
    ADD CONSTRAINT [FK_TrxTypeElectricityVendChannel_VendChannelId] FOREIGN KEY ([VendChannelId]) REFERENCES [dbo].[VendChannel] ([Id]);


GO



ALTER TABLE [dbo].[TrxTypeElectricityVendChannel]
    ADD CONSTRAINT [PK_TrxTypeElectricityVendChannel_VendChannelId_TrxTypeId] PRIMARY KEY CLUSTERED ([VendChannelId] ASC, [TrxTypeId] ASC);


GO



