CREATE TABLE [dbo].[TJReversals] (
    [TrxId]       BIGINT        NULL,
    [Date]        DATETIME      NULL,
    [TransNumber] VARCHAR (10)  NULL,
    [MeterNumber] VARCHAR (30)  NULL,
    [Amount]      MONEY         NULL,
    [Reference]   VARCHAR (100) NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxTrxIdTReversals]
    ON [dbo].[TJReversals]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO




  
CREATE TRIGGER [dbo].[utr_DELETE_TJReversals_After] ON [dbo].[TJReversals]  
AFTER DELETE   
  
AS   
  
BEGIN   
  SET NOCOUNT ON;  
    
INSERT INTO AEON_SA_Archive..TJReversalsArchive  
(TrxId,Date,TransNumber,MeterNumber,Amount,Reference)  
    
SELECT  
TrxId,Date,TransNumber,MeterNumber,Amount,Reference  
FROM deleted  
  
END
GO



