CREATE TABLE [dbo].[TransactionType] (
    [Id]              INT          IDENTITY (1, 1) NOT NULL,
    [SourceBank]      INT          NOT NULL,
    [TransactionCode] VARCHAR (50) NOT NULL,
    [TransactionType] VARCHAR (50) NOT NULL,
    [DoProcess]       BIT          NOT NULL
);


GO

