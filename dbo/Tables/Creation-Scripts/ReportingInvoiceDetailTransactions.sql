CREATE TABLE [dbo].[ReportingInvoiceDetailTransactions] (
    [TrxId]    BIGINT NOT NULL,
    [InvID]    INT    NOT NULL,
    [InvDetId] INT    NULL
);


GO

ALTER TABLE [dbo].[ReportingInvoiceDetailTransactions]
    ADD CONSTRAINT [PK_ReportinReportingInvoiceDetail] PRIMARY KEY CLUSTERED ([TrxId] ASC);


GO



