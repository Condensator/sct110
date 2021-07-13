CREATE TABLE [dbo].[TrxIthuba] (
    [ItbId]       INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [TrxId]       BIGINT       NULL,
    [Serial]      VARCHAR (50) NULL,
    [TrxAmt]      MONEY        NULL,
    [IsDeleted]   BIT          NOT NULL,
    [DevId]       INT          NULL,
    [Date]        DATETIME     NULL,
    [VasProdId]   INT          NULL,
    [MerchId]     VARCHAR (15) NULL,
    [Seq]         INT          NULL,
    [Description] VARCHAR (50) NULL,
    [BusDate]     VARCHAR (4)  NULL,
    [Barcode]     VARCHAR (30) NULL,
    [ProductId]   VARCHAR (14) NULL
);


GO

ALTER TABLE [dbo].[TrxIthuba]
    ADD CONSTRAINT [DF_TrxIthuba_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[TrxIthuba]
    ADD CONSTRAINT [PK_TrxIthuba] PRIMARY KEY CLUSTERED ([ItbId] ASC);


GO



CREATE NONCLUSTERED INDEX [IX_TrxIthuba_Serial]
    ON [dbo].[TrxIthuba]([Serial] ASC)
    INCLUDE([ItbId]);


GO



CREATE NONCLUSTERED INDEX [IX_TrxIthuba_TrxId]
    ON [dbo].[TrxIthuba]([TrxId] ASC);


GO






CREATE TRIGGER [dbo].[utr_DELETE_TrxIthuba_After] ON [dbo].[TrxIthuba]
AFTER DELETE 
AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxIthubaArchive
(ItbId,TrxId,Serial,TrxAmt,IsDeleted,DevId,Date,VasProdId,MerchId,Seq,Description,BusDate,Barcode,ProductId)
  
SELECT 
	ItbId,TrxId,Serial,TrxAmt,IsDeleted,DevId,Date,VasProdId,MerchId,Seq,Description,BusDate,Barcode,ProductId
FROM deleted

DELETE FROM TrxIthuba_Recovery
    WHERE EXISTS(SELECT TrxId FROM deleted WHERE TrxIthuba_Recovery.TrxId = deleted.TrxId)

DELETE FROM Trx 
    WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)
    
END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxIthuba_After]
    ON [dbo].[TrxIthuba];


GO



