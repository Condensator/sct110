CREATE TABLE [dbo].[TrxIthuba_Recovery] (
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

ALTER TABLE [dbo].[TrxIthuba_Recovery]
    ADD CONSTRAINT [DF_TrxIthuba_IsDeleted_Recovery] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[TrxIthuba_Recovery]
    ADD CONSTRAINT [PK_TrxIthuba_Recovery] PRIMARY KEY CLUSTERED ([ItbId] ASC);


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxIthuba_Recovery_After] ON [dbo].[TrxIthuba_Recovery]
AFTER DELETE 
AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxIthuba_RecoveryArchive
(ItbId,TrxId,Serial,TrxAmt,IsDeleted,DevId,Date,VasProdId,MerchId,Seq,Description,BusDate,Barcode,ProductId)
  
SELECT 
	ItbId,TrxId,Serial,TrxAmt,IsDeleted,DevId,Date,VasProdId,MerchId,Seq,Description,BusDate,Barcode,ProductId
FROM deleted


    
END
GO



