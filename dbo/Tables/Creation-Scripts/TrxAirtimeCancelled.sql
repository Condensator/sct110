CREATE TABLE [dbo].[TrxAirtimeCancelled] (
    [id]          BIGINT IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [AirtimeId]   BIGINT NULL,
    [DevId]       INT    NULL,
    [StockTypeId] INT    NULL,
    [StockId]     INT    NULL,
    [Used]        BIT    DEFAULT ((0)) NULL,
    [TrxId]       BIGINT NULL
);


GO

ALTER TABLE [dbo].[TrxAirtimeCancelled]
    ADD CONSTRAINT [PK_TrxAirtimeCancelled] PRIMARY KEY CLUSTERED ([id] ASC);


GO



CREATE NONCLUSTERED INDEX [idx_TrxAirtimeCancelled_AirtimeId]
    ON [dbo].[TrxAirtimeCancelled]([AirtimeId] ASC) WITH (FILLFACTOR = 70)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_TrxAirtimeCancelled_DevId]
    ON [dbo].[TrxAirtimeCancelled]([DevId] ASC) WITH (FILLFACTOR = 80, ALLOW_PAGE_LOCKS = OFF, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_TrxAirtimeCancelled_Devid_Used]
    ON [dbo].[TrxAirtimeCancelled]([DevId] ASC, [Used] ASC)
    INCLUDE([StockTypeId]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_TrxAirtimeCancelled_DevId_Used_AirtimeId]
    ON [dbo].[TrxAirtimeCancelled]([DevId] ASC, [Used] ASC, [AirtimeId] ASC)
    INCLUDE([StockTypeId]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_TrxAirtimeCancelled_Used]
    ON [dbo].[TrxAirtimeCancelled]([Used] ASC) WITH (FILLFACTOR = 80, ALLOW_PAGE_LOCKS = OFF, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_TrxAirtimeCancelled_Used_AirtimeId]
    ON [dbo].[TrxAirtimeCancelled]([Used] ASC)
    INCLUDE([AirtimeId]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxAirTimeCancelled_After] ON [dbo].[TrxAirtimeCancelled] 
AFTER DELETE

AS 

BEGIN
  SET NOCOUNT ON;
INSERT INTO AEON_SA_Archive..TrxAirTimeCancelledArchive
(id,AirtimeId,DevId,StockTypeId,StockId,Used)
  
SELECT 
id,AirtimeId,DevId,StockTypeId,StockId,Used 
FROM Deleted
END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxAirTimeCancelled_After]
    ON [dbo].[TrxAirtimeCancelled];


GO



