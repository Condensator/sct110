CREATE TABLE [dbo].[TrxReversal] (
    [Id]             INT      IDENTITY (1, 1) NOT NULL,
    [TrxId]          BIGINT   NOT NULL,
    [TrxId_Reversed] BIGINT   NOT NULL,
    [Date]           DATETIME NOT NULL,
    [Result]         INT      NOT NULL,
    [Status]         INT      NOT NULL,
    [Amount]         MONEY    NULL
);


GO

ALTER TABLE [dbo].[TrxReversal]
    ADD CONSTRAINT [DF_TrxReversal_Date] DEFAULT (getdate()) FOR [Date];


GO



CREATE NONCLUSTERED INDEX [ndxId]
    ON [dbo].[TrxReversal]([Id] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxId]
    ON [dbo].[TrxReversal]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxIdRev]
    ON [dbo].[TrxReversal]([TrxId_Reversed] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO




CREATE TRIGGER [dbo].[utr_DELETE_TrxReversal_After] ON [dbo].[TrxReversal]
AFTER DELETE

AS 
BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxReversalArchive
(Id,TrxId,TrxId_Reversed,Date,Result,Status,Amount)
  
SELECT 
Id,TrxId,TrxId_Reversed,Date,Result,Status,Amount
FROM Deleted

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)

END
GO



