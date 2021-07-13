CREATE TABLE [dbo].[InvoiceCreditNotes] (
    [InvId] INT NOT NULL,
    [CRId]  INT NOT NULL
);


GO

ALTER TABLE [dbo].[InvoiceCreditNotes]
    ADD CONSTRAINT [FK_InvoiceCreditNotes_CreditNotes] FOREIGN KEY ([CRId]) REFERENCES [dbo].[CreditNotes] ([CRId]);


GO



ALTER TABLE [dbo].[InvoiceCreditNotes]
    ADD CONSTRAINT [FK_InvoiceCreditNotes_Invoice] FOREIGN KEY ([InvId]) REFERENCES [dbo].[Invoice] ([InvId]);


GO



CREATE NONCLUSTERED INDEX [ndx_InvId_CrId]
    ON [dbo].[InvoiceCreditNotes]([InvId] ASC, [CRId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



