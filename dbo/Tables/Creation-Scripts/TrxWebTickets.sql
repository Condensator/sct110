CREATE TABLE [dbo].[TrxWebTickets] (
    [id]                    INT            IDENTITY (1, 1) NOT NULL,
    [TransactionID]         INT            NOT NULL,
    [Barcode]               NVARCHAR (20)  NOT NULL,
    [Cost]                  MONEY          NOT NULL,
    [TransactionDate]       DATETIME       NOT NULL,
    [TrxId]                 BIGINT         NOT NULL,
    [PerformanceId]         NVARCHAR (10)  NOT NULL,
    [Quantity]              INT            NOT NULL,
    [CellPhoneNumber]       NVARCHAR (10)  NOT NULL,
    [Performance_Date_Time] DATETIME       NULL,
    [BuildResponse]         VARCHAR (4000) NULL,
    [ProductId]             INT            NULL
);


GO

ALTER TABLE [dbo].[TrxWebTickets]
    ADD CONSTRAINT [DF__TrxWebTic__Produ__29971A18] DEFAULT ((0)) FOR [ProductId];


GO



ALTER TABLE [dbo].[TrxWebTickets]
    ADD CONSTRAINT [PK_TrxWebTickets] PRIMARY KEY CLUSTERED ([id] ASC);


GO




CREATE TRIGGER [dbo].[utr_DELETE_TrxWebTickets_After] ON [dbo].[TrxWebTickets]
AFTER DELETE

AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxWebTicketsArchive
(id,TransactionID,Barcode,Cost,TransactionDate,TrxId,PerformanceId,Quantity,CellPhoneNumber,
Performance_Date_Time,BuildResponse,ProductId)
  
SELECT 
id,TransactionID,Barcode,Cost,TransactionDate,TrxId,PerformanceId,Quantity,CellPhoneNumber,
Performance_Date_Time,BuildResponse,ProductId
FROM Deleted

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)

END
GO



