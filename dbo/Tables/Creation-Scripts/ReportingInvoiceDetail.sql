CREATE TABLE [dbo].[ReportingInvoiceDetail] (
    [InvDetId] INT NOT NULL,
    [InvID]    INT NOT NULL
);


GO

ALTER TABLE [dbo].[ReportingInvoiceDetail]
    ADD CONSTRAINT [PK_ReportingInvoice] PRIMARY KEY CLUSTERED ([InvDetId] ASC);


GO



CREATE NONCLUSTERED INDEX [idx_ReportingInvoiceDetail_InvID]
    ON [dbo].[ReportingInvoiceDetail]([InvID] ASC);


GO



