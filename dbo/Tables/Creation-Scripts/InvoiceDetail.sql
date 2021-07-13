CREATE TABLE [dbo].[InvoiceDetail] (
    [InvDetailId]            INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [InvId]                  INT             NOT NULL,
    [ItemCnt]                INT             NOT NULL,
    [ItemAmountExcl]         MONEY           NOT NULL,
    [ItemAmountIncl]         MONEY           NOT NULL,
    [ItemDescription]        NVARCHAR (255)  NOT NULL,
    [ItemDateTime]           SMALLDATETIME   NOT NULL,
    [IsDeleted]              BIT             NOT NULL,
    [ItemFullAmount]         MONEY           NULL,
    [CommPercent]            MONEY           NULL,
    [TrxTypeId]              INT             NULL,
    [Reference]              VARCHAR (50)    NULL,
    [PaymentTypeId]          INT             NULL,
    [AccTransTypeId]         INT             NULL,
    [RebateValue]            MONEY           NULL,
    [FeeProvider]            MONEY           NULL,
    [ConvenienceFeeOutlet]   MONEY           NULL,
    [ConvenienceFeeProvider] MONEY           NULL,
    [ConvenienceFeeSwitch]   MONEY           NULL,
    [VasProductId]           INT             NULL,
    [VASSlidingId]           INT             NULL,
    [ComSlidingId]           INT             NULL,
    [FaceValue]              MONEY           NULL,
    [StockTypeID]            INT             NULL,
    [Units]                  DECIMAL (18, 2) NULL,
    [SupplierGLCode]         VARCHAR (20)    NULL,
    [ProviderRebateValue]    MONEY           NULL,
    [IsCommissionable]       BIT             NULL
);


GO

ALTER TABLE [dbo].[InvoiceDetail]
    ADD CONSTRAINT [DF__InvoiceDe__CommP__1DEB03DA] DEFAULT ((0)) FOR [CommPercent];


GO



ALTER TABLE [dbo].[InvoiceDetail]
    ADD CONSTRAINT [DF__InvoiceDe__ItemF__1CF6DFA1] DEFAULT ((0)) FOR [ItemFullAmount];


GO



ALTER TABLE [dbo].[InvoiceDetail]
    ADD CONSTRAINT [DF_InvoiceDetail_IsCommissionable] DEFAULT ((1)) FOR [IsCommissionable];


GO



ALTER TABLE [dbo].[InvoiceDetail]
    ADD CONSTRAINT [DF_InvoiceDetail_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[InvoiceDetail]
    ADD CONSTRAINT [DF_InvoiceDetail_TrxTypeId] DEFAULT ((0)) FOR [TrxTypeId];


GO



ALTER TABLE [dbo].[InvoiceDetail]
    ADD CONSTRAINT [FK_InvoiceDetail_Invoice1] FOREIGN KEY ([InvId]) REFERENCES [dbo].[Invoice] ([InvId]);


GO



CREATE NONCLUSTERED INDEX [index_15425_15424_InvoiceDetail]
    ON [dbo].[InvoiceDetail]([TrxTypeId] ASC)
    INCLUDE([InvId], [ItemCnt], [ItemAmountIncl]) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [index_204_203_InvoiceDetail]
    ON [dbo].[InvoiceDetail]([AccTransTypeId] ASC)
    INCLUDE([InvId], [ItemCnt], [ItemAmountExcl], [ItemAmountIncl], [TrxTypeId]) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [Indx_invoicedetail_itemcnt_itemamtincl_paymenttypeid]
    ON [dbo].[InvoiceDetail]([InvId] ASC)
    INCLUDE([ItemCnt], [ItemAmountIncl], [PaymentTypeId]);


GO



CREATE NONCLUSTERED INDEX [Indx_ItemDateTime]
    ON [dbo].[InvoiceDetail]([ItemDateTime] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [IX_InvoiceDetail_InvId]
    ON [dbo].[InvoiceDetail]([InvId] ASC)
    INCLUDE([ItemCnt], [FaceValue], [Units]);


GO



CREATE NONCLUSTERED INDEX [IX_InvoiceDetail_InvId_Incl_ItemAmounincm_VasProductId]
    ON [dbo].[InvoiceDetail]([InvId] ASC)
    INCLUDE([ItemAmountIncl], [VasProductId]);


GO



CREATE NONCLUSTERED INDEX [IX_InvoiceDetail_InvId_ItemCnt_Excl_Incl]
    ON [dbo].[InvoiceDetail]([InvId] ASC)
    INCLUDE([InvDetailId], [ItemCnt], [ItemAmountExcl], [ItemAmountIncl], [ItemDescription], [FaceValue], [StockTypeID], [Units]);


GO



CREATE NONCLUSTERED INDEX [ndxInvDetailInvId]
    ON [dbo].[InvoiceDetail]([InvId] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxInvoiceDetails]
    ON [dbo].[InvoiceDetail]([InvId] ASC, [TrxTypeId] ASC);


GO



ALTER TABLE [dbo].[InvoiceDetail]
    ADD CONSTRAINT [PK_InvoiceDetail] PRIMARY KEY CLUSTERED ([InvDetailId] ASC) WITH (FILLFACTOR = 90);


GO



