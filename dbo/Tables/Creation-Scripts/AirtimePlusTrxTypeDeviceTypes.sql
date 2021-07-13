CREATE TABLE [dbo].[AirtimePlusTrxTypeDeviceTypes] (
    [Id]                           INT IDENTITY (1, 1) NOT NULL,
    [AirtimePlusProductTrxTypesId] INT NOT NULL,
    [DeviceTypesId]                INT NOT NULL
);


GO

ALTER TABLE [dbo].[AirtimePlusTrxTypeDeviceTypes]
    ADD CONSTRAINT [FK_AirtimePlusTrxTypeDeviceTypes_AirtimePlusProductTrxTypes] FOREIGN KEY ([AirtimePlusProductTrxTypesId]) REFERENCES [dbo].[AirtimePlusProductTrxTypes] ([Id]);


GO



ALTER TABLE [dbo].[AirtimePlusTrxTypeDeviceTypes]
    ADD CONSTRAINT [FK_AirtimePlusTrxTypeDeviceTypes_DeviceTypes] FOREIGN KEY ([DeviceTypesId]) REFERENCES [dbo].[DeviceTypes] ([DevTypeId]);


GO



ALTER TABLE [dbo].[AirtimePlusTrxTypeDeviceTypes]
    ADD CONSTRAINT [IX_AirtimePlusTrxTypeDeviceTypes] UNIQUE NONCLUSTERED ([AirtimePlusProductTrxTypesId] ASC, [DeviceTypesId] ASC);


GO



ALTER TABLE [dbo].[AirtimePlusTrxTypeDeviceTypes]
    ADD CONSTRAINT [PK_AirtimePlusTrxTypeDeviceTypes] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



