CREATE TABLE [dbo].[DeviceClearanceRefund] (
    [Id]                        INT           IDENTITY (1, 1) NOT NULL,
    [DeviceClearanceMovementId] INT           NULL,
    [RefundDate]                DATETIME      NOT NULL,
    [RefundValue]               BIGINT        NOT NULL,
    [Barcode]                   NVARCHAR (50) NULL,
    [SeqNo]                     INT           NULL,
    [RedeemStatus]              INT           NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [idx_DeviceClearanceRefund_DeviceClearanceMovementId]
    ON [dbo].[DeviceClearanceRefund]([DeviceClearanceMovementId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DeviceClearanceRefund]
    ADD CONSTRAINT [DF__DeviceCle__Redee__42B26BD7] DEFAULT ((0)) FOR [RedeemStatus];


GO



ALTER TABLE [dbo].[DeviceClearanceRefund]
    ADD CONSTRAINT [FK_DeviceClearanceRefund_DeviceClearanceMovement] FOREIGN KEY ([DeviceClearanceMovementId]) REFERENCES [dbo].[DeviceClearanceMovement] ([Id]);


GO



ALTER TABLE [dbo].[DeviceClearanceRefund]
    ADD CONSTRAINT [PK_DeviceClearanceRefund] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



