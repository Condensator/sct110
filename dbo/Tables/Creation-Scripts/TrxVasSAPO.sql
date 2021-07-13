CREATE TABLE [dbo].[TrxVasSAPO] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [TrxId]             BIGINT        NOT NULL,
    [ProviderId]        INT           NOT NULL,
    [ProductId]         INT           NOT NULL,
    [Amount]            MONEY         NOT NULL,
    [TransactionId]     VARCHAR (15)  NULL,
    [TenderType]        VARCHAR (15)  NULL,
    [Merchant]          VARCHAR (30)  NULL,
    [ChannelId]         INT           NULL,
    [ChannelName]       VARCHAR (30)  NULL,
    [ServiceProviderId] VARCHAR (15)  NULL,
    [PrincipleId]       VARCHAR (15)  NULL,
    [ReceiverCode]      VARCHAR (15)  NULL,
    [CostCentre]        VARCHAR (15)  NULL,
    [SentFieldString]   VARCHAR (200) NULL,
    [Date]              DATETIME      NULL,
    [RefNoResp]         VARCHAR (30)  NULL,
    [TransactionIdResp] VARCHAR (15)  NULL,
    [Status]            INT           NULL,
    [ErrorCode]         INT           NULL,
    [ErrorMessage]      VARCHAR (50)  NULL,
    [AccountNumber]     VARCHAR (200) NULL,
    [RefNo]             VARCHAR (20)  NULL,
    [OriginalTrxId]     BIGINT        NULL,
    [Refund]            BIT           NULL,
    [stan]              VARCHAR (10)  NULL
);


GO

ALTER TABLE [dbo].[TrxVasSAPO]
    ADD CONSTRAINT [DF__TrxVasSAP__Refun__38E90EAA] DEFAULT ((0)) FOR [Refund];


GO



ALTER TABLE [dbo].[TrxVasSAPO]
    ADD CONSTRAINT [DF_TrxVasSAPO_Date] DEFAULT (getdate()) FOR [Date];


GO



CREATE NONCLUSTERED INDEX [index_45740_45739_TrxVasSAPO]
    ON [dbo].[TrxVasSAPO]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IX_TrxVasSAPO_Id]
    ON [dbo].[TrxVasSAPO]([Id] ASC)
    INCLUDE([TrxId], [Amount], [TenderType], [Merchant], [PrincipleId], [CostCentre], [SentFieldString], [Date], [RefNoResp], [TransactionIdResp], [Status], [AccountNumber], [Refund], [stan]);


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxVasSAPO_InsteadOf] ON [dbo].[TrxVasSAPO] 
INSTEAD OF DELETE

AS

BEGIN
  SET NOCOUNT ON;
  
  --SET IDENTITY_INSERT TrxVasSAPOArchive ON

DELETE FROM TrxVasSAPO WHERE TrxId IN (SELECT TrxId FROM deleted)

INSERT INTO AEON_SA_Archive..TrxVasSAPOArchive 
(TrxId,ProviderId,ProductId,Amount,TransactionId,TenderType,Merchant,ChannelId,ChannelName,ServiceProviderId,PrincipleId,ReceiverCode,CostCentre,SentFieldString,Date,RefNoResp,TransactionIdResp,Status,ErrorCode,ErrorMessage,AccountNumber,RefNo,OriginalTrxId,Refund,stan)  

SELECT 
TrxId,ProviderId,ProductId,Amount,TransactionId,TenderType,Merchant,ChannelId,ChannelName,ServiceProviderId,PrincipleId,ReceiverCode,CostCentre,SentFieldString,Date,RefNoResp,TransactionIdResp,Status,ErrorCode,ErrorMessage,AccountNumber,RefNo,OriginalTrxId,Refund,stan
FROM Deleted

DELETE FROM TrxRefundLog 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE TrxRefundLog.TrxId = deleted.TrxId)

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)

--SET IDENTITY_INSERT TrxVasSAPOArchive OFF

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxVasSAPO_InsteadOf]
    ON [dbo].[TrxVasSAPO];


GO



