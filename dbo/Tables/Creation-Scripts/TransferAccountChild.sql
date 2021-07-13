CREATE TABLE [dbo].[TransferAccountChild] (
    [Id]                       INT      IDENTITY (1, 1) NOT NULL,
    [AccId]                    INT      NOT NULL,
    [TransferAccId]            INT      NOT NULL,
    [LastTransferDate]         DATETIME NULL,
    [LastTransferAmount]       MONEY    NULL,
    [LastTransferSystemUserId] INT      NULL,
    [LastTransferCashBookId]   INT      NULL
);


GO

CREATE CLUSTERED INDEX [ClusteredIndex-20180801-174822]
    ON [dbo].[TransferAccountChild]([AccId] ASC, [TransferAccId] ASC);


GO



