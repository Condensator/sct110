CREATE TABLE [dbo].[Trxnfcputco] (
    [Id]             BIGINT       IDENTITY (1, 1) NOT NULL,
    [TicketId]       VARCHAR (50) NOT NULL,
    [TrxId]          BIGINT       NULL,
    [ReferenceId]    VARCHAR (50) NULL,
    [TransactionId]  VARCHAR (50) NULL,
    [BusinessUnitId] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([TicketId] ASC),
    FOREIGN KEY ([TrxId]) REFERENCES [dbo].[Trx] ([TrxId])
);


GO

