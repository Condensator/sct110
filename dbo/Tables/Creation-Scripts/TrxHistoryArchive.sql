CREATE TABLE [dbo].[TrxHistoryArchive] (
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

ALTER TABLE [dbo].[TrxHistoryArchive]
    ADD CONSTRAINT [DF__TrxHis__SupplierRev__785D46D4Trx_BigInt] DEFAULT ((0)) FOR [SupplierReversal];


GO



ALTER TABLE [dbo].[TrxHistoryArchive]
    ADD CONSTRAINT [DF__TrxHis__VatAmount__66CFD91ATrx_BigInt] DEFAULT ((0)) FOR [VatAmount];


GO



ALTER TABLE [dbo].[TrxHistoryArchive]
    ADD CONSTRAINT [DF_TrxHis_DevIdTrx_BigInt] DEFAULT ((0)) FOR [DevId];


GO



ALTER TABLE [dbo].[TrxHistoryArchive]
    ADD CONSTRAINT [DF_TrxHis_IsCreditTrx_BigInt] DEFAULT ((0)) FOR [IsCredit];


GO



ALTER TABLE [dbo].[TrxHistoryArchive]
    ADD CONSTRAINT [DF_TrxHis_IsDeletedTrx_BigInt] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[TrxHistoryArchive]
    ADD CONSTRAINT [DF_TrxHis_TransDateTimeTrx_BigInt] DEFAULT (getdate()) FOR [TransDateTime];


GO



ALTER TABLE [dbo].[TrxHistoryArchive]
    ADD CONSTRAINT [PK_TrxHis_BigInt] PRIMARY KEY CLUSTERED ([TrxId] ASC) WITH (FILLFACTOR = 100) ON [AOEN_DATA_INVOICE2_FG];


GO



CREATE NONCLUSTERED INDEX [idx_Trx_BigInt_ClearanceId_SWAT]
    ON [dbo].[TrxHistoryArchive]([DeviceClearanceId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [idx_Trx_BigInt_TrxTypeId_SupplierAccId_ProductId_SupplierInvDetailId_SWAT]
    ON [dbo].[TrxHistoryArchive]([TrxTypeId] ASC, [SupplierAccID] ASC, [Status] ASC)
    INCLUDE([ProductId], [SupplierInvDetailId]) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_AccIdTrx_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([AccId] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_DevIdTrx_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([DevId] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_ExtReferenceTrx_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([ExtReference] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_InvDetailIdTrx_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([InvDetailId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_ReversalIdTrx_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([ReversalId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_StatusTrx_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([Status] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_TransDateTimeTrx_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([TransDateTime] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [indx_TrxTypeIDTrx_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([TrxTypeId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [IX_Trx_ShfId_Status_SWAT]
    ON [dbo].[TrxHistoryArchive]([ShfId] ASC, [Status] ASC)
    INCLUDE([TrxId], [DevUsrId], [FullAmount], [BillAmount], [TrxTypeId], [Reference], [IsCredit]) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [IX_Trx_TransRef_SWAT]
    ON [dbo].[TrxHistoryArchive]([TransRef] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [ndx_AccId_Status_Transdatetime_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([AccId] ASC, [Status] ASC, [TransDateTime] ASC)
    INCLUDE([TrxId], [DevId], [FullAmount], [BillAmount], [PaymentTypeId], [TrxTypeId], [Reference], [ProductId]) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [ndxAccidInvDetailIdStatusTrx_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([AccId] ASC, [InvDetailId] ASC, [Status] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [ndxReferenceTrx_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([Reference] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [ndxSupplierReversalTrx_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([SupplierReversal] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrx_DevidTransDateTimeStatus_SWAT]
    ON [dbo].[TrxHistoryArchive]([DevId] ASC, [TransDateTime] ASC, [Status] ASC)
    INCLUDE([TrxId]) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxDevid_TrxidExtReferenceTrx_BigInt_SWAT]
    ON [dbo].[TrxHistoryArchive]([DevId] ASC)
    INCLUDE([TrxId], [ExtReference]) WITH (FILLFACTOR = 100)
    ON [AEON_INVOICE_NC_INDEX_FG];


GO



