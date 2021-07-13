CREATE TABLE [dbo].[Entity] (
    [EntId]                    INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [EntityName]               VARCHAR (80) NULL,
    [SalesRepId]               INT          NOT NULL,
    [CurrentStatus]            INT          NOT NULL,
    [PostalAddId]              INT          NOT NULL,
    [PhysicalAddId]            INT          NOT NULL,
    [EntTypeId]                INT          NOT NULL,
    [IsDeleted]                BIT          NOT NULL,
    [ComID]                    INT          NULL,
    [EntityNumber]             VARCHAR (50) NULL,
    [ComAirtimeId]             INT          NULL,
    [ParentID]                 INT          NULL,
    [InvoiceOnDevice]          BIT          NOT NULL,
    [VAT_StructureID]          INT          NOT NULL,
    [Branch]                   VARCHAR (80) NULL,
    [ComBillPaymentId]         INT          NULL,
    [PaymentTypeLimitId]       INT          NULL,
    [VASCommissionStructureId] INT          NULL,
    [VASRebateStructureId]     INT          NULL,
    [VASConvenienceFeeId]      INT          NULL,
    [IsAggregator]             BIT          NOT NULL,
    [AggregatorTypeID]         INT          NOT NULL,
    [Restricted]               BIT          NOT NULL,
    [InvoicePriority]          INT          NULL,
    [IsCommissionParent]       BIT          NOT NULL,
    [CommissionParentEntId]    INT          NOT NULL,
    [PreferredCommissionRule]  BIT          NOT NULL,
    [ProfitDisplayEnabled]     BIT          NOT NULL,
    [BalanceDisplayEnabled]    BIT          NOT NULL,
    [BarcodeSetId]             INT          NULL
);


GO

ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF__Entity__Aggregat__26C1635B] DEFAULT ((1)) FOR [AggregatorTypeID];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF__Entity__ComAirti__53AEEA52] DEFAULT ((0)) FOR [ComAirtimeId];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF__Entity__InvoiceP__3CAB10EA] DEFAULT ((1)) FOR [InvoicePriority];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF__Entity__Restrict__5ECDB6C2] DEFAULT ((0)) FOR [Restricted];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF_CommissionParentEntId] DEFAULT ((0)) FOR [CommissionParentEntId];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF_Entity_BalanceDisplayEnabled] DEFAULT ((0)) FOR [BalanceDisplayEnabled];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF_Entity_CurrentStatus] DEFAULT ((0)) FOR [CurrentStatus];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF_Entity_InvoiceOnDevice] DEFAULT ((0)) FOR [InvoiceOnDevice];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF_Entity_IsAggregator] DEFAULT ((0)) FOR [IsAggregator];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF_Entity_IsCommissionParent] DEFAULT ((0)) FOR [IsCommissionParent];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF_Entity_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF_Entity_PreferredCommissionRule] DEFAULT ((0)) FOR [PreferredCommissionRule];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF_Entity_ProfitDisplayEnabled] DEFAULT ((0)) FOR [ProfitDisplayEnabled];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [DF_Entity_VAT_StructureID] DEFAULT ((1)) FOR [VAT_StructureID];


GO



CREATE NONCLUSTERED INDEX [ComID]
    ON [dbo].[Entity]([ComID] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_Entity_ComBillPaymentId]
    ON [dbo].[Entity]([ComBillPaymentId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_Entity_PaymentTypeLimitId]
    ON [dbo].[Entity]([PaymentTypeLimitId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_Entity_VASCommissionStructureId]
    ON [dbo].[Entity]([VASCommissionStructureId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_Entity_VASConvenienceFeeId]
    ON [dbo].[Entity]([VASConvenienceFeeId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [idx_Entity_VASRebateStructureId]
    ON [dbo].[Entity]([VASRebateStructureId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_EntityName]
    ON [dbo].[Entity]([EntityName] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_EntityNumber]
    ON [dbo].[Entity]([EntityNumber] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IsDeleted]
    ON [dbo].[Entity]([IsDeleted] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IX_Entity_AggregatorTypeID]
    ON [dbo].[Entity]([AggregatorTypeID] ASC)
    INCLUDE([EntId]);


GO



CREATE NONCLUSTERED INDEX [ndxCurrentStatusEnttypeid]
    ON [dbo].[Entity]([CurrentStatus] ASC, [EntTypeId] ASC)
    INCLUDE([EntId], [EntityName]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxEntityidIsDeleted]
    ON [dbo].[Entity]([EntTypeId] ASC, [IsDeleted] ASC)
    INCLUDE([EntId], [EntityName], [CurrentStatus], [EntityNumber]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxEntTypeId]
    ON [dbo].[Entity]([EntTypeId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxEnttypeidIsdeleted2]
    ON [dbo].[Entity]([EntTypeId] ASC, [IsDeleted] ASC)
    INCLUDE([EntId], [EntityName], [CurrentStatus], [Branch]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxEntTypeidIsdeleted3]
    ON [dbo].[Entity]([EntTypeId] ASC, [IsDeleted] ASC)
    INCLUDE([EntId], [CurrentStatus], [Branch]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [FK_Entity_Addres] FOREIGN KEY ([PostalAddId]) REFERENCES [dbo].[Addres] ([AddId]);


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [FK_Entity_Addres1] FOREIGN KEY ([PhysicalAddId]) REFERENCES [dbo].[Addres] ([AddId]);


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [FK_Entity_CommissionStructures] FOREIGN KEY ([ComID]) REFERENCES [dbo].[CommissionStructures] ([ID]);


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [FK_Entity_EntityStatus] FOREIGN KEY ([CurrentStatus]) REFERENCES [dbo].[EntityStatus] ([StId]);


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [FK_Entity_EntityType] FOREIGN KEY ([EntTypeId]) REFERENCES [dbo].[EntityType] ([EntTypeId]);


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [FK_Entity_InvoicePriority] FOREIGN KEY ([InvoicePriority]) REFERENCES [dbo].[InvoicePriority] ([Id]);


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [FK_Entity_SalesReps] FOREIGN KEY ([SalesRepId]) REFERENCES [dbo].[SalesReps] ([SalesRepId]);


GO



ALTER TABLE [dbo].[Entity]
    ADD CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED ([EntId] ASC) WITH (FILLFACTOR = 90);


GO



