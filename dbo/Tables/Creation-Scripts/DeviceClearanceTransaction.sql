CREATE TABLE [dbo].[DeviceClearanceTransaction] (
    [Id]                        INT    IDENTITY (1, 1) NOT NULL,
    [DeviceClearanceMovementId] INT    NOT NULL,
    [TrxId]                     BIGINT NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxTrxIdDeviceClearanceTransaction]
    ON [dbo].[DeviceClearanceTransaction]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DeviceClearanceTransaction]
    ADD CONSTRAINT [FK_DeviceClearanceTransaction_DeviceClearanceMovement] FOREIGN KEY ([DeviceClearanceMovementId]) REFERENCES [dbo].[DeviceClearanceMovement] ([Id]);


GO



ALTER TABLE [dbo].[DeviceClearanceTransaction]
    ADD CONSTRAINT [PK_DeviceClearanceTransaction] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



CREATE TRIGGER [dbo].[utr_DELETE_DeviceClearanceTransaction_After] ON [dbo].[DeviceClearanceTransaction]
AFTER DELETE 

AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..DeviceClearanceTransactionArchive
(DeviceClearanceMovementId,TrxId)
  
SELECT
DeviceClearanceMovementId,TrxId
FROM deleted

END
GO



