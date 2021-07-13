CREATE TABLE [dbo].[TrxVasPayAt] (
    [PayAtID]         INT            IDENTITY (1, 1) NOT NULL,
    [TrxTypeId]       INT            NULL,
    [TrxId]           BIGINT         NULL,
    [AccountNo]       VARCHAR (50)   NULL,
    [TrxAmount]       MONEY          NULL,
    [MerchantId]      VARCHAR (50)   NULL,
    [TerminalId]      VARCHAR (50)   NULL,
    [TransactionType] VARCHAR (50)   NULL,
    [Status]          INT            NULL,
    [ResponseCode]    INT            NULL,
    [ResponseDesc]    VARCHAR (50)   NULL,
    [BuildResponse]   VARCHAR (1000) NULL,
    [ClientDetail]    VARCHAR (1000) NULL,
    [ConfirmCode]     INT            NULL,
    [ConfirmDesc]     VARCHAR (100)  NULL,
    [RollbackTrx]     BIT            NULL,
    [TrxDate]         DATETIME       NULL,
    [ExternalRef]     VARCHAR (50)   NULL,
    [ReceiptNo]       VARCHAR (50)   NULL,
    [ReceiverCode]    VARCHAR (50)   NULL,
    [PaymentFee]      MONEY          NULL,
    [ProviderId]      INT            NULL,
    [ProductId]       INT            NULL,
    [Verify]          BIT            NULL
);


GO

ALTER TABLE [dbo].[TrxVasPayAt]
    ADD CONSTRAINT [PK_TrxPayAt] PRIMARY KEY CLUSTERED ([PayAtID] ASC);


GO



CREATE NONCLUSTERED INDEX [IX_TrxVasPayAt_ProductId]
    ON [dbo].[TrxVasPayAt]([ProductId] ASC)
    INCLUDE([TrxId], [AccountNo]);


GO



CREATE NONCLUSTERED INDEX [ndxAccNumberPayAt]
    ON [dbo].[TrxVasPayAt]([AccountNo] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxReceiptNo]
    ON [dbo].[TrxVasPayAt]([ReceiptNo] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxStatusTrxdate]
    ON [dbo].[TrxVasPayAt]([Status] ASC, [TrxDate] ASC)
    INCLUDE([TrxId], [AccountNo], [TrxAmount], [ClientDetail]);


GO



CREATE NONCLUSTERED INDEX [ndxTrxidPayAt]
    ON [dbo].[TrxVasPayAt]([TrxId] ASC);


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxVasPayAt_InsteadOf] ON [dbo].[TrxVasPayAt] 
INSTEAD OF DELETE

AS

BEGIN
  SET NOCOUNT ON;
  
SET IDENTITY_INSERT AEON_SA_Archive..TrxVasPayatArchive ON

DELETE FROM TrxVasPayAt WHERE TrxId IN (SELECT TrxId FROM deleted)

INSERT INTO AEON_SA_Archive..TrxVasPayAtArchive 
(PayAtID,TrxTypeId,TrxId,AccountNo,TrxAmount,MerchantId,TerminalId,TransactionType,Status,ResponseCode,ResponseDesc,BuildResponse,ClientDetail,ConfirmCode,ConfirmDesc,RollbackTrx,TrxDate,ExternalRef,ReceiptNo,ReceiverCode,PaymentFee,ProviderId,ProductId,Verify)  

SELECT 
PayAtID,TrxTypeId,TrxId,AccountNo,TrxAmount,MerchantId,TerminalId,TransactionType,Status,ResponseCode,ResponseDesc,BuildResponse,ClientDetail,ConfirmCode,ConfirmDesc,RollbackTrx,TrxDate,ExternalRef,ReceiptNo,ReceiverCode,PaymentFee,ProviderId,ProductId,Verify
FROM Deleted

DELETE FROM TrxRefundLog 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE TrxRefundLog.TrxId = deleted.TrxId)

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)

SET IDENTITY_INSERT AEON_SA_Archive..TrxVasPayatArchive OFF

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxVasPayAt_InsteadOf]
    ON [dbo].[TrxVasPayAt];


GO



