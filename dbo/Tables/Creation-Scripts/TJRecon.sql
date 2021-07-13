CREATE TABLE [dbo].[TJRecon] (
    [TrxId]          BIGINT       NOT NULL,
    [BatchNumber]    VARCHAR (10) NULL,
    [TerminalId]     VARCHAR (10) NULL,
    [MerchantId]     VARCHAR (20) NULL,
    [TransNumber]    VARCHAR (10) NULL,
    [TransReference] VARCHAR (15) NULL,
    [SysReference]   VARCHAR (40) NULL,
    [TransDateTime]  DATETIME     NULL,
    [BusinessDate]   DATETIME     NULL,
    [TransType]      VARCHAR (4)  NULL,
    [AccountNumber]  VARCHAR (40) NULL,
    [ProductId]      VARCHAR (60) NULL,
    [Amount]         INT          NULL,
    [Authoriser]     VARCHAR (60) NULL,
    [ProductName]    VARCHAR (60) NULL
);


GO

ALTER TABLE [dbo].[TJRecon]
    ADD CONSTRAINT [PK_TJRecon_BigInt] PRIMARY KEY CLUSTERED ([TrxId] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxTJReconAccountNumber_BigInt]
    ON [dbo].[TJRecon]([AccountNumber] ASC);


GO




CREATE TRIGGER [dbo].[utr_DELETE_TJRecon_After_BigInt] ON [dbo].[TJRecon]
AFTER DELETE 

AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TJReconArchive
(TrxId,BatchNumber,TerminalId,MerchantId,TransNumber,TransReference,SysReference,TransDateTime,
BusinessDate,TransType,AccountNumber,ProductId,Amount,Authoriser,ProductName)
  
SELECT
TrxId,BatchNumber,TerminalId,MerchantId,TransNumber,TransReference,SysReference,TransDateTime,
BusinessDate,TransType,AccountNumber,ProductId,Amount,Authoriser,ProductName
FROM deleted

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TJRecon_After_BigInt]
    ON [dbo].[TJRecon];


GO



