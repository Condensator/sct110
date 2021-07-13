CREATE TABLE [dbo].[BulkVoucherOrder] (
    [BulkId]        INT      IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [VoucherType]   INT      NOT NULL,
    [RandValue]     MONEY    NULL,
    [Quantity]      INT      NOT NULL,
    [MinAmount]     MONEY    NULL,
    [MaxAmount]     MONEY    NULL,
    [Processed]     BIT      NULL,
    [ReceivedTime]  DATETIME NULL,
    [CompletedTime] DATETIME NULL
);


GO

CREATE NONCLUSTERED INDEX [index_processed]
    ON [dbo].[BulkVoucherOrder]([Processed] ASC);


GO



ALTER TABLE [dbo].[BulkVoucherOrder]
    ADD CONSTRAINT [PK_BulkId] PRIMARY KEY CLUSTERED ([BulkId] ASC) WITH (FILLFACTOR = 90);


GO



