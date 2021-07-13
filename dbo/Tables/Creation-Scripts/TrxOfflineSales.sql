CREATE TABLE [dbo].[TrxOfflineSales] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [TrxId]        BIGINT       NOT NULL,
    [Reference]    VARCHAR (50) NULL,
    [Description]  VARCHAR (50) NULL,
    [Amount]       MONEY        NULL,
    [Date]         DATETIME     NOT NULL,
    [DevId]        INT          NOT NULL,
    [UserId]       INT          NOT NULL,
    [RecordedDate] DATETIME     NULL
);


GO



CREATE TRIGGER [dbo].[utr_DELETE_TrxOfflineSales_After] ON [dbo].[TrxOfflineSales]
AFTER DELETE 
AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxOfflineSalesArchive
(Id,TrxId,Reference,Description,Amount,Date,DevId,UserId,RecordedDate)
  
SELECT 
	Id,TrxId,Reference,Description,Amount,Date,DevId,UserId,RecordedDate
FROM deleted

DELETE FROM Trx 
    WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)
    
END
GO



