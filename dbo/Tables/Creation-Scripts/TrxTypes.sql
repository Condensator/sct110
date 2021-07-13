CREATE TABLE [dbo].[TrxTypes] (
    [TrxTypeId]                 INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [TransType]                 VARCHAR (50)  NOT NULL,
    [SupplierAccId]             INT           NOT NULL,
    [TrxGroupId]                INT           NOT NULL,
    [IsDeleted]                 BIT           NOT NULL,
    [ServerState]               VARCHAR (200) NULL,
    [ServerFlags]               INT           NULL,
    [Enabled]                   BIT           NULL,
    [AutoLoad]                  BIT           NULL,
    [ServerTransType]           VARCHAR (200) NULL,
    [HasDiscount]               BIT           NULL,
    [InvoiceByRef]              BIT           NULL,
    [Billable]                  INT           NULL,
    [MetaGroupId]               INT           NULL,
    [SystemId]                  INT           NOT NULL,
    [NoRevend]                  BIT           NULL,
    [DisplayName]               VARCHAR (50)  NULL,
    [InvoiceByPayment]          BIT           NULL,
    [Account_TransactionTypeId] INT           NULL,
    [CostCentreRequired]        BIT           NULL,
    [CostCentreValidation]      SMALLINT      NULL,
    [RequireMerchantGroup]      BIT           NULL,
    [IsRedemptionTrxType]       BIT           NOT NULL,
    [IsGCRSOnly]                BIT           NOT NULL,
    [IsFMCG]                    BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [DF__TrxTypes__Billab__00CE0B91] DEFAULT ((0)) FOR [Billable];


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [DF__TrxTypes__HasDis__52BAC619] DEFAULT ((0)) FOR [HasDiscount];


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [DF__TrxTypes__Invoic__3906AC65] DEFAULT ((0)) FOR [InvoiceByRef];


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [DF__TrxTypes__IsRede__7A8C724F] DEFAULT ((0)) FOR [IsRedemptionTrxType];


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [DF__TrxTypes__MetaGr__094F401A] DEFAULT ((0)) FOR [MetaGroupId];


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [DF__TrxTypes__NoReve__668AB62B] DEFAULT ((0)) FOR [NoRevend];


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [DF__TrxTypes__System__1D6CDE0E] DEFAULT ((0)) FOR [SystemId];


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [DF_TrxTypes_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [DF_TrxTypes_IsFMCG] DEFAULT ((0)) FOR [IsFMCG];


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [DF_TrxTypes_IsGCRSOnly] DEFAULT ((0)) FOR [IsGCRSOnly];


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [DF_TrxTypes_TrxGroupId] DEFAULT ((1)) FOR [TrxGroupId];


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [FK_TrxTypes_Accounts] FOREIGN KEY ([SupplierAccId]) REFERENCES [dbo].[Accounts] ([AccId]);


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [FK_TrxTypes_TrxTypesGroup] FOREIGN KEY ([TrxGroupId]) REFERENCES [dbo].[TrxTypesGroup] ([ID]);


GO



ALTER TABLE [dbo].[TrxTypes]
    ADD CONSTRAINT [PK_AccTransTypes] PRIMARY KEY CLUSTERED ([TrxTypeId] ASC);


GO



CREATE NONCLUSTERED INDEX [Billable]
    ON [dbo].[TrxTypes]([Billable] ASC) WITH (FILLFACTOR = 75)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IsDeleted]
    ON [dbo].[TrxTypes]([IsDeleted] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [mdxMetaGroup]
    ON [dbo].[TrxTypes]([MetaGroupId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxEnabledTrxTypeid]
    ON [dbo].[TrxTypes]([Enabled] ASC, [TrxTypeId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxInvoiceByRef]
    ON [dbo].[TrxTypes]([InvoiceByRef] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxSystemId]
    ON [dbo].[TrxTypes]([SystemId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxGroupId]
    ON [dbo].[TrxTypes]([TrxGroupId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxGroupIdTrxTypeidMetagroupid]
    ON [dbo].[TrxTypes]([TrxGroupId] ASC, [TrxTypeId] ASC, [MetaGroupId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxTypeidIsdeleted]
    ON [dbo].[TrxTypes]([TrxTypeId] ASC, [IsDeleted] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxTypesTranstype]
    ON [dbo].[TrxTypes]([TransType] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



