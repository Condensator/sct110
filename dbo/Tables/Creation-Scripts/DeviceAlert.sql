CREATE TABLE [dbo].[DeviceAlert] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [DevId]          INT            NOT NULL,
    [AlertTypeId]    INT            NOT NULL,
    [DeviceDateTime] DATETIME       NOT NULL,
    [RecievedDate]   DATETIME       NOT NULL,
    [SentDateTime]   DATETIME       NULL,
    [IsSent]         BIT            NULL,
    [DeviceMessage1] VARCHAR (1000) NULL,
    [DeviceMessage2] VARCHAR (1000) NULL
);


GO

CREATE NONCLUSTERED INDEX [idx_DeviceAlert_DevId_DeviceDateTime]
    ON [dbo].[DeviceAlert]([DevId] ASC, [DeviceDateTime] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DeviceAlert]
    ADD CONSTRAINT [DF_DeviceAlert_IsSent] DEFAULT ((0)) FOR [IsSent];


GO



ALTER TABLE [dbo].[DeviceAlert]
    ADD CONSTRAINT [DF_DeviceAlert_RecievedDate] DEFAULT (getdate()) FOR [RecievedDate];


GO



ALTER TABLE [dbo].[DeviceAlert]
    ADD CONSTRAINT [FK_DeviceAlert_AlertType] FOREIGN KEY ([AlertTypeId]) REFERENCES [dbo].[AlertType] ([Id]);


GO



ALTER TABLE [dbo].[DeviceAlert]
    ADD CONSTRAINT [FK_DeviceAlert_Devices] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[DeviceAlert]
    ADD CONSTRAINT [PK_DeviceAlert] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



