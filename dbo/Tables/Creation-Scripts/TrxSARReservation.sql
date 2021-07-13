CREATE TABLE [dbo].[TrxSARReservation] (
    [Id]                   INT          IDENTITY (1, 1) NOT NULL,
    [TrxId]                BIGINT       NOT NULL,
    [Seats]                INT          NOT NULL,
    [BoardingRoute]        VARCHAR (20) NULL,
    [BoardingDate]         DATETIME     NULL,
    [BoardingLocation]     VARCHAR (20) NULL,
    [DestinationLocation]  VARCHAR (20) NULL,
    [Carrier]              VARCHAR (20) NULL,
    [TicketClass]          VARCHAR (20) NULL,
    [IsReturn]             BIT          NULL,
    [ReturnRoute]          VARCHAR (20) NULL,
    [ReturnDate]           DATETIME     NULL,
    [ReturnBoarding]       VARCHAR (20) NULL,
    [ReturnDestination]    VARCHAR (20) NULL,
    [ReturnCarrier]        VARCHAR (20) NULL,
    [ReturnClass]          VARCHAR (20) NULL,
    [TraceNum]             INT          NULL,
    [amount]               MONEY        NULL,
    [ProductId]            INT          NULL,
    [PassengerReferenceID] VARCHAR (10) NULL
);


GO

ALTER TABLE [dbo].[TrxSARReservation]
    ADD CONSTRAINT [DF__TrxSARRes__amoun__3C0AD43D] DEFAULT ((0)) FOR [amount];


GO



ALTER TABLE [dbo].[TrxSARReservation]
    ADD CONSTRAINT [DF__TrxSARRes__Produ__2B7F628A] DEFAULT ((0)) FOR [ProductId];


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxSARReservation_After] ON [dbo].[TrxSARReservation]
AFTER DELETE 
AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxSARReservationArchive
(Id,TrxId,Seats,BoardingRoute,BoardingDate,BoardingLocation,DestinationLocation,Carrier,TicketClass,IsReturn
,ReturnRoute,ReturnDate,ReturnBoarding,ReturnDestination,ReturnCarrier,ReturnClass,TraceNum,amount,ProductId,PassengerReferenceID)
  
SELECT 
	Id,TrxId,Seats,BoardingRoute,BoardingDate,BoardingLocation,DestinationLocation,Carrier,TicketClass,IsReturn
,ReturnRoute,ReturnDate,ReturnBoarding,ReturnDestination,ReturnCarrier,ReturnClass,TraceNum,amount,ProductId,PassengerReferenceID
FROM deleted

DELETE FROM Trx 
    WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)
    
END
GO



