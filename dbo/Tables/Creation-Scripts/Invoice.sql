CREATE TABLE [dbo].[Invoice] (
    [InvId]             INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [EntId]             INT            NOT NULL,
    [TimeStamp]         DATETIME       NOT NULL,
    [Description]       NVARCHAR (255) NOT NULL,
    [AmountExcl]        MONEY          NOT NULL,
    [AmountIncl]        MONEY          NOT NULL,
    [Printed]           INT            NULL,
    [IsDeleted]         BIT            NOT NULL,
    [IsExported]        BIT            NOT NULL,
    [AccTransId]        INT            NULL,
    [ComIssued]         BIT            NULL,
    [IsIntegrated]      BIT            NULL,
    [DeviceId]          INT            NULL,
    [CashbookId]        INT            NULL,
    [CreditNoteId]      INT            NULL,
    [RebateIssued]      BIT            NULL,
    [ConvenienceIssued] BIT            NULL,
    [Paid]              BIT            NULL,
    [ShiftDescription]  NVARCHAR (200) NULL
);


GO

ALTER TABLE [dbo].[Invoice]
    ADD CONSTRAINT [default_invoice_Printed] DEFAULT ((0)) FOR [Printed];


GO



ALTER TABLE [dbo].[Invoice]
    ADD CONSTRAINT [DF__Invoice__DeviceI__00C41BBA] DEFAULT ((0)) FOR [DeviceId];


GO



ALTER TABLE [dbo].[Invoice]
    ADD CONSTRAINT [DF__Invoice__IsInteg__7DE7AF0F] DEFAULT ((0)) FOR [IsIntegrated];


GO



ALTER TABLE [dbo].[Invoice]
    ADD CONSTRAINT [DF_Invoice_ComIssued] DEFAULT ((0)) FOR [ComIssued];


GO



ALTER TABLE [dbo].[Invoice]
    ADD CONSTRAINT [DF_Invoice_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[Invoice]
    ADD CONSTRAINT [DF_Invoice_IsExported] DEFAULT ((0)) FOR [IsExported];


GO



ALTER TABLE [dbo].[Invoice]
    ADD CONSTRAINT [FK_Invoice_AccTrans] FOREIGN KEY ([AccTransId]) REFERENCES [dbo].[AccTrans] ([TransId]);


GO



ALTER TABLE [dbo].[Invoice]
    ADD CONSTRAINT [FK_Invoice_Entity] FOREIGN KEY ([EntId]) REFERENCES [dbo].[Entity] ([EntId]);


GO



CREATE NONCLUSTERED INDEX [index_5894_5893_Invoice]
    ON [dbo].[Invoice]([TimeStamp] ASC)
    INCLUDE([InvId], [Description], [AccTransId]) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [index_5907_5906_Invoice]
    ON [dbo].[Invoice]([EntId] ASC, [TimeStamp] ASC)
    INCLUDE([AmountIncl]) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [index_5945_5944_Invoice]
    ON [dbo].[Invoice]([TimeStamp] ASC)
    INCLUDE([InvId], [Description], [AmountExcl], [AmountIncl], [AccTransId]) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [index_7141_7140_Invoice]
    ON [dbo].[Invoice]([CashbookId] ASC)
    INCLUDE([InvId]) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [Indx_TimeStamp]
    ON [dbo].[Invoice]([TimeStamp] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxEntidDescTimeStamp]
    ON [dbo].[Invoice]([EntId] ASC, [Description] ASC, [TimeStamp] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxInvAcctransId]
    ON [dbo].[Invoice]([AccTransId] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxInvEntIt]
    ON [dbo].[Invoice]([EntId] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxInvoiceTimestampInclInvidAcctransid]
    ON [dbo].[Invoice]([TimeStamp] ASC)
    INCLUDE([InvId], [AccTransId]) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxTimestampInclAmountInclDeviceid]
    ON [dbo].[Invoice]([TimeStamp] ASC)
    INCLUDE([AmountIncl], [DeviceId]) WITH (FILLFACTOR = 90);


GO



ALTER TABLE [dbo].[Invoice]
    ADD CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED ([InvId] ASC) WITH (FILLFACTOR = 90);


GO



