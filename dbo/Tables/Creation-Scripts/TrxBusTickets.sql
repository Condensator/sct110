CREATE TABLE [dbo].[TrxBusTickets] (
    [Id]           INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [VoucherId]    INT          NOT NULL,
    [Status]       INT          NOT NULL,
    [Date]         DATETIME     NOT NULL,
    [ValidFrom]    DATETIME     NOT NULL,
    [ValidTo]      DATETIME     NOT NULL,
    [TrxId]        BIGINT       NOT NULL,
    [DevId]        INT          NOT NULL,
    [TicketType]   VARCHAR (16) NOT NULL,
    [BusProductId] INT          NOT NULL
);


GO

ALTER TABLE [dbo].[TrxBusTickets]
    ADD CONSTRAINT [PK_TrxBusTickets] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



CREATE UNIQUE NONCLUSTERED INDEX [ndxTBTrxId]
    ON [dbo].[TrxBusTickets]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO




CREATE TRIGGER [dbo].[utr_DELETE_TrxBusTickets_After] ON [dbo].[TrxBusTickets]
AFTER DELETE 
AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxBusTicketsArchive
(Id, VoucherId, Status, Date, ValidFrom, ValidTo, TrxId, DevId, TicketType, BusProductId)
  
SELECT 
	Id, VoucherId, Status, Date, ValidFrom, ValidTo, TrxId, DevId, TicketType, BusProductId
FROM deleted

DELETE FROM Trx 
    WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)
    
END
GO



