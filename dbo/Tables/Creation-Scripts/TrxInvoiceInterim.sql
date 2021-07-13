CREATE TABLE [dbo].[TrxInvoiceInterim] (
    [TrxId]               BIGINT        NOT NULL,
    [AccId]               INT           NOT NULL,
    [DevId]               INT           NULL,
    [ShfId]               INT           NOT NULL,
    [DevUsrId]            INT           NULL,
    [FullAmount]          MONEY         NOT NULL,
    [BillAmount]          MONEY         NOT NULL,
    [TransDateTime]       DATETIME      NOT NULL,
    [PaymentTypeId]       INT           NULL,
    [InvDetailId]         INT           NULL,
    [Status]              INT           NULL,
    [CustId]              INT           NULL,
    [ReqDateTime]         DATETIME      NULL,
    [TrxTypeId]           INT           NOT NULL,
    [Reference]           VARCHAR (50)  NULL,
    [IsDeleted]           BIT           NOT NULL,
    [IsCredit]            BIT           NULL,
    [SupplierAccID]       INT           NULL,
    [ReversalId]          BIGINT        NULL,
    [ExtReference]        VARCHAR (100) NULL,
    [VatAmount]           MONEY         NULL,
    [Revend_OriginalID]   BIGINT        NULL,
    [ProductId]           INT           NULL,
    [CRDetailId]          INT           NULL,
    [DeviceClearanceId]   INT           NULL,
    [ReconStatus]         BIT           NULL,
    [SupplierInvDetailId] INT           NULL,
    [SupplierReversal]    BIT           NULL,
    [TransRef]            BIGINT        NOT NULL,
    [DtTimestamp]         ROWVERSION    NOT NULL
) ON [AOEN_DATA_INVOICE2_FG];


GO

ALTER TABLE [dbo].[TrxInvoiceInterim]
    ADD CONSTRAINT [DF__TrxInvInt__SupplierRev__785D46D4Trx_BigInt] DEFAULT ((0)) FOR [SupplierReversal];


GO



ALTER TABLE [dbo].[TrxInvoiceInterim]
    ADD CONSTRAINT [DF__TrxInvInt__VatAmount__66CFD91ATrx_BigInt] DEFAULT ((0)) FOR [VatAmount];


GO



ALTER TABLE [dbo].[TrxInvoiceInterim]
    ADD CONSTRAINT [DF_TrxInvInt_DevIdTrx_BigInt] DEFAULT ((0)) FOR [DevId];


GO



ALTER TABLE [dbo].[TrxInvoiceInterim]
    ADD CONSTRAINT [DF_TrxInvInt_IsCreditTrx_BigInt] DEFAULT ((0)) FOR [IsCredit];


GO



ALTER TABLE [dbo].[TrxInvoiceInterim]
    ADD CONSTRAINT [DF_TrxInvInt_IsDeletedTrx_BigInt] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[TrxInvoiceInterim]
    ADD CONSTRAINT [DF_TrxInvInt_TransDateTimeTrx_BigInt] DEFAULT (getdate()) FOR [TransDateTime];


GO



ALTER TABLE [dbo].[TrxInvoiceInterim]
    ADD CONSTRAINT [FK_TrxInvInt_Devices_BigInt] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[TrxInvoiceInterim]
    ADD CONSTRAINT [FK_TrxInvInt_InvoiceDetail_BigInt] FOREIGN KEY ([InvDetailId]) REFERENCES [dbo].[InvoiceDetail] ([InvDetailId]);


GO



ALTER TABLE [dbo].[TrxInvoiceInterim]
    ADD CONSTRAINT [FK_TrxInvInt_TrxTypes_BigInt] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[TrxInvoiceInterim]
    ADD CONSTRAINT [PK_TrxInvInt_BigInt] PRIMARY KEY CLUSTERED ([TrxId] ASC) WITH (FILLFACTOR = 100) ON [AOEN_DATA_INVOICE2_FG];


GO



CREATE NONCLUSTERED INDEX [idx_Trx_BigInt_TrxTypeId_SupplierAccId_ProductId_SupplierInvDetailId_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([TrxTypeId] ASC, [SupplierAccID] ASC, [Status] ASC)
    INCLUDE([ProductId], [SupplierInvDetailId]) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_AccIdTrx_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([AccId] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_DevIdTrx_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([DevId] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_ExtReferenceTrx_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([ExtReference] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_InvDetailIdTrx_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([InvDetailId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_ReversalIdTrx_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([ReversalId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_StatusTrx_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([Status] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_TransDateTimeTrx_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([TransDateTime] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [indx_TrxTypeIDTrx_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([TrxTypeId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [IX_Trx_ShfId_Status_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([ShfId] ASC, [Status] ASC)
    INCLUDE([TrxId], [DevUsrId], [FullAmount], [BillAmount], [TrxTypeId], [Reference], [IsCredit]) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [IX_Trx_TransRef_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([TransRef] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [ndx_AccId_Status_Transdatetime_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([AccId] ASC, [Status] ASC, [TransDateTime] ASC)
    INCLUDE([TrxId], [DevId], [FullAmount], [BillAmount], [PaymentTypeId], [TrxTypeId], [Reference], [ProductId]) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [ndxAccidInvDetailIdStatusTrx_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([AccId] ASC, [InvDetailId] ASC, [Status] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [ndxReferenceTrx_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([Reference] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [ndxSupplierReversalTrx_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([SupplierReversal] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrx_DevidTransDateTimeStatus_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([DevId] ASC, [TransDateTime] ASC, [Status] ASC)
    INCLUDE([TrxId]) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxDevid_TrxidExtReferenceTrx_BigInt_Interim_SWAT]
    ON [dbo].[TrxInvoiceInterim]([DevId] ASC)
    INCLUDE([TrxId], [ExtReference]) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO




CREATE TRIGGER [dbo].[utr_INSERT_TrxInvoiceInterim_AfterDelete]
ON [dbo].[TrxInvoiceInterim]
AFTER DELETE
AS
BEGIN
	INSERT INTO [dbo].[TrxInvoice]
           ([TrxId]
           ,[AccId]
           ,[DevId]
           ,[ShfId]
           ,[DevUsrId]
           ,[FullAmount]
           ,[BillAmount]
           ,[TransDateTime]
           ,[PaymentTypeId]
           ,[InvDetailId]
           ,[Status]
           ,[CustId]
           ,[ReqDateTime]
           ,[TrxTypeId]
           ,[Reference]
           ,[IsDeleted]
           ,[IsCredit]
           ,[SupplierAccID]
           ,[ReversalId]
           ,[ExtReference]
           ,[VatAmount]
           ,[Revend_OriginalID]
           ,[ProductId]
           ,[CRDetailId]
           ,[DeviceClearanceId]
           ,[ReconStatus]
           ,[SupplierInvDetailId]
           ,[SupplierReversal]
           ,[TransRef])

		   SELECT deleted.[TrxId]
           ,deleted.[AccId]
           ,deleted.[DevId]
           ,deleted.[ShfId]
           ,deleted.[DevUsrId]
           ,deleted.[FullAmount]
           ,deleted.[BillAmount]
           ,deleted.[TransDateTime]
           ,deleted.[PaymentTypeId]
           ,deleted.[InvDetailId]
           ,deleted.[Status]
           ,deleted.[CustId]
           ,deleted.[ReqDateTime]
           ,deleted.[TrxTypeId]
           ,deleted.[Reference]
           ,deleted.[IsDeleted]
           ,deleted.[IsCredit]
           ,deleted.[SupplierAccID]
           ,deleted.[ReversalId]
           ,deleted.[ExtReference]
           ,deleted.[VatAmount]
           ,deleted.[Revend_OriginalID]
           ,deleted.[ProductId]
           ,deleted.[CRDetailId]
           ,deleted.[DeviceClearanceId]
           ,deleted.[ReconStatus]
           ,deleted.[SupplierInvDetailId]
           ,deleted.[SupplierReversal]
           ,deleted.[TransRef]
		    FROM deleted
           LEFT OUTER JOIN TrxInvoice I (NOLOCK) ON I.TrxId = deleted.TrxId
		   WHERE deleted.Status = 3
		    AND I.TrxId is null
		    
		   
		   INSERT INTO [dbo].[TrxHistory]
           ([TrxId]
           ,[AccId]
           ,[DevId]
           ,[ShfId]
           ,[DevUsrId]
           ,[FullAmount]
           ,[BillAmount]
           ,[TransDateTime]
           ,[PaymentTypeId]
           ,[InvDetailId]
           ,[Status]
           ,[CustId]
           ,[ReqDateTime]
           ,[TrxTypeId]
           ,[Reference]
           ,[IsDeleted]
           ,[IsCredit]
           ,[SupplierAccID]
           ,[ReversalId]
           ,[ExtReference]
           ,[VatAmount]
           ,[Revend_OriginalID]
           ,[ProductId]
           ,[CRDetailId]
           ,[DeviceClearanceId]
           ,[ReconStatus]
           ,[SupplierInvDetailId]
           ,[SupplierReversal]
           ,[TransRef])

		   SELECT deleted.[TrxId]
           ,deleted.[AccId]
           ,deleted.[DevId]
           ,deleted.[ShfId]
           ,deleted.[DevUsrId]
           ,deleted.[FullAmount]
           ,deleted.[BillAmount]
           ,deleted.[TransDateTime]
           ,deleted.[PaymentTypeId]
           ,deleted.[InvDetailId]
           ,deleted.[Status]
           ,deleted.[CustId]
           ,deleted.[ReqDateTime]
           ,deleted.[TrxTypeId]
           ,deleted.[Reference]
           ,deleted.[IsDeleted]
           ,deleted.[IsCredit]
           ,deleted.[SupplierAccID]
           ,deleted.[ReversalId]
           ,deleted.[ExtReference]
           ,deleted.[VatAmount]
           ,deleted.[Revend_OriginalID]
           ,deleted.[ProductId]
           ,deleted.[CRDetailId]
           ,deleted.[DeviceClearanceId]
           ,deleted.[ReconStatus]
           ,deleted.[SupplierInvDetailId]
           ,deleted.[SupplierReversal]
           ,deleted.[TransRef]
		    FROM deleted
           LEFT OUTER JOIN TrxInvoice I (NOLOCK) ON I.TrxId = deleted.TrxId
		   WHERE deleted.Status NOT IN (3)
		    AND I.TrxId is null
END
GO



CREATE TRIGGER [dbo].[utr_INSERT_TrxInvoiceInterim_AfterDelete_20200218]
ON [dbo].[TrxInvoiceInterim]
AFTER DELETE
AS
BEGIN
	INSERT INTO [dbo].[TrxInvoice]
           ([TrxId]
           ,[AccId]
           ,[DevId]
           ,[ShfId]
           ,[DevUsrId]
           ,[FullAmount]
           ,[BillAmount]
           ,[TransDateTime]
           ,[PaymentTypeId]
           ,[InvDetailId]
           ,[Status]
           ,[CustId]
           ,[ReqDateTime]
           ,[TrxTypeId]
           ,[Reference]
           ,[IsDeleted]
           ,[IsCredit]
           ,[SupplierAccID]
           ,[ReversalId]
           ,[ExtReference]
           ,[VatAmount]
           ,[Revend_OriginalID]
           ,[ProductId]
           ,[CRDetailId]
           ,[DeviceClearanceId]
           ,[ReconStatus]
           ,[SupplierInvDetailId]
           ,[SupplierReversal]
           ,[TransRef])

		   SELECT [TrxId]
           ,[AccId]
           ,[DevId]
           ,[ShfId]
           ,[DevUsrId]
           ,[FullAmount]
           ,[BillAmount]
           ,[TransDateTime]
           ,[PaymentTypeId]
           ,[InvDetailId]
           ,[Status]
           ,[CustId]
           ,[ReqDateTime]
           ,[TrxTypeId]
           ,[Reference]
           ,[IsDeleted]
           ,[IsCredit]
           ,[SupplierAccID]
           ,[ReversalId]
           ,[ExtReference]
           ,[VatAmount]
           ,[Revend_OriginalID]
           ,[ProductId]
           ,[CRDetailId]
           ,[DeviceClearanceId]
           ,[ReconStatus]
           ,[SupplierInvDetailId]
           ,[SupplierReversal]
           ,[TransRef]
		   FROM deleted
		   WHERE Status = 3
		   
		   INSERT INTO [dbo].[TrxHistory]
           ([TrxId]
           ,[AccId]
           ,[DevId]
           ,[ShfId]
           ,[DevUsrId]
           ,[FullAmount]
           ,[BillAmount]
           ,[TransDateTime]
           ,[PaymentTypeId]
           ,[InvDetailId]
           ,[Status]
           ,[CustId]
           ,[ReqDateTime]
           ,[TrxTypeId]
           ,[Reference]
           ,[IsDeleted]
           ,[IsCredit]
           ,[SupplierAccID]
           ,[ReversalId]
           ,[ExtReference]
           ,[VatAmount]
           ,[Revend_OriginalID]
           ,[ProductId]
           ,[CRDetailId]
           ,[DeviceClearanceId]
           ,[ReconStatus]
           ,[SupplierInvDetailId]
           ,[SupplierReversal]
           ,[TransRef])

		   SELECT [TrxId]
           ,[AccId]
           ,[DevId]
           ,[ShfId]
           ,[DevUsrId]
           ,[FullAmount]
           ,[BillAmount]
           ,[TransDateTime]
           ,[PaymentTypeId]
           ,[InvDetailId]
           ,[Status]
           ,[CustId]
           ,[ReqDateTime]
           ,[TrxTypeId]
           ,[Reference]
           ,[IsDeleted]
           ,[IsCredit]
           ,[SupplierAccID]
           ,[ReversalId]
           ,[ExtReference]
           ,[VatAmount]
           ,[Revend_OriginalID]
           ,[ProductId]
           ,[CRDetailId]
           ,[DeviceClearanceId]
           ,[ReconStatus]
           ,[SupplierInvDetailId]
           ,[SupplierReversal]
           ,[TransRef]
		   FROM deleted
		   WHERE Status NOT IN (3)
END
GO
DISABLE TRIGGER [dbo].[utr_INSERT_TrxInvoiceInterim_AfterDelete_20200218]
    ON [dbo].[TrxInvoiceInterim];


GO



