CREATE TABLE [dbo].[DeviceClearanceMovementDetail] (
    [Id]                        INT    IDENTITY (1, 1) NOT NULL,
    [DeviceClearanceMovementId] INT    NULL,
    [DenominationTypeId]        INT    NULL,
    [QtyIn]                     INT    NOT NULL,
    [QtyOut]                    INT    NOT NULL,
    [ValueIn]                   BIGINT NOT NULL,
    [ValueOut]                  BIGINT NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [idx_DeviceClearanceMovementDetail_DeviceClearanceMovementId]
    ON [dbo].[DeviceClearanceMovementDetail]([DeviceClearanceMovementId] ASC)
    INCLUDE([QtyIn], [QtyOut]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DeviceClearanceMovementDetail]
    ADD CONSTRAINT [FK_DeviceClearanceMovementDetail_DenominationType] FOREIGN KEY ([DenominationTypeId]) REFERENCES [dbo].[DenominationType] ([Id]);


GO



ALTER TABLE [dbo].[DeviceClearanceMovementDetail]
    ADD CONSTRAINT [FK_DeviceClearanceMovementDetail_DeviceClearanceMovement] FOREIGN KEY ([DeviceClearanceMovementId]) REFERENCES [dbo].[DeviceClearanceMovement] ([Id]);


GO



ALTER TABLE [dbo].[DeviceClearanceMovementDetail]
    ADD CONSTRAINT [PK_DeviceClearanceMovementDetail] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



