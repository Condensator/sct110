CREATE TABLE [dbo].[DeviceUserCashUp] (
    [Id]         INT      IDENTITY (1, 1) NOT NULL,
    [DevId]      INT      NOT NULL,
    [DevShiftId] INT      NOT NULL,
    [DevUserId]  INT      NOT NULL,
    [CashUpDate] DATETIME NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [idx_DeviceUserCashUp_DevId_DevShiftId_DevUserId]
    ON [dbo].[DeviceUserCashUp]([DevId] ASC, [DevShiftId] ASC, [DevUserId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DeviceUserCashUp]
    ADD CONSTRAINT [PK_DeviceUserCashUp] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



