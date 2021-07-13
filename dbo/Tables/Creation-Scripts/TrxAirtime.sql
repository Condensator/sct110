CREATE TABLE [dbo].[TrxAirtime] (
    [AirId]           BIGINT         IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [TrxId]           BIGINT         NOT NULL,
    [StockTypeId]     INT            NULL,
    [StockId]         INT            NULL,
    [StockTypeName]   NVARCHAR (50)  NULL,
    [TrxAmount]       MONEY          NULL,
    [AmsResponse]     VARCHAR (5000) NULL,
    [IsDeleted]       BIT            NOT NULL,
    [Status]          INT            NULL,
    [Date]            DATETIME       NULL,
    [TrxId_Reversal]  BIGINT         NULL,
    [DevId]           INT            NULL,
    [ClientReference] VARCHAR (50)   NULL,
    [BatchID]         VARCHAR (50)   NULL,
    [dtTimestamp]     ROWVERSION     NOT NULL
);


GO

ALTER TABLE [dbo].[TrxAirtime]
    ADD CONSTRAINT [DF_TrxAirtime__IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[TrxAirtime]
    ADD CONSTRAINT [DF_TrxAirtime__TrxAmount] DEFAULT ((0)) FOR [TrxAmount];


GO



ALTER TABLE [dbo].[TrxAirtime]
    ADD CONSTRAINT [PK_TrxAirtime_AirId] PRIMARY KEY CLUSTERED ([AirId] ASC) WITH (FILLFACTOR = 100);


GO



CREATE NONCLUSTERED INDEX [Idx_TrxAirtime_Date]
    ON [dbo].[TrxAirtime]([Date] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [Idx_TrxAirtime_DevId]
    ON [dbo].[TrxAirtime]([DevId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [Idx_TrxAirtime_Status_DevId_ClientReference]
    ON [dbo].[TrxAirtime]([Status] ASC, [DevId] ASC, [ClientReference] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [Idx_TrxAirtime_StockId]
    ON [dbo].[TrxAirtime]([StockId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE UNIQUE NONCLUSTERED INDEX [Idx_TrxAirtime_TrxId]
    ON [dbo].[TrxAirtime]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO




  
CREATE TRIGGER [dbo].[utr_DELETE_TrxAirtime_InsteadOf] ON [dbo].[TrxAirtime]   
INSTEAD OF DELETE  
  
AS  
  
BEGIN  
  SET NOCOUNT ON;  
    
  
IF EXISTS (SELECT TrxId from TrxAirtime where TrxId in (SELECT TrxId from Deleted))  
DELETE b FROM TrxAirtimeCancelled b JOIN TrxAirtime a ON b.AirtimeId = a.AirId   
WHERE a.TrxId IN (SELECT TrxId FROM deleted)  
  
--IF EXISTS (SELECT TrxId from TrxAirtime where TrxId in (SELECT TrxId from Deleted))  
--DELETE c FROM TrxIntegrated c JOIN TrxAirtime d ON c.AirTrxID = d.AirId   
--WHERE d.TrxId IN (SELECT TrxId FROM deleted)  
  
DELETE FROM TrxAirtime WHERE TrxId IN (SELECT TrxId FROM deleted)  
  
INSERT INTO AEON_SA_Archive..TrxAirTimeArchive   
(AirId,TrxId,StockTypeId,StockId,StockTypeName,TrxAmount,AmsResponse,IsDeleted,Status,Date,  
TrxId_Reversal,DevId,ClientReference)    
  
SELECT   
AirId,TrxId,StockTypeId,StockId,StockTypeName,TrxAmount,AmsResponse,IsDeleted,Status,Date,  
TrxId_Reversal,DevId,ClientReference  
FROM Deleted  
  
DELETE FROM Trx   
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)  
  
END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxAirtime_InsteadOf]
    ON [dbo].[TrxAirtime];


GO



