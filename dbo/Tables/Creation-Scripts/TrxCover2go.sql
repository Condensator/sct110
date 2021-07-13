CREATE TABLE [dbo].[TrxCover2go] (
    [Id]             INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [PolicyId]       INT          NOT NULL,
    [dateTime]       DATETIME     NOT NULL,
    [TransactionRef] VARCHAR (50) NOT NULL,
    [ReceiptRef]     INT          NOT NULL,
    [Amount]         MONEY        NOT NULL,
    [TrxId]          BIGINT       NOT NULL,
    [Description]    VARCHAR (50) NOT NULL
);


GO

ALTER TABLE [dbo].[TrxCover2go]
    ADD CONSTRAINT [PK_TrxCover2go] PRIMARY KEY CLUSTERED ([Id] ASC);


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxCover2go_After] ON [dbo].[TrxCover2go]
AFTER DELETE 
AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxCover2goArchive
(Id,PolicyId,dateTime,TransactionRef,ReceiptRef,Amount,TrxId,Description)
  
SELECT 
	Id,PolicyId,dateTime,TransactionRef,ReceiptRef,Amount,TrxId,Description
FROM deleted

DELETE FROM Trx 
    WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)
    
END
GO



