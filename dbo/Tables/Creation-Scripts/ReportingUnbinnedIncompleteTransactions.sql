CREATE TABLE [dbo].[ReportingUnbinnedIncompleteTransactions] (
    [TrxId] BIGINT NOT NULL
);


GO

ALTER TABLE [dbo].[ReportingUnbinnedIncompleteTransactions]
    ADD CONSTRAINT [PK_ReportingUnbinnedIncompleteTransactions] PRIMARY KEY CLUSTERED ([TrxId] ASC);


GO



