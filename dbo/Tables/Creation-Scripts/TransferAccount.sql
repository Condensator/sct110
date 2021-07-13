CREATE TABLE [dbo].[TransferAccount] (
    [Id]                       INT      IDENTITY (1, 1) NOT NULL,
    [AccId]                    INT      NOT NULL,
    [LastTransferDate]         DATETIME NULL,
    [LastTransferAmount]       MONEY    NULL,
    [LastTransferSystemUserId] INT      NULL,
    [LastTransferCashBookId]   INT      NULL
);


GO

CREATE CLUSTERED INDEX [ClusteredIndex-20180801-174803]
    ON [dbo].[TransferAccount]([AccId] ASC);


GO



