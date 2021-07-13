CREATE TABLE [dbo].[TrxTicketPro] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [TrxId]              BIGINT        NOT NULL,
    [ProductId]          INT           NOT NULL,
    [TicketProTrxId]     VARCHAR (60)  NULL,
    [Reference]          VARCHAR (20)  NULL,
    [XMLPaymentResponse] VARCHAR (500) NULL
);


GO

ALTER TABLE [dbo].[TrxTicketPro]
    ADD CONSTRAINT [PK__TrxTicke__3214EC0721F5F850] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



CREATE NONCLUSTERED INDEX [IDX_TrxTicketPro_TicketProTrxId]
    ON [dbo].[TrxTicketPro]([TicketProTrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTicketProReference]
    ON [dbo].[TrxTicketPro]([Reference] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxTickerPro]
    ON [dbo].[TrxTicketPro]([TrxId] ASC)
    INCLUDE([TicketProTrxId], [Reference]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxTicketPros_InsteadOf] ON [dbo].[TrxTicketPro] 
INSTEAD OF DELETE

AS

BEGIN
  SET NOCOUNT ON;
  
SET IDENTITY_INSERT [AEON_SA_Archive]..TrxTicketProArchive ON

DELETE FROM TrxTicketPro WHERE TrxId IN (SELECT TrxId FROM deleted)

INSERT INTO [AEON_SA_Archive]..TrxTicketProArchive 
(Id,TrxId,ProductId,TicketProTrxId,Reference,XMLPaymentResponse)  

SELECT 
Id,TrxId,ProductId,TicketProTrxId,Reference,XMLPaymentResponse
FROM Deleted

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)

SET IDENTITY_INSERT [AEON_SA_Archive]..TrxTicketProArchive OFF

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxTicketPros_InsteadOf]
    ON [dbo].[TrxTicketPro];


GO



