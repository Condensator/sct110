CREATE TABLE [dbo].[DeviceMerchantRequest] (
    [Id]                    INT      IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DeviceId]              INT      NOT NULL,
    [MerchantRequestTypeId] INT      NOT NULL,
    [RequestDate]           DATETIME NOT NULL,
    [DeviceUserId]          INT      NULL
);


GO

ALTER TABLE [dbo].[DeviceMerchantRequest]
    ADD CONSTRAINT [FK_DeviceMerchantRequest_Devices] FOREIGN KEY ([DeviceId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[DeviceMerchantRequest]
    ADD CONSTRAINT [FK_DeviceMerchantRequest_DevUser] FOREIGN KEY ([DeviceUserId]) REFERENCES [dbo].[DevUser] ([Id]);


GO



ALTER TABLE [dbo].[DeviceMerchantRequest]
    ADD CONSTRAINT [FK_DeviceMerchantRequest_MerchantRequestType] FOREIGN KEY ([MerchantRequestTypeId]) REFERENCES [dbo].[MerchantRequestType] ([Id]);


GO



ALTER TABLE [dbo].[DeviceMerchantRequest]
    ADD CONSTRAINT [PK__DeviceMe__3214EC072161290E] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



