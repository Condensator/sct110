CREATE TABLE [dbo].[TrxBusReservation] (
    [Id]                   INT             IDENTITY (1, 1) NOT NULL,
    [TrxId]                BIGINT          NOT NULL,
    [Seats]                INT             NOT NULL,
    [BoardingRoute]        VARCHAR (20)    NULL,
    [BoardingDate]         DATETIME        NULL,
    [Carrier]              VARCHAR (20)    NULL,
    [TraceNum]             VARCHAR (50)    NULL,
    [amount]               DECIMAL (19, 4) NULL,
    [ProductId]            INT             NULL,
    [PassengerReferenceID] VARCHAR (50)    NULL,
    [CancellationReason]   VARCHAR (250)   NULL,
    [ContactNumber]        VARCHAR (15)    NULL,
    [ServiceNumber]        VARCHAR (50)    NULL,
    [PassengerClass]       VARCHAR (50)    NULL,
    [OriginalArrivalDate]  VARCHAR (50)    NULL,
    [BoardLocation]        VARCHAR (1000)  NULL,
    [DestinationLocation]  VARCHAR (1000)  NULL
);


GO

ALTER TABLE [dbo].[TrxBusReservation]
    ADD CONSTRAINT [DF_TrxBusReservation_Amount] DEFAULT ((0)) FOR [amount];


GO



ALTER TABLE [dbo].[TrxBusReservation]
    ADD CONSTRAINT [PK_TrxBusReservation] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



CREATE NONCLUSTERED INDEX [IX_TrxBusReservation_TrxId]
    ON [dbo].[TrxBusReservation]([TrxId] ASC);


GO



CREATE TRIGGER [dbo].[utr_DELETE_TrxBusReservation_After] ON [dbo].[TrxBusReservation]
AFTER DELETE 
AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxBusReservationArchive
(Id,TrxId,Seats,BoardingRoute,BoardingDate,Carrier,TraceNum,amount,ProductId,PassengerReferenceID,CancellationReason,ContactNumber)
  
SELECT 
	Id,TrxId,Seats,BoardingRoute,BoardingDate,Carrier,TraceNum,amount,ProductId,PassengerReferenceID,CancellationReason,ContactNumber
FROM deleted

DELETE FROM Trx 
    WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)
    
END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxBusReservation_After]
    ON [dbo].[TrxBusReservation];


GO



