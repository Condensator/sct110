CREATE TABLE [dbo].[TrxMPower] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [TrxTypeId]           INT            NULL,
    [ProductId]           INT            NULL,
    [TrxId]               BIGINT         NULL,
    [AccountNumber]       VARCHAR (50)   NULL,
    [TrxAmount]           MONEY          NULL,
    [TrxDate]             DATE           NULL,
    [ResponseDescription] VARCHAR (50)   NULL,
    [MpownerRequest]      VARCHAR (5000) NULL,
    [MpowerResponse]      VARCHAR (5000) NULL
);


GO

ALTER TABLE [dbo].[TrxMPower]
    ADD CONSTRAINT [PK_TrxMPower] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxMPowerAccNumber]
    ON [dbo].[TrxMPower]([AccountNumber] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxMPowerTrxid]
    ON [dbo].[TrxMPower]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxMPower_InsteadOf] ON [dbo].[TrxMPower] 
INSTEAD OF DELETE

AS

BEGIN
  SET NOCOUNT ON;
  

DELETE FROM TrxMpower WHERE TrxId IN (SELECT TrxId FROM deleted)

INSERT INTO [AEON_SA_Archive]..TrxMpowerArchive 
(Id,TrxTypeId,ProductId,TrxId,AccountNumber,TrxAmount,TrxDate,ResponseDescription,MpownerRequest,MpowerResponse)  

SELECT 
Id,TrxTypeId,ProductId,TrxId,AccountNumber,TrxAmount,TrxDate,ResponseDescription,MpownerRequest,MpowerResponse
FROM Deleted

DELETE FROM TrxRefundLog 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE TrxRefundLog.TrxId = deleted.TrxId)

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)



END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxMPower_InsteadOf]
    ON [dbo].[TrxMPower];


GO



