CREATE TABLE [dbo].[TrxVasPayAtInsurance] (
    [PayAtInsuranceID] INT            IDENTITY (1, 1) NOT NULL,
    [TrxTypeId]        INT            NULL,
    [TrxId]            BIGINT         NULL,
    [AccountNo]        VARCHAR (50)   NULL,
    [TrxAmount]        MONEY          NULL,
    [MerchantId]       VARCHAR (50)   NULL,
    [TerminalId]       VARCHAR (50)   NULL,
    [TransactionType]  VARCHAR (50)   NULL,
    [Status]           INT            NULL,
    [ResponseCode]     INT            NULL,
    [ResponseDesc]     VARCHAR (200)  NULL,
    [BuildResponse]    VARCHAR (1000) NULL,
    [BuildRequest]     VARCHAR (1000) NULL,
    [ClientDetail]     VARCHAR (1000) NULL,
    [ConfirmCode]      INT            NULL,
    [ConfirmDesc]      VARCHAR (100)  NULL,
    [RollbackTrx]      BIT            NULL,
    [TrxDate]          DATETIME       NULL,
    [ExternalRef]      VARCHAR (50)   NULL,
    [ReceiptNo]        VARCHAR (50)   NULL,
    [ReceiverCode]     VARCHAR (50)   NULL,
    [PaymentFee]       MONEY          NULL,
    [ProviderId]       INT            NULL,
    [ProductId]        INT            NULL
);


GO

ALTER TABLE [dbo].[TrxVasPayAtInsurance]
    ADD CONSTRAINT [PK_TrxPayAtInsurance] PRIMARY KEY CLUSTERED ([PayAtInsuranceID] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxPayAtInsAccountNo]
    ON [dbo].[TrxVasPayAtInsurance]([AccountNo] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxidPayAtInsurance]
    ON [dbo].[TrxVasPayAtInsurance]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxVasPayAtInsurance_InsteadOf] ON [dbo].[TrxVasPayAtInsurance] 
INSTEAD OF DELETE

AS

BEGIN
  SET NOCOUNT ON;
  
SET IDENTITY_INSERT TrxVasPayAtInsuranceArchive ON


DELETE FROM TrxVasPayAtInsurance WHERE TrxId IN (SELECT TrxId FROM deleted)

INSERT INTO TrxVasPayAtInsuranceArchive 
(PayAtInsuranceID,TrxTypeId,TrxId,AccountNo,TrxAmount,MerchantId,TerminalId,TransactionType,Status,ResponseCode,ResponseDesc,BuildResponse,BuildRequest,ClientDetail,ConfirmCode,ConfirmDesc,RollbackTrx,TrxDate,ExternalRef,ReceiptNo,ReceiverCode,PaymentFee,ProviderId,ProductId)  

SELECT 
PayAtInsuranceID,TrxTypeId,TrxId,AccountNo,TrxAmount,MerchantId,TerminalId,TransactionType,Status,ResponseCode,ResponseDesc,BuildResponse,BuildRequest,ClientDetail,ConfirmCode,ConfirmDesc,RollbackTrx,TrxDate,ExternalRef,ReceiptNo,ReceiverCode,PaymentFee,ProviderId,ProductId
FROM Deleted

DELETE FROM TrxRefundLog 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE TrxRefundLog.TrxId = deleted.TrxId)

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)

SET IDENTITY_INSERT TrxVasPayAtInsuranceArchive ON


END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxVasPayAtInsurance_InsteadOf]
    ON [dbo].[TrxVasPayAtInsurance];


GO



