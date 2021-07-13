CREATE TABLE [dbo].[DeviceClearanceMovement] (
    [Id]                INT      IDENTITY (1, 1) NOT NULL,
    [DeviceClearanceId] INT      NULL,
    [TotalValueIn]      BIGINT   NOT NULL,
    [TotalValueOut]     BIGINT   NOT NULL,
    [TrxStatus]         INT      NOT NULL,
    [MovementDate]      DATETIME NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [idx_DeviceClearanceMovement_DeviceClearanceId]
    ON [dbo].[DeviceClearanceMovement]([DeviceClearanceId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DeviceClearanceMovement]
    ADD CONSTRAINT [DF__DeviceCle__TrxSt__3A1D25D6] DEFAULT ((0)) FOR [TrxStatus];


GO



ALTER TABLE [dbo].[DeviceClearanceMovement]
    ADD CONSTRAINT [DF_DeviceClearanceMovement_MovementDate] DEFAULT (getdate()) FOR [MovementDate];


GO



ALTER TABLE [dbo].[DeviceClearanceMovement]
    ADD CONSTRAINT [FK_DeviceClearanceMovement_DeviceClearance] FOREIGN KEY ([DeviceClearanceId]) REFERENCES [dbo].[DeviceClearance] ([Id]);


GO



ALTER TABLE [dbo].[DeviceClearanceMovement]
    ADD CONSTRAINT [PK_DeviceClearanceMovement] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



