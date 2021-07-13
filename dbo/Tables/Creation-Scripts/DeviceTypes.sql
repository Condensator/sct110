CREATE TABLE [dbo].[DeviceTypes] (
    [DevTypeId]              INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DeviceType]             VARCHAR (20) NOT NULL,
    [IsDeleted]              BIT          NOT NULL,
    [UseElectGlobalBin]      BIT          NOT NULL,
    [IsRedemptionDeviceType] BIT          NOT NULL,
    [UseVoucherGlobalBin]    BIT          DEFAULT ((1)) NOT NULL
);


GO

ALTER TABLE [dbo].[DeviceTypes]
    ADD CONSTRAINT [DF__DeviceTyp__IsRed__7C74BAC1] DEFAULT ((0)) FOR [IsRedemptionDeviceType];


GO



ALTER TABLE [dbo].[DeviceTypes]
    ADD CONSTRAINT [DF_DeviceTypes_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[DeviceTypes]
    ADD CONSTRAINT [DF_DeviceTypes_UseElectGlobalBin] DEFAULT ((0)) FOR [UseElectGlobalBin];


GO



ALTER TABLE [dbo].[DeviceTypes]
    ADD CONSTRAINT [PK_DeviceTypes] PRIMARY KEY CLUSTERED ([DevTypeId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



