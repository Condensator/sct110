CREATE TABLE [dbo].[TrxVasSyntellAccPayment] (
    [SyntellAccPaymentId] INT            IDENTITY (1, 1) NOT NULL,
    [TrxTypeId]           INT            NULL,
    [TrxId]               BIGINT         NULL,
    [AccountNo]           VARCHAR (50)   NULL,
    [TrxAmount]           MONEY          NULL,
    [MerchantId]          VARCHAR (50)   NULL,
    [TerminalId]          VARCHAR (50)   NULL,
    [TransactionType]     VARCHAR (50)   NULL,
    [Status]              INT            NULL,
    [ResponseCode]        INT            NULL,
    [ResponseDesc]        VARCHAR (50)   NULL,
    [BuildResponse]       VARCHAR (1000) NULL,
    [ConfirmCode]         INT            NULL,
    [ConfirmDesc]         VARCHAR (100)  NULL,
    [RollbackTrx]         BIT            NULL,
    [TrxDate]             DATETIME       NULL,
    [ExternalRef]         VARCHAR (50)   NULL,
    [ReceiptNo]           VARCHAR (50)   NULL,
    [ReceiverCode]        VARCHAR (50)   NULL,
    [PaymentFee]          MONEY          NULL,
    [ProviderId]          INT            NULL,
    [ProductId]           INT            NULL
);


GO

ALTER TABLE [dbo].[TrxVasSyntellAccPayment]
    ADD CONSTRAINT [PK_TrxVasSyntellAccPayment] PRIMARY KEY CLUSTERED ([SyntellAccPaymentId] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxSyntelAccNumber]
    ON [dbo].[TrxVasSyntellAccPayment]([AccountNo] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxVasSynTrxid]
    ON [dbo].[TrxVasSyntellAccPayment]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxVasSyntellAccPayment_InsteadOf] ON [dbo].[TrxVasSyntellAccPayment] 
INSTEAD OF DELETE

AS

BEGIN
  SET NOCOUNT ON;
  
SET IDENTITY_INSERT AEON_SA_Archive..TrxVasSyntellAccPaymentArchive ON 

DELETE FROM TrxVasSyntellAccPayment WHERE TrxId IN (SELECT TrxId FROM deleted)

INSERT INTO AEON_SA_Archive..TrxVasSyntellAccPaymentArchive 
(SyntellAccPaymentId,TrxTypeId,TrxId,AccountNo,TrxAmount,MerchantId,TerminalId,TransactionType,Status,ResponseCode,ResponseDesc,BuildResponse,ConfirmCode,ConfirmDesc,RollbackTrx,TrxDate,ExternalRef,ReceiptNo,ReceiverCode,PaymentFee,ProviderId,ProductId)  

SELECT 
SyntellAccPaymentId,TrxTypeId,TrxId,AccountNo,TrxAmount,MerchantId,TerminalId,TransactionType,Status,ResponseCode,ResponseDesc,BuildResponse,ConfirmCode,ConfirmDesc,RollbackTrx,TrxDate,ExternalRef,ReceiptNo,ReceiverCode,PaymentFee,ProviderId,ProductId
FROM Deleted

DELETE FROM TrxRefundLog 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE TrxRefundLog.TrxId = deleted.TrxId)

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)

SET IDENTITY_INSERT AEON_SA_Archive..TrxVasSyntellAccPaymentArchive OFF
END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxVasSyntellAccPayment_InsteadOf]
    ON [dbo].[TrxVasSyntellAccPayment];


GO



