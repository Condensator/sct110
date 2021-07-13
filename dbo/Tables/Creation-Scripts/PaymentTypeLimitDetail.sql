CREATE TABLE [dbo].[PaymentTypeLimitDetail] (
    [Id]                 INT   IDENTITY (1, 1) NOT NULL,
    [PaymentTypeLimitId] INT   NOT NULL,
    [PaymentTypeId]      INT   NOT NULL,
    [TrxTypeId]          INT   NOT NULL,
    [Limit]              MONEY NOT NULL
);


GO

CREATE CLUSTERED INDEX [ClusteredIndex-20180801-174549]
    ON [dbo].[PaymentTypeLimitDetail]([TrxTypeId] ASC, [PaymentTypeId] ASC);


GO



