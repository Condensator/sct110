CREATE TABLE [dbo].[TrxVasSyntellFinePayment] (
    [SyntellFinePaymentId] INT            IDENTITY (1, 1) NOT NULL,
    [TrxTypeId]            INT            NULL,
    [TrxId]                BIGINT         NULL,
    [NoticeNo]             VARCHAR (50)   NULL,
    [TrxAmount]            MONEY          NULL,
    [MerchantId]           VARCHAR (50)   NULL,
    [TerminalId]           VARCHAR (50)   NULL,
    [TransactionType]      VARCHAR (50)   NULL,
    [Status]               INT            NULL,
    [ResponseCode]         INT            NULL,
    [ResponseDesc]         VARCHAR (50)   NULL,
    [BuildResponse]        VARCHAR (1000) NULL,
    [ConfirmCode]          INT            NULL,
    [ConfirmDesc]          VARCHAR (100)  NULL,
    [RollbackTrx]          BIT            NULL,
    [TrxDate]              DATETIME       NULL,
    [ExternalRef]          VARCHAR (50)   NULL,
    [ReceiptNo]            VARCHAR (50)   NULL,
    [ReceiverCode]         VARCHAR (50)   NULL,
    [PaymentFee]           MONEY          NULL,
    [ProviderId]           INT            NULL,
    [ProductId]            INT            NULL
);


GO

ALTER TABLE [dbo].[TrxVasSyntellFinePayment]
    ADD CONSTRAINT [PK_TrxVasSyntellFinePayment] PRIMARY KEY CLUSTERED ([SyntellFinePaymentId] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxNoticeNo]
    ON [dbo].[TrxVasSyntellFinePayment]([NoticeNo] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxidSyntellFine]
    ON [dbo].[TrxVasSyntellFinePayment]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxVasSyntellFinePayment_InsteadOf] ON [dbo].[TrxVasSyntellFinePayment] 
INSTEAD OF DELETE

AS

BEGIN
  SET NOCOUNT ON;
  
SET IDENTITY_INSERT AEON_SA_Archive..TrxVasSyntellFinePaymentArchive ON

DELETE FROM TrxVasSyntellFinePayment WHERE TrxId IN (SELECT TrxId FROM deleted)

INSERT INTO AEON_SA_Archive..TrxVasSyntellFinePaymentArchive 
(SyntellFinePaymentId,TrxTypeId,TrxId,NoticeNo,TrxAmount,MerchantId,TerminalId,TransactionType,Status,ResponseCode,ResponseDesc,BuildResponse,ConfirmCode,ConfirmDesc,RollbackTrx,TrxDate,ExternalRef,ReceiptNo,ReceiverCode,PaymentFee,ProviderId,ProductId)  

SELECT 
SyntellFinePaymentId,TrxTypeId,TrxId,NoticeNo,TrxAmount,MerchantId,TerminalId,TransactionType,Status,ResponseCode,ResponseDesc,BuildResponse,ConfirmCode,ConfirmDesc,RollbackTrx,TrxDate,ExternalRef,ReceiptNo,ReceiverCode,PaymentFee,ProviderId,ProductId
FROM Deleted

DELETE FROM TrxRefundLog 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE TrxRefundLog.TrxId = deleted.TrxId)

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)

SET IDENTITY_INSERT AEON_SA_Archive..TrxVasSyntellFinePaymentArchive OFF

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxVasSyntellFinePayment_InsteadOf]
    ON [dbo].[TrxVasSyntellFinePayment];


GO




CREATE TRIGGER utr_TrxVasSyntellFinePayment_InsteadOf_Insert
   ON TrxVasSyntellFinePayment
   INSTEAD OF INSERT
AS 
BEGIN
   
	SET NOCOUNT ON;
    INSERT INTO TrxVasSyntellFinePayment (SyntellFinePaymentId ,TrxTypeId ,TrxId ,NoticeNo ,TrxAmount ,
        MerchantId ,TerminalId ,TransactionType ,Status ,ResponseCode ,
        ResponseDesc ,BuildResponse ,ConfirmCode ,ConfirmDesc ,RollbackTrx ,
        TrxDate ,ExternalRef ,ReceiptNo ,ReceiverCode ,PaymentFee ,
        ProviderId ,ProductId)

    SELECT
      i.SyntellFinePaymentId ,i.TrxTypeId ,i.TrxId ,i.NoticeNo ,i.TrxAmount ,
      i.MerchantId ,i.TerminalId ,i.TransactionType ,i.Status ,i.ResponseCode ,
      i.ResponseDesc ,i.BuildResponse ,i.ConfirmCode ,i.ConfirmDesc ,i.RollbackTrx ,
      i.TrxDate ,i.ExternalRef ,i.ReceiptNo ,i.ReceiverCode ,i.PaymentFee ,
      i.ProviderId ,i.ProductId
    FROM inserted i
	LEFT OUTER JOIN TrxVasSyntellFinePayment H ON i.SyntellFinePaymentId =h.SyntellFinePaymentId 
	WHERE  H.SyntellFinePaymentId IS NULL
	SET NOCOUNT OFF;

END
GO



