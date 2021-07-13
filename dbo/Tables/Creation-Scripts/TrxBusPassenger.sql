CREATE TABLE [dbo].[TrxBusPassenger] (
    [Id]                     INT           IDENTITY (1, 1) NOT NULL,
    [TrxBusReservationId]    INT           NOT NULL,
    [Title]                  VARCHAR (5)   NULL,
    [Initials]               VARCHAR (5)   NULL,
    [LastName]               VARCHAR (100) NULL,
    [IdNumber]               VARCHAR (15)  NULL,
    [CellNumber]             VARCHAR (15)  NULL,
    [Email]                  VARCHAR (50)  NULL,
    [Type]                   VARCHAR (5)   NULL,
    [Discount]               VARCHAR (15)  NULL,
    [Infant]                 VARCHAR (10)  NULL,
    [PassengerNumber]        INT           NULL,
    [RowSeat]                VARCHAR (50)  NULL,
    [EmergencyContactNumber] VARCHAR (15)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([TrxBusReservationId]) REFERENCES [dbo].[TrxBusReservation] ([Id]),
    FOREIGN KEY ([TrxBusReservationId]) REFERENCES [dbo].[TrxBusReservation] ([Id])
);


GO

