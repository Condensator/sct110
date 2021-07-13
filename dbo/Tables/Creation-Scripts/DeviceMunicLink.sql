CREATE TABLE [dbo].[DeviceMunicLink] (
    [Id]                          INT IDENTITY (1, 1) NOT NULL,
    [DevId]                       INT NULL,
    [MunicipalityId]              INT NULL,
    [ElectricityDeviceGuidTypeId] INT NULL
);


GO

ALTER TABLE [dbo].[DeviceMunicLink]
    ADD CONSTRAINT [FK__DeviceMun__DevId__0BA41FF3] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[DeviceMunicLink]
    ADD CONSTRAINT [FK__DeviceMun__Elect__0C98442C] FOREIGN KEY ([ElectricityDeviceGuidTypeId]) REFERENCES [dbo].[ElectricityDeviceGuidType] ([id]);


GO



ALTER TABLE [dbo].[DeviceMunicLink]
    ADD CONSTRAINT [PK__DeviceMu__3214EC071AA70175] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



