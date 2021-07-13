CREATE TABLE [dbo].[DeviceVersionTrxTypeExclusion] (
    [DeviceVersionId] INT NOT NULL,
    [TrxTypeId]       INT NOT NULL
);


GO

ALTER TABLE [dbo].[DeviceVersionTrxTypeExclusion]
    ADD CONSTRAINT [FK_DeviceVersionTrxTypeExclusion_DeviceVersion] FOREIGN KEY ([DeviceVersionId]) REFERENCES [dbo].[DeviceVersion] ([Id]);


GO



ALTER TABLE [dbo].[DeviceVersionTrxTypeExclusion]
    ADD CONSTRAINT [FK_DeviceVersionTrxTypeExclusion_TrxTypes] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[DeviceVersionTrxTypeExclusion]
    ADD CONSTRAINT [PK_DeviceVersionTrxTypeExclusion] PRIMARY KEY CLUSTERED ([DeviceVersionId] ASC, [TrxTypeId] ASC);


GO



