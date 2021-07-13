CREATE TABLE [dbo].[TrxMoneyTransfer] (
    [MnyId]     INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [TrxId]     BIGINT       NULL,
    [VoucherId] VARCHAR (50) NULL,
    [IDNum]     VARCHAR (50) NULL,
    [TrxAmount] MONEY        NULL,
    [IsDeleted] BIT          NOT NULL,
    [DevId]     INT          NULL,
    [Date]      DATETIME     NULL,
    [VasProdId] INT          NULL
);


GO

ALTER TABLE [dbo].[TrxMoneyTransfer]
    ADD CONSTRAINT [DF_TrxMoneyTransfer_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[TrxMoneyTransfer]
    ADD CONSTRAINT [PK_TrxMoneyTransfer] PRIMARY KEY CLUSTERED ([MnyId] ASC);


GO



CREATE NONCLUSTERED INDEX [Indx_VoucherId]
    ON [dbo].[TrxMoneyTransfer]([VoucherId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxIdMoneyTransfer]
    ON [dbo].[TrxMoneyTransfer]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxVasProdID]
    ON [dbo].[TrxMoneyTransfer]([VasProdId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxMoneyTransfer_After] ON [dbo].[TrxMoneyTransfer]
AFTER DELETE 
AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxMoneyTransferArchive
(MnyId,TrxId,VoucherId,IDNum,TrxAmount,IsDeleted,DevId,Date,VasProdId)
  
SELECT 
	MnyId,TrxId,VoucherId,IDNum,TrxAmount,IsDeleted,DevId,Date,VasProdId
FROM deleted

DELETE FROM Trx 
    WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)
    
END
GO



